import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './components/components.dart';
import './screens/dashboard/dashboard_container.dart';
import 'components/localization/i18n.dart';

void main() {
  runApp(const BytebankApp());
}

class LogObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print('${bloc.runtimeType} > $change');
    }
    super.onChange(bloc, change);
  }
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Bloc.observer = LogObserver();

    return MaterialApp(
      theme: bytebanktheme,
      home: const DashboardContainer(),
    );
  }
}
