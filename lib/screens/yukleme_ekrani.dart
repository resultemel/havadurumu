import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hava_durumu/screens/Ana_Ekran.dart';
import 'package:hava_durumu/utilities/location.dart';
import 'package:hava_durumu/utilities/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoadingScreen> {
  LocationHelper locationData;
  Future<void> getLocationData() async {
    locationData = LocationHelper();
    await locationData.getCurrentLocation();
    if (locationData.latitude == null || locationData.longitude == null) {
      print("Konum Bilgileri Gelmiyor");
    } else {
      print("latitude:  " + locationData.latitude.toString());
      print("longitude:  " + locationData.longitude.toString());
    }
  }

  void getWeatherData() async {
    await getLocationData();
    WeatherData weatherData = WeatherData(locationData: locationData);
    await weatherData.getCurrentTemperature();

    if (weatherData.currentTemperature == null ||
        weatherData.currentCondition == null) {
      print("API den sıcaklık veya durum bilgisi boş dönüyor.");
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MainScreen(
        weatherData: weatherData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.redAccent, Colors.pinkAccent],
        )),
        child: Center(
            child: SpinKitDoubleBounce(
          color: Colors.blue,
          size: 150.0,
          duration: Duration(milliseconds: 1200),
        )),
      ),
    );
  }
}
