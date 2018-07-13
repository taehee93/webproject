// textarea 공백없애기
function nbspDel(val){
	var result = val.replace(/(^\s*)|(\s*$)/, '');
	return result;
}	

/*
공백체크
*/
function checkEmpty(obj, alertString ){
	var errorMesg =  alertString ;
	if(trim(obj.value) == "" ) {
		alert(errorMesg);
		obj.focus();
		return false;
	} else {
		return true;   
	}	
}

/*
	자릿수 채워지면 다음 입력상자로 이동
*/
function nextFocus(leng,obj,nextcol){
	var frm=document.all;
	if(obj.value.length==leng)	{
		next_c="frm."+nextcol+".focus();"
		eval(next_c);
	}
}

/*
문자열 앞뒤에있는 공백없에기
*/
function trim( arg )
{
   var st = 0;
   var len = arg.length;

   //문자열앞에 공백문자가 들어 있는 Index 추출
   while( (st < len) && (arg.charCodeAt(st) == 32) )
   {
      st++;
   }
   //문자열뒤에 공백문자가 들어 있는 Index 추출
   while( (st < len) && (arg.charCodeAt(len-1) == 32) )
   {
      len--;
   }
   return ((st > 0) || (len < arg.length)) ? arg.substring(st, len) : arg;
}

/*달력입력창*/
function calendaropen(form,obj)
{   
  var obj_v = "document."+form+"."+obj+".value";
  var obj_value=eval(obj_v);
  
  var today = new Date();
  var monthName = "010203040506070809101112";
  var dayName = "01020304050607080910111213141516171819202122232425262728293031";
  
  var seldate;	
  var year;	
  var month;	
  var day;	

  if (obj_value=="") {
		year = today.getFullYear();
       	month = monthName.substring(today.getMonth()*2, (today.getMonth() + 1) * 2);
       	day = dayName.substring((today.getDate()-1)*2, today.getDate()*2);
		seldate = year+"-"+month+"-"+day;
  }else{	
		year=obj_value.substring(0,4);
		month=obj_value.substring(5,7);
		seldate=obj_value;
  }
  
  window.open("/common/calendar.jsp?seldate="+seldate+"&year="+year+"&month="+month+"&formname="+form+"&targetname="+obj,"calendar",'scrollbars=no,width=230,height=210');
}

//--숫자만 입력되게//
function inputNum()
{
	em = event.srcElement;
	if(event.keyCode == 109 && em.length == 1)
		return;
	if((event.keyCode <48)||(event.keyCode >57))
		event.returnValue=false;
}

/*  js_dateCheck        :   InputBox에 입력된 날짜가 유효한지 체크하여  */
/*                              유효하면 YYYY-MM-DD의 형태로 변환하여 return*/
/*                              하고, 유효하지 않으면 에러메세지 보여줌     */
/*                              (년월일 입력필드의 onblur event에 사용할것) */
function js_dateCheck(obj) {
    var err  = 0;
    var chartest = obj.value;
    ival  = obj.value;
    if (ival == '') return;
    chartest = js_removeChar(chartest,'-');
    if(chartest.length != 8) {
        alert('YYYYMMDD의 형식으로 입력하십시요.');
		obj.value="";
        obj.focus();
        return;
    }
    cen = chartest.substring(0, 2); // century
    if (cen > 19) {
        yea = chartest.substring(0, 4); // year
    } else {
        yea = chartest.substring(2, 4); // year
    }
    mon = chartest.substring(4, 6); // month
    da  = chartest.substring(6, 8); // day
    //들어온 값 검색 - 문자인지..
    if(!js_numberCheck(chartest)) {
        alert('문자가 입력될수 없습니다.11');
		obj.value="";
        obj.focus();
        return;
    }
    //기본적인 일, 월, 년 에러 검색
    if(mon < 1 || mon > 12) err = 1;
    if(da  < 1 || da  > 31) err = 1;
    if (cen < 20) {
        if(yea < 0 || yea > 99) err = 1;
    }
    if(cen < 19) err = 1;
    if(err == 1) {
        alert('날짜 형식에 맞지 않습니다.11');
		obj.value="";
        obj.focus();
        return;
    }
    d = new Date(yea, mon - 1, da);
    if(yea != d.getFullYear() || mon != (d.getMonth() + 1)) {
        alert('날짜 형식에 맞지 않습니다.22');
		obj.value="";
        obj.focus();
        return;
    }
    else{
         if (cen > 19) {
             obj.value = yea + '-' + mon + '-' + da;
         } else {
             obj.value = cen + yea + '-' + mon + '-' + da;
         }
    }
}
/*   js_removeChar       :   문자열중에서 특정 문자만 제거한 값 return   */
/*          js_removeChar("1","2")                                          */
/*          --> 1: 문자열(String)                                           */
/*              2: 제거할 문자        */
function js_removeChar(str, chr) {
    var src = new String(str);
    var tar = new String();
    var i, len=src.length;
    for (i=0; i < len; i++) {
        if (src.charAt(i) == chr)
            tar += '';
        else
            tar += src.charAt(i);
    }
    return tar;
}
/*    js_numberCheck      :   문자열에 숫자만 있으면 true, 문자가 있으면  */
/*                              false return                                */
/*          js_numberCheck("1")                                             */
function js_numberCheck(str) {
    var src = new String(str);
    var tar = true;
    var i, len=src.length;
    for (i=0; i < len; i++) {
        if ((src.charAt(i) < '0') | (src.charAt(i) > '9'))
            return false;
    }
    return true;
}

//InputBox에 입력된 값에서 '-'값 제거
function js_removeChar2(obj) {
    var src = new String(obj.value);
    var tar = new String();
    var i, len=src.length;
    for (i=0; i < len; i++) {
        if (src.charAt(i) == '-')
            tar += '';
        else
            tar += src.charAt(i);
    }
    obj.value = tar;
}
