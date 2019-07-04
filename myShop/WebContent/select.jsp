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
	
		String inputId = request.getParameter("id");
	
		ProductDAO dao = new ProductDAO();
	
		dto = dao.select(inputId);
		
	%>

</body>
	<script type="text/javascript">
	</script>
	검색된 상품 정보<br>
	아이디 : <%= dto.getId() %> <br>
	상품제목 : <%= dto.getTitle() %> <br>
	상품설명 : <%= dto.getContent() %> <br>
	가격 : <%= dto.getPrice() %> <br>
</html>