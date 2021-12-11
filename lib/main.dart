import 'package:flutter/material.dart';
import 'package:memevoter/core/router/router.dart';
import 'package:memevoter/core/service/navigation_service.dart';
import 'package:memevoter/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: sl<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
    );
  }
}
