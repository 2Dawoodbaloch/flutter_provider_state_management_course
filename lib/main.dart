import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management_course/provider/count_provider.dart';
import 'package:flutter_provider_state_management_course/provider/favorite_app_provider.dart';
import 'package:flutter_provider_state_management_course/provider/multi_provider_example.dart';
import 'package:flutter_provider_state_management_course/provider/theme_changer.dart';
import 'package:flutter_provider_state_management_course/view/screens/count_example.dart';
import 'package:flutter_provider_state_management_course/view/screens/example_multi_provider.dart';
import 'package:flutter_provider_state_management_course/view/screens/favorite_app/favorite_app.dart';
import 'package:flutter_provider_state_management_course/view/screens/home_screen/home_screen.dart';
import 'package:flutter_provider_state_management_course/view/screens/theme_screen/dark_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MultiProviderExample()),
      ChangeNotifierProvider(create: (_) => CountProvider()),
      ChangeNotifierProvider(create: (_) => FavoriteAppProvider()),
      ChangeNotifierProvider(create: (_) => ThemeChanger())
    ],
    child: Builder(builder: (BuildContext context){
      final themeProvider = Provider.of<ThemeChanger>(context);
      return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: themeProvider.themeMode,
        theme: ThemeData(
          primaryColor: Colors.pink,
          primarySwatch: Colors.blue,
          brightness: Brightness.light
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.red)
        ),
        home:  DarkThemeScreen(),
      );
    }),
    );

  }
}
