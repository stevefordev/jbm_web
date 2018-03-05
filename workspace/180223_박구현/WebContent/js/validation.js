/*! 전화번호 저장 및 수정에서 인풋 데이터 유효성 검사 */

// 이름 인풋은 한글만 1 자리에서 10자리까지만 허용
var nameRegExp = /^[ㄱ-힣]{1,10}$/;

// 전화번호 인풋 중간 입력은 숫자로(0~9)만 3~4 자리 허용
var phone2RegExp = /^[0-9]{3,4}$/;

// 전화번호 인풋 마지막 입력은 숫자로(0~9)만 4 자리만 허용
var phone3RegExp = /^[0-9]{4}$/;

// 전화번호 등록 폼이 submit 될때
// 이름 과전화번호의 유효성 검사를 진행
$("#form").submit(function(e) {

	// 이름 인풋값의 유효성 검사
	var name = $("#name").val().trim();
	if (!nameRegExp.test(name)) {
		alert("이름을 1~10글자 한글로 입력해주세요.");
		$("#name").val("").focus();
		return false
	}

	// 전화번호 중간 인풋값의 유효성 검사
	var phone2 = $("#phone2").val();
	if (!phone2RegExp.test(phone2)) {
		alert("전화번호 2번째 자리를 3~4글자 숫자로 입력해주세요.");
		$("#phone2").val("").focus();
		return false
	} else {
		// 실제 불가능한 번호는 더 많을 수 있지만 적어도 0으로만 도배한 번호는 필터 하였습니다.
		// 정규식에 [1~9] 라고 하면 3380 같이 0 이 하나라도 들어갈 수 없어서 정규식은 [0~9] 라고 하였습니다.
		if (phone2 == "000" || phone2 == "0000") {
			alert("전화번호 2번째 자리에 " + phone2 + " 를 입력할 수 없습니다.");
			$("#phone2").val("").focus();
			return false
		}
	}

	// 전화번호 마지막 인풋값의 유효성 검사
	var phone3 = $("#phone3").val().trim();
	if (!phone3RegExp.test(phone3)) {
		alert("전화번호를 3번째 자리를 4글자 숫자로 입력해주세요.");
		$("#phone3").val("").focus();
		return false
	} else {
		// 실제 불가능한 번호는 더 많을 수 있지만 적어도 0으로만 도배한 번호는 필터 하였습니다.
		// 정규식에 [1~9] 라고 하면 3380 같이 0 이 하나라도 들어갈 수 없어서 정규식은 [0~9] 라고 하였습니다.
		if (phone3 == "0000") {
			alert("전화번호를 3번째 자리에 " + phone3 + " 를 입력할 수 없습니다.");
			$("#phone3").val("").focus();
			return false
		}
	}
});