import 'package:flutter/material.dart';
import 'package:paymet_get_way_example/screens/dashboard_screen.dart';

import 'routes_name.dart';



class Routers {
  static WidgetBuilder generateRoute(String routeName) {
    switch (routeName) {

      case RoutesName.splash:
        return (context) => PaymentGatewayUI();

    default:
        return (context) => const Scaffold(
              body: Center(
                child: Text(
                  'No Route Found!',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            );
    }
  }
}
