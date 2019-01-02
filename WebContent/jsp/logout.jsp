<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.removeAttribute("uvo");
%>
<!DOCTYPE html>
<html lang="ko">
<script>
	location.href = 'index';

	if($(uvo == null))
		history.go(1);
</script>
</html>