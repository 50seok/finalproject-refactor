<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>충전소 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-JyB+g0gmjSY68DpznWWC1u/NQLVzIm1POyQ7JM7jyekvBssmQhBemz73NFcf7RrG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link href="../../../css/ramg-dark.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
    #wrap {border-radius: 5px; position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px; line-height: 1.5; background: #161b22; border:1px solid #30363d;}
    #title {padding: 5px 0 0 10px;height: 30px;background: #1c2128;border-bottom: 1px solid #30363d;font-size: 18px;font-weight: bold; color:#e6edf3;}
    #close {position: absolute;top: 10px;right: 10px;color: #8b949e;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    #close:hover {cursor: pointer;}
    #body {position: relative;overflow: hidden;}
    #desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    #ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap; color: #e6edf3;}
    #jibun {font-size: 11px;color: #8b949e;margin-top: -2px;}
    #img {border: 0px; position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 0px solid #30363d;color: #8b949e;overflow: hidden;}

    /* 사이드 패널 */
    .side-panel {
        background-color: #161b22;
        height: 900px;
        border-right: 1px solid #30363d;
    }
    .side-panel-title {
        color: #e6edf3;
        font-size: 1rem;
        font-weight: 600;
        padding: 20px 16px;
        border-bottom: 1px solid #30363d;
        border-left: 3px solid #00e5b4;
        margin-bottom: 0;
    }
    .side-filter {
        background-color: #1c2128;
        border: 1px solid #30363d;
        border-radius: 8px;
        padding: 12px;
        margin: 12px 8px;
    }

    /* 반경 버튼 */
    .custom-btn {
        width: auto;
        height: auto;
        padding: 6px 14px;
        border: 1px solid #00e5b4;
        color: #00e5b4;
        background: transparent;
        border-radius: 6px;
        font-size: 13px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s ease;
        display: inline-block;
        margin: 3px;
    }
    .custom-btn:hover, .custom-btn.active-radius {
        background: rgba(0,229,180,0.15);
        box-shadow: 0 0 8px rgba(0,229,180,0.3);
    }
    .btn-3 { line-height: normal; }
    .btn-3 span { display: inline; }

    /* 충전소 목록 */
    #list1 {
        width: 100%;
        height: 680px;
        overflow-y: scroll;
        scrollbar-width: thin;
        scrollbar-color: #30363d #1c2128;
    }
    #list1 .list-group-item {
        background-color: #161b22 !important;
        border-color: #30363d !important;
        color: #8b949e !important;
        font-size: 0.82rem;
        padding: 10px 12px;
    }
    #list1 .list-group-item:hover {
        background-color: #1c2128 !important;
    }
    #list1 a { color: #8b949e !important; text-decoration: none !important; }
    #list1 a:hover { color: #00e5b4 !important; }

    /* 범례 오버레이 */
    .box {
        position: absolute;
        top: 18px;
        left: 1264px;
        border-radius: 10px;
        border: 1px solid #30363d;
        z-index: 3;
        background-color: rgba(22,27,34,0.9);
    }
    .box1 {
        width: 85px;
        height: 80px;
        padding: 10px;
        display: inline-block;
        text-align: center;
        color: #e6edf3;
        font-size: 0.78rem;
    }

    /* 현재위치 표시 */
    #myposition {
        padding: 6px 12px;
        color: #e6edf3;
        font-size: 0.85rem;
        background-color: rgba(22,27,34,0.9);
        border-bottom: 1px solid #30363d;
        border-radius: 6px 6px 0 0;
    }

    .kmap { z-index: 2; }
    .in { z-index: 4; }
    .fff { color: #e6edf3; }
</style>
<body>
        <!--////////// Header Start ////////////-->
        <jsp:include page="../main/mainH.jsp"></jsp:include>
        <!--////////// Header end ////////////-->

        <!--////////// Main start //////////////-->
        <div class="container-fluid text-center">
            <div class="row d-flex">
                <div class="col-md-2 side-panel">
                    <div class="side-panel-title">내 주변 가까운 충전소</div>
                    <div class="side-filter">
                        <div class="mb-2" style="color:#8b949e; font-size:0.8rem;">반경 선택</div>
                        <div class="container max-width mb-3">
                            <button class="custom-btn btn-3 fff"><span>1km</span></button>
                            <button class="custom-btn btn-3 fff"><span>2km</span></button>
                            <button class="custom-btn btn-3 fff"><span>3km</span></button>
                            <button class="custom-btn btn-3 fff"><span>4km</span></button>
                            <button class="custom-btn btn-3 fff"><span>5km</span></button>
                        </div>
                        <ul class="list-group" id="list1">
                            <!-- ajax로 받아온 html문서 적용 -->
                        </ul>
                    </div>
                </div>
                <div class="col-md-10" style="padding-right: 0; padding-left: 0;">
                    <div style="padding-left: 0; position: relative;">
                        <div style="background-color:transparent; width: 300px; height: 300px;" class="box">
                            <div id="myposition" class="col-6 fff" style="padding-left: 0; width:100%;"></div>
                            <div style="background-color: rgba(22,27,34,0.85); border-radius:0 0 10px 10px;" class="in">
                                <div class="box1">
                                    <p class="fff"><img src="../../../images/map_marker_green.svg" width="20px">
                                        <br/><span class="station-badge-ok">충전가능</span></p>
                                </div>
                                <div class="box1">
                                    <p class="fff"><img src="../../../images/map_marker_red.svg" width="20px">
                                        <br/><span class="station-badge-off">불가능</span></p>
                                </div>
                                <div class="box1">
                                    <p class="fff"><img src="../../../images/bolt-solid.svg" width="25px">
                                        <br/><span class="station-badge-busy">충전중</span></p>
                                </div>
                            </div>
                        </div>
                        <div id="map" class="kmap" style="width: 100%; height: 900px;"></div>
                    </div>
                </div>
            </div>
        </div>
        <!--////////// Main end //////////////-->

        <!--////////// Foter start //////////////-->
        <jsp:include page="../main/mainF.jsp"></jsp:include>
        <!--////////// Foter end //////////////-->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10b35fbf759effd509a13d5148feabfa&libraries=services"></script>
        <script>

            var markers =[];
            var markers2 =[];
            var overlays = [];
            var overlays2 = [];
            var container = document.getElementById('map');

            var imageSrc_ok = "../images/map_marker_green.svg";
            var imageSrc_redicon = "../images/map_marker_red.svg";
            var imageSrc_chargeicon = "../images/bolt-solid.svg";

            var options = {
                center: new kakao.maps.LatLng(37.483782, 126.9003409),
                level: 7
            };
            var radius = 5000;

            var map = new kakao.maps.Map(container, options);
            var geocoder = new kakao.maps.services.Geocoder();

             if (navigator.geolocation) {

                navigator.geolocation.getCurrentPosition(function(position) {
                    var lati = position.coords.latitude,
                        lon = position.coords.longitude;

                    var locPosition = new kakao.maps.LatLng(lati, lon),
                    message = '<div style="padding:5px;">현재위치</div>';

                    displayMarker(locPosition, message);
                    getAddr(lati, lon);
                    function getAddr(lati,lon){
                        let geocoder2 = new kakao.maps.services.Geocoder();
                        let coord = new kakao.maps.LatLng(lati, lon);
                        let callback = function(result, status) {
                            if (status === kakao.maps.services.Status.OK) {
                                var city = result[0].address.address_name;
                                geocoder.addressSearch(result[0].address.address_name, function(result, status) {
                                    if (status === kakao.maps.services.Status.OK) {
                                        var ind = 0;
                                        var mnd = 0;
                                        var type;
                                        <c:forEach items="${ar}" var="vo">
                                            <c:if test = "${vo.cpTp eq '1'}">type = 'B타입(5핀)';</c:if>
                                            <c:if test = "${vo.cpTp eq '2'}">type = 'C타입(5핀)';</c:if>
                                            <c:if test = "${vo.cpTp eq '3'}">type = 'BC타입(5핀)';</c:if>
                                            <c:if test = "${vo.cpTp eq '4'}">type = 'BC타입(7핀)';</c:if>
                                            <c:if test = "${vo.cpTp eq '5'}">type = 'DC차데모';</c:if>
                                            <c:if test = "${vo.cpTp eq '6'}">type = 'AC3상';</c:if>
                                            <c:if test = "${vo.cpTp eq '7'}">type = 'DC콤보';</c:if>
                                            <c:if test = "${vo.cpTp eq '8'}">type = 'DC차데모+DC콤보';</c:if>
                                            <c:if test = "${vo.cpTp eq '10'}">type = 'DC차데모+AC3상+DC콤보';</c:if>
                                            var imageSize = new kakao.maps.Size(24, 35);
                                            var pos = new kakao.maps.LatLng('${vo.lat}', '${vo.longi}');
                                            var overlayid = "idnum"+ ind++;
                                            var content = document.createElement('div');
                                            content.className = overlayid;
                                            content.style = 'display : none;';
                                            content.innerHTML = '<div id="wrap">' +
                                            '       <div id="info">' +
                                                '        <div id="title">' +
                                            '            ${vo.csNm}' +
                                            '            <span id="close" onClick="removeOverlay(\''+overlayid+'\')" title="닫기"></span>' +
                                            '        </div>' +
                                            '        <div id="body">' +
                                                '            <div id="img">' +
                                            '                <img src="../images/chargestation.png" width="73" height="70"/>' +
                                            '           </div>' +
                                            '            <div id="desc">' +
                                            '                <div id="ellipsis">${vo.addr}<br/>'+type+'</div>' +
                                            '            </div>' +
                                            '        </div>' +
                                            '    </div>' +
                                            '</div>';

                                            <c:if test = "${vo.cpStat eq '1'}">
                                                var markerImage = new kakao.maps.MarkerImage(imageSrc_ok, imageSize);
                                            </c:if>
                                            <c:if test = "${vo.cpStat eq '2'}">
                                                var markerImage = new kakao.maps.MarkerImage(imageSrc_chargeicon, imageSize);
                                            </c:if>
                                            <c:if test = "${vo.cpStat eq '3'}">
                                                var markerImage = new kakao.maps.MarkerImage(imageSrc_redicon, imageSize);
                                            </c:if>
                                            var marker = new kakao.maps.Marker({
                                                position: pos,
                                                image: markerImage,
                                                title:overlayid
                                            });
                                            markers.push(marker);
                                            var overlay = new kakao.maps.CustomOverlay({
                                                content: content,
                                                position: marker.getPosition(),
                                                map: map
                                            });
                                            overlays.push(overlay);
                                        </c:forEach>

                                            let str2 ="";
                                            str2 += city;
                                            $("#myposition").html(str2);

                                            function displayList() {
                                                var str = "";
                                                var d = 1;
                                                for (var a = 0; a < overlays2.length; a++) {
                                                    var overlay = overlays2[a];
                                                    var content = overlay.getContent();
                                                    var address = $(content).find("#ellipsis").text();
                                                    var type = $(content).find("#desc > .fff").text();
                                                    str += '<li class="list-group-item">';
                                                    str += '<a style="text-decoration: none;" class="tag-link" href="#" data-index="' + a + '">';
                                                    str += d + '. ' + address + '<br/>' + type;
                                                    str += '</a>';
                                                    str += '</li>';
                                                    d++;
                                                }
                                                $("#list1").html(str);
                                            }

                                            function clearList() {
                                                overlays2 = [];
                                                markers2 = [];
                                                displayList();
                                            }
                                            function clearPath() {
                                                polyline.setMap(null);
                                            }

                                            if(radius == 5000){
                                                for (var i = 0; i < markers.length; i++) {
                                                    var c1 = locPosition;
                                                    var c2 = markers[i].getPosition();
                                                    var poly = new daum.maps.Polyline({ path: [c1, c2] });
                                                    var dist = poly.getLength();
                                                    if (dist <= radius) {
                                                        overlays2.push(overlays[i]);
                                                        markers2.push(markers[i]);
                                                        markers[i].setMap(map);
                                                    } else {
                                                        markers[i].setMap(null);
                                                    }
                                                }
                                                overlays2.sort(function(a, b) {
                                                    var c1 = locPosition;
                                                    var c2a = a.getPosition();
                                                    var c2b = b.getPosition();
                                                    var polyA = new daum.maps.Polyline({ path: [c1, c2a] });
                                                    var polyB = new daum.maps.Polyline({ path: [c1, c2b] });
                                                    return polyA.getLength() - polyB.getLength();
                                                });
                                                displayList();
                                            }
                                            $('.custom-btn').click(function() {
                                                var buttonText = $(this).text();
                                                radius = parseInt(buttonText.replace(/[^0-9]/g, ''));
                                                clearList();
                                                if(radius == 5){ map.setCenter(locPosition); map.setLevel(7); }
                                                else if(radius == 4){ map.setCenter(locPosition); map.setLevel(6); }
                                                else if(radius == 3){ map.setCenter(locPosition); map.setLevel(6); }
                                                else if(radius == 2){ map.setCenter(locPosition); map.setLevel(6); }
                                                else if(radius == 1){ map.setCenter(locPosition); map.setLevel(4); }
                                                for (var i = 0; i < markers.length; i++) {
                                                    var c1 = locPosition;
                                                    var c2 = markers[i].getPosition();
                                                    var poly = new daum.maps.Polyline({ path: [c1, c2] });
                                                    var dist = poly.getLength();
                                                    if (dist <= radius * 1000) {
                                                        overlays2.push(overlays[i]);
                                                        markers2.push(markers[i]);
                                                        markers[i].setMap(map);
                                                    } else {
                                                        markers[i].setMap(null);
                                                    }
                                                }
                                                overlays2.sort(function(a, b) {
                                                    var c1 = locPosition;
                                                    var polyA = new daum.maps.Polyline({ path: [c1, a.getPosition()] });
                                                    var polyB = new daum.maps.Polyline({ path: [c1, b.getPosition()] });
                                                    return polyA.getLength() - polyB.getLength();
                                                });
                                                displayList();
                                                clearPath();
                                            });

                                        for(i=0; i<markers.length; i++){
                                            kakao.maps.event.addListener(markers[i], 'click', function(){
                                                $('.'+this.Gb).css('display', 'block');
                                            })
                                        }
                                        var polyline, startMarker;
                                        $(document).on("click", ".tag-link", function(event) {
                                            if (startMarker) { startMarker.setMap(null); startMarker = null; }
                                            if (polyline) { polyline.setMap(null); polyline = null; }
                                            var index = $(this).data("index");
                                            var lon2 = overlays2[index].getPosition().La;
                                            var lati2 = overlays2[index].getPosition().Ma;
                                            var lon3 = lon;
                                            var lati3 = lati;
                                            $.ajax({
                                                url: '/here',
                                                type: "POST",
                                                dataType: "json",
                                                data: { lati3: lati3, lon3: lon3, lati2: lati2, lon2: lon2 }
                                            }).done(function(data) {
                                                var route = data.key[0];
                                                var path = route.sections[0].roads;
                                                var linePath = [];
                                                for (var i = 0; i < path.length; i++) {
                                                    var vertexes = path[i].vertexes;
                                                    for (var j = 0; j < vertexes.length; j += 2) {
                                                        linePath.push(new kakao.maps.LatLng(vertexes[j+1], vertexes[j]));
                                                    }
                                                }
                                                polyline = new kakao.maps.Polyline({
                                                    path: linePath,
                                                    strokeWeight: 5,
                                                    strokeColor: '#00e5b4',
                                                    strokeOpacity: 1,
                                                    strokeStyle: 'solid'
                                                });
                                                polyline.setMap(map);
                                                startMarker = new kakao.maps.Marker({
                                                    map: map,
                                                    position: new kakao.maps.LatLng(route.summary.origin.y, route.summary.origin.x)
                                                });
                                            }).fail(function(err) {
                                                console.log(err + " Failed");
                                            });
                                        });
                                    }
                                });
                            }
                        }
                        geocoder2.coord2Address(coord.getLng(), coord.getLat(), callback);
                    }
                });
            } else {
                var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
                    message = 'geolocation을 사용할수 없어요..'
                displayMarker(locPosition, message);
            }

            function displayMarker(locPosition, message) {
                var marker = new kakao.maps.Marker({ map: map, position: locPosition });
                var infowindow = new kakao.maps.InfoWindow({ content: message, removable: true });
                infowindow.open(map, marker);
                map.setCenter(locPosition);
            }

            function removeOverlay(overlayid) {
                $('.'+overlayid).css('display', 'none');
            }

            function removeMarker() {
                for (var i = 0; i < markers.length; i++) { markers[i].setMap(null); }
                markers = [];
            }

        </script>
</body>
</html>
