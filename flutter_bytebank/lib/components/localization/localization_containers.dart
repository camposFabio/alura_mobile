import 'package:bytebank/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationContainer extends BlocContainer {
  final Widget child;

  const LocalizationContainer({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalizationCubit>(
      create: (context) => LocalizationCubit(),
      child: child,
    );
  }
}

class LocalizationCubit extends Cubit<String> {
  LocalizationCubit() : super("en");
}
