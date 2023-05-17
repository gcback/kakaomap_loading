const String loadMap = '''
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
</head>
<body>
  <div id="map" style="width:375px;height:800px;"></div>
	<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=7700b899ca79c19cf98c2d8cca480ff5"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>
''';

const sampleStr = '''
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
</head>
<body>
	<script>
		function add(num1, num2) {
            var result = num1 + num2;
            document.getElementById("result").innerHTML
                = num1 + " + " + num2 + " = " + result;
        }
	</script>
  <p>Hello from Flutter</p>
    <p id="result"></p>
</body>
</html>

''';
//	 <div id="map" style="width:500px;height:400px;"></div>

