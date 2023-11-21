import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temir_yol_task/features/data/loading_state_enum.dart';
import 'package:temir_yol_task/features/presentation/screen/home/bloc/home_bloc.dart';
import 'package:temir_yol_task/features/presentation/widget/loading_widget.dart';
import 'package:temir_yol_task/features/presentation/widget/message_display.dart';
import 'package:temir_yol_task/features/presentation/widget/weather_data.dart';

import '../../../../injection_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    di.get<HomeBloc>().add(GetCurrentWeatherEvent(city: 'Tashkent'));
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather app")),
      body: BlocProvider(
        create: (context) => di.get<HomeBloc>(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: scrollController,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return Builder(builder: (context) {
                      if (state.status == LoadingState.EMPTY) {
                        return const MessageDisplay(message: "Loading...");
                      } else if (state.status == LoadingState.LOADING) {
                        return const LoadingWidget();
                      } else if (state.status == LoadingState.LOADED) {
                        return weatherDataWidget(
                          weatherData: state.weatherData!,
                          onRefreshClick: () => di
                              .get<HomeBloc>()
                              .add(GetCurrentWeatherEvent(city: 'Tashkent')),
                        );
                      } else if (state.status == LoadingState.ERROR) {
                        return MessageDisplay(message: state.errorMessage);
                      }
                      return Container();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
