import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class StepsGauge extends StatefulWidget {
  StepsGauge({Key? key}) : super(key: key);

  @override
  _StepsGaugeState createState() => _StepsGaugeState();
}

class _StepsGaugeState extends State<StepsGauge> {
  final double _pointerValue = 8456;
  String _image = 'assets/images/widgets/person_walking.gif';

  @override
  void didChangeDependencies() {
    precacheImage(
        AssetImage('assets/images/widgets/person_walking.png'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _buildStepsCounter(context);
  }

  Widget _buildStepsCounter(BuildContext context) {
    final Brightness _brightness = Theme.of(context).brightness;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.68,
            child: SfLinearGauge(
              minimum: 0.0,
              maximum: 12000.0,
              interval: 12000.0,
              animateAxis: true,
              minorTicksPerInterval: 0,
              axisTrackStyle: LinearAxisTrackStyle(
                thickness: 32,
                borderWidth: 1,
                borderColor: _brightness == Brightness.dark
                    ? Color(0xff898989)
                    : Colors.grey[350],
                color: _brightness == Brightness.light
                    ? Color(0xffE8EAEB)
                    : Color(0xff62686A),
              ),
              barPointers: <LinearBarPointer>[
                LinearBarPointer(
                    value: _pointerValue,
                    animationDuration: 3000,
                    thickness: 32,
                    color: Color(0xff0DC9AB)),
                LinearBarPointer(
                    value: 12000,
                    enableAnimation: false,
                    thickness: 25,
                    offset: 60,
                    color: Colors.transparent,
                    position: LinearElementPosition.outside,
                    child: Container(
                        child: Text('Sun, 7 February',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)))),
              ],
              markerPointers: <LinearMarkerPointer>[
                LinearWidgetPointer(
                    value: _pointerValue,
                    animationDuration: 2800,
                    onAnimationCompleted: () {
                      setState(() {
                        _image = 'assets/images/widgets/person_walking.png';
                      });
                    },
                    position: LinearElementPosition.outside,
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Image.asset(
                        _image,
                        fit: BoxFit.fitHeight,
                      ),
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 65),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'STEPS',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    _pointerValue.toStringAsFixed(0),
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xff0DC9AB),
                        fontWeight: FontWeight.bold),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
