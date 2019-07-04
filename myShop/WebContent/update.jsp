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
	
		int res = dao.update(dto);
		String alert = "";
		if(res > 0){
			alert = "입력한 아이디에 상품설명과 가격이 수정되었습니다.";
		}else{
			alert = "입력한 아이디는 없는 아이디입니다.";
		}
	%>

</body>
	<script type="text/javascript">
		alert('<%=alert%>')
	</script>
	수정된 상품용
	상품설명 : <%= dto.getContent() %> <br>
	가격 : <%= dto.getPrice() %>
</html>