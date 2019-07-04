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
	
		int res = dao.insert(dto);
		String alert = "";
		String url = null;
		if(res > 0){
			alert = "상품등록이 완료되었습니다.";
			url = "insert.html";
		}else{
			alert = "상품등록에 실패하였습니다.";
			url = "insert.html";
		}
	%>

</body>
	<script type="text/javascript">
		alert('<%=alert%>')
		location.href=("<%=url%>")
	</script>
	등록된 상품 내용<br>
	아이디 : <%= dto.getId() %> <br>
	상품제목 : <%= dto.getTitle() %> <br>
	상품설명 : <%= dto.getContent() %> <br>
	가격 : <%= dto.getPrice() %>
</html>