<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<jsp:useBean id="dto" class="product.ProductDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
<body>

	<%
		ProductDAO dao = new ProductDAO();
		
		int res = dao.delete(dto);
		
		String alert ="", url = null;
		if(res > 0){
			alert = "입력한 상품이 삭제되었습니다.";
			url = "insert.html";
		}else{
			alert = "입력한 상품은 존재하지 않습니다.";
			url = "delete.html";
		}
	%>

</body>
	<script type="text/javascript">
		alert('<%=alert%>')
		location.href=("<%=url%>")
	</script>
</html>