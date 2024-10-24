import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_clean/features/weather/domain/entities/weather_father.dart';

class WeatherWidget extends StatefulWidget {
  final WeatherFather weather;
  const WeatherWidget({
    super.key,
    required this.weather,
  });

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && >= 300:
        return Image.asset("images/11d.png");

      case >= 300 && >= 500:
        return Image.asset("images/09d.png");
      case >= 500 && >= 600:
        return Image.asset("images/10d.png");
      case >= 600 && >= 700:
        return Image.asset("images/13d.png");
      case >= 700 && > 800:
        return Image.asset("images/50d.png");
      case == 800:
        return Image.asset("images/01d.png");
      case >= 801 && >= 804:
        return Image.asset("images/02d.png");

      default:
        return Image.asset("images/01d.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   systemOverlayStyle: const SystemUiOverlayStyle(
        //     statusBarBrightness: Brightness.dark,
        //   ),
        // ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(children: [
                  Align(
                    alignment: const AlignmentDirectional(0, -1.2),
                    child: Container(
                      height: 300,
                      width: 355,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        color: const Color.fromARGB(255, 174, 0, 255),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(2.3, 0.02),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-2.3, 0.02),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                    child: Container(
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.weather.sys.country,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          getWeatherIcon(widget.weather.weather[0].id),
                          Center(
                            child: Text(
                              "${(((widget.weather.main.temp) - 32) * 5 / 9).round().toString()}°C",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              widget.weather.weather[0].main,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 33,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("images/13-0.png"),
                              Text(
                                widget.weather.main.temp_max
                                    .round()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Image.asset("images/14-0.png"),
                              Text(
                                widget.weather.main.temp_min
                                    .round()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
