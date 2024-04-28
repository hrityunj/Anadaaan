import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import './location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

const apiKey = '46d1cd5f70bc429aa22fcd5e09ef81e1';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  // void getLocationData() async {
  //   Location location = Location();
  //   await location.getCurrentLocation();
  //   latitude = location.latitude;
  //   longitude = location.longitude;
  //   NetworkHelper networkHelper = NetworkHelper(
  //       'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
  //   var weatherData = await networkHelper.getData();
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return LocationScreen(locationWeather: weatherData,);
  //   }));
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  // void getData() async {
  //   // print(latitude);
  //   // print(longitude);
  //   http.Response response = await http.get(
  //       'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
  //   if (response.statusCode == 200) {
  //     String data = response.body;

  //     var decodedData = jsonDecode(data);
  //     int condition = decodedData['weather'][0]['id'];
  //     double temperature = decodedData['main']['temp'];
  //     String cityName = decodedData['name'];
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
      // body: Center(
      //   child: RaisedButton(
      //     onPressed: () {
      //       getLocation();
      //     },
      //     child: Text('Get Location'),
      //   ),
      // ),
    );
  }
}
