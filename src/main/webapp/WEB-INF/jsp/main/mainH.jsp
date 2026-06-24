<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>람쥐썬더 충전소</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 <link href="../../../css/ramg-dark.css" rel="stylesheet">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <style>
  #header3 {
   font-size: 20px !important;
   padding: 10px 16px !important;
   position: fixed;
   top: 0;
   left: 0;
   right: 0;
   z-index: 999;
   background-color: #0d1117;
   border-bottom: 1px solid #30363d !important;
  }

  body {
   padding-top: 75px;
   padding-bottom: 75px;
  }

  /* 헤더 링크 */
  #header3 .header.nav-link {
   color: #8b949e !important;
   transition: color 0.2s;
  }
  #header3 .header.nav-link:hover,
  #header3 .header.nav-link:focus {
   color: #00e5b4 !important;
   text-decoration: none !important;
  }

  /* 드롭다운 */
  #header3 .dropdown-menu {
   background-color: #161b22 !important;
   border: 1px solid #30363d !important;
  }
  #header3 .dropdown-item {
   color: #8b949e !important;
  }
  #header3 .dropdown-item:hover {
   background-color: #1c2128 !important;
   color: #00e5b4 !important;
  }

  /* 로고 포인트 도트 */
  .logo-dot {
   display: inline-block;
   width: 8px;
   height: 8px;
   background-color: #00e5b4;
   border-radius: 50%;
   margin-left: 6px;
   vertical-align: middle;
  }

  /* 로그인 버튼 */
  #loginButton {
   background: transparent;
   border: 1px solid #00e5b4;
   color: #00e5b4 !important;
   border-radius: 8px;
   padding: 6px 18px;
   font-weight: 600;
   transition: background 0.2s;
  }
  #loginButton:hover { background: rgba(0, 229, 180, 0.1); }
  #loginButton a { color: #00e5b4 !important; text-decoration: none !important; }

  /* 로그아웃/유저명 */
  #logoutButton {
   background: transparent;
   border: 1px solid #30363d;
   color: #8b949e !important;
   border-radius: 8px;
   padding: 6px 16px;
  }
  #logoutButton:hover { border-color: #00e5b4; color: #00e5b4 !important; }
  #logoutButton a { color: #8b949e !important; text-decoration: none !important; }
  #logoutButton:hover a { color: #00e5b4 !important; }

  .welcome-name a { color: #e6edf3 !important; font-weight: 500; }
  .welcome-name a:hover { color: #00e5b4 !important; }

  /* GPS 로딩 */
  #gps-loading-msg {
   background: #00e5b4;
   color: #0d1117;
  }

  /* GPS 모달 */
  #gpsGuideModal .modal-header {
   background-color: #00b894;
   color: #0d1117;
  }
  #gpsGuideModal .modal-body code {
   background-color: #1c2128;
   color: #e6edf3;
   padding: 2px 6px;
   border-radius: 4px;
  }
 </style>
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
 integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<body>
 <!--////////// Header Start ////////////-->

 <div class="container-fluid">
  <header id="header3" style="margin: 0.0rem!important;"
   class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between mb-4">
   <a href="/main/" class="d-flex align-items-center mb-3 mb-md-0 me-md-20 text-decoration-none" style="margin-right: 150px;">
    <svg class="bi me-2" width="50" height="35"><img style="width: 50px;" src="/images/logo3.png" />
     <img src="/images/logo.png" style="width: 200px;"/></svg>
    <span class="logo-dot"></span>
   </a>
   <div class="dropdown">
    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
     <li class="mx-5">
      <a href="#" class="header nav-link px-4" onclick="conf()">충전소 찾기</a>
     </li>
     <c:if test="${sessionScope.mvo.m_class eq 0 || sessionScope.mvo.m_class eq null}">
      <li class="mx-5">
       <a href="#" class="header nav-link px-4" data-bs-toggle="dropdown">충전
        서비스</a>
       <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="/infoma/">서비스 소개</a></li>
        <li><a class="dropdown-item" href="/taksong/">탁송 서비스</a></li>
        <li><a class="dropdown-item" href="/edongsik/">이동식 충전 서비스</a></li>
        <li><a class="dropdown-item" href="/support/review">리뷰</a></li>
       </ul>
      </li>
     </c:if>
     <li class="mx-5">
      <a href="#" class="header nav-link px-4" data-bs-toggle="dropdown">고객센터</a>
      <ul class="dropdown-menu">
       <li><a class="dropdown-item" href="/support/notice">공지사항</a></li>
       <li><a class="dropdown-item" href="/support/faq">자주하는 질문</a></li>
       <li><a class="dropdown-item" href="/support/qna">문의 게시판</a></li>
      </ul>
     </li>
     <c:if test="${sessionScope.mvo != null}">
      <li class="mx-5">
       <a href="#" class="header nav-link px-4" data-bs-toggle="dropdown">마이
        페이지</a>
       <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="/mypage">정보 관리</a></li>
        <li><a class="dropdown-item" href="/car_list">차량 관리</a></li>
        <li><a class="dropdown-item" href="/my_question">나의 문의</a></li>
        <c:if test="${sessionScope.mvo.m_class eq 1}">
         <li><a class="dropdown-item" href="/mypage/serviceadd/">서비스 관리</a></li>
         <li><a class="dropdown-item" href="/mypage/service/">고객 서비스 신청 현황</a></li>
         <li><a class="dropdown-item" href="/my_review">이용자의 리뷰</a></li>
        </c:if>
        <c:if test="${sessionScope.mvo.m_class eq 0}">
         <li><a class="dropdown-item" href="/e_orderList/">서비스 이용내역</a></li>
        </c:if>
       </ul>
      </li>
     </c:if>
    </ul>
   </div>
   <c:if test="${sessionScope.mvo eq null}">
    <div class="col-md-3 text-end">
     <button id="loginButton" type="button"><a href="/login"><i class="fa fa-sign-in me-2" aria-hidden="true"></i>로그인</a></button>
    </div>
   </c:if>
   <c:if test="${sessionScope.mvo ne null}">
    <div class="col-md-3 text-end d-flex align-items-center justify-content-end gap-2">
     <p class="me-2 mb-0 welcome-name"><a href="/mypage">${sessionScope.mvo.m_name}</a>님 환영합니다.</p>
     <button id="logoutButton" type="button"><a href="/logout">로그아웃<i class="fa fa-sign-out ms-2" aria-hidden="true"></i></a></button>
    </div>
   </c:if>
  </header>
 </div>
 <!--////////// Header end ////////////-->
 <script type="text/javascript"
  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10b35fbf759effd509a13d5148feabfa&libraries=services"></script>

 <!-- GPS 로딩 메시지 -->
 <div id="gps-loading-msg" style="display:none; position:fixed; top:80px; left:50%; transform:translateX(-50%);
  padding:10px 24px; border-radius:20px; z-index:9999; font-size:0.9rem; font-weight:600;">
  📍 위치를 가져오는 중입니다...
 </div>

 <!-- GPS 차단 안내 모달 -->
 <div class="modal fade" id="gpsGuideModal" tabindex="-1" aria-labelledby="gpsGuideModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
   <div class="modal-content">
    <div class="modal-header">
     <h5 class="modal-title" id="gpsGuideModalLabel">📍 위치 권한 허용이 필요합니다</h5>
     <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
     <p>충전소 찾기 기능은 <strong>브라우저 위치 권한</strong>이 필요합니다.<br>현재 위치 접근이 차단되어 있습니다.</p>
     <hr style="border-color:#30363d;">
     <div id="gps-chrome-guide">
      <p><strong style="color:#00e5b4;">🔵 Chrome 설정 방법</strong></p>
      <ol style="color:#8b949e;">
       <li>주소창 왼쪽 <strong>🔒 자물쇠 아이콘</strong> 클릭</li>
       <li><strong>사이트 설정</strong> 선택</li>
       <li><strong>위치</strong> → <strong>허용</strong> 으로 변경</li>
       <li>페이지 새로고침 후 다시 시도</li>
      </ol>
     </div>
     <div id="gps-firefox-guide" style="display:none;">
      <p><strong style="color:#00e5b4;">🦊 Firefox 설정 방법</strong></p>
      <ol style="color:#8b949e;">
       <li>주소창 왼쪽 <strong>🔒 자물쇠 아이콘</strong> 클릭</li>
       <li><strong>연결 보안 → 추가 정보</strong></li>
       <li><strong>권한 탭</strong>에서 위치 → <strong>허용</strong></li>
       <li>페이지 새로고침 후 다시 시도</li>
      </ol>
     </div>
     <p class="text-muted mt-2" style="font-size:0.85rem;">
      ※ 로컬(http) 환경에서는 Chrome 주소창에<br>
      <code>chrome://flags/#unsafely-treat-insecure-origin-as-secure</code><br>
      입력 후 <code>http://localhost:8080</code> 추가하면 테스트 가능합니다.
     </p>
    </div>
    <div class="modal-footer">
     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
     <button type="button" class="neon-btn"
      onclick="submitWithDefaultCity()">서울 기준으로 조회</button>
    </div>
   </div>
  </div>
 </div>

  <script>
   function submitWithDefaultCity() {
    var form = document.createElement('form');
    form.setAttribute('method', 'post');
    form.setAttribute('action', '/fmap/');
    form.style.display = 'none';
    var input = document.createElement('input');
    input.setAttribute('type', 'hidden');
    input.setAttribute('name', 'city');
    input.setAttribute('value', '서울특별시');
    form.appendChild(input);
    document.body.appendChild(form);
    form.submit();
   }

   function showGpsGuideModal(errorCode) {
    var isFirefox = navigator.userAgent.toLowerCase().indexOf('firefox') > -1;
    if (isFirefox) {
     document.getElementById('gps-chrome-guide').style.display = 'none';
     document.getElementById('gps-firefox-guide').style.display = 'block';
    }
    var modal = new bootstrap.Modal(document.getElementById('gpsGuideModal'));
    modal.show();
   }

   var _gpsModalShown = false;
   var _gpsFallbackTimer = null;

   function _showGpsModalOnce(code) {
    if (_gpsModalShown) return;
    _gpsModalShown = true;
    if (_gpsFallbackTimer) { clearTimeout(_gpsFallbackTimer); _gpsFallbackTimer = null; }
    document.getElementById('gps-loading-msg').style.display = 'none';
    showGpsGuideModal(code);
   }

   function conf() {
    if (confirm("위치 기반 서비스를 이용하여 현재위치를 조회하시겠습니까?")) {
     johoe();
    } else {
     alert("현재위치를 조회해주세요.");
    }
   }

   function johoe() {
    _gpsModalShown = false;
    document.getElementById('gps-loading-msg').style.display = 'block';

    // HTTP 환경에서 콜백 미호출 대비 5초 폴백
    _gpsFallbackTimer = setTimeout(function() {
     _showGpsModalOnce(1);
    }, 5000);

    var geocoder = new kakao.maps.services.Geocoder();
    if (navigator.geolocation) {
     navigator.geolocation.getCurrentPosition(
      function (position) {
       if (_gpsFallbackTimer) { clearTimeout(_gpsFallbackTimer); _gpsFallbackTimer = null; }
       document.getElementById('gps-loading-msg').style.display = 'none';
       var lati = position.coords.latitude;
       var lon = position.coords.longitude;
       var geocoder2 = new kakao.maps.services.Geocoder();
       var coord = new kakao.maps.LatLng(lati, lon);
       geocoder2.coord2Address(coord.getLng(), coord.getLat(), function (result, status) {
        if (status === kakao.maps.services.Status.OK) {
         var city = result[0].address.address_name;
         geocoder.addressSearch(city, function (result, status) {
          if (status === kakao.maps.services.Status.OK) {
           var form = document.createElement('form');
           form.setAttribute('method', 'post');
           form.setAttribute('action', '/fmap/');
           form.style.display = 'none';
           var cityInput = document.createElement('input');
           cityInput.setAttribute('type', 'hidden');
           cityInput.setAttribute('name', 'city');
           cityInput.setAttribute('value', city);
           form.appendChild(cityInput);
           document.body.appendChild(form);
           form.submit();
          } else {
           _showGpsModalOnce(0);
          }
         });
        } else {
         _showGpsModalOnce(0);
        }
       });
      },
      function (error) {
       _showGpsModalOnce(error.code);
      },
      { timeout: 8000, enableHighAccuracy: false }
     );
    } else {
     _showGpsModalOnce(2);
    }
   }
  </script>
</body>

</html>
