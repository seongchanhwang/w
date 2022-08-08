<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- spring:message="메시지 키값" -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>WORLD 물류관리 시스템</title>
<link rel="stylesheet" href="../../css/base.css">
<script src="../../js/jquery-1.9.1.min.js"></script>
<script src="../../js/uikit.min.js"></script>
<script src="../../js/layout.js"></script>
<script src="../../../js/dashboard/dashboard.js"></script>
<script src="../../../js/dashboard/master-info-edit.js"></script>
<script defer src="../../js/script.js"></script>

</head>

<body>
	<div id="wrap">
		<!-- header -->
		<header id="header">
			<h1>
				<a href="#"> <img src="../../images/logo.png"
					alt="월드비엠 물류관리 시스템"> <span>WORLD 물류관리 시스템</span>
				</a>
			</h1>
			<div class="profile-wrap">
				<div class="info">
					<a href="#">홍길동</a>
					<p>회사명</p>
				</div>
				<a href="#" class="logout">로그아웃</a>
				<div class="d-flex">
					<button class="mem-edit"
						onclick="location.href='003_privacy_info.html'">개인정보</button>
					<button class="alarm-list">알림 목록</button>
				</div>
			</div>
			<!-- s:aside -->
			<nav id="aside">
				<ul class="uk-nav-default uk-nav-parent-icon uk-nav member"
					uk-nav="">
					<li class="uk-open"><a href="210_dashboard.html">대시보드</a></li>
					<li class="uk-parent"><a href="220_order_manage.html">주문관리
					</a>
						<ul class="uk-nav-sub" hidden="">
							<li><a onclick="location.href='goOrderManage.do'">- 재고조회</a></li>
							<li><a href="#">- 주문현황</a></li>
							<li><a href="#">- 직송현황</a></li>
							<li><a href="#">- 예약내역</a></li>
						</ul></li>
					<li class="uk-parent"><a href="230_warehouse_manage.html">입고관리
					</a>
						<ul class="uk-nav-sub" hidden="">
							<li><a onclick="location.href='manageOrder.do'">- 오더하기</a></li>
							<li><a onclick="location.href='orderlist.do'">- 오더내역</a></li>
							<li><a onclick="location.href=goShipmentStatus.do'">-
									선적현황</a></li>
							<li><a href="#">- 통관현황</a></li>
							<li><a href="#">- CY현황</a></li>
							<li><a href="#">- 입고현황</a></li>
							<li><a href="#">- 컨테이너 반납현황</a></li>
						</ul></li>
					<li class="uk-parent"><a href="240_etc_manage.html">기타관리</a>
						<ul class="uk-nav-sub" hidden="">
							<li><a onclick="location.href='goEtcManage.do'"">- 준공서류
									관리</a></li>
							<li><a href="241_all_warehouse.html">- 전체 출/입고 현황</a></li>
							<li><a onclick="location.href='warehouseManage.do'">-
									창고관리</a></li>
							<li><a onclick="location.href='goInvetoryManage.do'">-
									창고별 재고관리</a></li>
							<li><a onclick="location.href='goInventoryStatus.do'">-
									창고별 재고현황</a></li>
							<li><a onclick="location.href='safetyManage.do'">- 안전 재고
									관리</a></li>
							<li><a onclick="location.href='productRegists.do'">- 제품
									등록 관리</a></li>
							<li><a onclick="location.href='creditList.do'">- 여신 관리</a></li>
							<li><a onclick="location.href='inquiryList.do'">- 신규가입문의</a></li>
						</ul></li>
					<li><a onclick="location.href='memberList.do'">회원관리 </a></li>
				</ul>
			</nav>
			<!-- e:aside -->
		</header>

		<!-- s:container -->
		<div id="container">
			<h2 class="normal">개인정보</h2>
			<div id="content">
				<div class="cont-box pt19">
					<!-- 회원 구분 -->

					<form id="frm" name="member-form"> 
					<div class="rows dl-box">
						<h4 class="dl-box-h4">회원 구분</h4>
						<article class="inner">
							<dl class="row col-2">
								<dt>
									아이디 <i class="essen">*</i>
								</dt>
								<dd>
									<input type="text" class="wd210p disable" name="id" value="${Member.id}"
										readonly>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>현재 비밀번호</dt>
								<dd>
									<input id="nowPw" name="nowPw" type="password" class="wd210p" required>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>변경할 비밀번호</dt>
								<dd>
									<input id="chgPw" name="chgPw" type="password" class="wd210p" required>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>비밀번호 확인</dt>
								<dd>
									<input id="chgPw2" name="chgPw2" type="password" class="wd210p" required>
								</dd>
							</dl>
						</article>
					</div>

					<!-- 회원 정보 -->
					<div class="rows dl-box line-t">
						<h4 class="dl-box-h4">회원 정보</h4>
						<article class="inner">
							<dl class="row col-4">
								<dt>회사명</dt>
								<%-- 								<c:choose>
									<c:when test="${fn:contains(Member.companyNm,',')}"> 
										<dd><input type="text" class="wd330p" value="${fn:split(Member.companyNm,',')[0]}" ></dd>
									</c:when>
									<c:otherwise>
										<dd><input type="text" class="wd330p" value="${Member.companyNm}" ></dd>
									</c:otherwise>
								</c:choose>	 --%>
								<dd>
									<input type="text" name="companyNm1" class="wd330p"
										value="${fn:split(Member.companyNm,',')[0]}">
								</dd>
								<dt>
									대표이사명 <i class="essen">*</i>
								</dt>
								<dd>
									<input type="text" class="wd210p" name="ceoNm"
										value="${fn:split(Member.ceoNm,',')[0]}"
										placeholder="대표이사명 입력" required>
								</dd>
							</dl>
							<dl class="row col-4">
								<dt>
									법인등록번호 <i class="essen">*</i>
								</dt>
								<dd>
									<input type="text" class="wd330p" name="businessNum1"
										value="${fn:split(Member.businessNum,',')[0]}"
										placeholder="- 없이 숫자만 입력" required>
								</dd>
								<dt>대표이사 생년월일</dt>
								<dd>
									<input type="text" class="wd210p" name="ceoBirth1"
										value="${fn:split(Member.ceoBirth,',')[0]}" placeholder="">
								</dd>
							</dl>
							<dl class="row col-4">
								<dt>
									대표 전화번호<i class="essen">*</i>
								</dt>
								<dd>
									<input type="text" class="wd210p" name="companyPhoneNum1"
										value="${fn:split(Member.companyPhoneNum,',')[0]}"
										placeholder="- 없이 숫자만 입력" required>
								</dd>
								<dt>팩스번호</dt>
								<dd>
									<input type="text" class="wd210p" name="faxNum1"
										value="${fn:split(Member.faxNum,',')[0]}"
										placeholder="- 없이 숫자만 입력">
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>
									주소<i class="essen">*</i>
								</dt>
								<dd>
									<input type="text" class="wd330p" name="addr11"
										value="${fn:split(Member.addr1,',')[0]}" required> <input
										type="text" class="wd62" name="addr12"
										value="${fn:split(Member.addr2,',')[0]}" placeholder="상세주소"
										required>
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>
									이메일<i class="essen">*</i>
								</dt>
								<dd>
									<input type="text" class="wd210p" placeholder="이메일 입력"
										id="email11" name="email11"
										value="${fn:split(Member.email1,',')[0]}" required> <span>@</span>
									<select title="" name="email2" class="wd210p" required>
										<option value="${fn:split(Member.email2,',')[0]}" selected>${fn:split(Member.email2,',')[0]}</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="self">직접 입력</option>
									</select>
									<!-- 직접 입력할때만 활성화 -->
									<input type="text" class="disable wd30" name="email3" id="email31">
								</dd>
							</dl>
							<dl class="row col-2 dt-start">
								<dt>특이사항</dt>
								<dd>
									<textarea name="specialMessage1" id=""
										placeholder="예) 5톤축차 진입불가" class="wd60">${fn:split(Member.specialMessage,',')[0]}</textarea>
								</dd>
							</dl>

							<br></br>
							<!--추후 퍼블 요청 -->
							<dl class="row col-4">
								<dt>회사명</dt>
								<dd>
									<input type="text" name="companyNm2" class="wd330p"
										value="${fn:split(Member.companyNm,',')[1]}">
								</dd>
								<dt>
									대표이사명 <i class="essen">*</i>
								</dt>
								<dd>
									<input type="text" class="wd210p" name="ceoNm"
										value="${fn:split(Member.ceoNm,',')[1]}"
										placeholder="대표이사명 입력" required>
								</dd>
							</dl>
							<dl class="row col-4">
								<dt>
									법인등록번호 <i class="essen">*</i>
								</dt>
								<dd>
									<input type="text" class="wd330p" name="businessNum2"
										value="${fn:split(Member.businessNum,',')[1]}"
										placeholder="- 없이 숫자만 입력" required>
								</dd>
								<dt>대표이사 생년월일</dt>
								<dd>
									<input type="text" class="wd210p" name="ceoBirth2"
										value="${fn:split(Member.ceoBirth,',')[1]}" placeholder="">
								</dd>
							</dl>
							<dl class="row col-4">
								<dt>
									대표 전화번호<i class="essen">*</i>
								</dt>
								<dd>
									<input type="text" class="wd210p" name="companyPhoneNum2"
										value="${fn:split(Member.companyPhoneNum,',')[1]}"
										placeholder="- 없이 숫자만 입력" required>
								</dd>
								<dt>팩스번호</dt>
								<dd>
									<input type="text" class="wd210p" name="faxNum2"
										value="${fn:split(Member.faxNum,',')[1]}"
										placeholder="- 없이 숫자만 입력">
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>
									주소<i class="essen">*</i>
								</dt>
								<dd>
									<input type="text" class="wd330p" name="addr21"
										value="${fn:split(Member.addr1,',')[1]}"> <input
										type="text" class="wd62" name="addr22"
										value="${fn:split(Member.addr2,',')[1]}" placeholder="상세주소">
								</dd>
							</dl>
							<dl class="row col-2">
								<dt>
									이메일<i class="essen">*</i>
								</dt>
								<dd>
									<input type="text" class="wd210p" placeholder="이메일 입력"
										id="email21" name="email12"
										value="${fn:split(Member.email1,',')[1]}" required> <span>@</span>
									<select title="" name="email22" class="wd210p" required>
										<option value="${fn:split(Member.email2,',')[1]}">${fn:split(Member.email2,',')[1]}</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="self">직접 입력</option>
									</select>
									<!-- 직접 입력할때만 활성화 -->
									<input type="text" class="disable wd30">
								</dd>
							</dl>
							<dl class="row col-2 dt-start">
								<dt>특이사항</dt>
								<dd>
									<textarea name="specialMessage2" id=""
										placeholder="예) 5톤축차 진입불가" class="wd60">${fn:split(Member.specialMessage,',')[1]}</textarea>
								</dd>
							</dl>
						</article>

					</div>
					</form>
					<div class="dl-buttons">
						<button class="btn bg_color3 small wd120p">취소</button>
						<button type="button" id="save-btn"	class="btn bg_color1 small wd120p">저장</button>
					</div>

				</div>
			</div>
		</div>
		<!-- s:container -->
	</div>
</body>
</html>
