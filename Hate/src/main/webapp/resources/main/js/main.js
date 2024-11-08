// 추가한 함수
// 메인페이지 배너 제어
function HSBanner() {
	$('.hideOnce').css('display', 'none');
	$('.hideBanner').css('display', 'block');
}


// 아이디 중복
$('#IdDupCheck').click(function() {
	let userId = $('#inputUserId').val();
	if (userId.trim().length == 0) {
		alert('아이디를 입력해주세요');
	} else {
		console.log(userId);
		$.ajax({
			url : "idCheck",
			type : "post",
			async : false,
			data : {
				sdy : userId
			},
			dataType : 'json',
			success : function(result) {
				if (result == 0) {
					$('#IdDupWarning').css("display", "none");
					$('#IdDupWarning').css("display", "block");
					$('label[for="IdLabelWarning"]').css('color', '#787878');
					$('label[for="IdLabelWarning"]').text('아이디 사용가능');
					$('#DupCheck').attr('value','Check');
					$('#inputUserId').attr('readonly', true);
				} else {
					$('#IdDupWarning').css("display", "none");
					$('#IdDupWarning').css("display", "block");
					$('label[for="IdLabelWarning"]').css('color', 'rgb(255 0 0)');
					$('label[for="IdLabelWarning"]').text('아이디 중복');
					$('#DupCheck').attr('value','UnCheck');
					$('#inputUserId').val('');
				}
			},
			error : function() {
				alert("서버요청실패");
			}
		});
	}
});

// 아이디 재입력
function reInput() {
	$('#IdDupWarning').css("display", "none");
	$('#inputUserId').attr('readonly', false);
	$('#DupCheck').attr('value','UnCheck');
	$('#inputUserId').val('');
}

// 비밀번호 확인
function checkPw() {
	let pw = document.getElementById('registPW').value;
	if (pw.length < 4) {
		$('#PwDupWarning').css("display", "none");
		$('#PwDupWarning').css("display", "block");
		$('label[for="PwLabelWarning"]').css('color', 'rgb(255 0 0)');
		$('label[for="PwLabelWarning"]').text('비밀번호는 4자이상으로 작성해주세요');
		document.getElementById('registPW').value = '';
	}
	if (pw != '' && document.getElementById('checkPW').value != '') {
		if (pw == document.getElementById('checkPW').value) {
			$('#PwDupWarning').css("display", "none");
			$('#PwDupWarning').css("display", "block");
			$('label[for="PwLabelWarning"]').css('color', '#787878');
			$('label[for="PwLabelWarning"]').text('비밀번호일치');
		} else {
			$('#PwDupWarning').css("display", "none");
			$('#PwDupWarning').css("display", "block");
			$('label[for="PwLabelWarning"]').css('color', 'rgb(255 0 0)');
			$('label[for="PwLabelWarning"]').text('비밀번호 불일치');
			document.getElementById('checkPW').value = '';
		}
	}
}

// 비밀번호 변경 확인
function checkNewPw() {
	let newPw = document.getElementById('newRegistPw').value;
	if (newPw.length < 4) {
		$('#NewPwDupWarning').css("display", "none");
		$('#NewPwDupWarning').css("display", "block");
		$('label[for="NewPwLabelWarning"]').css('color', 'rgb(255 0 0)');
		$('label[for="NewPwLabelWarning"]').text('비밀번호는 4자이상으로 작성해주세요');
		document.getElementById('newRegistPw').value = '';
	}
	if (newPw != '' && document.getElementById('newCheckPw').value != '') {
		if (newPw == document.getElementById('newCheckPw').value) {
			$('#NewPwDupWarning').css("display", "none");
			$('#NewPwDupWarning').css("display", "block");
			$('label[for="NewPwLabelWarning"]').css('color', '#787878');
			$('label[for="NewPwLabelWarning"]').text('비밀번호일치');
		} else {
			$('#NewPwDupWarning').css("display", "none");
			$('#NewPwDupWarning').css("display", "block");
			$('label[for="NewPwLabelWarning"]').css('color', 'rgb(255 0 0)');
			$('label[for="NewPwLabelWarning"]').text('비밀번호 불일치');
			document.getElementById('newCheckPw').value = '';
		}
	}
}


// 비밀번호 변경 form확인
function changePwAjax() {
	let moveSuccessOrFail = true;
	let userPw = $('#nowPw').val();
	$.ajax({
		url : "pwCheck",
		type : "post",
		async : false,
		data : {
			reqPw : userPw
		},
		dataType : 'json',
		success : function(result) {
			if (result == 1) {
				moveSuccessOrFail = false;
				$('#NewPwDupWarning').css("display", "none");
				document.getElementById('nowPw').value = '';
				document.getElementById('newRegistPw').value = '';
				document.getElementById('newCheckPw').value = '';
				alert("현재비밀번호 틀림");
			}
		},
		error : function() {
			alert("서버요청실패");
		}
	});
	return moveSuccessOrFail;
}

function changePw() {
	let nowPw2 = $('#nowPw').val();
	let newCheckPw2 = $('#newCheckPw').val();
	if (nowPw2 == newCheckPw2) {
	$('#NewPwDupWarning').css("display", "none");
		$('#NewPwDupWarning').css("display", "block");
		$('label[for="NewPwLabelWarning"]').css('color', 'rgb(255 0 0)');
		$('label[for="NewPwLabelWarning"]').text('현재 비밀번호와 새 비밀번호를 다르게 입력하세요');
		document.getElementById('newRegistPw').value = '';
		document.getElementById('newCheckPw').value = '';
		return false;
	}
	return changePwAjax();
}

// 로그인 form확인
function loginAjax() {
	let loginSuccessOrFail = true;
	let userId = $('#inputLoginId').val();
	let userPw = $('#inputLoginPw').val();
	$.ajax({
		url : "loginCheck",
		type : "post",
		async : false,
		data : {
			reqId : userId,
			reqPw : userPw
		},
		dataType : 'json',
		success : function(result) {
			if (result == 0) {
				loginSuccessOrFail = false;
				$('#loginInputDiv').css("display", "block");
				$('label[for="loginInputLabel"]').css('color', 'rgb(255 0 0)');
				$('label[for="loginInputLabel"]').text('아이디 혹은 비밀번호가 틀렸습니다');
				document.getElementById('inputLoginPw').value = '';
			}
		},
		error : function() {
			alert("서버요청실패");
		}
	});
	return loginSuccessOrFail;
}

function loginCheckInfo() {
	return loginAjax();
}


// 주민번호 앞자리 6자 다입력하면 바로 뒷자리입력하게 커서변경됨
function moveNext(obj, length, nextObj) {
	if (obj.value.length == length) {
		nextObj.focus();
	}
}

function formCheck(obj) {
	if (obj.rn1.value.trim().length !== 6) {
		$('#RnDupWarning').css("display", "none");
		$('#RnDupWarning').css("display", "block");
		$('label[for="RnLabelWarning"]').css('color', 'rgb(255 0 0)');
		$('label[for="RnLabelWarning"]').text('주민등록번호 앞자리는 6자리');
		obj.rn1.value = "";
		obj.rn1.focus();
		return false;
	}
	// NaN = Not a Number, Number()는 인수를 숫자로변경
	if (isNaN(Number(obj.rn1.value))) {
		$('#RnDupWarning').css("display", "none");
		$('#RnDupWarning').css("display", "block");
		$('label[for="RnLabelWarning"]').css('color', 'rgb(255 0 0)');
		$('label[for="RnLabelWarning"]').text('숫자만 입력');
		obj.rn1.value = "";
		obj.rn1.focus();
		return false;
	}
	if (obj.rn2.value.trim().length !== 7) {
		$('#RnDupWarning').css("display", "none");
		$('#RnDupWarning').css("display", "block");
		$('label[for="RnLabelWarning"]').css('color', 'rgb(255 0 0)');
		$('label[for="RnLabelWarning"]').text('주민등록번호 뒷자리는 7자리');
		obj.rn2.value = "";
		obj.rn2.focus();
		return false;
	}
	if (isNaN(Number(obj.rn2.value))) {
		$('#RnDupWarning').css("display", "none");
		$('#RnDupWarning').css("display", "block");
		$('label[for="RnLabelWarning"]').css('color', 'rgb(255 0 0)');
		$('label[for="RnLabelWarning"]').text('숫자만 입력');
		obj.rn2.value = "";
		obj.rn2.focus();
		return false;
	}
	if (obj.DupCheck.value!="Check"){
		$('#RnDupWarning').css("display", "none");
		$('#RnDupWarning').css("display", "block");
		$('label[for="RnLabelWarning"]').css('color', 'rgb(255 0 0)');
		$('label[for="RnLabelWarning"]').text('아이디중복체크');
		return false;
	}
	// 주민번호 유효성검사
	rnCheck = obj.rn1.value.trim() + obj.rn2.value.trim();
	sum = 0;
	for (i = 0; i < 12; i++) {
		sum += rnCheck.charAt(i) * (i < 8 ? i + 2 : i - 6);
	}
	result = (11 - sum % 11);
	if (result != rnCheck.charAt(12)) {
		$('#RnDupWarning').css("display", "none");
		$('#RnDupWarning').css("display", "block");
		$('label[for="RnLabelWarning"]').css('color', 'rgb(255 0 0)');
		$('label[for="RnLabelWarning"]').text('주민등록번호가 올바르지 않습니다');
		obj.rn2.value = "";
		obj.rn2.focus();
		return false;
	}
	
	return checkRn();
}

function formCheckFindId(obj) {
	if (obj.rn1.value.trim().length !== 6) {
		$('#SRnDupWarningId').css("display", "none");
		$('#SRnDupWarningId').css("display", "block");
		$('label[for="SRnLabelWarningId"]').css('color', 'rgb(255 0 0)');
		$('label[for="SRnLabelWarningId"]').text('주민등록번호 앞자리는 6자리');
		obj.rn1.value = "";
		obj.rn1.focus();
		return false;
	}
	// NaN = Not a Number, Number()는 인수를 숫자로변경
	if (isNaN(Number(obj.rn1.value))) {
		$('#SRnDupWarningId').css("display", "none");
		$('#SRnDupWarningId').css("display", "block");
		$('label[for="SRnLabelWarningId"]').css('color', 'rgb(255 0 0)');
		$('label[for="SRnLabelWarningId"]').text('숫자만 입력');
		obj.rn1.value = "";
		obj.rn1.focus();
		return false;
	}
	if (obj.rn2.value.trim().length !== 7) {
		$('#SRnDupWarningId').css("display", "none");
		$('#SRnDupWarningId').css("display", "block");
		$('label[for="SRnLabelWarningId"]').css('color', 'rgb(255 0 0)');
		$('label[for="SRnLabelWarningId"]').text('주민등록번호 뒷자리는 7자리');
		obj.rn2.value = "";
		obj.rn2.focus();
		return false;
	}
	if (isNaN(Number(obj.rn2.value))) {
		$('#SRnDupWarningId').css("display", "none");
		$('#SRnDupWarningId').css("display", "block");
		$('label[for="SRnLabelWarningId"]').css('color', 'rgb(255 0 0)');
		$('label[for="SRnLabelWarningId"]').text('숫자만 입력');
		obj.rn2.value = "";
		obj.rn2.focus();
		return false;
	}
	
	return true;
}

function formCheckFindPw(obj) {
	if (obj.rn1.value.trim().length !== 6) {
		$('#SRnDupWarningPw').css("display", "none");
		$('#SRnDupWarningPw').css("display", "block");
		$('label[for="SRnLabelWarningPw"]').css('color', 'rgb(255 0 0)');
		$('label[for="SRnLabelWarningPw"]').text('주민등록번호 앞자리는 6자리');
		obj.rn1.value = "";
		obj.rn1.focus();
		return false;
	}
	// NaN = Not a Number, Number()는 인수를 숫자로변경
	if (isNaN(Number(obj.rn1.value))) {
		$('#SRnDupWarningPw').css("display", "none");
		$('#SRnDupWarningPw').css("display", "block");
		$('label[for="SRnLabelWarningPw"]').css('color', 'rgb(255 0 0)');
		$('label[for="SRnLabelWarningPw"]').text('숫자만 입력');
		obj.rn1.value = "";
		obj.rn1.focus();
		return false;
	}
	if (obj.rn2.value.trim().length !== 7) {
		$('#SRnDupWarningPw').css("display", "none");
		$('#SRnDupWarningPw').css("display", "block");
		$('label[for="SRnLabelWarningPw"]').css('color', 'rgb(255 0 0)');
		$('label[for="SRnLabelWarningPw"]').text('주민등록번호 뒷자리는 7자리');
		obj.rn2.value = "";
		obj.rn2.focus();
		return false;
	}
	if (isNaN(Number(obj.rn2.value))) {
		$('#SRnDupWarningPw').css("display", "none");
		$('#SRnDupWarningPw').css("display", "block");
		$('label[for="SRnLabelWarningPw"]').css('color', 'rgb(255 0 0)');
		$('label[for="SRnLabelWarningPw"]').text('숫자만 입력');
		obj.rn2.value = "";
		obj.rn2.focus();
		return false;
	}
	
	return true;
}

function checkRn(){
	// 주민등록번호 중복체크
	let trueOrFalse = true;
	$.ajax({
		url : "rnCheck",
		type : "post",
		async : false,
		data : {
			checkRegistNumber : rnCheck
		},
		dataType : 'json',
		success : function(result) {
			if (result != 0) {
				trueOrFalse = false;
				$('#RnDupWarning').css("display", "none");
				$('#RnDupWarning').css("display", "block");
				$('label[for="RnLabelWarning"]').css('color', 'rgb(255 0 0)');
				$('label[for="RnLabelWarning"]').text('해당주민등록번호로 회원가입된 아이디있습니다');
			}
		},
		error : function() {
			trueOrFalse = false;
			alert("서버요청실패");
		}
	});
	return trueOrFalse;
}

// 랜덤메뉴 생성
// 소주 ajax통해 전체 안주 받기
function sojuAjax() {

	let seo = $('#sojuSub').val();
	console.log(seo);
	
	// 소주니까 soju~
	var sojuFoodList = [];
	$.ajax({
		// url은 soju~
		url : "sojuFood",
		type : "post",
		async : false,
		data : {
			sibal : seo
		},
		dataType : 'json',
		success : function(result) {
			if (result !== null) {
				// soju~ 에 result 삽입
				sojuFoodList = result;
			} else {
				console.log('목록없음');
			}
		},
		error : function() {
			alert("서버요청실패");
		}
	});
	// return soju~
	return sojuFoodList;
}

function sojuRandomFood() {
	var sulFoodList = [];
	sulFoodList = sojuAjax();
	
	// 랜덤값 jquery
	let randomThree = [];
	let i = 0;
	while (i < 3) {
		let n = Math.floor(Math.random() * sulFoodList.length);
		if (! sameNum(n)) {
			randomThree.push(n);
			i++;
		}
	}
  	
	function sameNum (n) {
		for (let i = 0; i < randomThree.length; i++) {
			if (n === randomThree[i]) {
				return true;
			}
		}
    	return false;
	}
	
	const sulFood1 = sulFoodList[randomThree[0]];
	const sulFood2 = sulFoodList[randomThree[1]];
	const sulFood3 = sulFoodList[randomThree[2]];
	const html = '<div style="color:#787878; font-weight:bold;"/>';
	const foodBtnElement1 = document.getElementById("showFood1");
	foodBtnElement1.innerHTML = html + sulFood1;
	const foodBtnElement2 = document.getElementById("showFood2");
	foodBtnElement2.innerHTML = html + sulFood2;
	const foodBtnElement3 = document.getElementById("showFood3");
	foodBtnElement3.innerHTML = html + sulFood3;
	
}

// 맥주 ajax통해 전체 안주 받기
function beerAjax() {
	var beerFoodList = [];
	$.ajax({
		url : "beerFood",
		type : "post",
		async : false,
		dataType : 'json',
		success : function(result) {
			if (result !== null) {
				beerFoodList = result;
			} else {
				console.log('목록없음');
			}
		},
		error : function() {
			alert("서버요청실패");
		}
	});
	return beerFoodList;
}

function beerRandomFood() {
	let sulFoodList = [];
	sulFoodList = beerAjax();
	
	let randomThree = [];
	let i = 0;
	while (i < 3) {
		let n = Math.floor(Math.random() * sulFoodList.length);
		if (! sameNum(n)) {
			randomThree.push(n);
			i++;
		}
	}
  	
	function sameNum (n) {
		for (let i = 0; i < randomThree.length; i++) {
			if (n === randomThree[i]) {
				return true;
			}
		}
    	return false;
	}
	
	const sulFood1 = sulFoodList[randomThree[0]];
	const sulFood2 = sulFoodList[randomThree[1]];
	const sulFood3 = sulFoodList[randomThree[2]];
	const html = '<div style="color:#787878; font-weight:bold;"/>';
	const foodBtnElement1 = document.getElementById("showFood1");
	foodBtnElement1.innerHTML = html + sulFood1;
	const foodBtnElement2 = document.getElementById("showFood2");
	foodBtnElement2.innerHTML = html + sulFood2;
	const foodBtnElement3 = document.getElementById("showFood3");
	foodBtnElement3.innerHTML = html + sulFood3;
	
}

// 와인 ajax통해 전체 안주 받기
function wineAjax() {
	var wineFoodList = [];
	$.ajax({
		url : "wineFood",
		type : "post",
		async : false,
		dataType : 'json',
		success : function(result) {
			if (result !== null) {
				wineFoodList = result;
			} else {
				console.log('목록없음');
			}
		},
		error : function() {
			alert("서버요청실패");
		}
	});
	return wineFoodList;
}

function wineRandomFood() {
	var sulFoodList = [];
	sulFoodList = wineAjax();
	
	let randomThree = [];
	let i = 0;
	while (i < 3) {
		let n = Math.floor(Math.random() * sulFoodList.length);
		if (! sameNum(n)) {
			randomThree.push(n);
			i++;
		}
	}
  	
	function sameNum (n) {
		for (let i = 0; i < randomThree.length; i++) {
			if (n === randomThree[i]) {
				return true;
			}
		}
    	return false;
	}
	
	const sulFood1 = sulFoodList[randomThree[0]];
	const sulFood2 = sulFoodList[randomThree[1]];
	const sulFood3 = sulFoodList[randomThree[2]];
	const html = '<div style="color:#787878; font-weight:bold;"/>';
	const foodBtnElement1 = document.getElementById("showFood1");
	foodBtnElement1.innerHTML = html + sulFood1;
	const foodBtnElement2 = document.getElementById("showFood2");
	foodBtnElement2.innerHTML = html + sulFood2;
	const foodBtnElement3 = document.getElementById("showFood3");
	foodBtnElement3.innerHTML = html + sulFood3;
	
}

// 보드카 ajax통해 전체 안주 받기
function vodkaAjax() {
	var vodkaFoodList = [];
	$.ajax({
		url : "vodkaFood",
		type : "post",
		async : false,
		dataType : 'json',
		success : function(result) {
			if (result !== null) {
				vodkaFoodList = result;
			} else {
				console.log('목록없음');
			}
		},
		error : function() {
			alert("서버요청실패");
		}
	});
	return vodkaFoodList;
}

function vodkaRandomFood() {
	var sulFoodList = [];
	sulFoodList = vodkaAjax();
	
	let randomThree = [];
	let i = 0;
	while (i < 3) {
		let n = Math.floor(Math.random() * sulFoodList.length);
		if (! sameNum(n)) {
			randomThree.push(n);
			i++;
		}
	}
  	
	function sameNum (n) {
		for (let i = 0; i < randomThree.length; i++) {
			if (n === randomThree[i]) {
				return true;
			}
		}
    	return false;
	}
	
	const sulFood1 = sulFoodList[randomThree[0]];
	const sulFood2 = sulFoodList[randomThree[1]];
	const sulFood3 = sulFoodList[randomThree[2]];
	const html = '<div style="color:#787878; font-weight:bold;"/>';
	const foodBtnElement1 = document.getElementById("showFood1");
	foodBtnElement1.innerHTML = html + sulFood1;
	const foodBtnElement2 = document.getElementById("showFood2");
	foodBtnElement2.innerHTML = html + sulFood2;
	const foodBtnElement3 = document.getElementById("showFood3");
	foodBtnElement3.innerHTML = html + sulFood3;
	
}

// 위스키 ajax통해 전체 안주 받기
function whiskeyAjax() {
	var whiskeyFoodList = [];
	$.ajax({
		url : "whiskeyFood",
		type : "post",
		async : false,
		dataType : 'json',
		success : function(result) {
			if (result !== null) {
				whiskeyFoodList = result;
			} else {
				console.log('목록없음');
			}
		},
		error : function() {
			alert("서버요청실패");
		}
	});
	return whiskeyFoodList;
}

function whiskeyRandomFood() {
	var sulFoodList = [];
	sulFoodList = whiskeyAjax();
	
	let randomThree = [];
	let i = 0;
	while (i < 3) {
		let n = Math.floor(Math.random() * sulFoodList.length);
		if (! sameNum(n)) {
			randomThree.push(n);
			i++;
		}
	}
  	
	function sameNum (n) {
		for (let i = 0; i < randomThree.length; i++) {
			if (n === randomThree[i]) {
				return true;
			}
		}
    	return false;
	}
	
	const sulFood1 = sulFoodList[randomThree[0]];
	const sulFood2 = sulFoodList[randomThree[1]];
	const sulFood3 = sulFoodList[randomThree[2]];
	const html = '<div style="color:#787878; font-weight:bold;"/>';
	const foodBtnElement1 = document.getElementById("showFood1");
	foodBtnElement1.innerHTML = html + sulFood1;
	const foodBtnElement2 = document.getElementById("showFood2");
	foodBtnElement2.innerHTML = html + sulFood2;
	const foodBtnElement3 = document.getElementById("showFood3");
	foodBtnElement3.innerHTML = html + sulFood3;
	
}



// 기존
(function($) {

	var	$window = $(window),
		$body = $('body');

	// Breakpoints.
		breakpoints({
			wide:      [ '1281px',  '1680px' ],
			normal:    [ '981px',   '1280px' ],
			narrow:    [ '841px',   '980px'  ],
			narrower:  [ '737px',   '840px'  ],
			mobile:    [ '481px',   '736px'  ],
			mobilep:   [ null,      '480px'  ]
		});

	// Play initial animations on page load.
		$window.on('load', function() {
			window.setTimeout(function() {
				$body.removeClass('is-preload');
			}, 100);
		});

	// Dropdowns.
		$('#nav > ul').dropotron({
			offsetY: -15,
			hoverDelay: 0,
			alignment: 'center'
		});

	// Nav.

		// Bar.
			$(
				'<div id="titleBar">' +
					'<a href="#navPanel" class="toggle"></a>' +
					'<span class="title">' + $('#logo').html() + '</span>' +
				'</div>'
			)
				.appendTo($body);

		// Panel.
			$(
				'<div id="navPanel">' +
					'<nav>' +
						$('#nav').navList() +
					'</nav>' +
				'</div>'
			)
				.appendTo($body)
				.panel({
					delay: 500,
					hideOnClick: true,
					hideOnSwipe: true,
					resetScroll: true,
					resetForms: true,
					side: 'left',
					target: $body,
					visibleClass: 'navPanel-visible'
				});

})(jQuery);
