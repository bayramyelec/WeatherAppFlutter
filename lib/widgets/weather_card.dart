import 'package:flutter/material.dart';
import 'package:weather_app_flutter/model/city_model.dart';

Widget weatherCard(City? data) {
  return Card(
    margin: EdgeInsets.all(16),
    child: Column(
      children: [
        Text(
          data!.name!,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 8),
        Text(
          '${data.main!.temp!}°',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          data.weather![0].description!,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Column(
              children: [
                Icon(Icons.water_drop),
                SizedBox(height: 8),
                Text(
                  data.main!.humidity!.round().toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Column(
              children: [
                Icon(Icons.air),
                SizedBox(height: 8),
                Text(
                  data.wind!.speed.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
