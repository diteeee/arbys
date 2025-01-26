<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="arbys.User.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- about section -->

    <section class="about_section layout_padding">
        <div class="container  ">

            <div class="row">
                <div class="col-md-6 ">
                    <div class="img-box">
                        <img src="../TemplateFiles/images/about-img.png" alt="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="detail-box">
                        <div class="heading_container">
                            <h2>We Are Arby's
                            </h2>
                        </div>
                        <p>
                            At Arby’s, we’re passionate about serving up mouthwatering sandwiches made with the highest quality ingredients. From our signature roast beef to our unique selection of deli meats, we’re dedicated to providing our customers with fresh, flavorful meals that hit the spot every time. Our commitment to fast, friendly service and delicious food has earned us a loyal following.

                            Our working hours are as follows:
                            <ul>
                                <li>Monday to Friday: 10:00 AM – 10:00 PM</li>
                                <li>Saturday: 10:00 AM – 11:00 PM</li>
                                <li>Sunday: 10:00 AM – 9:00 PM</li>
                            </ul>
                            We look forward to welcoming you!
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end about section -->

</asp:Content>
