import 'dart:ui';

import 'package:flutter/material.dart';

class CustomInputTheme {
  TextStyle _buildTextStyle(Color color, {double size = 16.0}) {
    return TextStyle(color: color, fontSize: size);
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(color: color, width: 1.0));
  }

  InputDecorationTheme theme() => InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      isDense: true,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      constraints: BoxConstraints(maxWidth: 150),
      // enabledBorder: _buildBorder(Colors.grey[600]!),
      enabledBorder: _buildBorder(Colors.transparent),
      errorBorder: _buildBorder(Colors.deepPurple),
      focusedErrorBorder: _buildBorder(Colors.deepPurple),
      focusedBorder: _buildBorder(Colors.transparent),
      disabledBorder: _buildBorder(Colors.grey[400]!),
      suffixStyle: _buildTextStyle(Colors.purple),
      counterStyle: _buildTextStyle(Colors.grey, size: 12.0),
      floatingLabelStyle: _buildTextStyle(Colors.purple),
      errorStyle: _buildTextStyle(Colors.deepPurple, size: 12.0),
      helperStyle: _buildTextStyle(Colors.purple, size: 12.0),
      hintStyle: _buildTextStyle(Colors.purple),
      labelStyle: _buildTextStyle(Colors.purple),
      prefixStyle: _buildTextStyle(Colors.purple),
      filled: true,
      fillColor: Colors.purple[50]);
}
