<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.member.model.vo.*" %>
<%@ include file="/views/common/header.jsp"%>
<%
	//서버에서 보낸 데이터
	Member logginedmember = (Member) session.getAttribute("memberloggined");
	Member m = (Member)request.getAttribute("member");
%>
<style>
  .mptitle h1 {
      font-family: 'S-CoreDream-8Heavy', sans-serif;
      text-align: center;
      margin: 50px;
  }

  table tbody tr th label {
      margin-left: 70%;
  }

  button {
      margin-left: 5px;
      display: -webkit-flex;
      justify-content: center;
      align-items: center;
      width: 60px;
      height: 30px;
      overflow: hidden;
      font-size: 16px;
      border: 1px solid #ddd;
  }

  .modifybtn {
  
      background-color: #107bb3;
      color: white;
  }

  .board-view-btn {
      margin: 40px 0 80px 0;
      display: -webkit-flex;
      justify-content: flex-end;
      align-items: center;
      width: 100%;
      height: auto;
  }

  em {
      color: red;
  }

  .table tbody tr th {
      width: 35%;
  }

  span.alert {
      background-color: white;
      border: 0px;
  }

  span.alert:nth-child(2) {
      color: red;
  }
  #pwterms{
  	color:gray; 
  	margin-left:3%;
  }
 
</style>
<section id="ptn_enroll-container">
	<div class="mptitle">
        <h1>업체회원 정보 수정</h1>
    </div>

    <div class="container">
        <!-- 본문 시작-->
        <!-- 여기에 코드 추가! -->
    <form id ="membermodi" action="" method="POST">
    <table class="table">
      <tbody>
          <tr>
              <th>
                  <label for="member_id"><em>* </em>아이디</label>
              </th>
              <td>
                  <input type="text" name="member_id" id="member_id_" 
                  placeholder="영문·숫자 4~15자리" readonly value="<%=m.getMemberId() %>"
                  pattern="^[a-z][a-zA-Z0-9]{4,15}$">
              </td>
          </tr>
          <tr>
              <th>
                  <label for="member_name"><em>* </em>이름</label>
              </th>
              <td>
                  <input type="text" name="member_name" id="member_name"
                  placeholder="한글 2~4글자" value="<%=m.getMemberName() %>"
                  pattern="^[가-힣]{2,4}$">
              </td>
          </tr>
          <tr>
              <th>
                  <label for="member_pw"><em>* </em>비밀번호</label>
              </th>
              <td>
                  <input type="password" name="member_pw" id="member_pw_" 
                  value="<%=m.getMemberPw() %>" required>
                  <small id="pwterms">영문·숫자·특수문자 조합 6~15자리</small>
              </td>
          </tr>
          <tr>
              <th>
                  <label for="member_pwck"><em>* </em>비밀번호확인</label>
              </th>
              <td>
                  <input type="password" name="member_pwck" id="member_pwck" 
                  value="<%=m.getMemberPw() %>" required>
                  <small id="labelpw">
                      <span class="alert alert-success" id="alert-success">비밀번호가 일치합니다</span>
                      <span class="alert alert-danger" id="alert-danger">비밀번호가 일치하지않습니다</span>
                  </small>
              </td>
          </tr>
          <tr>
              <th>
                  <label for="member_email"><em>* </em>이메일주소</label>
              </th>
              <td>
                  <input type="email" name="member_email" id="member_email" 
                  placeholder="hyolo@example.com" value="<%=m.getMemberEmail() %>"
                  pattern="^[\w-]{4,}@[\w-]+(\.\w+){1,3}$">
              </td>
          </tr>
          <tr>
              <th>
                  <label for="member_phone"><em>* </em>전화번호</label>
              </th>
              <td>
                  <input type="tel" name="member_phone" id="member_phone" maxlength="11"
                  placeholder="ex) 01012341004" value="<%=m.getMemberPhone() %>"
                  pattern="^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$">
              </td>
          </tr>
          <tr>
              <th>
                  <label for="address"><em>* </em>주소</label>
              </th>
              <td>
                  <input type="text" name="postcode" id="postcode" placeholder="우편번호" value="<%=m.getMemPostcode() %>">
                  <input type="button" onclick="Postcode();" value="우편번호 찾기"><br>
                  <input type="text" name="address" id="address" placeholder="주소" value="<%=m.getMemAddress() %>">
                  <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" value="<%=m.getMemDetailAddress() %>">
                  <input type="text" name="extraAddress" id="extraAddress" placeholder="동/건물" value="<%=m.getMemExtraAddress() %>">
              </td>
          </tr>
      </tbody>
  </table>
		<div class="board-view-btn">
		  <input type="button" value="탈퇴" onclick="deletemember();">
		  <input type="button" class ="modifybtn" value="정보수정" onclick="modify();">
		</div>
  </form>

</div>
    <script>
		function deletemember(){
			if(confirm("정말로 탈퇴하시겠습니까?")){
				location.replace('<%=request.getContextPath()%>/member/memberDelete?member_id=<%=logginedmember.getMemberId()%>');			
			}
		};
        $(function () {
            $("#alert-success").hide();
            $("#alert-danger").hide();
            $("#member_pw_").focus();
            $("#member_pw_").val("");
            $("#member_pwck").val("")

            $("#member_pwck").click(function(){
         		
      			var pwcheck = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()]).*$/;
                  var pw = $("#member_pw_").val();
                  var pwck = $("#member_pwck").val();

                  if (!pwcheck.test(pw)) {
                      alert("비밀번호는 비밀번호영문·숫자·특수문자 조합 6~15자리입니다.");
                      $("#member_pw_").val("");
       				  $("#member_pw_").focus();
                      return false;
                  }
                  
            });
            //비밀번호확인 알림창
            $("#member_pwck").keyup(function () {
                var pw = $("#member_pw_").val();
                var pwck = $("#member_pwck").val();
                if (pw != '' && pwck != '') {
                    if (pw == pwck) {
                        $("#alert-success").show();
                        $("#alert-danger").hide();
                        $("#modifybtn").removeAttr("disabled");
                    } else {
                        $("#alert-success").hide();
                        $("#alert-danger").show();
                        $("#modifybtn").attr("disabled", "disabled");
                    }
                }
                
            });
        });
    </script>

    <!-- /.container -->
    
    <!-- 주소api -->

    <script>
        function Postcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data
                                .buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddress").focus();
                }
            }).open();
        }
    </script>


    <!-- 수정버튼누르면 alert 띄우고 메인화면으로 -->
    <script>
        //name은 적용이 안됨;
		function modify() {
            /* if ($("#member_pw_").val()!="" && $("#member_pwck").val()!=""
            		&& ($("#member_pw_").val() == $("#member_pwck").val())) {
                */ 
                if ($("#member_pw_").val().length == 0) {
                    alert("비밀번호를 입력하세요");
                    $("#member_pw_").focus();
                    return false;
                }
                if ($("#member_pwck").val().length == 0) {
                    alert("비밀번호확인을 입력하세요");
                    $("#member_pwck").focus();
                    return false;
                }
                var pwcheck = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()]).*$/;
                var pw = $("#member_pw_").val();
                var pwck = $("#member_pwck").val();

                if (pwcheck.test(pw) && pw==pwck) {
                
                
                const frm = $("#membermodi");
    			const url="<%=request.getContextPath()%>/partner/memberUpdate";
    			
    			frm.attr({
    				"action":url,
    				"method":"post",
    			});
    			frm.submit();
              
            } else {
            	$("#member_pw_").val("");
            	$("#member_pwck").val("");
            	$("#member_pw_").focus();
                alert('다시 확인해주세요');
            }
        };
        
        
        
        
    </script>
</section>
<%@ include file="/views/common/footer.jsp"%>