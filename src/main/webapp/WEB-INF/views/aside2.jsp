<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Nanum+Gothic&family=Noto+Sans+KR:wght@900&family=UnifrakturCook&display=swap" rel="stylesheet">

<script src="../resources/js/jquery-3.6.1.min.js"></script>

<link rel="stylesheet" href="../resources/css/aside.css?after" />
<link rel="stylesheet" href="./resources/css/aside.css?after" />

</head>
<body>
<aside>
	<script>
		$(document).ready(function(){
			$('#main_menu > li > a').off().on("click", function() {
				$(this).next($('.snd_menu')).slideToggle('fast');
			});
			$('.snd_menu > li > a').off().on("click", function(e) {
	            e.stopPropagation();
	            $(this).next($('.trd_menu')).slideToggle('fast');
	        })
		});
	</script>
	<nav>
		<!-- <dl>
			<dt>아우터</dt>
			<dd class="aside_dd"><a href="#" onclick="return false;">패딩</a></dd>
			<dd class="aside_dd"><a href="#" onclick="return false;">자켓</a></dd>
		</dl>
		<dl>
			<dt>티＆셔츠</dt>
			<dd class="aside_dd"><a href="#" onclick="return false;">라운드티</a></dd>
			<dd class="aside_dd"><a href="#" onclick="return false;">후드티</a></dd>
			<dd class="aside_dd"><a href="#" onclick="return false;">셔츠</a></dd>
		</dl>
		<dl>
			<dt>바지</dt>
			<dd class="aside_dd"><a href="#" onclick="return false;">트레이닝/조거팬츠</a></dd>
			<dd class="aside_dd"><a href="#" onclick="return false;">레깅스</a></dd>
		</dl>
		<dl>
			<dt>BACK PACK</dt>
			<dd class="aside_dd"><a href="#" onclick="return false;">등산백팩</a></dd>
			<dd class="aside_dd"><a href="#" onclick="return false;">캐주얼백팩</a></dd>
		</dl>
		<dl>
			<dt>기타용품</dt>
			<dd class="aside_dd"><a href="#" onclick="return false;">양말</a></dd>
			<dd class="aside_dd"><a href="#" onclick="return false;">마스크</a></dd>
		</dl>
		<dl>
			<dt>모자</dt>
			<dd class="aside_dd"><a href="#" onclick="return false;">CAP</a></dd>
		</dl>
		<dl>
			<dt>상품가격</dt>
			<dd><input type="checkbox" /><span>남녀공용</span></dd>
			<dd><input type="checkbox" /><span>남성</span></dd>
			<dd><input type="checkbox" /><span>여성</span></dd>
		</dl> -->
		<ul id="main_menu">
          <li>
            <a class="aside_atag as_category" href="./category?c=outer" >아우터</a>
            <ul class="snd_menu sub_menu">
                <li><a class="aside_atag" href="./category?c=outer-parka" >패딩</a></li>
                <li><a class="aside_atag" href="./category?c=outer-jacket" >자켓</a></li>
            </ul>
         </li>
          
            <li>
                <a class="aside_atag as_category" href="./category?c=tshirts" >티＆셔츠</a>
                <ul class="snd_menu sub_menu">
                    <li><a class="aside_atag" href="./category?c=tshirts_crewneck" >라운드티</a></li>
                    <li><a class="aside_atag" href="./category?c=tshirts_hood" >후드티</a></li>
                    <li><a class="aside_atag" href="./category?c=tshirts_shirts" >셔츠</a></li>
                </ul>
            </li>
            <li>
                <a class="aside_atag as_category" href="./category?c=pants_training" >바지</a>
<!--                 <ul class="snd_menu sub_menu"> -->
<!--                     <li><a class="aside_atag" href="#" >트레이닝/조거팬츠</a></li> -->
<!--                     <li><a class="aside_atag" href="#" >레깅스</a></li> -->
<!--                 </ul> -->
            </li>
            <li>
                <a class="aside_atag as_category" href="./category?c=backpack">BACK PACK</a>
                <ul class="snd_menu sub_menu">
                    <li><a class="aside_atag" href="./category?c=backpack_climbing">등산백팩</a></li>
                    <li><a class="aside_atag" href="./category?c=backpack_casual" >캐주얼백팩</a></li>
                </ul>
            </li>
            <li>
                <a class="aside_atag as_category" href="./category?c=hat_cap">모자</a>
                <ul class="snd_menu sub_menu">
                    <li><a class="aside_atag" href="./category?c=hat_cap" >캡</a></li>
                </ul>
            </li>
            <li>
                <a class="aside_atag as_category" href="./category?c=other">기타용품</a>
                <ul class="snd_menu sub_menu">
                    <li><a class="aside_atag" href="./category?c=other_socks" >양말</a></li>
                    <li><a class="aside_atag" href="./category?c=other_mask">마스크</a></li>
                </ul>
            </li>
            
        </ul>
	</nav>
</aside>
</body>
</html>