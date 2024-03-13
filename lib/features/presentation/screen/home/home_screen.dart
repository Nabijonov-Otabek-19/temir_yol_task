import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:temir_yol_task/features/data/loading_state_enum.dart';
import 'package:temir_yol_task/features/presentation/screen/home/bloc/home_bloc.dart';
import 'package:temir_yol_task/features/presentation/widget/loading_widget.dart';
import 'package:temir_yol_task/features/presentation/widget/message_display.dart';
import 'package:temir_yol_task/features/presentation/widget/weather_data_widget.dart';

import '../../../../injection_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = di.get<HomeBloc>();
  Position? location;

  @override
  void initState() {
    checkPermission();
    bloc.add(GetCurrentWeatherEvent(city: 'Tashkent'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather app")),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                bloc.add(GetCurrentWeatherEvent(
                  city: location == null
                      ? 'Tashkent'
                      : '${location!.latitude},${location!.longitude}',
                ));
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Builder(builder: (context) {
                    if (state.status == LoadingState.EMPTY) {
                      return const MessageDisplay(message: "Loading...");
                    } else if (state.status == LoadingState.LOADING) {
                      return const LoadingWidget();
                    } else if (state.status == LoadingState.LOADED) {
                      return WeatherData(weatherEntity: state.weatherData!);
                    } else if (state.status == LoadingState.ERROR) {
                      return MessageDisplay(message: state.errorMessage);
                    }
                    return Container();
                  }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  checkPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return ("Location service are disabled");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    print("PERMISSION = $permission");
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        //return ("Location permission are denied");
        print("Location permission are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print(
          "Location permissions are permanently denied, we cannot request permissions");
      //return "Location permissions are permanently denied, we cannot request permissions";
    }
    if (permission == LocationPermission.whileInUse) {
      location = await Geolocator.getCurrentPosition();
    }
  }
}
