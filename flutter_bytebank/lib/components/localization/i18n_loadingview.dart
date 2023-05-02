import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../progress/progress_view.dart';
import '../components.dart';
import 'i18n.dart';

typedef I18nWidgetCreator = Widget Function(I18nMessages messages);

class I18nLoadingView extends StatelessWidget {
  final I18nWidgetCreator creator;

  const I18nLoadingView(this.creator, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<I18nMessagesCubit, I18nMessagesState>(
        builder: (context, state) {
      if (state is InitI18nMessagesState || state is LoadingI18nMessagesState) {
        return const ProgressView(message: 'Loading...');
      }
      if (state is LoadedI18nMessagesState) {
        final messages = state.messages;
        return creator.call(messages);
      }
      return const ErrorView(message: 'Erro ao localizar mensagens da tela');
    });
  }
}
