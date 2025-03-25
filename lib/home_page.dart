import 'package:flutter/material.dart';
import 'package:weather_app_flutter/constants/list_and_variables.dart';
import 'package:weather_app_flutter/model/city_model.dart';
import 'package:weather_app_flutter/widgets/weather_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String? selectedCity;
Future<City>? futureBuilder;

class _HomePageState extends State<HomePage> {
  Future<City> _getWeather(String city) async {
    final response = await dio.get('/weather', queryParameters: {'q': city});
    final data = City.fromJson(response.data);
    return data;
  }

  void selecteddCity(String city) {
    setState(() {
      selectedCity = city;
      _getWeather(city);
      futureBuilder = _getWeather(city);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Column(
        children: [
          if (futureBuilder != null)
            FutureBuilder(
              future: futureBuilder,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                if (snapshot.hasData) {
                  return weatherCard(snapshot.data);
                }
                return SizedBox();
              },
            ),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final isSelected = selectedCity == cities[index];
                return GestureDetector(
                  onTap: () {
                    selecteddCity(cities[index]);
                  },
                  child: Card(
                    color:
                        isSelected
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                    child: Center(child: Text(cities[index])),
                  ),
                );
              },
              itemCount: cities.length,
            ),
          ),
        ],
      ),
    );
  }
}
