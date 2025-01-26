using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace arbys.Admin
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            string script = @"
                localStorage.removeItem('authToken');
                window.location.href = '../User/Login.aspx?logout=true';
            ";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "clearTokenOnLogout", script, true);
        }

    }
}