import 'package:ecommerce/core/dependency_injection/di.dart';
import 'package:ecommerce/presenstation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagewidget/imagewidget.dart';

import 'presenstation/home/home_screen.dart';

void main() {
  AppDelegate.run();
}

class AppDelegate {
  static Future<void> run() async {
    ImageWidget.packageDefault = null;
    await configureDependencies();
    runApp(const Application());
  }
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF4797d5),
      ),
      home: BlocProvider<HomeBloc>(
        create: (context) => injector.get(),
        child: const HomeScreen(),
      ),
    );
  }
}
