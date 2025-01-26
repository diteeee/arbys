using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace arbys.User
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        private const string SecretKey = "YourVeryStrongSecretKeyHere!123456789";
        private readonly SymmetricSecurityKey securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(SecretKey));

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text.Trim() == "Admin" && txtPassword.Text.Trim() == "123")
            {
                var token = GenerateJwtToken(txtUsername.Text.Trim(), "Admin");
                Session["admin"] = txtUsername.Text.Trim();
                Session["token"] = token;
                Response.Redirect($"../Admin/Dashboard.aspx?token={token}");
            }
            else
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("User_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "SELECT4LOGIN");
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count == 1)
                {
                    var token = GenerateJwtToken(txtUsername.Text.Trim(), "User");
                    Session["username"] = txtUsername.Text.Trim();
                    Session["userId"] = dt.Rows[0]["UserId"];
                    Session["token"] = token;
                    string script = $"<script>localStorage.setItem('authToken', '{token}');</script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "SaveToken", script);
                    Response.Redirect($"Default.aspx?token={token}");
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Invalid Credentials..!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
        }

        private string GenerateJwtToken(string username, string role)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, username),
                new Claim(ClaimTypes.Role, role)
            };

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.UtcNow.AddHours(1),
                SigningCredentials = credentials
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}
