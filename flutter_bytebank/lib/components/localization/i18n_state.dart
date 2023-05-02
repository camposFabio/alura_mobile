import 'package:flutter/material.dart';

import 'i18n.dart';

@immutable
class I18nMessagesState {
  const I18nMessagesState();
}

@immutable
class LoadingI18nMessagesState extends I18nMessagesState {
  const LoadingI18nMessagesState();
}

@immutable
class InitI18nMessagesState extends I18nMessagesState {
  const InitI18nMessagesState();
}

@immutable
class LoadedI18nMessagesState extends I18nMessagesState {
  final I18nMessages messages;
  const LoadedI18nMessagesState(this.messages);
}

@immutable
class FatalErrorI18nMessagesState extends I18nMessagesState {
  const FatalErrorI18nMessagesState();
}

@immutable
class ChangeI18nMessagesState extends I18nMessagesState {
  const ChangeI18nMessagesState();
}
