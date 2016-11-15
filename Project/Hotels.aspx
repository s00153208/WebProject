<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Hotels.aspx.cs" Inherits="Project.Items" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <asp:TextBox ID="txtNote" runat="server" placeholder="Enter message" CssClass="form-control"></asp:TextBox>
        <asp:Button ID="btnAddNote" runat="server" Text="Add notification" CssClass="btn btn-primary" OnClick="btnAddNote_Click" />

        <div class="row" id="restaurant-cont">
            <!--<% for (int i = 0; i < 12; i++)
                {%>
            <div class="col-md-4">
                <a href="ViewItem.aspx" class="thumbnail">
                    <img src="https://bytesizemoments.com/wp-content/uploads/2014/04/placeholder3.png" alt="" class="img-responsive fake-img" />
                    <p class="caption lead">Some text</p>
                </a>
            </div>
            <% } %>-->
        </div> 

    </div>

    <div class="container">

        <nav aria-label="...">
            <ul class="pagination">
                <li>
                    <span>
                        <span aria-hidden="true">&laquo;</span>
                    </span>
                </li>
                <% for (int i = 0; i < 5; i++)
                    { %>
                <li <%= ((i == 0) ? "class=\"active\"" : "") %>>
                    <span><%= (i + 1) %></span>
                </li>
                <% } %>
                <li>
                    <span>
                        <span aria-hidden="true">&raquo;</span>
                    </span>
                </li>
            </ul>
        </nav>

    </div>
    <div id="map" style="display: none"></div>

    <hr />
    <script src="Scripts/notifications.js"></script>
    <script>

        var currIndex = 0;
        var maxIndex = 5;

        var map;
        var infowindow;

        function initApp() {
            var sligo = { lat: 54.2683987, lng: -8.4982395 };

            map = new google.maps.Map(document.getElementById('map'), {
                center: sligo,
                zoom: 15
            });

            infowindow = new google.maps.InfoWindow();
            var service = new google.maps.places.PlacesService(map);
            service.nearbySearch({
                location: sligo,
                radius: 2000,
                type: ['hotel'],
            }, callback);
        }

        var placesArray = [];

        function callback(results, status) {
            if (status === google.maps.places.PlacesServiceStatus.OK) {
                placesArray = results;
                for (var i = 0; i < 9; i++) {
                    var cont = $("#restaurant-cont");

                    var service = new google.maps.places.PlacesService(map);
                    service.getDetails({
                        placeId: results[i].place_id,
                    }, function (place, status) {
                        if (status === google.maps.places.PlacesServiceStatus.OK) {
                            var img;
                            var numImages = place.photos.length;
                            if (numImages && numImages > 0) {
                                img = place.photos[ 0 ].getUrl({ 'maxWidth': 300, 'maxHeight': 300 });
                            } else {
                                img = "http://www.dspropertymgt.com/assets/placeholder2-3868690f952a1ca5a0bcc01342b77336c6aa76f182b73c0ca647a71985ba5161.jpg";
                            }
                            $(cont).append( '<div class="col-md-4 restaurant-div">' +
                                                '<div class="wrapper">' +
                                                    '<div class="widget">' +
						                            '<div class="widget__photo" style="background: url(' + img + ')"></div>' +
						                            '<a href="ViewItem.aspx?place=' + place.place_id + '" class="widget__button"> More details </a>' +
                                                    '<div class="widget__details">' +
						                                '<div class="widget__badges">' +
							                                '<div class="widget__badge">'+
                                                                '$$$$' +
                                                            '</div>' +
							                                '<div class="widget__badge widget__badge--rating">' +
							                                    place.rating +
							                                '</div> ' +
                                                        '</div>' +
						                                '<div class="widget__name"> ' +
							                                place.name +
						                                '</div>' +
						                                '<div class="widget__info">' +
                                                            '<span>' +
							                                    place.formatted_address +
							                                '</span>' +
						                                '</div>' +
                                                    '</div>' +
                                                '</div>');


                      /*      '<a href="ViewItem.aspx?place=' + place.place_id + '" class="thumbnail restaurant-link">' +
                            '<img src="' + img + '" class="img-responsive restaurant-img"/>' +
                            '<p class="caption lead">' + place.name + '</p>' +
                            '<div class="star-ratings-sprite">Rating<span style="width:'+place.rating*20+'%" class="star-ratings-sprite-rating"></span></div>' +
                            '</a>' +
                            '</div>'); */

                            //console.log(place.photos[0]);
                            //console.log(place.photos.photo_reference);
                            //console.log("https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" + place.reference + "&key=AIzaSyAwML5XL64ThMk-o0IK0lheAsTau0YADdE");
                        } else
                            console.log("doesnt work with the id: " + results[i].place_id);
                    });
                    var res = results[i];
                    //console.log(res.photos[0].photo_reference);
                    //console.log(res);
                    //console.log("https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" + res.reference + "&key=AIzaSyAwML5XL64ThMk-o0IK0lheAsTau0YADdE");
                }
            }
        }

        function getDetails(start) {
            for (var i = start; i < start + 9; i++) {
                var cont = $("#cont");
                $(cont).empty();
                var service = new google.maps.places.PlacesService(map);
                service.getDetails({
                    placeId: placesArray[i].place_id,
                }, function (place, status) {
                    if (status === google.maps.places.PlacesServiceStatus.OK) {
                        var img = place.photos[0].getUrl({ 'maxWidth': 300, 'maxHeight': 300 });
                        $(cont).append('<div class="col-md-4 restaurant-div text-center">' +
                        '<img width="300px" height="300px" src="' + img + '" class="img-thumbnail"/>' +
                        '<p>Address: ' + place.formatted_address + '</p>' +
                        '<p>Rating: ' + place.rating + '</p>' +
                        '</div>');

                        //console.log(place.photos[0]);
                        //console.log(place.photos.photo_reference);
                        //console.log("https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" + place.reference + "&key=AIzaSyAwML5XL64ThMk-o0IK0lheAsTau0YADdE");
                    } else
                        console.log("doesnt work with the id: " + results[i].place_id);
                });
            }

        }

    </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAxmTQ04-q4_mTKBOh631Xq5qNmr0c6HYY&libraries=places&callback=initApp" async defer></script>
</asp:Content>
