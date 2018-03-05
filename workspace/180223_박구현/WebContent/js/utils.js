/*! 자주 사용하는 유틸 함수 모음,  moment js 필수
 * 
 * 가산점: 년도/ 월 선택하면 일이 자동으로 만들어짐
 * 
 * */

var $year = $("#year"), $month = $("#month"), $date = $("#date");

var utils = {	
	nowDate : 1,
	createDate : function(isNeedInit) {
		var date = $date.val();

		// 처음 화면 노출시에 updateForm 일경우 디비 초기값
		// registerForm 일경우 오늘 날짜로 셋팅
		if (isNeedInit == true) {
			console.log("initDate_" + isNeedInit);
			date = this.nowDate;
		}
		
		console.log($year.val());
		console.log($month.val());
		console.log("date_" + date);
		
		try {
			$date.empty();
			var year = $year.val();
			var month = $month.val();

			var lastDate = moment(year + "-" + month, "YYYY-MM").daysInMonth();
			for (var i = 1; i <= lastDate; i++) {
				var option = $("<option>").text(i);
				if (date == i) {
					console.log("selected_" + i);

					// .prop("selected", true) 를 사용하는 경우 페이지 내에
					// 리셋버튼 클릭시 일의 select 가 무조건 1일로 선택되는 문제 발생 하여
					// .attr("selected", "selected") 사용
					option.attr("selected", "selected");
				}
				option.appendTo("#date");
			}
		} catch (err) {
			console.log(err.message);
		}
	}
}

// 년과, 월의 selectbox 가 변경 될때마다 수행
$("#year,#month").change(utils.createDate);