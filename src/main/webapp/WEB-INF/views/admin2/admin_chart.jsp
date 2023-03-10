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
<h3>차트</h3>

<div class="container">
	<div class="row">
		<div class="col-me-6">
			<canvas id="myChartOne" width="500" height="400"></canvas>
		</div>
		<div class="col-me-6"> 
			<canvas id="myChartTwo" width="500" height="400"></canvas>
 		</div> 
		<div class="col-me-6"> 
			<canvas id="myChartThree" width="500" height="400"></canvas>
 		</div> 
 		<div class="col-me-6"> 
			<canvas id="myChartFour" width="500" height="400"></canvas>
 		</div> 
	</div>
</div>
<script>
// 	var jArray=new Array();
// 	jArray="<c:out value='${arr }'/>";
// 	jArray=JSON.parse(jArray);
// import { Colors } from 'chart.js/auto';
// Chart.register(Colors);	
	
 	const myChartOne = document.getElementById('myChartOne').getContext('2d');
	const myChartTwo = document.getElementById('myChartTwo').getContext('2d');
	const myChartThree = document.getElementById('myChartThree').getContext('2d');
	const myChartFour = document.getElementById('myChartFour').getContext('2d');
	

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
//	세로
	const barChartOne=new Chart(myChartOne,{	
		type:'pie',
		data:{
			labels:['남성','여성'],
			datasets:[{
				//label:'회원수',
				data:['${maleMember}','${femaleMember}'],
				backgroundColor:[
					 'rgba(255, 99, 132, 1.0)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 1.0)',
		                'rgba(153, 102, 255, 0.2)',
		                '#0000ff'

				],
				borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],

				borderWidth:3
			}]
		},
		options:{
			responsive: false,
			scales:{
				/* y:{
					beginAtZero:true
				} */
			}
		}
	}
			
	);
	
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
// 					[
// 					'rgba(255, 99, 132, 1.0)',
// 	                'rgba(54, 162, 235, 0.2)',
// 	                'rgba(255, 206, 86, 0.2)',
// 	                'rgba(75, 192, 192, 1.0)',
// 	                'rgba(153, 102, 255, 0.2)',
// 					'#0000ff'
// 				],
				borderColor:[
// 				    'rgba(255, 99, 132, 1)',
// 	                'rgba(54, 162, 235, 1)',
// 	                'rgba(255, 206, 86, 1)',
// 	                'rgba(75, 192, 192, 1)',
// 	                'rgba(153, 102, 255, 1)',
// 	                'rgba(255, 159, 64, 1)'
			
				],
				borderWidth:3
			}]
		},
			options: {
					responsive: false,
				    indexAxis: 'y',
			}
		
	});
	
	const barChartThree=new Chart(myChartThree,{
		type:'pie',
		data:{
			labels:['10대','20대','30대','40대','50대'],
			datasets:[{
				//label:'회원수',
				data:['${memberchart1}','${memberchart2}','${memberchart3}','${memberchart4}','${memberchart5}'],
				backgroundColor:[
					 'rgba(255, 99, 132, 1.0)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 1.0)',
		                'rgba(153, 102, 255, 0.2)',
		                '#0000ff'

				],
				borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],

				borderWidth:3
			}]
		},
		options:{
			responsive: false,
			scales:{
				/* y:{
					beginAtZero:false
				} */
			}
		}
	}
			
	);
	
	
 	const barChartFour=new Chart(myChartFour,{
 		type:'line',
		data:{
			labels:[<c:forEach items="${reviewAdmin_ScoreDesc }" var="admin_scoredesc">
					"${admin_scoredesc.productDto.p_name }", 
					</c:forEach>],
			datasets:[{
				label:'제품별 평균별점',
				data:[<c:forEach items="${reviewAdmin_ScoreDesc }" var="admin_scoredesc">
						"${admin_scoredesc.productDto.avgscore }", 
						</c:forEach>],
				backgroundColor:[
					'red',
					'blue',
					'green',
					'yellow'
				],
				borderColor:[
					'rgba(255,99,132,1)',
					'rgba(55,162,132,1)',
					'rgba(255,230,132,1)',
					'rgba(75,192,192,1)',
					'rgba(153,102,255,1)',
					'rgba(255,99,132,1)'
				],
			}]
		},
		options:{
			title:{
				display:true,
				text:'제품별 평균별점'
			},
			legend:{
				display:true,
				position:'top'
			},
			layout:{
				enabled:false
			},
			layout:{
				padding:{
					left:10,
					right:10,
					top:10,
					bottom:10
				}
			}
			/* scales:{
				y:{
					beginAtZero:true
				}
			} */
		}
	});
	
	
</script>
</body>
</html>