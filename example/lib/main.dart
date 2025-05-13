
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/routes/routes.dart';
import 'utils/routes/routes_name.dart';
import 'view_model/payin_status_view_model.dart';
import 'view_model/payout_status_view_model.dart';
import 'view_model/payout_view_model.dart';
import 'view_model/pyin_view_model.dart';



double height = 0.0;
double width = 0.0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => PayinViewModel()),
            ChangeNotifierProvider(create: (_) => PayoutViewModel()),
            ChangeNotifierProvider(create: (_) => PayinStatusViewModel()),
            ChangeNotifierProvider(create: (_) => MerchantPayoutHistoryViewModel()),




          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesName.splash,
            onGenerateRoute: (settings) {
              if (settings.name != null) {
                return MaterialPageRoute(
                    builder: Routers.generateRoute(settings.name!),
                    settings: settings);
              }
              return null;
            },

          ),
        );
      },
    );
  }
}
