import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    Provider.of<WeatherProvider>(context, listen: false)
        .getLocation((bool status){if(status==true){  Provider.of<WeatherProvider>(context, listen: false)
        .autoCompleteWeather(Provider.of<WeatherProvider>(context, listen: false)
        .latitude,Provider.of<WeatherProvider>(context, listen: false)
        .longitude,(){});}});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Toady's Weather"),),
      body: Consumer<WeatherProvider>(

        builder: (context, weatherProvider,child) {
          return weatherProvider.autoCom?CircularProgressIndicator():Column(
            children: [
              Text("${weatherProvider.autoCompleteModel.location!.name}"),
              Text("${weatherProvider.autoCompleteModel.current!.tempC}"),
              Text("${weatherProvider.autoCompleteModel.current!.cloud}"),
              Container(
                  child: Image.network("http:${weatherProvider.autoCompleteModel.current!.condition!.icon}")),
              Text("${weatherProvider.autoCompleteModel.current!.lastUpdated}"),
              Text("${weatherProvider.autoCompleteModel.current!.humidity}"),

            ],
          );
        }
      ),
    );
  }
}
