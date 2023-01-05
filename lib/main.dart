import 'package:connection_check/sl/injection.dart';
import 'package:flutter/material.dart';

import 'widgets/app.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}
