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
                        <img id="placeImage">
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
            <div id="comment-section">

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
                    console.log(place.reviews);
                    for (var i = 0; i < place.reviews.length; i++) {
                        var url, name, text, rating

                        if (place.reviews[i].profile_photo_url)
                            url = place.reviews[i].profile_photo_url;
                        else 
                            url = "http://icons.iconarchive.com/icons/danleech/simple/512/google-plus-icon.png";
                        
                        if (place.reviews[i].author_name) 
                            name = place.reviews[i].author_name;
                        else
                            name = "Not Available";

                        if (place.reviews[i].text)
                            text = place.reviews[i].text;
                        else
                            text = "Not Available";

                        if (place.reviews[i].text)
                            rating = place.reviews[i].rating;
                        else
                            rating = 0;
                 

                        $("#comment-section").append( ''+
                            '<div class="author-box"> ' +
                                '<div class="row"> ' +
                                    '<hr>' +
                                    '<div class="col-xs-12 col-sm-2"> ' +
                                        '<img src="' + url + '" class="img-fluid rounded-circle z-depth-2" onError="this.src = http://7108-presscdn-0-78.pagely.netdna-cdn.com/wp-content/uploads/2013/08/google-plus.png">' +
                                        '<br/><a  class="gplus-ic" href="' + place.reviews[i].author_url + '"><i class="fa fa-google-plus"></i></a>' +
                                    '</div>' +
                                    '<div class="col-xs-12 col-sm-10">' +
                                        '<p><strong class="text-capitalize">' + name + '</strong></p><br/>' +
                                        '<div class="star-ratings-sprite"><span style="width:' + place.reviews[i].rating * 20 + '%" class="star-ratings-sprite-rating"></span></div>' +                  
                                        '<br/><p>' + text + '' +
                                    '</div>'+
                                '</div>'+
                            '</div>');
                        
                    }

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
