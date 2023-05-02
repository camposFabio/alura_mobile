import 'package:flutter/material.dart';

import 'progress.dart';

class ProgressView extends StatelessWidget {
  final String _message;

  const ProgressView({Key? key, message = 'Sending...'})
      : _message = message,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Processing'),
      ),
      body: Progress(
        message: _message,
      ),
    );
  }
}
