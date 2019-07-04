function check_title (){
	if (insert_shop.title.value == ""){
		alert("상품제목을 입력해주세요");
		f.title.focus();
		return false;
	}
	document.insert_shop.submit();
}