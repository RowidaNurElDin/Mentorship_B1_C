import 'package:flutter/material.dart';
import 'package:mentoship_rockets_discovries_project/spacex_app.dart';

import 'core/dependency_injection/dependency_injection.dart';

void main() {
  setUpDependencyInjections();
  runApp(const SpacexApp());
}