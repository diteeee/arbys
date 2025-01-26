<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="arbys.User.Default" %>
<%@ Import Namespace="arbys" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        function getQueryParam(name) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(name);
        }

        const token = getQueryParam("token");

        if (token) {
            localStorage.setItem("authToken", token);
            console.log("Token saved in localStorage:", token);
        } else {
            console.log("No token found in the query string.");
        }

        const isLogout = getQueryParam("logout");
        if (isLogout === "true") {
            localStorage.removeItem("authToken");
            console.log("Auth token removed from localStorage on logout.");
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- offer section -->

    <section class="offer_section layout_padding-bottom">
        <div class="offer_container">
            <div class="container ">
                <div class="row">
                    <asp:Repeater ID="rCategory" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6  ">
                                <div class="box ">
                                    <div class="img-box">
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">
                                            <img src="<%# Utils.GetImageUrl( Eval("ImageUrl")) %>" alt="">
                                        </a>
                                    </div>
                                    <div class="detail-box">
                                        <h5>Tasty Thursdays
                                        </h5>
                                        <h6>
                                            <span>20%</span> Off
                                        </h6>
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">Order Now
                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background: new 0 0 456.029 456.029;" xml:space="preserve">
                        <g>
                            <g>
                                <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                     c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                     C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                     c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                     C457.728,97.71,450.56,86.958,439.296,84.91z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                     c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                            </g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                    </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </section>

    <!-- end offer section -->

    <!-- start about section -->

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
                            Arby's is a beloved fast-food chain known for its unique menu centered around deliciously crafted roast beef sandwiches.
                            With a focus on high-quality meats, Arby's offers a variety of flavorful options,
                            including their signature Roast Beef Classic, as well as tasty alternatives like turkey, chicken, and even brisket sandwiches.
                            Whether you're craving a classic sandwich, a hearty wrap, or a tasty side like curly fries, Arby's delivers bold flavors and satisfying portions. With a commitment to providing fast, 
                            friendly service and fresh ingredients, Arby's continues to be a favorite destination for those seeking a tasty, satisfying meal on the go.
                        </p>
                        <a href="About.aspx">Read More
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end about section -->

    <!-- client section -->

    <section class="client_section layout_padding-bottom pt-5">
        <div class="container">
            <div class="heading_container heading_center psudo_white_primary mb_45">
                <h2>What Says Our Customers
                </h2>
            </div>
            <div class="carousel-wrap row ">
                <div class="owl-carousel client_owl-carousel">
                    <div class="item">
                        <div class="box">
                            <div class="detail-box">
                                <p>
                                    Many customers appreciate the friendly service and the variety of options, from classic roast beef to more unique choices, which keep them coming back for more.
                                </p>
                                <h6>Michelle Obama
                                </h6>
                                <p>
                                    delicious
                                </p>
                            </div>
                            <div class="img-box">
                                <img src="../TemplateFiles/images/client1.jpg" alt="" class="box-img">
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="box">
                            <div class="detail-box">
                                <p>
                                    Our clients rave about the consistently delicious flavors and the quality of the meat in every sandwich at Arby's, making it their go-to spot for a satisfying meal.
                                </p>
                                <h6>Mike Tyson
                                </h6>
                                <p>
                                    love it
                                </p>
                            </div>
                            <div class="img-box">
                                <img src="../TemplateFiles/images/client2.jpg" alt="" class="box-img">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end client section -->
</asp:Content>
