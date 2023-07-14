import 'package:flutter/material.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MaterialApp(
    initialRoute: Routes.home,
    onGenerateRoute: Routes.generateRoute,
  ));
}
