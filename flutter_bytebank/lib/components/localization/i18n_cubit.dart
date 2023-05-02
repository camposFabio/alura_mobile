import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';

import '../../http/web_clients/i18n_webclient.dart';
import 'i18n.dart';

const storageFile = 'local_insecure_version_1.json';

class I18nMessagesCubit extends Cubit<I18nMessagesState> {
  final String _viewKey;

  I18nMessagesCubit({required String viewKey})
      : _viewKey = viewKey,
        super(const InitI18nMessagesState());

  // Armazena o locale atual
  static String _currentLocale = "en";

  String get currentLocale => _currentLocale;

  void setLocale(String locale) {
    emit(const LoadingI18nMessagesState());
    _currentLocale = locale;
  }

  void init() async {
    emit(const LoadingI18nMessagesState());
    final LocalStorage _storage = LocalStorage(storageFile);
    await _storage.ready;
    final Map<String, dynamic> settings = _storage.getItem('settings');
    if (!settings.containsKey('current_locale')) {
      settings['current_locale'] = 'en';
      _storage.setItem('settings', settings);
    }
    setLocale(settings['current_locale']);
  }

  void load({required String viewKey, String? locale}) async {
    emit(const LoadingI18nMessagesState());
    if (locale != null) {
      _currentLocale = locale;
    }
    try {
      final LocalStorage _storage = LocalStorage(storageFile);

      I18nWebClient client =
          I18nWebClient(viewKey: viewKey, locale: _currentLocale);

      await _storage.ready;
      final items = _storage.getItem('${_viewKey}_$_currentLocale');

      if (items != null) {
        emit(LoadedI18nMessagesState(I18nMessages(items)));
        return;
      }
      Map<String, dynamic> messages = await client.findAll();
      saveAndRefresh(messages);
    } catch (e) {
      emit(const FatalErrorI18nMessagesState());
    }
  }

  saveAndRefresh(Map<String, dynamic> messages) {
    final LocalStorage _storage = LocalStorage(storageFile);
    _storage.setItem('${_viewKey}_$_currentLocale', messages);
    final state = LoadedI18nMessagesState(I18nMessages(messages));
    emit(state);
  }
}
