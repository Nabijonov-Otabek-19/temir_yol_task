import 'package:flutter/material.dart';
import 'package:temir_yol_task/features/domain/entity/weather_entity.dart';

class WeatherData extends StatefulWidget {
  final WeatherEntity weatherEntity;

  const WeatherData({super.key, required this.weatherEntity});

  @override
  State<WeatherData> createState() => _WeatherDataState();
}

class _WeatherDataState extends State<WeatherData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Text(
          widget.weatherEntity.location?.name ?? "Unknown",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          widget.weatherEntity.current?.lastUpdated ?? "Unknown",
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(height: 30),
        Text(
          "${widget.weatherEntity.current?.tempC}℃",
          style: const TextStyle(color: Colors.black, fontSize: 100),
        ),
        const SizedBox(height: 30),
        Text(
          widget.weatherEntity.current?.condition?.text ?? "Unknown",
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        const SizedBox(height: 40),
        const Text(
          "Swipe to refresh",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
