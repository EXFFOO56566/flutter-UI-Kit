import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WaterGauge extends StatefulWidget {
  WaterGauge({Key? key}) : super(key: key);

  @override
  _WaterGaugeState createState() => _WaterGaugeState();
}

class _WaterGaugeState extends State<WaterGauge> {
  double _level = 150;
  final double _minimumLevel = 0;
  final double _maximumLevel = 500;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
          child: Container(
        height: 300,
        child: _buildWaterIndicator(context),
      )),
    );
  }

  Widget _buildWaterIndicator(BuildContext context) {
    final Brightness _brightness = Theme.of(context).brightness;

    return Padding(
        padding: const EdgeInsets.all(10),
        child: SfLinearGauge(
          minimum: _minimumLevel,
          maximum: _maximumLevel,
          orientation: LinearGaugeOrientation.vertical,
          interval: 100,
          axisTrackStyle: const LinearAxisTrackStyle(
            thickness: 2,
          ),
          markerPointers: <LinearMarkerPointer>[
            LinearWidgetPointer(
              value: _level,
              enableAnimation: false,
              onChanged: (dynamic value) {
                setState(() {
                  _level = value as double;
                });
              },
              child: Material(
                elevation: 4.0,
                shape: const CircleBorder(),
                clipBehavior: Clip.hardEdge,
                color: Colors.blue,
                child: Ink(
                  width: 32.0,
                  height: 32.0,
                  child: InkWell(
                    splashColor: Colors.grey,
                    hoverColor: Colors.blueAccent,
                    onTap: () {},
                    child: Center(
                      child: _level == _minimumLevel
                          ? Icon(Icons.keyboard_arrow_up_outlined,
                              color: Colors.white, size: 20.0)
                          : _level == _maximumLevel
                              ? Icon(Icons.keyboard_arrow_down_outlined,
                                  color: Colors.white, size: 20.0)
                              : RotatedBox(
                                  quarterTurns: 3,
                                  child: Icon(Icons.code_outlined,
                                      color: Colors.white, size: 20.0)),
                    ),
                  ),
                ),
              ),
            ),
            LinearWidgetPointer(
              value: _level,
              enableAnimation: false,
              markerAlignment: LinearMarkerAlignment.end,
              offset: 95,
              position: LinearElementPosition.outside,
              child: Container(
                  width: 50,
                  height: 20,
                  child: Center(
                      child: Text(
                    _level.toStringAsFixed(0) + ' ml',
                    style: TextStyle(
                        color: _brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ))),
            )
          ],
          barPointers: <LinearBarPointer>[
            LinearBarPointer(
              value: _maximumLevel,
              enableAnimation: false,
              thickness: 200,
              offset: 18,
              position: LinearElementPosition.outside,
              color: Colors.transparent,
              child: CustomPaint(
                  painter: _CustomPathPainter(
                      color: Colors.blue,
                      waterLevel: _level,
                      maximumPoint: _maximumLevel)),
            )
          ],
        ));
  }
}

class _CustomPathPainter extends CustomPainter {
  _CustomPathPainter(
      {required this.color,
      required this.waterLevel,
      required this.maximumPoint});

  final Color color;
  final double waterLevel;
  final double maximumPoint;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = _buildTumblerPath(size.width, size.height);
    final double factor = size.height / maximumPoint;
    final double height = 2 * factor * waterLevel;
    final Paint strokePaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final Paint paint = Paint()..color = color;
    canvas.drawPath(path, strokePaint);
    final Rect clipper = Rect.fromCenter(
        center: Offset(size.width / 2, size.height),
        height: height,
        width: size.width);
    canvas.clipRect(clipper);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CustomPathPainter oldDelegate) => true;
}

Path _buildTumblerPath(double width, double height) {
  return Path()
    ..lineTo(width, 0)
    ..lineTo(width * 0.75, height - 15)
    ..quadraticBezierTo(width * 0.74, height, width * 0.67, height)
    ..lineTo(width * 0.33, height)
    ..quadraticBezierTo(width * 0.26, height, width * 0.25, height - 15)
    ..close();
}
