<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<script defer src="../../js/script.js"></script>
</head>

<body>
	<div id="wrap">
		<!-- header -->
		<header id="header">
			<h1>
				<a href="#">
					<img src="../../images/logo.png" alt="월드비엠 물류관리 시스템">
					<span>WORLD 물류관리 시스템</span>
				</a>
			</h1>
			<div class="profile-wrap">
				<div class="info">
					<a href="#">홍길동</a>
					<p>회사명</p>
				</div>
				<a href="#" class="logout">로그아웃</a>
				<div class="d-flex">
					<button class="mem-edit" onclick="location.href='003_privacy_info.html'">개인정보</button>
					<button class="alarm-list">알림 목록</button>
				</div>
			</div>
			<!-- s:aside -->
			<nav id="aside">
				<ul class="uk-nav-default uk-nav-parent-icon uk-nav member" uk-nav="">
					<li class=""><a onclick="location.href='goDashboard.do'">대시보드</a></li>
					<li class="uk-parent uk-open">
						<a href="220_order_manage.html">주문관리 </a>
						<ul class="uk-nav-sub" hidden="">
							<li><a onclick="location.href='goOrderManage.do'">- 재고조회</a></li>
							<li class="uk-open"><a href="#">- 주문현황</a></li>
							<li><a href="#">- 직송현황</a></li>
							<li><a href="#">- 예약내역</a></li>
						</ul>
					</li>
					<li class="uk-parent">
						<a href="230_warehouse_manage.html">입고관리 </a>
						<ul class="uk-nav-sub" hidden="">
							<li><a onclick="location.href='manageOrder.do'">- 오더하기</a></li>
							<li><a onclick="location.href='orderlist.do'">- 오더내역</a></li>
							<li><a onclick="location.href=goShipmentStatus.do'">- 선적현황</a></li>
							<li><a href="#">- 통관현황</a></li>
							<li><a href="#">- CY현황</a></li>
							<li><a href="#">- 입고현황</a></li>
							<li><a href="#">- 컨테이너 반납현황</a></li>
						</ul>
					</li>
					<li class="uk-parent">
						<a href="240_etc_manage.html">기타관리</a>
						<ul class="uk-nav-sub" hidden="">
							<li><a onclick="location.href='goEtcManage.do'"">- 준공서류 관리</a></li>
							<li><a href="241_all_warehouse.html">- 전체 출/입고 현황</a></li>
							<li><a onclick="location.href='warehouseManage.do'">- 창고관리</a></li>		
							<li><a onclick="location.href='goInvetoryManage.do'">- 창고별 재고관리</a></li>
							<li><a onclick="location.href='goInventoryStatus.do'">- 창고별 재고현황</a></li>
							<li><a onclick="location.href='safetyManage.do'">- 안전 재고 관리</a></li>
							<li><a onclick="location.href='productRegists.do'">- 제품 등록 관리</a></li>
							<li><a onclick="location.href='creditList.do'">- 여신 관리</a></li>
							<li><a onclick="location.href='inquiryList.do'">- 신규가입문의</a></li>
						</ul>
					</li>
					<li ><a onclick="location.href='memberList.do'">회원관리 </a></li>
				</ul>
			</nav>
			<!-- e:aside -->
		</header>
        <!-- s:container -->
        <div id="container">
            <h2 class="normal">주문현황</h2>
            <div id="content">
                <!-- search box -->
                <div class="cont-box">
                    <article class="inner">
                        <dl class="row col-4">
                            <dt>납기일</dt>
                            <dd><input type="date" class="wd140p"></dd>
                            <dt>거래처</dt>
                            <dd>
                                <select name="" id="" class="wd200p">
                                    <option value="">--선택--</option>
                                </select>
                            </dd>
                        </dl>
                        <dl class="row col-2">
                            <dt>주소</dt>
                            <dd>
                                <select name="" id="" class="wd180p">
                                    <option value="">시도 선택</option>
                                </select>
                                <select name="" id="" class="wd180p">
                                    <option value="">시군구 선택</option>
                                </select>
                                <select name="" id="" class="wd180p">
                                    <option value="">읍면동 선택</option>
                                </select>
                                <input type="text" class="wd40" placeholder="상세주소">
                            </dd>
                        </dl>
                        <dl class="row col-4">
                            <dt>창고</dt>
                            <dd>
                                <select name="" id="" class="wd190p">
                                    <option value="">--선택--</option>
                                </select>
                            </dd>
                            <dt>제품코드</dt>
                            <dd>
                                <select name="" id="" class="wd190p">
                                    <option value="">35</option>
                                </select>
                            </dd>
                        </dl>
                    </article>

                    <div class="dl-buttons mt30">
                        <button class="btn bg_color3 small wd120p">초기화</button>
                        <button class="btn bg_color1 small wd120p">검색</button>
                    </div>
                </div>

                <!-- search result box -->
                <div class="cont-box mt30">
                    <!-- table -->
                    <div class="bbs">
                        <div class="d-flex right gap10 mb16">
                            <button class="btn bg_color4 small">발주취소</button>
                            <button class="btn bg_color1 small ico edit"
                                onclick="location.href='goOrderStatusView.do'">발주변경</button>
                        </div>
                        <table class="b-list">
                            <caption></caption>
                            <colgroup>
                                <col class="wd3">
                                <col class="wd6">
                                <col class="wd8">
                                <col class="wd8">
                                <col class="wd8">
                                <col>
                                <col class="wd7">
                                <col class="wd6">
                                <col class="wd8">
                                <col class="wd7">
                                <col class="wd7">
                                <col class="wd7">
                                <col class="wd4">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">&nbsp;</th>
                                    <th scope="col">현황</th>
                                    <th scope="col">발주일 </th>
                                    <th scope="col">납기일</th>
                                    <th scope="col">거래처</th>
                                    <th scope="col">주소</th>
                                    <th scope="col">창고</th>
                                    <th scope="col">제품코드</th>
                                    <th scope="col">수량(장)/㎡ </th>
                                    <th scope="col">파렛/장</th>
                                    <th scope="col">공급가액(원)</th>
                                    <th scope="col">확정운반비(원)</th>
                                    <th scope="col">발주서</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td rowspan="2"><input type="radio" name="" id=""></td>
                                    <td rowspan="2"> <span class="state-circle red">주문완료</span> </td>
                                    <td rowspan="2">2022-03-21</td>
                                    <td rowspan="2">2022-04-30 오전 09:00 </td>
                                    <td rowspan="2">에코포라인</td>
                                    <td rowspan="2" class="txt-left line">서울시 서초구 서초동 111-1 </td>
                                    <td rowspan="2" class="line "><b>평택창고</b></td>
                                    <td>30S-1 </td>
                                    <td>100 / 120.11</td>
                                    <td>2파렛 5장</td>
                                    <td class="txt-right">1,000,000</td>
                                    <td rowspan="2" class="txt-right">90,000</td>
                                    <td rowspan="2"><a href="#" class="btn-pdf">PDF다운</a></td>
                                </tr>
                                <tr>
                                    <td>30S-1 </td>
                                    <td>100 / 120.11</td>
                                    <td>2파렛 5장</td>
                                    <td class="txt-right">1,000,000</td>
                                </tr>
                                <tr>
                                    <td><input type="radio" name="" id=""></td>
                                    <td><span class="state-circle yellow">배차중</span></td>
                                    <td>2022-03-21</td>
                                    <td>2022-04-30 오전 09:00 </td>
                                    <td>에코포라인</td>
                                    <td class="txt-left">서울시 서초구 서초동 111-1 </td>
                                    <td><b>평택창고</b></td>
                                    <td>30S-1 </td>
                                    <td>100 / 120.11</td>
                                    <td>2파렛 5장</td>
                                    <td class="txt-right">1,000,000</td>
                                    <td class="txt-right">90,000</td>
                                    <td><a href="#" class="btn-pdf">PDF다운</a></td>
                                </tr>
                                <tr>
                                    <td><input type="radio" name="" id=""></td>
                                    <td><span class="state-circle green">배차완료</span></td>
                                    <td>2022-03-21</td>
                                    <td>2022-04-30 오전 09:00 </td>
                                    <td>에코포라인</td>
                                    <td class="txt-left">서울시 서초구 서초동 111-1 </td>
                                    <td><b>평택창고</b></td>
                                    <td>30S-1 </td>
                                    <td>100 / 120.11</td>
                                    <td>2파렛 5장</td>
                                    <td class="txt-right">1,000,000</td>
                                    <td class="txt-right">90,000</td>
                                    <td><a href="#" class="btn-pdf">PDF다운</a></td>
                                </tr>
                                <tr>
                                    <td><input type="radio" name="" id=""></td>
                                    <td><span class="state-circle gray">주문취소</span></td>
                                    <td>2022-03-21</td>
                                    <td>2022-04-30 오전 09:00 </td>
                                    <td>에코포라인</td>
                                    <td class="txt-left">서울시 서초구 서초동 111-1 </td>
                                    <td><b>평택창고</b></td>
                                    <td>30S-1 </td>
                                    <td>100 / 120.11</td>
                                    <td>2파렛 5장</td>
                                    <td class="txt-right">1,000,000</td>
                                    <td class="txt-right">90,000</td>
                                    <td><a href="#" class="btn-pdf">PDF다운</a></td>
                                </tr>
                                <tr>
                                    <td><input type="radio" name="" id=""></td>
                                    <td><span class="state-circle violet">자차사용</span></td>
                                    <td>2022-03-21</td>
                                    <td>2022-04-30 오전 09:00 </td>
                                    <td>에코포라인</td>
                                    <td class="txt-left">서울시 서초구 서초동 111-1 </td>
                                    <td><b>평택창고</b></td>
                                    <td>30S-1 </td>
                                    <td>100 / 120.11</td>
                                    <td>2파렛 5장</td>
                                    <td class="txt-right">1,000,000</td>
                                    <td class="txt-right">90,000</td>
                                    <td><a href="#" class="btn-pdf">PDF다운</a></td>
                                </tr>
                                <tr>
                                    <td><input type="radio" name="" id=""></td>
                                    <td><span class="state-circle blue">출고완료</span></td>
                                    <td>2022-03-21</td>
                                    <td>2022-04-30 오전 09:00 </td>
                                    <td>에코포라인</td>
                                    <td class="txt-left">서울시 서초구 서초동 111-1 </td>
                                    <td><b>평택창고</b></td>
                                    <td>30S-1 </td>
                                    <td>100 / 120.11</td>
                                    <td>2파렛 5장</td>
                                    <td class="txt-right">1,000,000</td>
                                    <td class="txt-right">90,000</td>
                                    <td><a href="#" class="btn-pdf">PDF다운</a></td>
                                </tr>
                            </tbody>
                        </table>

                        <!-- pager -->
                        <div class="pager txt-right">
                            <select name="" id="">
                                <option value="">10개보기</option>
                            </select>
                            <a class="arr prev" href="#">이전</a>
                            <strong class="active">1</strong>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a class="arr next" href="#">다음</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- s:container -->
	</div>
</body>
</html>