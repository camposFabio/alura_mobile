import 'package:flutter_bloc/flutter_bloc.dart';

// O stado é uma única String
// Poderia ser um perfil com diversos valores
class NameCubit extends Cubit<String> {
  NameCubit(String nome) : super(nome);

  void change(String name) => emit(name);
}
