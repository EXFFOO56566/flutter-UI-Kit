import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ThermometerGauge extends StatefulWidget {
  ThermometerGauge({Key? key}) : super(key: key);

  @override
  _ThermometerGaugeState createState() => _ThermometerGaugeState();
}

class _ThermometerGaugeState extends State<ThermometerGauge> {
  double _meterValue = 35;
  final double _temperatureValue = 37.5;

  @override
  Widget build(BuildContext context) {
    return _buildThermometer(context);
  }

  Widget _buildThermometer(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;

    return Center(
        child: Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Padding(
                    padding: EdgeInsets.only(bottom: 11),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SfLinearGauge(
                            minimum: -20,
                            maximum: 50,
                            interval: 10,
                            minorTicksPerInterval: 0,
                            axisTrackExtent: 23,
                            axisTrackStyle: LinearAxisTrackStyle(
                                thickness: 12,
                                borderWidth: 1,
                                edgeStyle: LinearEdgeStyle.bothCurve),
                            tickPosition: LinearElementPosition.outside,
                            labelPosition: LinearLabelPosition.outside,
                            orientation: LinearGaugeOrientation.vertical,
                            markerPointers: <LinearMarkerPointer>[
                              LinearWidgetPointer(
                                  markerAlignment: LinearMarkerAlignment.end,
                                  value: 50,
                                  enableAnimation: false,
                                  position: LinearElementPosition.outside,
                                  offset: 8,
                                  child: Container(
                                    height: 30,
                                    child: Text(
                                      '°C',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  )),
                              LinearShapePointer(
                                value: -20,
                                markerAlignment: LinearMarkerAlignment.start,
                                shapeType: LinearShapePointerType.circle,
                                borderWidth: 1,
                                borderColor: brightness == Brightness.dark
                                    ? Colors.white30
                                    : Colors.black26,
                                position: LinearElementPosition.cross,
                                width: 24,
                                height: 24,
                              ),
                              LinearShapePointer(
                                value: -20,
                                markerAlignment: LinearMarkerAlignment.start,
                                shapeType: LinearShapePointerType.circle,
                                borderWidth: 6,
                                borderColor: Colors.transparent,
                                color: _meterValue > _temperatureValue
                                    ? Color(0xffFF7B7B)
                                    : Color(0xff0074E3),
                                position: LinearElementPosition.cross,
                                width: 24,
                                height: 24,
                              ),
                              LinearWidgetPointer(
                                  value: -20,
                                  markerAlignment: LinearMarkerAlignment.start,
                                  child: Container(
                                    width: 10,
                                    height: 3.4,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 2.0),
                                        right: BorderSide(width: 2.0),
                                      ),
                                      color: _meterValue > _temperatureValue
                                          ? Color(0xffFF7B7B)
                                          : Color(0xff0074E3),
                                    ),
                                  )),
                              LinearWidgetPointer(
                                  value: _meterValue,
                                  enableAnimation: false,
                                  position: LinearElementPosition.outside,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      _meterValue = value as double;
                                    });
                                  },
                                  child: Container(
                                      width: 16,
                                      height: 12,
                                      transform:
                                          Matrix4.translationValues(4, 0, 0.0),
                                      child: Image.asset(
                                        'assets/images/widgets/triangle_pointer.png',
                                        color: _meterValue > _temperatureValue
                                            ? Color(0xffFF7B7B)
                                            : Color(0xff0074E3),
                                      ))),
                              LinearShapePointer(
                                value: _meterValue,
                                width: 20,
                                height: 20,
                                enableAnimation: false,
                                color: Colors.transparent,
                                position: LinearElementPosition.cross,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    _meterValue = value as double;
                                  });
                                },
                              )
                            ],
                            barPointers: <LinearBarPointer>[
                              LinearBarPointer(
                                value: _meterValue,
                                enableAnimation: false,
                                thickness: 6,
                                edgeStyle: LinearEdgeStyle.endCurve,
                                color: _meterValue > _temperatureValue
                                    ? Color(0xffFF7B7B)
                                    : Color(0xff0074E3),
                              )
                            ]),
                        Container(
                            transform: Matrix4.translationValues(-6, 0, 0.0),
                            child: SfLinearGauge(
                              minimum: 0,
                              maximum: 120,
                              showAxisTrack: false,
                              interval: 20,
                              minorTicksPerInterval: 0,
                              axisTrackExtent: 24,
                              axisTrackStyle:
                                  LinearAxisTrackStyle(thickness: 0),
                              orientation: LinearGaugeOrientation.vertical,
                              markerPointers: <LinearMarkerPointer>[
                                LinearWidgetPointer(
                                    markerAlignment: LinearMarkerAlignment.end,
                                    value: 120,
                                    position: LinearElementPosition.inside,
                                    offset: 6,
                                    enableAnimation: false,
                                    child: Container(
                                      height: 30,
                                      child: Text(
                                        '°F',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    )),
                              ],
                            ))
                      ],
                    )))));
  }
}
