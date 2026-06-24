<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>마이페이지</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 <link href="../../../css/ramg-dark.css" rel="stylesheet">
 <style>
  body { background-color: #0d1117 !important; }

  .info-row {
   display: flex;
   align-items: center;
   padding: 14px 0;
   border-bottom: 1px solid #30363d;
  }
  .info-row:last-child { border-bottom: none; }

  .info-label {
   width: 90px;
   color: #8b949e;
   font-size: 0.85rem;
   flex-shrink: 0;
  }
  .info-value {
   color: #e6edf3;
   font-size: 0.95rem;
  }
 </style>
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<jsp:include page="../main/mainH.jsp"></jsp:include>
<div class="container section-pad-sm">
  <header>
    <div class="mb-4">
      <h1 class="page-title">나의 정보</h1>
    </div>
  </header>
  <div class="row justify-content-center">
    <div class="col-md-5">
      <div class="dark-card">
        <div class="info-row">
          <span class="info-label">이메일</span>
          <span class="info-value">${mvo.m_email}</span>
        </div>
        <div class="info-row">
          <span class="info-label">이름</span>
          <span class="info-value">${mvo.m_name}</span>
        </div>
        <div class="info-row">
          <span class="info-label">연락처</span>
          <span class="info-value">${mvo.m_phone}</span>
        </div>
        <div class="mt-4 text-end">
          <button type="button" class="neon-outline-btn" onclick="javascript:location.href='updateMember'">Edit</button>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../main/mainF.jsp"></jsp:include>
</body>

</html>
