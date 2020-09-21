<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<style>
.box {
    border-radius: 6px;
    border: solid 1px rgba(144, 144, 144, 0.25);
    margin-bottom: 2em;
    padding: 3em 2em;
    }
    section.special, article.special {
    text-align: center;
}
h3 {
    font-size: 1.25em;
    line-height: 1.5em;
}
h1, h2, h3, h4, h5, h6 {
    color: #666f77;
    font-weight: 300;
    line-height: 1em;
    margin: 0 0 1em 0;
    text-transform: uppercase;
    letter-spacing: 0.125em;
}

.icon.major {
    display: inline-block;
    margin: 0 0 1.25em 0;
    color: #ffffff;
    background: #629DD1;
    width: 3em;
    height: 3em;
    font-size: 2em;
    text-align: center;
    line-height: 3em;
    border-radius: 100%;
    box-shadow: 0 0 0 10px #fff, 0 0 0 11px rgba(144, 144, 144, 0.25);
}

.icon {
    text-decoration: none;
    border-bottom: none;
    position: relative;
}

*, *:before, *:after {
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    /* box-sizing: border-box; */
}
.row>* {
    padding-left: 4em;
}
.\34 u {
    width: 50%;
}
</style>
<div class="container">
<div class="row">
						<div class="4u">
							<section class="special box">
								<i class="icon fa-area-chart major"></i>
								<h3><a href="<%=request.getContextPath()%>/views/partner/ptnRequest2.jsp">사이트에 사용할 이미지 등록</a></h3>
								<p>Eu non col commodo accumsan ante mi. Commodo consectetur sed mi adipiscing accumsan ac nunc tincidunt lobortis.</p>
							</section>
						</div>
						<div class="4u">
							<section class="special box">
								<i class="icon fa-refresh major"></i>
								<h3>예약 서비스 제공 설정하기</h3>
								<p>Eu non col commodo accumsan ante mi. Commodo consectetur sed mi adipiscing accumsan ac nunc tincidunt lobortis.</p>
							</section>
						</div>
						
					</div>
					</div>

<%@ include file="/views/common/footer.jsp"%>