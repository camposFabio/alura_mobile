import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String? message;

  const Progress({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              message ?? 'Loading',
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
