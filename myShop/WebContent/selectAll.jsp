<%@page import="java.util.ArrayList"%>
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
	
		ArrayList<ProductDTO> list = dao.selectAll(dto);
		
		for(int i = 0; i < list.size(); i++){
			dto = list.get(i);
		}
	%>
</body>
	전체 목록 검색<br>
	<%= dto.getId() %> <br>
	<%= dto.getTitle() %> <br>
	<%= dto.getContent() %> <br>
	<%= dto.getPrice() %>
</html>