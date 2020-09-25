<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
		
<!-- 로그인이벤트는 따로 분리했습니다. 아마 일부게시판에만 사용될 것 같아요
	사용해야된다면 푸터 include 한 부분 위쪽편으로 써주시면 됩니다. 그리고 include 하고 다서 </div>로 닫아주세요-->
 <!-- 로그인 modal html -->
    <div class="modal fade login" id="loginModal" data-backdrop="static" data-keyboard="false">
      <div class="modal-dialog login animated">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" >&times;</button>
            <h2 class="modal-title">Login</h2>
          </div>
          <div class="modal-body">
            <div class="box">
              <div class="content">
                <div class="social">
                  <img class="circle naver" src="<%=request.getContextPath()%>\img\Green.PNG" width="80" height="80">
              
                    <img class="circle kakao" src="<%=request.getContextPath()%>\img\kakao.jpg" width="80" height="80">
              
                    <img class="circle google" src="<%=request.getContextPath()%>\img\google.jpg" width="80" height="80">
                </div>
                <div class="division">
                  <div class="line l"></div>
                  <span>or</span>
                  <div class="line r"></div>
                </div>
                <div class="error"></div>
                
                <div class="form loginBox">
                
                  <form method="post" action="<%=request.getContextPath()%>/login" accept-charset="UTF-8">
                    <input id="partner_id" class="form-control" type="text" placeholder="Email" name="id">
                    <input id="partner_pw" class="form-control" type="password" placeholder="Password" name="pw">
                    <input class="btn btn-default btn-login" id="loginBtn" type="submit" value="Login" >
                  
                  
                </div>
                
              </div>
            </div>
            
            <div class="box">
              <div class="content searchIdBox" style="display:none;">
               
                
                <div class="form">
                
                
                  <form method="post" action="<%=request.getContextPath()%>/login" accept-charset="UTF-8">
                    <input id="search_email" class="form-control" type="text" placeholder="이메일" name="findId">
                    <input id="search_pw" class="form-control" type="password" placeholder="비밀번호" name="findPw">
                    <input class="btn btn-default btn-login" id="searchBtn" type="submit" value="찾기" >
                  </form>
                </div>
                
              </div>
            </div>








           <div class="box">
              <div class="content registerBox" style="display:none;">
                <div class="form">
                  <form method="post" html="{:multipart=>true}" data-remote="true" action="<%=request.getContextPath() %>/signupmember" accept-charset="UTF-8">
                  
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active show" data-toggle="tab" href="#login_member">MEMBER</a>
              </li>
               <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#login_partner">PARTNER</a>
              </li>            
            </ul>


         <!--============================= Member 로그인 부분=============================-->
          <div class="tab-content">
            <div class="tab-pane fade active show" id="login_member">
                <!-- 아이디 -->
            <div class="form-group">
              <br><label for="form-label">ID</label><br>
               <input type="text" class="form-control" placeholder="영문·숫자 4~15자리" id="member_id" name="member_id"
                required pattern="^[a-z][a-zA-Z0-9]{4,15}$" style="width:50%;float:left">
                <input type="button" id="findAddress" onclick="id_duplicate();" value="아이디 중복확인" style="float:right"><br>
              <div class="" id="id_check1"></div>
            </div>
           
            
            
            <!--아이디 중복확인 함수  -->
            <script>
            function id_duplicate(){
            	let id=$("#member_id").val().trim();
            	if(id.length<4){
            		alert("아이디는 4글자 이상 입력하세요!");
            		return;
            	}
            	//중복확인창
            	const url="<%=request.getContextPath()%>/checkIdDuplicate";
				const title="chekcIdDuplicate";
				const status="left=500px,top=100px,width=300px,height=300px";
            	
				open("",title,status);
            	
            	checkIdDuplicate.target=title;
            	checkIdDuplicate.action=url;
            	checkIdDuplicate.method="post";
            	//input에 userId값 넣기
            	checkIdDuplicate.member_id.value=id;
            	//form 전송하기
            	checkIdDuplicate.submit();
            	
            }
            </script>
            
            
               <!-- 이름 --><br>
          <div class="form-group">
            <label for="form-label" >name</label>
              <input type="text" class="form-control" placeholder="한글 2~4글자" id="member_name" name="member_name" 
              required pattern="^[가-힝]{2,4}$">
           <div class="" id="name_check1"></div>
          </div>

          <!--============================= Member 비밀번호 =============================-->
          <div class="form-group">
          <label for="psw1">Password<span class="span" id="pwCondition1"></span></label>
            <input type="password" class="form-control" placeholder="영문·숫자 조합 6~15자리" id="pw1" name="pw"  required="required" onchange="pwCondition1()">
          </div>
          <div class="form-group">
          <label for="pswcheck1">Repeat Password<span class="span" id="pwOk"></span></label>
           <input type="password" class="form-control" placeholder="비밀번호 확인" id="pw2" name="pswcheck1"  required="required" onchange="pswCheck1()">
          </div>
  
          <script>
          //비밀번호 확인 
          function pswCheck1() {
            var pw1 = document.getElementById("pw1").value;
            var pw2 = document.getElementById("pw2").value;
            var pwOk = document.getElementById("pwOk");
            if (pw1 != '' && pw2 != '') {
              if (pw1 == pw2) {
                pwOk.innerHTML = " 비밀번호가 일치합니다.";
                pwOk.style.color = "blue";
                return true;
              } else {
                pwOk.innerHTML = " 비밀번호가 일치하지 않습니다!";
                pwOk.style.color = "red";
                return false;
              }
            }
          }
         
          //비밀번호 조건
          function pwCondition1() {
            var pw1 = document.getElementById("pw1").value;
            var pwCondition1 = document.getElementById("pwCondition1");
            var condition1 = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z]).*$/;
            if (condition1.test(pw1)) {
              pwCondition1.innerHTML = "조건이 일치합니다.";
              pwCondition1.style.color = "blue";
              return true;
            } else {
              pwCondition1.innerHTML = "조건이 일치하지 않습니다!";
              pwCondition1.style.color = "red";
              return false;
            }
          }
        </script>


        <!-- 성별 선택 -->
        <div class="form-group">
          Gender&nbsp;
          <label for="female"><input type="radio" name="gender" value="female" id="female">여자 </label>

            <label for="male"><input type="radio" name="gender" value="male" id="male" >남자 </label>
        </div> 
        <!-- 나이 선택 -->
				<div class="form-group">
					<label for="form-label">Date of Birth</label>
				  <input type="date" class="form-control" placeholder="Date of Birth" id="member_age" name="member_age" required>
        </div>
        <!-- 이메일 -->
				<div class="form-group">
					<label for="form-label">Email</label>
				  <input type="email" class="form-control" placeholder="hyolo@example.com" id="member_Email" name="member_Email" required pattern="^[\w-]{4,}@[\w-]+(\.\w+){1,3}$">
				    <div class="" id="email_check1"></div>
        </div>
        <!-- 번호 -->
				<div class="form-group">
					<label for="form-label">Phone</label>
				  <input type="tel" class="form-control" placeholder="ex) 01012341004" id="member_Phone" name="member_Phone" required pattern="^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$">
			  	<div class="" id="tel_check1"></div>
        </div>


                 <!--============================= Member 주소 =============================-->
        <div class="form-group">
          <label style="display:block;">Address</label>
            <input class="col-6" type="text" id="mem_postcode" name="mem_postcode" placeholder="우편번호">
            <input type="button" id="mem_findAddress" onclick="postcode();" value="우편번호 찾기">
            <input type="text" id="mem_address" name="mem_address" placeholder="주소" required>
            <input type="text" id="mem_detailAddress" name="mem_detailAddress" placeholder="상세주소" required>
            <input type="text" id="mem_extraAddress" name="mem_extraAddress" placeholder="참고항목" >
        </div>
        
        <script>
          function postcode() {
              new daum.Postcode({
                  oncomplete: function (data) {
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
                          document.getElementById("mem_extraAddress").value = extraAddr;

                      } else {
                          document.getElementById("mem_extraAddress").value = '';
                      }

                      // 우편번호와 주소 정보를 해당 필드에 넣는다.
                      document.getElementById('mem_postcode').value = data.zonecode;
                      document.getElementById("mem_address").value = addr;
                      // 커서를 상세주소 필드로 이동한다.
                      document.getElementById("mem_detailAddress").focus();
                  }
              }).open();
          }
      </script>

       
           <input type="hidden" name="member_sep" value="회원">

      <!-- 관심사 선택   -->
      <div class="form-group">
       <label for="form-label" >Interest <small>(관심사 선택)</small></label><br>
        <label for="cafeCheck"><input type="radio" name="interest" id = "cafeCheck" value="CAFE" > CAFE </label>
         <label for="restaurantCheck"><input type="radio" name="interest" id = "restaurantCheck" value="RESTAURANT" > RESTAURANT </label>
         <label for="pubCheck"><input type="radio" name="interest" id = "pubCheck" value="PUB" > PUB/BAR </label>
    </div> 

    <!-- Member 전송/취소 버튼 -->   
    <div class="btn_wrap d-flex justify-content-center">
        <input type="submit" class="btn btn-outline-success" value="JOIN" > &nbsp;
        <input type="reset" class="btn btn-outline-success" value="CANCEL" > 
      </div> 
     </form>
       </div>


    <!--=============================Partner 로그인 부분=============================-->    
    
    
     <div class="tab-pane fade" id="login_partner"> 
    <form method="post" html="{:multipart=>true}" data-remote="true" action="<%=request.getContextPath() %>/signuppartner" accept-charset="UTF-8">
			<div class="form-group">
            <!-- 아이디 -->
            <div class="form-group">
              <label for="form-label">ID</label>
              <br>
            <input type="text" class="form-control" placeholder="영문·숫자 4~15자리" id="partner_id" name="partner_id"
            required pattern="^[a-z][a-zA-Z0-9]{4,15}$" style="width:50%;float:left">
            <input type="button" id="findAddress" onclick="id_duplicate();" value="아이디 중복확인" style="float:right"><br>
            <div class="" id="id_check1"></div>
            </div>
            
            <br>
            <!-- 이름 -->
            <div class="form-group">
              <label for="form-label">name</label>
            <input type="text" class="form-control" placeholder="한글 2~4글자" id="partner_name" name="partner_name" 
            required pattern="^[가-힝]{2,4}$" >
            <div class="" id="name_check1"></div>
            </div>

<!--             업체 이름
            <div class="form-group">
              <label for="form-label">ShopName</label>
            <input type="text" class="form-control" placeholder="영어·한글·숫자 1~15글자" id="shopname" name="shopname" 
            required pattern="^[a-zA-Z0-9가-힝]{1,15}$" >
            <div class="" id="shopname"></div>
            </div> -->
        
        
<!--             <form action="" name="checkIdDuplicate">
           		<input type="hidden" name="partner_sep" value="파트너">
            </form> -->
    
    <!-- =========================== Partner 비밀번호======================== -->
              <div class="form-group">
              <label for="psw">Password<span class="span" id="pwCondition2"></span></label>
        <input type="password" class="form-control" placeholder="영문·숫자 조합 6~15자리" id="pw3" name="pw2"
            onchange="pwCondition2()">
          </div>
            <div class="form-group">
        <label for="pswcheck">Repeat Password<span class="span" id="pwOk1"></span></label>
        <input type="password" class="form-control" placeholder="비밀번호 확인" id="pw4" name="pswcheck" onchange="pswCheck()">
      </div>

	<input type="hidden" name="partner_sep" value="파트너">
	
        <script>
        //비밀번호 확인 
        function pswCheck() {
          var pw3 = document.getElementById("pw3").value;
          var pw4 = document.getElementById("pw4").value;
          var pwOk1 = document.getElementById("pwOk1");
          if (pw3 != '' && pw4 != '') {
            if (pw3 == pw4) {
              pwOk1.innerHTML = " 비밀번호가 일치합니다.";
              pwOk1.style.color = "blue";
              return true;
            } else {
              pwOk1.innerHTML = " 비밀번호가 일치하지 않습니다!";
              pwOk1.style.color = "red";
              return false;
            }
          }
        }
       
        //비밀번호 조건
        function pwCondition2() {
          var pw3 = document.getElementById("pw3").value;
          var pwCondition2 = document.getElementById("pwCondition2");
          var condition = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z]).*$/;
          if (condition.test(pw3)) {
            pwCondition2.innerHTML = "조건이 일치합니다.";
            pwCondition2.style.color = "blue";
            return true;
          } else {
            pwCondition2.innerHTML = "조건이 일치하지 않습니다!";
            pwCondition2.style.color = "red";
            return false;
          }
        }
      </script>
      
	        
            <!-- 이메일  -->
            <div class="form-group">
              <label for="form-label">Email</label>
              <input type="email" class="form-control" placeholder="hyolo@example.com" id="partner_Email" name="partner_Email" required pattern="^[\w-]{4,}@[\w-]+(\.\w+){1,3}$">
             <div class="" id="email_check1"></div>
            </div>
            
            <!-- 번호 -->
            <div class="form-group">
              <label for="form-label">Phone</label>
              <input type="tel" class="form-control" placeholder="ex) 01012341004" id="partner_Phone" name="partner_Phone" required pattern="^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$">
             <div class="" id="tel_check1"></div>
            </div>
            
    

  <!--=============================Partner 주소=============================-->    
     <div class="form-group">
      <label style="display:block;">Address</label>
        <input class="col-6" type="text" name="partner_postcode" id="postcode" placeholder="우편번호">
        <input type="button" id="findAddress" onclick="Postcode();" value="우편번호 찾기">
        <input type="text" id="address" name="partner_address" placeholder="주소" required>
        <input type="text" id="detailAddress" name="partner_detailAddress" placeholder="상세주소" required>
        <input type="text" id="extraAddress" name="partner_extraAddress" placeholder="참고항목" >
    </div>
    
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
          
            </div> 
         
              <!-- 전송 버튼 -->
              <div class="btn_wrap d-flex justify-content-center">
                <input type="submit" class="btn btn-outline-success" value="JOIN"  onclick="joinCheck();">&nbsp;
                <input type="reset" class="btn btn-outline-success" value="CANCEL" onclick="removeCheck();"> 
              </div>
               </form>
               
               
              </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <div class="forgot login-footer">
            <div><label for="saveId"><input id="saveId" type="checkbox" name="saveId">Stay signed in</label></div>
              <span>Looking to
                <a href="javascript: showRegisterForm();">create an account</a>
                ?</span>
            </div>
            <div class="forgot register-footer" style="display:none">
              <span>Already have an account?</span>
              <a href="javascript: showLoginForm();">Login</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    