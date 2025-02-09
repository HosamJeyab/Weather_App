import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeatherCubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeatherState.dart';
import 'package:weather_app/main.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  void _searchWeather(BuildContext context) async {
    if (_controller.text.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    try {
      var getWeatherCubit = BlocProvider.of<Getweathercubit>(context);
      await getWeatherCubit.getWeather(cityName: _controller.text);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to fetch weather. Please try again!'),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Getweathercubit, WeatherState>(
      builder: (context, state) {
        Color appBarColor = Colors.blueAccent;
        if (state is WeatherLoadedState) {
          appBarColor = getTheamColor(state.weatherModel.weatherCondition);
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Search City"),
            backgroundColor: appBarColor,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _controller,
                    onSubmitted: (_) => _searchWeather(context),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      hintText: "Enter city name",
                      suffixIcon: _isLoading
                          ? const Padding(
                              padding: EdgeInsets.all(10),
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () => _searchWeather(context),
                            ),
                      labelText: "Search",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (_isLoading) const CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
