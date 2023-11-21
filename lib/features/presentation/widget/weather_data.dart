import 'package:flutter/material.dart';
import 'package:temir_yol_task/features/domain/entity/weather_data.dart';

Widget weatherDataWidget({
  required WeatherData weatherData,
  required Function() onRefreshClick,
}) {
  return Center(
    child: Column(
      children: [
        const SizedBox(height: 16),
        Text(
          weatherData.location?.name ?? "Unknown",
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(height: 2),
        Text(
          weatherData.current?.lastUpdated ?? "Unknown",
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(height: 40),
        Text(
          "${weatherData.current?.tempC}℃",
          style: const TextStyle(color: Colors.black, fontSize: 80),
        ),
        const SizedBox(height: 40),
        Text(
          weatherData.current?.condition?.text ?? "Unknown",
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(height: 50),
        FilledButton(
          onPressed: () => onRefreshClick(),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.blue),
          ),
          child: const Text(
            "Refresh",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
