<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>알림창</title>
<meta charset="UTF-8">
</head>
<body>
	<script>
    window.onload = function(){
    	alert('${msg}');
	    if(${flag}){
	    	location.href="redirect_true.do";
	    }else{
    		location.href="find_idPw.do";
    	}
    }
</script>
</body>
</html>