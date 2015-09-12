<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>
function setGeoLocation(hiddenLatitudeName, hiddenLongitudeName) {
    if (navigator.geolocation) {
        var options = { maximumAge: 60000 };    //60 seconds
        navigator.geolocation.getCurrentPosition(function(result) {
                geolocationSetCurrentPositionSuccessCallback(result, hiddenLatitudeName, hiddenLongitudeName);
            }
            , function(result) {
                geolocationSetCurrentPositionErrorCallback(result, hiddenLatitudeName, hiddenLongitudeName);
            }
            , options);
    } else {
        console.log("This browser either does not support geolocation or this feature is disabled.");
    }
}

$(document).ready(function() {
	setGeoLocation("HiddenField_Latitude", "HiddenField_Longitude");
});
</script>
</head>

<body>
<a id="hiddenbtn" target="_blank" style='display:none'></a>
<input type=hidden name=HiddenField_Latitude id=HiddenField_Latitude>
<input type=hidden name=HiddenField_Longitude id=HiddenField_Longitude>

<select id="mySelect">
    <option value>Select one</option>
    <option value="http://www.google.com">Google</option>
    <option value="http://www.stackoverflow.com">StackOverflow</option>
</select>

</body>
</html>
