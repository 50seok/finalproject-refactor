<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <style>
        body {
            background-color: #0d1117 !important;
        }

        /* 탭 pills */
        .nav-link.active#tab-personal,
        .nav-link.active#tab-business {
            color: #00e5b4 !important;
            background-color: #1c2128 !important;
            border: 1px solid #30363d !important;
        }
        .nav-pills .nav-link {
            color: #8b949e;
            background-color: transparent;
            border: 1px solid transparent;
            border-radius: 6px;
        }
        .nav-pills .nav-link:hover {
            color: #00e5b4;
            background-color: #1c2128;
        }

        .register-link {
            font-size: 14px;
            font-family: "Arial", sans-serif;
        }
        .register-link a {
            color: #00e5b4 !important;
        }

        #login-button {
            width: 100%;
            background-color: #00e5b4 !important;
            border-color: #00e5b4 !important;
            color: #0d1117 !important;
            font-weight: 600;
            border-radius: 8px;
            padding: 10px;
        }
        #login-button:hover {
            background-color: #00b894 !important;
            border-color: #00b894 !important;
        }
        #login-button:focus {
            outline: none;
            box-shadow: 0 0 0 0.25rem rgba(0, 229, 180, 0.35);
        }

        /* 다크 인풋 */
        .form-outline { position: relative; }
        .form-outline input {
            background-color: #0d1117 !important;
            border: 1px solid #30363d !important;
            border-radius: 8px;
            padding: 10px 12px;
            width: 100%;
            color: #e6edf3 !important;
        }
        .form-outline input::placeholder { color: #484f58; }
        .form-outline input:focus {
            outline: none;
            border-color: #00e5b4 !important;
            box-shadow: 0 0 0 0.2rem rgba(0, 229, 180, 0.2);
        }
        .form-outline label {
            position: absolute;
            top: 0;
            left: 0;
            font-size: 0.875rem;
            color: #8b949e;
            transition: transform 0.2s ease-out, font-size 0.2s ease-out;
        }
        .form-outline input:focus + label,
        .form-outline input:not(:placeholder-shown) + label {
            transform: translateY(-35px) scale(0.85);
            color: #6c757d;
        }

        /* form-floating 다크 */
        .form-floating > .form-control {
            background-color: #0d1117 !important;
            border-color: #30363d !important;
            color: #e6edf3 !important;
        }
        .form-floating > label { color: #8b949e; }
        .form-floating > .form-control:focus,
        .form-floating > .form-control:not(:placeholder-shown) {
            background-color: #0d1117 !important;
        }
        .form-floating > .form-control:focus ~ label,
        .form-floating > .form-control:not(:placeholder-shown) ~ label {
            color: #8b949e;
        }

        .divider {
            border-top: 1px solid #30363d;
            margin: 12px 0;
            width: 100%;
        }

        /* 소셜 로그인 버튼 영역 */
        .social-login-btn {
            display: block;
            background-color: #1c2128;
            border: 1px solid #30363d;
            border-radius: 8px;
            padding: 8px;
            text-align: center;
            transition: border-color 0.2s;
        }
        .social-login-btn:hover {
            border-color: #8b949e;
        }
        .social-login-btn img {
            width: 190px;
            height: 45px;
            object-fit: contain;
        }
    </style>
</head>
<body>
        <!--////////// Header Start ////////////-->
        <jsp:include page="../main/mainH.jsp"></jsp:include>
        <!--////////// Header end ////////////-->

        <!--////////// Main start //////////////-->
        <main>
            <div class="container">
                <article>
                    <header>
                        <!-- <h1>로그인</h1> -->
                    </header>
                    <div id="content">
                        <c:if test="${sessionScope.mvo eq null}">

                                <div class="d-flex justify-content-center align-items-center mt-5">
                                <div class="card shadow p-4 mb-3 mt-3 rounded" style="width: 25rem; background-color:#161b22; border:1px solid #30363d;" >
                                    <div class="card-body">

                                    <!-- 개인 로그인과 사업자 로그인 탭 -->
                                    <ul class="nav nav-pills nav-justified mb-4" id="ex1" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <a class="nav-link active" id="tab-personal" data-mdb-toggle="pill" href="#pills-personal" role="tab"
                                            aria-controls="pills-personal" aria-selected="true">개인 로그인</a>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <a class="nav-link" id="tab-business" data-mdb-toggle="pill" href="#pills-business" role="tab"
                                            aria-controls="pills-business" aria-selected="false">사업자 로그인</a>
                                        </li>
                                    </ul>

                    <div class="tab-content">

                                <!-- 개인 로그인 내용 -->
                              <div class="tab-pane fade show active" id="pills-personal" role="tabpanel" aria-labelledby="tab-personal">
                                <form action="login" method="post" name="frm">
                                    <input type="hidden" value="0" name="m_class" id="m_class1"/>

                                    <div class="form-outline mb-4 form-floating mb-3">
                                        <input type="text" id="m_email" name="m_email" class="form-control form-outline" placeholder="Email"/>
                                        <label for="m_email" class="form-label fs-6">Email</label>
                                    </div>

                                    <div class="form-outline mb-4 form-floating mb-3">
                                        <input type="password" id="m_pw" name="m_pw" class="form-control form-outline" placeholder="Password"/>
                                        <label for="m_pw" class="form-label fs-6">Password</label>
                                    </div>

                                    <div class="text-center">
                                        <button type="button" class="btn btn-primary btn-block mb-4 text-center" id="login-button" onclick="exe(this.form)"><i class="fa fa-sign-in me-2" aria-hidden="true"></i>로그인</button>
                                    </div>

                                        <hr class="divider"/>

                                        <div class="text-center register-link">
                                            <p style="color:#8b949e;">계정이 없으신가요? <a href="join">회원가입</a></p>
                                        </div>

                                    <div class="text-center d-flex flex-column align-items-center gap-2">
                                        <a id="kakao-login" class="social-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=01fcedff33d5020339523392547b5f9b&redirect_uri=http://localhost:8080/kakao/login&response_type=code">
                                            <img src="../images/kakao_login_large.png" />
                                        </a>
                                        <a id="naver-login" class="social-login-btn" href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=DEfYVqVL7Po51QB3sjNx&state=STATE_STRING&redirect_uri=http://localhost:8080/naver/login">
                                            <img src="../images/naver_login.png" />
                                        </a>
                                    </div>

                                </form>
                                </div>


                        <!-- 사업자 로그인 내용 -->
                        <div class="tab-pane fade" id="pills-business" role="tabpanel" aria-labelledby="tab-business">
                            <form action="login" method="post" name="frm">
                                <input type="hidden" value="1" name="m_class" id="m_class2"/>
                            <div class="form-outline mb-4 form-floating mb-3">
                                <input type="text" id="m_email" name="m_email" class="form-control form-outline" placeholder="Email" />
                                <label for="m_email" class="form-label fs-6">Email</label>
                            </div>

                            <div class="form-outline mb-4 form-floating mb-3">
                                <input type="password" id="m_pw" name="m_pw" class="form-control form-outline" placeholder="Password" />
                                <label for="m_pw" class="form-label fs-6">Password</label>
                            </div>

                            <div class="text-center">
                                <button type="button" class="btn btn-primary btn-block mb-4 text-center" id="login-button" onclick="exe(this.form)"><i class="fa fa-sign-in me-2" aria-hidden="true"></i>로그인</button>

                            <hr class="divider">

                                <div class="text-center register-link">
                                    <p style="color:#8b949e;">계정이 없으신가요? <a href="join">회원가입</a></p>
                                </div>
                             </div>

                        </form>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>

        </c:if>

        <div class="text-center" id="error-message"></div>


                            <!--Jquery Plugins, main Jquery	-->
                            <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
                            <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

                           <script>
                                function exe(frm) {
                                    if ($(frm.m_email).val() == "") {
                                    alert("이메일을 입력하세요");
                                    $(frm.m_email).focus();
                                    return;
                                    }

                                    if ($(frm.m_pw).val() == "") {
                                    alert("비밀번호를 입력하세요");
                                    $(frm.m_pw).focus();
                                    return;
                                    }

                                    $.ajax({
                                    type: "POST",
                                    url: "/reqLogin",
                                    data: $(frm).serialize(),
                                    datatype: "JSON",
                                    async: false
                                    })
                                    .done(function(response) {
                                    if (response.success == "1") {
                                        location.href = "/main/";
                                    } else {
                                        alert("로그인에 실패했습니다. 다시 시도해주세요.");
                                        location.href = "/login";
                                    }
                                    })
                                    .fail(function() {
                                    alert("로그인 중에 오류가 발생했습니다");
                                    });
                                }


                                $(document).ready(function() {
                                    //개인로그인 탭 눌려졌을때
                                    $("#tab-personal").on("click", function() {

                                    $(this).addClass("active");
                                    $("#tab-business").removeClass("active");
                                    $("#pills-personal").addClass("show active");
                                    $("#pills-business").removeClass("show active");

                                    $("#m_class1").val("0");
                                    $("#kakao-login").show();
                                    $("#naver-login").show();

                                      handlePersonalLogin();

                                    });

                                    //사업자로그인 탭 눌려졌을때
                                    $("#tab-business").on("click", function() {

                                        $(this).addClass("active");
                                        $("#tab-personal").removeClass("active");
                                        $("#pills-business").addClass("show active");
                                        $("#pills-personal").removeClass("show active");

                                    $("#m_class2").val("1");
                                    $("#kakao-login").hide();
                                    $("#naver-login").hide();

                                      handleBusinessLogin();

                                    });
                            });

                            // 엔터키 쳤을때 - 개인 로그인
                                function handlePersonalLogin() {
                                    $(this).addClass("active");
                                    $("#tab-business").removeClass("active");
                                    $("#pills-personal").addClass("show active");
                                    $("#pills-business").removeClass("show active");
                                    $("#m_class1").val("0");
                                    $("#kakao-login").show();
                                    $("#naver-login").show();
                                }

                                // 엔터키 쳤을때 - 사업자 로그인
                                function handleBusinessLogin() {
                                    $(this).addClass("active");
                                    $("#tab-personal").removeClass("active");
                                    $("#pills-business").addClass("show active");
                                    $("#pills-personal").removeClass("show active");
                                    $("#m_class2").val("1");
                                    $("#kakao-login").hide();
                                    $("#naver-login").hide();
                                }

                            </script>
                </article>
            </div>



        </main>
        <!--////////// Main end //////////////-->
        <!--////////// Foter start //////////////-->
        <jsp:include page="../main/mainF.jsp"></jsp:include>
        <!--////////// Foter end //////////////-->

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


</body>
</html>
