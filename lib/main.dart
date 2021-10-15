import 'package:flutter/material.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/routes/routes.dart';
import 'package:jane_app/screens/splash_screen/splash_screen.dart';
import 'package:jane_app/services/map_service.dart';
import 'package:jane_app/utils/utils.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => MapService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(),
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(
              bodyText2: TextStyle(color: Resources.PRIMARY_TEXT_COLOR)),
          fontFamily: 'Roboto',
          primarySwatch: Utils.generateSwatch(0xFFFF7360, 255, 115, 96),
        ),
        onGenerateRoute: Routes.generateRoute,
        home: SplashScreen(),
      ),
    );
  }
}
