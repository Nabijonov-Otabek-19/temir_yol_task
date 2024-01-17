import 'package:flutter/material.dart';
import 'package:temir_yol_task/features/domain/entity/weather_data.dart';

Widget weatherDataWidget({
  required WeatherData weatherData,
  required Function() onRefreshClick,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 16),
      Text(
        weatherData.location?.name ?? "Unknown",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        weatherData.current?.lastUpdated ?? "Unknown",
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
      const SizedBox(height: 30),
      Text(
        "${weatherData.current?.tempC}℃",
        style: const TextStyle(color: Colors.black, fontSize: 100),
      ),
      const SizedBox(height: 30),
      Text(
        weatherData.current?.condition?.text ?? "Unknown",
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
      const SizedBox(height: 30),
      const Text(
        "Swipe to refresh",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      /*FilledButton(
        onPressed: () => onRefreshClick(),
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blue),
        ),
        child: const Text(
          "Refresh",
          style: TextStyle(color: Colors.white),
        ),
      ),*/
    ],
  );
}
