<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js" type="text/javascript"></script>

   <link rel="stylesheet" 
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<title>Insert title here</title>
</head>
<body>
<h3>카트차표</h3>

<div class="container">
	<div class="row">
		<div class="col-me-6">
			<canvas id="myChartTwo" width="500" height="400"></canvas>
		</div>
	</div>
</div>
<script>
	const myChartTwo = document.getElementById('myChartTwo').getContext('2d');
	

	function getRandomColor() {
	    var letters = '0123456789ABCDEF'.split('');
	    var color = '#';
	    for (var i = 0; i < 8; i++ ) {
	        color += letters[Math.floor(Math.random() * 16)];
	    }
	    return color;
	}
	var data_arr = [1, 2, 3, 4, 5];
	var bg_colors = data_arr.map( item => getRandomColor() );
//	가로
	const barChartTwo=new Chart(myChartTwo,{
		type:'bar',
		data:{
			labels:[
				"<c:forEach items='${list }' var='cart' varStatus='status'> "
				+"${cart.productDto.p_name }<c:if test='${status.last eq false}'>","</c:if> "
				+"</c:forEach>"
					],
			datasets:[{
				axis: 'y',
				label:'상품 수량',
				data:[
					"<c:forEach items='${list }' var='cart' varStatus='status'> "
					+"${cart.totalcnt }<c:if test='${status.last eq false}'>","</c:if> "
					+"</c:forEach>"
					],
				fill: false,	
				backgroundColor:
					bg_colors,

				borderColor:[

			
				],
				borderWidth:3
			}]
		},
			options: {
					responsive: false,
				    indexAxis: 'y',
			}
		
	});
	

	
	
</script>
</body>
</html>