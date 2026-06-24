<!--일단 mainH 붙였음-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>회원가입</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
   <style>
    body { background-color: #0d1117 !important; }

    .form-outline { position: relative; }
    .form-outline input {
      background-color: #1c2128 !important;
      border: 1px solid #30363d !important;
      border-radius: 8px;
      padding: 7px 10px;
      width: 100%;
      color: #e6edf3 !important;
    }
    .form-outline input::placeholder { color: #484f58; }
    .form-outline input:focus {
      outline: none;
      border-color: #00e5b4 !important;
      box-shadow: 0 0 0 0.2rem rgba(0, 229, 180, 0.2);
      background-color: #1c2128 !important;
    }
    .form-outline label {
      position: relative;
      display: block;
      margin-bottom: 5px;
      font-size: 0.9rem;
      font-weight: 600;
      color: #8b949e;
    }
    .form-outline input:not(:placeholder-shown) {
      background-color: #1c2128 !important;
    }

    .radio-btn {
      margin-bottom: 1px;
      margin-top: 3px;
      font-size: 16px;
      font-weight: bold;
      color: #8b949e;
    }
    input[type="radio"] { width: 16px; height: 16px; }

    .divider {
      border-top: 1px solid #30363d;
      margin: 15px 0;
      width: 100%;
    }

    #box { font-size: 0.9rem; margin-right: 10px; }

    #login-link {
      margin-top: 12px;
      font-size: 13px;
      font-family: "Arial", sans-serif;
    }
    #login-link a { color: #00e5b4 !important; }

    .custom-shadow {
      box-shadow: 0 0 6px rgba(0, 229, 180, 0.2);
    }

    .btn-secondary {
      background-color: #1c2128 !important;
      border: 1px solid #30363d !important;
      color: #e6edf3 !important;
      border-radius: 6px;
    }
    .btn-secondary:focus {
      outline: none;
      box-shadow: 0 0 0 0.25rem rgba(0, 229, 180, 0.3);
    }
    .btn-secondary:hover { border-color: #00e5b4 !important; color: #00e5b4 !important; }

    .btn-primary {
      background-color: #00e5b4 !important;
      border-color: #00e5b4 !important;
      color: #0d1117 !important;
      font-weight: 600;
      border-radius: 8px;
    }
    .btn-primary:focus {
      outline: none;
      box-shadow: 0 0 0 0.4rem rgba(0, 229, 180, 0.3);
    }
    .btn-primary:hover { background-color: #00b894 !important; border-color: #00b894 !important; }

    /* 라디오 버튼 그룹 */
    .btn-group .btn.active,
    .btn-group .btn:active {
      background-color: #00e5b4 !important;
      border-color: #00e5b4 !important;
      color: #0d1117 !important;
    }

    #email-message { font-size: 15px; font-family: "Arial", sans-serif; }

    /* checkbox */
    input[type="checkbox"] { accent-color: #00e5b4; }
    label[for="agree"] { font-size: 13px; color: #8b949e; font-weight: normal; }
  </style>
  </head>

  <body>
   <!--////////// Header Start ////////////-->
   <jsp:include page="../main/mainH.jsp"></jsp:include>
   <!--////////// Header end ////////////-->

  <!--////////// Main start //////////////-->
  <main>
    <section>
      <header></header>

      <div class="d-flex justify-content-center">
        <div class="card shadow p-4 mb-3 mt-2 rounded" style="width: 30rem; background-color:#161b22; border:1px solid #30363d;">
            <div class="card-body">

          <form action="join" style="padding: 15px;" source="email" name="form" method="post" class="needs-validation">
              <input type="hidden" id="m_class_hidden" name="m_class_hidden" value="" />

              <div class="btn-group mb-3" data-toggle="buttons" style="width:300px;">
                  <label class="btn btn-primary active">
                      <input type="radio" name="m_class" value="0" checked> 개인
                  </label>
                  <label class="btn btn-primary">
                      <input type="radio" name="m_class" value="1"> 사업자
                  </label>
              </div>

                  <div class="form-outline mb-4">
                      <label for="m_email" style="display: block; margin-bottom: 5px; margin-top: 22px;">이메일</label>
                      <input type="email" onkeyup="checkEmail(this.value)" placeholder="ramsi@ramsithunder.com" class="form-control form-outline custom-shadow" id="m_email" name="m_email" style="width: 300px;" required>
                      <div id="email-message" style="color: #f85149;"></div>
                      <span id="box"></span>
                  </div>

                <div class="form-outline mb-4">
                  <label for="rg_pw">비밀번호</label>
                  <input type="password" placeholder="8자 이상(최소 숫자 1개, 문자 1개 포함)" class="form-control form-outline custom-shadow" required id="rg_pw" name="m_pw" style="width: 300px;">
                </div>

                <div class="form-outline mb-4">
                  <label for="rg_pw_chk">비밀번호 확인</label>
                  <input type="password" id="rg_pw_chk" name="rg_pw_chk" required="" class="form-control form-outline custom-shadow" required placeholder="비밀번호를 다시 입력해주세요" style="width: 300px;">
                </div>

                <div class="form-outline mb-4">
                  <label for="m_name">이름</label>
                  <input type="text" id="m_name" name="m_name" placeholder="이름을 입력해주세요" class="form-control form-outline custom-shadow" required style="width: 300px;">
                </div>

                <div class="form-outline mb-4">
                    <label for="m_phone_part1">연락처</label>
                    <div class="d-flex align-items-center">
                      <input type="text" id="m_phone_part1" name="m_phone_part1" placeholder="010" class="form-control form-outline custom-shadow" required style="width: 70px;" maxlength="3">
                      <span style="color:#8b949e;">&nbsp;-&nbsp;</span>
                      <input type="text" id="m_phone_part2" name="m_phone_part2" placeholder="1234" class="form-control form-outline custom-shadow" required style="width: 80px;" maxlength="4">
                      <span style="color:#8b949e;"> &nbsp;-&nbsp;</span>
                      <input type="text" id="m_phone_part3" name="m_phone_part3" placeholder="5678" class="form-control form-outline custom-shadow" required style="width: 80px;" maxlength="4">
                      &nbsp;&nbsp;
                      <button type="button" id="phoneCheckBtn" class="btn btn-secondary btn-sm">중복체크</button>
                  </div>
                </div>

                <div class="mb-3">
                <input type="checkbox" id="agree" name="rg_ok" value="On" class="u-active-palette-4-base u-border-2 u-border-grey-75 u-field-input">
                <label for="agree" class="u-field-label">이용약관과 개인정보취급방침에 동의합니다.</label>
              </div>

              <div class="u-align-right u-form-group u-form-submit u-label-top">
                <button onclick="send(this.form)" type="button" class="btn btn-primary bg-gradient">가입하기</button>
              </div>

              <hr class="divider">

              <div id="login-link" class="justify-content-end">
              <p style="color:#8b949e;">이미 계정이 있으신가요? <a href="login">로그인</a></p>
              </div>

            </form>

          </div>
        </div>
      </div>
    </section>
  </main>
    <!--////////// Main end //////////////-->

       <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
       <script>

        function checkEmail(email) {
          var atCount = email.split('@').length - 1;
          var dotCount = email.split('.').length - 1;
          var specialChars = /[!#%^&*()+=\\]/g;

          if (atCount === 1 && dotCount === 1 && !specialChars.test(email) &&!email.endsWith('.')) {
            document.getElementById("email-message").textContent = "";
          } else {
            document.getElementById("email-message").textContent = "이메일 형식이 올바르지 않습니다";
          }
        }


           <c:if test="${cnt == 0}">
               alert("회원가입에 실패했습니다. 다시 시도하세요");
           </c:if>

          //가입하기 버튼 눌렀을때
           function send(form){

             var mClassValue = $('input[name="m_class"]:checked').val();
             $('#m_class_hidden').val(mClassValue);

             let phoneNumberPart1 = $('#m_phone_part1').val();
             let phoneNumberPart2 = $('#m_phone_part2').val();
             let phoneNumberPart3 = $('#m_phone_part3').val();
            let phoneNumber = phoneNumberPart1 + phoneNumberPart2 + phoneNumberPart3

            let phoneNumberPattern = /^\d+$/;

               let check1 = /^[a-z0-9]{5,}$/;
               let check2 = /^(?=.*[a-z])(?=.*\d).{8,}$/;
               let check3 = /^[가-힣]{2,20}$/;
               let check5 = /^[a-zA-Z0-9]+@[a-z]+\.[a-zA-Z]{2,3}$/i;

               let email = $("#m_email").val();
               let pw = $("#rg_pw").val();
               let pwchk = $("#rg_pw_chk").val();
               let name = $("#m_name").val();

               if(email.trim().length < 1){
                   alert("이메일을 입력하세요");
                   $("#m_email").focus();
                   return;
               }

               if(!check5.test(email)){
                   alert("이메일 형식이 올바르지 않습니다");
                   $("#m_email").focus();
                   return;
               }

               if(pw.trim().length < 1){
                   alert("비밀번호를 입력하세요");
                   $("#rg_pw").focus();
                   return;
               }

               if(!check2.test(pw)){
                   alert("비밀번호는 최소 숫자1개, 소문자1개 포함한 8자 이상");
                   $("#rg_pw").focus();
                   return;
               }

               if(pwchk.trim() != pw.trim()){
                   alert("비밀번호가 일치하지 않습니다");
                   $("#rg_pw_chk").focus();
                   return;
               }

               if(name.trim().length < 1){
                   alert("이름을 입력하세요");
                   $("#m_name").focus();
                   return;
               }

               if(!check3.test(name)){
                   alert("이름은 2자 이상 20자 이하의 한글로 입력해주세요");
                   $("#m_name").focus();
                   return;
               }

              if (phoneNumberPart1.trim().length < 1 || phoneNumberPart2.trim().length < 1 || phoneNumberPart3.trim().length < 1) {
                  alert("연락처를 모두 입력하세요");
                  $("#m_phone_part1").focus();
                  return;
                }

                if (!phoneNumberPattern.test(phoneNumber)) {
              alert("연락처는 숫자만 입력해야 합니다");
              $("#m_phone_part1").focus();
              return;
            }

              if ($('#phoneCheckBtn').css('background-color') != 'rgb(177, 177, 177)') {
                alert("연락처 중복체크를 완료해주세요");
                return;
              }

               if(!$("#agree").is(":checked")){
                   alert("약관동의를 해주세요");
                   $("#agree").focus();
                   return;
               }

               $.ajax({
                 url: 'join',
                 type: 'POST',
                 data: $(form).serialize(),

                 success: function(response) {
                   if (response.success) {
                     alert("회원가입을 축하합니다. 로그인 해주세요.");
                     window.location.href = "/login";

                   } else {
                     alert("회원가입에 실패했습니다. 다시 시도해주세요.");
                   }
                 },
                 error: function() {
                   alert("회원가입에 실패했습니다. 다시 시도해주세요.");
                 }
               });

           }

           $(function(){

              $('#phoneCheckBtn').click(function(){

                var phoneNumberPart1 = $('#m_phone_part1').val();
                var phoneNumberPart2 = $('#m_phone_part2').val();
                var phoneNumberPart3 = $('#m_phone_part3').val();
                var phoneNumber = phoneNumberPart1 + phoneNumberPart2 + phoneNumberPart3;

                  var phoneNumberPattern = /^\d+$/;

              if (phoneNumberPart1.trim().length < 1 || phoneNumberPart2.trim().length < 1 || phoneNumberPart3.trim().length < 1) {
                  alert("연락처를 모두 입력하세요");
                  $("#m_phone_part1").focus();
                  return;
                }

                if (!phoneNumberPattern.test(phoneNumber)) {
              alert("연락처는 숫자만 입력해야 합니다");
              $("#m_phone_part1").focus();
              return;
            }

                    $.ajax({
                      url: 'checkPhone',
                      type: 'POST',
                       data:  {
                               "m_phone": phoneNumberPart1 + phoneNumberPart2 + phoneNumberPart3
                              },

                      success: function(response){
                            if (response.str.includes("사용 가능한 번호입니다")) {
                              alert("사용 가능한 번호입니다.");
                              $('#phoneCheckBtn').css('background-color', '#B1B1B1')
                            } else {
                              alert("이미 등록된 번호입니다.");
                              $('#phoneCheckBtn').css('background-color', '');
                            }
                      },
                      error: function() {
                        console.error('중복 체크 요청 실패');
                      }
                    });
              });

                $("#m_email").bind("focusout", function(){
                    var str = $(this).val();
                    if(str.trim().length > 0){
                        $.ajax({
                            url: 'checkEmail',
                            type: 'POST',
                            data: {"m_email":str.trim()}
                        }).done(function(res){
                            var msg = res.msg;
                            if(msg.includes("사용가능")){
                              $("#box").html(res.msg.trim()).css("color","#3fb950");
                            }else{
                             $("#box").html(res.msg.trim()).css("color","#f85149");
                            }
                        });
                    }else
                        $("#box").html("");
                });
            });

       </script>


    <!--////////// Footer start //////////////-->
    <jsp:include page="../main/mainF.jsp"></jsp:include>
    <!--////////// Foter end //////////////-->

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
   integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  </body>

  </html>
