<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div id="slideshow" class="carousel slide" data-ride="carousel" style="height: 400px;">
            <ol class="carousel-indicators">
                <li data-target="#slideshow" data-slide-to="0" class="active"></li>
                <li data-target="#slideshow" data-slide-to="1" class="active"></li>
                <li data-target="#slideshow" data-slide-to="2" class="active"></li>
            </ol>

            <div class="carousel-inner">
                <div class="item active">
                    <img src="https://bytesizemoments.com/wp-content/uploads/2014/04/placeholder3.png" alt="" />
                </div>

                <div class="item">
                    <img src="https://bytesizemoments.com/wp-content/uploads/2014/04/placeholder3.png" alt="" />
                </div>

                <div class="item">
                    <img src="https://bytesizemoments.com/wp-content/uploads/2014/04/placeholder3.png" alt="" />
                </div>
            </div>

            <a class="left carousel-control" href="#slideshow" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#slideshow" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <hr />

        <div class="row">
            <ul class="nav nav-pills navbar-right navbar">
                <li class="active"><a data-toggle="pill" href="#home">Home</a></li>
                <li><a data-toggle="pill" href="#menu1">Menu 1</a></li>
                <li><a data-toggle="pill" href="#menu2">Menu 2</a></li>
                <li><a data-toggle="pill" href="#menu3">Menu 3</a></li>
            </ul>
        </div>

        <div class="tab-content tab-style">
            <div id="home" class="tab-pane fade in active">
                <div class="row">
                    <% for (int i = 0; i < 6; i++)
                        {%>
                    <div class="col-md-4">
                        <a href="ViewItem.aspx" class="thumbnail">
                            <img src="https://bytesizemoments.com/wp-content/uploads/2014/04/placeholder3.png" alt="" class="img-responsive fake-img" />
                            <p class="caption lead">Some text</p>
                        </a>
                    </div>
                    <% } %>
                </div>
            </div>
            <div id="menu1" class="tab-pane fade">
                <div class="row">
                    <% for (int i = 0; i < 6; i++)
                        {%>
                    <div class="col-md-4">
                        <a href="ViewItem.aspx" class="thumbnail">
                            <img src="https://bytesizemoments.com/wp-content/uploads/2014/04/placeholder3.png" alt="" class="img-responsive fake-img" />
                            <p class="caption lead">Some text</p>
                        </a>
                    </div>
                    <% } %>
                </div>
            </div>
            <div id="menu2" class="tab-pane fade">
                <div class="row">
                    <% for (int i = 0; i < 6; i++)
                        {%>
                    <div class="col-md-4">
                        <a href="ViewItem.aspx" class="thumbnail">
                            <img src="https://bytesizemoments.com/wp-content/uploads/2014/04/placeholder3.png" alt="" class="img-responsive fake-img" />
                            <p class="caption lead">Some text</p>
                        </a>
                    </div>
                    <% } %>
                </div>
            </div>
            <div id="menu3" class="tab-pane fade">
                <div class="row">
                    <% for (int i = 0; i < 6; i++)
                        {%>
                    <div class="col-md-4">
                        <a href="ViewItem.aspx" class="thumbnail">
                            <img src="https://bytesizemoments.com/wp-content/uploads/2014/04/placeholder3.png" alt="" class="img-responsive fake-img" />
                            <p class="caption lead">Some text</p>
                        </a>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>

        <hr />

        <div class="row">
            <div class="col-md-6">
                <img src="https://bytesizemoments.com/wp-content/uploads/2014/04/placeholder3.png" alt="" class="img-responsive fake-img" />
            </div>

            <div class="col-md-6">
                <h3>Some Heading</h3>

                <p>Bacon ipsum dolor amet alcatra fatback t-bone jerky, picanha andouille ham hock. Leberkas cow bresaola prosciutto capicola burgdoggen. Rump tenderloin corned beef jowl pork loin short ribs chuck chicken. Spare ribs short ribs jerky bacon. Ham fatback meatball shank. Pastrami ribeye ham pork chop chicken, bresaola flank ball tip corned beef pancetta. Venison brisket strip steak, meatloaf prosciutto picanha pork.</p>
            </div>
        </div>

        <hr />
    </div>

</asp:Content>
