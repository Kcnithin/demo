import 'package:banner_demo/my_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'app_bar_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerDemo extends StatefulWidget {
  @override
  State<BannerDemo> createState() => _BannerDemoState();
}

class _BannerDemoState extends State<BannerDemo> {
  CarouselController buttonCarouselController = CarouselController();

  int currentPos = 0;

  List<Widget> listPaths = [
    MyStack(
      currentLocation: "Current location",
      cityName: "Dhaka",
      currentStatus: "Thunder",
      temp: "20°C",
      displayImage: MdiIcons.weatherLightning,
      color: Colors.white,
    ),
    MyStack(
      currentLocation: "United states",
      cityName: "California",
      currentStatus: "Clear",
      temp: "6°C",
      displayImage: MdiIcons.weatherPartlyCloudy,
      color: Colors.white,
    ),
    MyStack(
      currentLocation: "China",
      cityName: "Beijing",
      currentStatus: "Mostly sunny",
      temp: "5°C",
      displayImage: MdiIcons.weatherSunny,
      color: Colors.orange,
    ),
    MyStack(
      currentLocation: "Russia",
      cityName: "Moscow",
      currentStatus: "Cloudy",
      temp: "-04°C",
      displayImage: MdiIcons.weatherCloudy,
      color: Colors.white,
    ),
  ];
  DateTime pre_backpress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Hello Arian,\nDiscover the weather",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          AppBarWidgets(buttonAction: () {}, buttonIcon: Icons.search),
          AppBarWidgets(
              buttonAction: () {}, buttonIcon: MdiIcons.web),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          final timegap = DateTime.now().difference(pre_backpress);
          final cantExit = timegap >= Duration(seconds: 2);
          pre_backpress = DateTime.now();
          if (cantExit) {
            //show snackbar
            const snack = SnackBar(
              content: Text('Press Back button again to Exit'),
              duration: Duration(seconds: 2),
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
            return false;
          } else {
            SystemNavigator.pop();
            return true;
          }
        },
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin:
                    const EdgeInsets.only(top : 20),
                    child: CarouselSlider(
                      options: CarouselOptions(
                          autoPlay: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentPos = index;
                            });
                          }),
                      items: [
                        MyStack(
                          currentLocation: "Current location",
                          cityName: "Dhaka",
                          currentStatus: "Thunder",
                          temp: "20°C",
                          displayImage: MdiIcons.weatherLightning,
                          color: Colors.white,
                        ),
                        MyStack(
                          currentLocation: "United states",
                          cityName: "California",
                          currentStatus: "Clear",
                          temp: "6°C",
                          displayImage: MdiIcons.weatherPartlyCloudy,
                          color: Colors.white,
                        ),
                        MyStack(
                          currentLocation: "China",
                          cityName: "Beijing",
                          currentStatus: "Mostly sunny",
                          temp: "5°C",
                          displayImage: MdiIcons.weatherSunny,
                          color: Colors.orange,
                        ),
                        MyStack(
                          currentLocation: "Russia",
                          cityName: "Moscow",
                          currentStatus: "Cloudy",
                          temp: "-04°C",
                          displayImage: MdiIcons.weatherCloudy,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: listPaths.map((url) {
                      int index = listPaths.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin:
                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPos == index
                              ? Color.fromRGBO(0, 0, 0, 0.9)
                              : Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                child: const Text(
                  "Around the world",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              MyStack(
                currentLocation: "United states",
                cityName: "California",
                currentStatus: "Clear",
                temp: "6°C",
                displayImage: MdiIcons.weatherPartlyCloudy,
                color: Colors.white,
              ),
              MyStack(
                currentLocation: "China",
                cityName: "Beijing",
                currentStatus: "Mostly sunny",
                temp: "5°C",
                displayImage: MdiIcons.weatherSunny,
                color: Colors.orange,
              ),
              MyStack(
                currentLocation: "Russia",
                cityName: "Moscow",
                currentStatus: "Cloudy",
                temp: "-04°C",
                displayImage: MdiIcons.weatherCloudy,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
