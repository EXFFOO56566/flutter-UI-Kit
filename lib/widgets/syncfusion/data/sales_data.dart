import 'package:flutter/material.dart';

class SalesData {
  SalesData(this.x, this.y, [this.date, this.color]);

  final dynamic x;
  final dynamic y;
  final Color? color;
  final DateTime? date;
}
