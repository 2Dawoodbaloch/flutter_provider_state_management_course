import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management_course/provider/count_provider.dart';
import 'package:flutter_provider_state_management_course/provider/multi_provider_example.dart';
import 'package:flutter_provider_state_management_course/view/screens/count_example.dart';
import 'package:flutter_provider_state_management_course/view/screens/example_multi_provider.dart';
import 'package:flutter_provider_state_management_course/view/screens/home_screen/home_screen.dart';
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
    ],
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  ExampleMultiProvider(),
    ),
    );

  }
}
