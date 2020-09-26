/*
 *
 * login-register modal
 * Autor: Creative Tim
 * Web-autor: creative.tim
 * Web script: http://creative-tim.com
 * 
 */

function searchIdForm(){
    $('.loginBox').fadeOut('fast',function(){
        $('.searchIdBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('Search ID');
    }); 
   
       
}

function fn_openId(){
	 
	$('.loginBox').fadeOut('fast',function(){
        $('.foundId').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });

    }); 

}


function searchPwdBox(){
    $('.loginBox').fadeOut('fast',function(){
        $('.searchPwdBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('Search PW');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
       
}


function showLoginForm(){
    $('#loginModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
       	 
           $('.login-footer').fadeIn('fast');    
       	 
        }); 
        $('.modal-title').html('Login');
    });       
    $('.searchIdBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
        	 $('.login-footer').fadeIn('fast');    
        });
        $('.modal-title').html('Login');
    });  
     $('.error').removeClass('alert alert-danger').html('');
     
     $('.searchPwdBox').fadeOut('fast',function(){
         $('.loginBox').fadeIn('fast');
         $('.login-footer').fadeOut('fast',function(){
         	 $('.login-footer').fadeIn('fast');    
         });
         $('.modal-title').html('Login');
     });  
      $('.error').removeClass('alert alert-danger').html('');
} 

function showRegisterForm(){
    $('.loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('Register');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
       
}


function openLoginModal(){
    showLoginForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}
function openSerachModal(){
	searchIdForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}


function openRegisterModal(){
    showRegisterForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}

function loginAjax(){
/*   Simulate error message from the server   */
     shakeModal();
}

function shakeModal(){
	
	
	
    $('#loginModal .modal-dialog').addClass('shake');
             $('.error').addClass('alert alert-danger').html("Invalid email/password combination");
             $('input[type="password"]').val('');
             setTimeout( function(){ 
                $('#loginModal .modal-dialog').removeClass('shake'); 
    }, 1000 ); 
}



function removeCheck() {

    if (confirm("취소버튼을 누르셨습니다. 작성하신 내용은 저장되지않습니다.") == true){   

         location.href='main_final.html'
    }else{ 
        return false;
   
    }
}



    function joinCheck() {

        if (confirm("회원가입이 완료되었습니다. ") == true){   
              
            document.removefrm.submit();
        }else{
            return false;
       
        }
    };
    
    
//function Fn_searchId(){
//	if ($("#searchId_name").val().length == 0) {
//        alert("이름을 입력하세요");
//        return false;
//    }
//	
//    if ($("#searchId_phone").val().length == 0) {
//        alert("전화번호를 입력하세요");
//    if($("#id").length<4){
//    	alert("")
//    }
//    return;
//	}
//};
//	
//    function Fn_searchPw(){
//		
//    if ($("#searchPw_id").val().length == 0) {
//        alert("아이디를 입력하세요");
//        $("#searchPw_id").focus();
//        return false;
//	}
//    if ($("#searchPw_phone").val().length == 0) {
//        alert("전화번호를 입력하세요");
//        return false;
//	}
//    return;
//    };
//  
//$(function(){
//	var namecheck="^[가-힝]{2,4}$"
//	var phonecheck="^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$";
//	var idcheck="^[a-z][a-zA-Z0-9]{4,15}$";
//	  if(!idcheck.test($("#searchPw_id").val())){
//		  $("#searchPw_id").val("");
//	    }
//	    if(!phonecheck.test($("#searchPw_phone").val())){
//	    	alert("숫자형식으로 입력하셔야합니다.");
//	    }
//		
//});

function showLoginForm(){
    $('#loginModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
       	 
           $('.login-footer').fadeIn('fast');    
       	 
        }); 
        $('.modal-title').html('Login');
    });       
    $('.searchIdBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
        	 $('.login-footer').fadeIn('fast');    
        });
        $('.modal-title').html('Login');
    });  
     $('.error').removeClass('alert alert-danger').html(''); 
}

function showRegisterForm(){
    $('.loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('Register');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
       
}

function searchIdForm(){
    $('.loginBox').fadeOut('fast',function(){
        $('.searchIdBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('Search ID');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
       
}

function openLoginModal(){
    showLoginForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}
function openSerachModal(){
	searchIdForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}


function openRegisterModal(){
    showRegisterForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}

function loginAjax(){
/*   Simulate error message from the server   */
     shakeModal();
}

function shakeModal(){
	
	
	
    $('#loginModal .modal-dialog').addClass('shake');
             $('.error').addClass('alert alert-danger').html("Invalid email/password combination");
             $('input[type="password"]').val('');
             setTimeout( function(){ 
                $('#loginModal .modal-dialog').removeClass('shake'); 
    }, 1000 ); 
}



function removeCheck() {

    if (confirm("취소버튼을 누르셧습니다. 작성하신 내용은 저장되지않습니다.") == true){   
    		history.go(-1);     
     //    location.href='main_final.html'
    }else{ 
        return false;
   
    }
}



    function joinCheck() {

        if (confirm("회원가입이 완료되었습니다. ") == true){   
              
            document.removefrm.submit();
        }else{
            return false;
       
        }
    }
