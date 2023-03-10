<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
function textcheck() {
	var name=$("input[name=p_name]").val();
	var price=$("input[name=p_price]").val();
	var cnt=$("input[name=p_cnt]").val();
	var color=$("input[name=p_color]").val();
	var size=$("input[name=p_size]").val();
	var file=$("input[name=p_filesrc]").val();
	var category=$("input[name=p_category]").val();
	var info=$("input[name=p_info]").val();
	if(name == "" || price == "" || cnt == "" || color == "" || size == "" ||
		file == "" || file == null || category == "" || info == ""){
		alert("상품 내용을 입력하세요")
		return false;
	}else {
		return true;
	}
}
</script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
   rel="stylesheet">
<title>Insert title here</title>
<style>
body{
    text-align: center; 
    font-family: 'Noto Sans KR', sans-serif;
}
.addproduct{
    margin: auto;
	text-align: center;
    padding-top: 20px;
    padding-bottom: 20px;
    width: 400px;
    border: 1px solid;
}
.btn1{
	color: white;
	background-color: black;
	border-color: black;
}
.btn1:hover {
color: black;
background-color: white;
border-color: white;
cursor: pointer;
}
input[type=file]::file-selector-button{
      color: white;
         background-color: black;
         border-color: black;
         transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
         border-radius: 5px;
         border: 1px solid;
}
input[type=file]::file-selector-button:hover{
        color: black;
        background-color: white;
        border-color: black;
        transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
        border-radius: 5px;
        cursor: pointer;
}
.productfile{
	margin: auto;
}
</style>
</head>
<body>
<%@include file="../admin/admin_header.jsp" %> 
    <h1>상품등록</h1>
    
    <div class="addproduct"> 
        <form action="adminProductInsert" method="post" enctype="multipart/form-data"
        onsubmit="return textcheck();">
        <!-- 	상품번호  -->
        <!-- 	<input type="text" name="p_no" /> <br /> -->
            상품 
            <input type="text" name="p_name" /> <br />
            가격 
            <input type="text" name="p_price" /><br />
            재고 
            <input type="text" name="p_cnt" /><br />
        <!-- 	상품등록일  -->
        <!-- 	<input type="date" name="p_date" /><br /> -->
            색상 
            <input type="text" name="p_color" /><br />
            사이즈 
            <input type="text" name="p_size"> <br>  
            상품이미지
            <input type="file" name="p_filesrc" class="productfile"/>
            상품카테고리  
            <input type="text" name="p_category" /><br />
            상품내용  
            <textarea name="p_info"></textarea><br />
            <input type="submit" value="상품등록" class="btn1"/><br />
        </form>	
    </div>
    <footer>
<!-- footer section -->
<%@ include file="../admin/admin_footer.jsp" %> 
</footer>	
</body>
</html>