import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentoship_rockets_discovries_project/spacex_app.dart';
import 'package:flutter/widgets.dart';


import 'core/dependency_injection/dependency_injection.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setUpDependencyInjections();
  runApp(const SpacexApp());
}
