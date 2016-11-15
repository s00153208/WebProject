<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewItem.aspx.cs" Inherits="Project.ViewItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .img-car {
            border: 0px !IMPORTANT;
            max-height: 400px;
            width: 100%;
        }

        .table th {
            text-align: center !IMPORTANT;
        }

        #map {
            width: 100%;
            height: 300px;
        }
    </style>

    <div class="container">
        <section class="section section-blog-fw">

            <!--First row-->
            <div class="row">
                <div class="col-md-12">
                    <!--Featured image-->
                    <div class="view overlay hm-white-slight">
                        <img id="placeImage" src="">
                        <a>
                            <div class="mask "></div>
                        </a>
                    </div>

                    <div class="jumbotron">
                        <h2 id="placeName"><a></a></h2>
                        <br />
                        <ul class="rating inline-ul">
                            <li><i class="fa fa-star amber-text"></i></li>
                            <li><i class="fa fa-star amber-text"></i></li>
                            <li><i class="fa fa-star amber-text"></i></li>
                            <li><i class="fa fa-star"></i></li>
                            <li><i class="fa fa-star"></i></li>
                        </ul>
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="contact-icons">
                                    <li><i class="fa fa-map-marker fa-2x"></i>
                                        <p style="font-size:18px;" id="placeAddress"></p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="contact-icons">
                                    <li><i class="fa fa-phone fa-2x"></i>
                                        <p id="placePhone"></p>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <ul class="contact-icons">
                                    <li><i class="fa fa-globe fa-2x"></i>
                                        <p id="placeWeb"></p>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div id="map" class="z-depth-2"></div>
                            </div>
                            <div class="col-md-6">

                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Day</th>
                                            <th>Open</th>
                                            <th>Close</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Monday</td>
                                            <td>8:00</td>
                                            <td>20:00</td>
                                        </tr>
                                        <tr>
                                            <td>Tuesday</td>
                                            <td>8:00</td>
                                            <td>20:00</td>
                                        </tr>
                                        <tr>
                                            <td>Wednesday</td>
                                            <td>8:00</td>
                                            <td>20:00</td>
                                        </tr>
                                    </tbody>
                                </table>


                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="author-box">
                <div class="row">
                    <hr>
                    <div class="col-xs-12 col-sm-2">
                        <img src="http://2.gravatar.com/avatar/e9de252843e9ff541060127dac7126ed?s=150&d=mm&r=g" class="img-fluid rounded-circle z-depth-2">
                    </div>
                    <div class="col-xs-12 col-sm-10">
                        <p><strong>Michal Szymanski</strong></p>
                        <div class="personal-sm">
                            <a class="email-ic"><i class="fa fa-home"></i></a>
                            <a class="fb-ic"><i class="fa fa-facebook"></i></a>
                            <a class="tw-ic"><i class="fa fa-twitter"></i></a>
                            <a class="gplus-ic"><i class="fa fa-google-plus"></i></a>
                            <a class="li-ic"><i class="fa fa-linkedin"></i></a>
                            <a class="email-ic"><i class="fa fa-envelope-o"></i></a>
                        </div>
                        <p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus.</p>
                    </div>
                </div>
            </div>
            <div class="author-box">
                <div class="row">
                    <hr>
                    <div class="col-xs-12 col-sm-2">
                        <img src="http://2.gravatar.com/avatar/e9de252843e9ff541060127dac7126ed?s=150&d=mm&r=g" class="img-fluid rounded-circle z-depth-2">
                    </div>
                    <div class="col-xs-12 col-sm-10">
                        <p><strong>Michal Szymanski</strong></p>
                        <div class="personal-sm">
                            <a class="email-ic"><i class="fa fa-home"></i></a>
                            <a class="fb-ic"><i class="fa fa-facebook"></i></a>
                            <a class="tw-ic"><i class="fa fa-twitter"></i></a>
                            <a class="gplus-ic"><i class="fa fa-google-plus"></i></a>
                            <a class="li-ic"><i class="fa fa-linkedin"></i></a>
                            <a class="email-ic"><i class="fa fa-envelope-o"></i></a>
                        </div>
                        <p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus.</p>
                    </div>
                </div>
            </div>
            <hr>
        </section>
    </div>

    <script>

        var currIndex = 0;
        var maxIndex = 5;

        var map;
        var infowindow;

        function getDetails() {

            var sligo = { lat: 54.2683987, lng: -8.4982395 };

            map = new google.maps.Map(document.getElementById('map'), {
                center: sligo,
                zoom: 15
            });

            var service = new google.maps.places.PlacesService(map);
            service.getDetails({
                placeId: GetParameterValues("place"),
            }, function (place, status) {
                if (status === google.maps.places.PlacesServiceStatus.OK) {
                    console.log(place);
                    var numImages = place.photos.length;
                    if (numImages && numImages > 0) {
                        img = place.photos[[Math.floor(Math.random() * numImages)]].getUrl({ 'maxWidth': 300, 'maxHeight': 300 });
                    } else {
                        img = "http://www.dspropertymgt.com/assets/placeholder2-3868690f952a1ca5a0bcc01342b77336c6aa76f182b73c0ca647a71985ba5161.jpg";
                    }
                    $("#placeImage").attr("src", img);
                    $("#placeAddress").text(place.formatted_address);
                    $("#placeName").text(place.name);
                    $("#placePhone").text(place.formatted_phone_number);
                    $("#placeWeb").text(place.website);


                } else
                    console.log("doesnt work with");
            });
        }

        function GetParameterValues(param) {
            var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < url.length; i++) {
                var urlparam = url[i].split('=');
                if (urlparam[0] == param) {
                    return urlparam[1];
                }
            }
        }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAxmTQ04-q4_mTKBOh631Xq5qNmr0c6HYY&libraries=places&callback=getDetails" async defer></script>
</asp:Content>
