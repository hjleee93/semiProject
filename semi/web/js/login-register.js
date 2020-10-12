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
        });
        $('.modal-title').html('Search PW');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
       
}


function showLoginForm(){
	
	$('#foundId .content .searchPwdBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
       	 
           $('.login-footer').fadeIn('fast');    
       	 
        }); 
        $('.modal-title').html('Login');
    });
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
