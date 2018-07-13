$(document).ready(function(){
    $("#header_menu ul li").hover(function(){
        $(this).find("ul.submenu").stop().slideToggle(400);		
    })
    $("#add_eatery").click(function(){
        $(this).next().stop().slideToggle(400);		
    })	
});





$(document).ready(function() {
    $("#search").toggle(function() {
        $(".search_menu").fadeIn();
        $("#search > i").removeClass("xi-search xi-3x");
        $("#search > i").addClass("xi-close xi-3x");
    },
    function() {
        $(".search_menu").fadeOut();
        $("#search > i").removeClass("xi-close xi-3x");
        $("#search > i").addClass("xi-search xi-3x");
    });
    $("#lenguage").toggle(function() {
        $(".lenguage_list").show();
    },
    function() {
        $(".lenguage_list").hide();
    });
});       

document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
}, true);

function test_search(){
    if(document.ts.mainsearch_in.value==""){
        document.ts.mainsearch_in.focus();
        return;
    }else{
        document.ts.submit();
    }
}

function test_search_hs(){
    if(document.hs.headersearch_in.value==""){
        document.hs.headersearch_in.focus();
        return;
    }else{
        document.hs.submit();
    }
}

$(function(){
   $(".manager").on("click",function(){
       var maskheight = $(document).height();
       var maskwidth = $(document).width();

       $("#mask").css({"width":maskwidth,"height":maskheight});

       $("#mask").fadeIn(1000);
       $("#mask").fadeTo("slow",0.8);
       $(".window").show();
   });
    $(".close").on("click",function(){
        $(".window").hide();
        $("#mask").fadeOut(1000);
    });
});

$(document).ready(function() {
    $("#loginok").click(function() {
        if(!login.id.value){
        alert("ID를 입려하세요.");
        login.id.focus();
        return;
    }
    if(!login.pw.value){
        alert("password를 입려하세요.");
        login.pw.focus();
        return;
    }
	var form_data = {
		user_id: $("#id").val(),
		user_pw: $("#pw").val()
	};
	$.ajax({
		type: "get",
		url: "login",
		data: form_data,
        dataType:'json',
		success: function(response) {
			if(response.loginok == 'success') {
				alert("로그인 성공!");
				$(".window").hide();
                $("#mask").fadeOut(1000);
                window.location.reload();
			}else if (response.loginok == 'fail'){
                alert("로그인 실패!");
                document.getElementById("id").value="";
                document.getElementById("pw").value="";
                document.getElementById("id").focus();
            }
		},
        error:function(request,status,error){
           alert('code: '+request.status+"\n"+'message: '+request.responseText+"\n"+'error: '+error);
            document.getElementById("id").value="";
            document.getElementById("pw").value="";
            document.getElementById("id").focus();
       }
	});
	return false;
});
});