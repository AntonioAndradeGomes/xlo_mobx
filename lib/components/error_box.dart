import 'dart:ui';

import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final String message;

  ErrorBox({this.message});
  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return const SizedBox();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Container(
          color: Colors.red,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(
                  'Oops! $message. Por favor, tente novamente.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
