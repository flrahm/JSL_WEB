<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	int year = LocalDate.now().getYear();
	pageContext.setAttribute("year", year);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load('current', {
	'packages' : [ 'corechart' ]
	});
</script>
<script type="text/javascript">
	// monthly based chart

/*  	google.charts.load("current", {
		packages : [ 'corechart' ]
	});  */
	google.charts.setOnLoadCallback(ajaxCall_monthlyBased);
	
	
	function drawChart_monthlyBased(data, year) {
		
		if(typeof(year) != typeof(1))
			year = ${year};
		
		var dataRows = new Array();

		// 가장 큰 데이터값에 빨간색을 주기 위한 변수 선언
		var keyMax = 0;
		
		for (key in data) {
			if(keyMax < data[key])
				keyMax = data[key];
		}
		
		
		
	// 열 등록
		for (var i = 1; i <= 12; i++) {

			for (key in data) {
				if ((i + '월') == key) {

					var color = 'blue';
					if (data[key]== keyMax) {
						color = 'red';
					}
					
					
					dataRows.push([ key, data[key], color ]);
					break;
				}
			}
		}

		dataRows.unshift([ "month", "readCnt", {
			role : "style"
		} ]);

		console.log(dataRows);
		var chartData1 = google.visualization.arrayToDataTable(dataRows);

		var view = new google.visualization.DataView(chartData1);
		view.setColumns([ 0, 1, {
			calc : "stringify",
			sourceColumn : 1,
			type : "string",
			role : "annotation"
		}, 2 ]);

		var options = {
			title : year + "년 월 별 대출 현황",
			width : 600,
			height : 400,
			bar : {
				groupWidth : "55%"
			},
			legend : {
				position : "none"
			},
		};
		var chart = new google.visualization.ColumnChart(document
				.getElementById("columnchart_values"));
		chart.draw(view, options);
	}

	function ajaxCall_monthlyBased(year) {
		$.ajax({
			url : 'booklend?cmd=booklend_personalChart&base=monthlyBased&year='
					+ year,
			type : 'get',
			dataType : 'json',
			success : function(data) {
				drawChart_monthlyBased(data, year);
			}
		});

	}
</script>

<script>
	// type based chart 

	// Load the Visualization API and the corechart package.
 /* 	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});  */
	// Set a callback to run when the Google Visualization API is loaded.
	 google.charts.setOnLoadCallback(ajaxCall_typeBased);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.

	function darwChart_typeBased(data) {
		
		var chartData = new google.visualization.DataTable();
		chartData.addColumn('string', 'Topping');
		chartData.addColumn('number', 'Slices');

		for (key in data) {
			//console.log('key:' + key + ' / ' + 'value:' + data[key]);
			chartData.addRows([ [ key, data[key] ] ]);
		}

		// Set chart options
		var options = {
			'title' : '장르별 대출',
			'width' : 1500,
			'height' : 500
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document
				.getElementById('chart_typeBased'));
		chart.draw(chartData, options);
	}

	function ajaxCall_typeBased() {

		$.ajax({
			url : 'booklend?cmd=booklend_personalChart&base=typeBased',
			type : 'get',
			dataType : 'json',
			success : function(data) {
				darwChart_typeBased(data);

			}
		});

	}
</script>
</head>



<body>
<!-- 	<script>
		ajaxCall_typeBased();
		ajaxCall_monthlyBased('2019');
	</script> -->

	<div id="chart_typeBased" style="margin: 0 auto;"></div>
	<!-- <button onclick="ajaxCall_typeBased()">타입별 데이터</button> -->

	<button id="pYearBtn">이전년도</button>
	<button id="nYearBtn">다음년도</button>

	<input type="hidden" id="nowYear" value="${year }">
	<div id="columnchart_values"
		style="margin: 0 auto; width: 2300px; height: 300px;"></div>


	<script>
		$('#pYearBtn').click(function() {
			var nowYear = $('#nowYear').val();
			nowYear -= 1;
			$('#nowYear').val(nowYear);

			ajaxCall_monthlyBased(nowYear);
		});

		$('#nYearBtn').click(function() {
			var nowYear = $('#nowYear').val();
			nowYear *= 1;
			nowYear += 1;
			$('#nowYear').val(nowYear);

			ajaxCall_monthlyBased(nowYear);
		});
	</script>

</body>
</html>