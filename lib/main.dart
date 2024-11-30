import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'core/resources/routes_manager.dart';
import 'core/utils/cashed_data_shared_preferences.dart';
import 'core/utils/my_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedData.cacheInitialization();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const FlowerApp());

}

class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RoutesManager.splashRoute,
    );
  }
}
