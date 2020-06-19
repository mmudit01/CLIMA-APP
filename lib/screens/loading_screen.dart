import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';

const apiKey = '5a515feeea1b155b258e306fc6e0ac3a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude, longitude;

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    Location location;
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(latitude);
    print(longitude);
    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');

    String data = response.body;
    // String cityName = jsonDecode(data)['name'];
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey
