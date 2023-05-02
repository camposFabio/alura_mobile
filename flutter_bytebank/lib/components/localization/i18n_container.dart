import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_container.dart';
import 'i18n.dart';

class I18nLoadingContainer extends BlocContainer {
  final I18nWidgetCreator _creator;
  final String _viewKey;

  const I18nLoadingContainer(
      {Key? key, required String viewKey, required I18nWidgetCreator creator})
      : _creator = creator,
        _viewKey = viewKey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<I18nMessagesCubit>(
      create: (BuildContext context) {
        final I18nMessagesCubit cubit = I18nMessagesCubit(viewKey: _viewKey);
        cubit.load(viewKey: _viewKey);
        return cubit;
      },
      child: I18nLoadingView(_creator),
    );
  }
}
