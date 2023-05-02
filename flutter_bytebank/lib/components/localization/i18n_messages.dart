class I18nMessages {
  final Map<String, dynamic> _messages;
  const I18nMessages(this._messages);

  String get(String key) {
    assert(_messages.containsKey(key));

    return _messages[key] ?? '';
  }
}
