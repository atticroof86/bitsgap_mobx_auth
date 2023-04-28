import 'package:flutter/material.dart';

extension NumEx on num {
  SizedBox get w => SizedBox(width: toDouble());
  SizedBox get h => SizedBox(height: toDouble());
}
