<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<div class="submenu" style="background-color: cornflowerblue;">
	<ul>
		<li><a class="subhome"
			href="<%=request.getContextPath()%>/main.jsp">HOME</a></li>
		<li><a class="subhome" href="./purchase_history.html">주문내역 조회</a></li>
		<li><a class="subhome" href="cart.html.html">장바구니</a></li>
		<li><a class="subhome" href="#">작성한 리뷰 확인</a></li>
		<li><a class="subhome" href="usr_qna.html">작성한 문의 확인</a></li>
	</ul>
</div>
    <!-- 서브메뉴 끝 -->

    <!-- 본문 시작-->
    <div class="cst-status">
        <h1>작성한 문의</h1>
    </div>

    
    
        <form id="bbsVO" name="bbsVO" action="partBbs.do" method="post">

            <input type="hidden" id="pageMode" name="pageMode" value="List">
            <input type="hidden" id="pageIndex" name="pageIndex" value="1">
            <input type="hidden" id="nttId" name="nttId" value="">
            <input type="hidden" id="nttNo" name="nttNo" value="0">
            <input type="hidden" id="nowNum" name="nowNum">

            <div class="board-header">
                <p class="cnt">총 게시물 : <strong>21</strong></p>
                <div class="board-search-form">
                    <label for="searchCondition" class="hidden">검색 구분</label>
                    <select id="searchCondition" name="searchCondition" class="select">
                        <option value="sj">제목</option>
                        <option value="cn">내용</option>
                        <option value="all">제목+내용</option>
                    </select>
                    <label for="searchWord" class="hidden">검색어 입력란</label>
                    <input type="text" class="inp" name="searchWord" id="searchWord" title="검색어 입력" value="">
                    <button type="button" onclick="javascript:fn_se();return false;">검색버튼</button>
                </div>
            </div>

            <div class="tbl-box">
                <table class="tbl-list">
                    <caption>업체 문의 관리 테이블</caption>
                    <thead>
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col">문의 상태</th>
                            <th scope="col">업체</th>
                            <th scope="col">문의자 아이디</th>
                            <th scope="col">문의날짜</th>
                            <th scope="col">대답 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>21</td>
                            <td>
                                <span>공개</span>
                            </td>
                            <td class="al">
                                <a href="./게시글.html">
                                    <span>
                                        아웃백 스테이크 하우스 
                                    </span>
                                </a>
                            </td>
                            <td>id자리</td>
                            <td>2020-08-10</td>
                            <td>미완료</td>                            
                        </tr>
                    </tbody>
                </table>
            </div>


            <div class="board-bottom board-view-btn">
                <div class="paging">
                    <a href="javascript:void(0)" class="on" title="선택됨">1</a>&nbsp;<a href="?pageIndex=2"
                        onclick="fn_list(2);return false; " title="페이지로 이동">2</a>&nbsp;<a href="?pageIndex=3"
                        onclick="fn_list(3);return false; " title="페이지로 이동">3</a>&nbsp;

                </div>
                
            </div>

        </form>
        <!-- 본문 끝 -->


        <!-- /.container -->
    </div>
<style>

        .cst-status {
            margin: 50px;
        }

        .cst-status h1 {
            font-family: 'S-CoreDream-8Heavy', sans-serif;
            text-align: center;
        }
    </style>

<%@ include file="/views/common/footer.jsp"%>