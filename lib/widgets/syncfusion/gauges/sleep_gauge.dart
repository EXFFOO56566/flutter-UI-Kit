import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:intl/intl.dart' as intl;
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SleepGauge extends StatefulWidget {
  SleepGauge({Key? key}) : super(key: key);

  @override
  _SleepGaugeState createState() => _SleepGaugeState();
}

class _SleepGaugeState extends State<SleepGauge> {
  Widget build(BuildContext context) {
    final bool _isDarkTheme =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 150,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(width: 1, color: Colors.grey),
                    color: Colors.transparent),
                child: Center(
                  child: Text('Mon, 5 Apr', style: TextStyle(fontSize: 14)),
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: FxSpacing.x(16),
                height: MediaQuery.of(context).size.height / 2,
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                      showFirstLabel: false,
                      axisLineStyle: AxisLineStyle(
                          thickness: 0.03,
                          thicknessUnit: GaugeSizeUnit.factor,
                          color: Colors.lightBlue[50]),
                      minorTicksPerInterval: 10,
                      majorTickStyle: MajorTickStyle(length: 10),
                      minimum: 0,
                      maximum: 12,
                      interval: 3,
                      startAngle: 90,
                      endAngle: 90,
                      onLabelCreated: (AxisLabelCreatedArgs args) {
                        if (args.text == '6') {
                          args.text = '12';
                        } else if (args.text == '9') {
                          args.text = '3';
                        } else if (args.text == '12') {
                          args.text = '6';
                        } else if (args.text == '3') {
                          args.text = '9';
                        }
                      },
                      pointers: <GaugePointer>[
                        WidgetPointer(
                            enableDragging: true,
                            value: _wakeupTimeValue,
                            onValueChanged: _handleWakeupTimeValueChanged,
                            onValueChanging: _handleWakeupTimeValueChanging,
                            onValueChangeStart: _handleWakeupTimeValueStart,
                            onValueChangeEnd: _handleWakeupTimeValueEnd,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.grey
                                          : Colors.white.withOpacity(0.2),
                                      offset: Offset.zero,
                                      blurRadius: 4.0,
                                    ),
                                  ],
                                  border: Border.all(
                                    color: _isDarkTheme
                                        ? Colors.white.withOpacity(0.1)
                                        : Colors.black.withOpacity(0.1),
                                    style: BorderStyle.solid,
                                    width: 0.0,
                                  )),
                              height: _wakeupTimePointerHeight,
                              width: _wakeupTimePointerWidth,
                              child: Center(
                                  child: Icon(
                                Icons.bedtime,
                                size: 15,
                                color: Colors.white,
                              )),
                            )),
                        WidgetPointer(
                          enableDragging: true,
                          value: _bedTimeValue,
                          onValueChanged: _handleBedTimeValueChanged,
                          onValueChanging: _handleBedTimeValueChanging,
                          onValueChangeStart: _handleBedTimeValueStart,
                          onValueChangeEnd: _handleBedTimeValueEnd,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: _isDarkTheme
                                        ? Colors.white.withOpacity(0.2)
                                        : Colors.grey,
                                    offset: Offset.zero,
                                    blurRadius: 4.0,
                                  ),
                                ],
                                border: Border.all(
                                  color: _isDarkTheme
                                      ? Colors.white.withOpacity(0.1)
                                      : Colors.black.withOpacity(0.1),
                                  style: BorderStyle.solid,
                                  width: 0.0,
                                )),
                            height: _bedTimePointerHeight,
                            width: _bedTimePointerWidth,
                            child: Center(
                                child: Icon(
                              Icons.wb_sunny,
                              color: Colors.white,
                              size: 15,
                            )),
                          ),
                        ),
                      ],
                      ranges: <GaugeRange>[
                        GaugeRange(
                            endValue: _bedTimeValue,
                            sizeUnit: GaugeSizeUnit.factor,
                            startValue: _wakeupTimeValue,
                            color: Colors.blue,
                            startWidth: 0.03,
                            endWidth: 0.03)
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: SizedBox(
                              width: 300,
                              height: 200,
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  AnimatedPositioned(
                                    right: 180,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.decelerate,
                                    child: AnimatedOpacity(
                                      opacity: _isWakeupTime ? 1.0 : 0.0,
                                      duration: (_isWakeupTime && _isBedTime)
                                          ? Duration(milliseconds: 800)
                                          : Duration(milliseconds: 200),
                                      child: CustomAnimatedBuilder(
                                        value: 1.3,
                                        curve: Curves.decelerate,
                                        duration: Duration(milliseconds: 300),
                                        builder: (BuildContext context,
                                                Widget? child,
                                                Animation<dynamic> animation) =>
                                            Transform.scale(
                                          scale: animation.value,
                                          child: child,
                                        ),
                                        child: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                '4 Apr',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                _wakeupTimeAnnotation,
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AnimatedOpacity(
                                    opacity: (_isBedTime && _isWakeupTime)
                                        ? 1.0
                                        : 0.0,
                                    duration: (_isWakeupTime && _isBedTime)
                                        ? Duration(milliseconds: 800)
                                        : Duration(milliseconds: 200),
                                    child: Container(
                                      margin: EdgeInsets.only(top: 16.0),
                                      child: Text(
                                        '-',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  AnimatedPositioned(
                                    left: 180,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.decelerate,
                                    child: AnimatedOpacity(
                                      opacity: _isBedTime ? 1.0 : 0.0,
                                      duration: (_isWakeupTime && _isBedTime)
                                          ? Duration(milliseconds: 800)
                                          : Duration(milliseconds: 200),
                                      child: CustomAnimatedBuilder(
                                        value: 1.3,
                                        curve: Curves.decelerate,
                                        duration: Duration(milliseconds: 300),
                                        builder: (BuildContext context,
                                                Widget? child,
                                                Animation<dynamic> animation) =>
                                            Transform.scale(
                                          scale: animation.value,
                                          child: child,
                                        ),
                                        child: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                '5 Apr',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                _bedTimeAnnotation,
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            positionFactor: 0.05,
                            angle: 0),
                      ])
                ]),
              ),
              SizedBox(height: 15),
              Text(
                _sleepMinutes == '00'
                    ? '$_sleepHours hrs'
                    : '$_sleepHours hrs ' '$_sleepMinutes mins',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 4),
              Text(
                'Sleep time',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleWakeupTimeValueChanged(double value) {
    setState(() {
      _wakeupTimeValue = value;
      final int _value = _wakeupTimeValue.abs().toInt();
      final int _hourValue = _value;
      final List<String> _minList =
          _wakeupTimeValue.toStringAsFixed(2).split('.');
      double _currentMinutes = double.parse(_minList[1]);
      _currentMinutes = (_currentMinutes * 60) / 100;
      final String _minutesValue = _currentMinutes.toStringAsFixed(0);

      final double hour = (_hourValue >= 0 && _hourValue <= 6)
          ? (_hourValue + 6)
          : (_hourValue >= 6 && _hourValue <= 12)
              ? _hourValue - 6
              : 0;
      final String hourValue = hour.toString().split('.')[0];

      _wakeupTimeAnnotation = ((hour >= 6 && hour < 10)
              ? '0' + hourValue
              : hourValue) +
          ':' +
          (_minutesValue.length == 1 ? '0' + _minutesValue : _minutesValue) +
          (_hourValue >= 6 ? ' pm' : ' pm');

      _wakeupTime = (_hourValue + 6 < 10
              ? '0' + _hourValue.toString()
              : _hourValue.toString()) +
          ':' +
          (_minutesValue.length == 1 ? '0' + _minutesValue : _minutesValue);

      final intl.DateFormat dateFormat = intl.DateFormat('HH:mm');
      final DateTime _wakeup = dateFormat.parse(_wakeupTime);
      final DateTime _sleep =
          dateFormat.parse(_bedTime == '09:00 pm' ? '12:00' : _bedTime);
      final String _sleepDuration = _sleep.difference(_wakeup).toString();
      _sleepHours = _sleepDuration.toString().split(':')[0];
      _sleepMinutes = _sleepDuration.toString().split(':')[1];
    });
  }

  void _handleWakeupTimeValueChanging(ValueChangingArgs args) {
    if (args.value >= 6 && args.value < 12) {
      args.cancel = true;
    }

    _wakeupTimePointerWidth = _wakeupTimePointerHeight = 40.0;
  }

  void _handleBedTimeValueChanging(ValueChangingArgs args) {
    if (args.value >= 0 && args.value < 6) {
      args.cancel = true;
    }

    _bedTimePointerWidth = _bedTimePointerHeight = 40.0;
  }

  void _handleBedTimeValueChanged(double value) {
    setState(() {
      _bedTimeValue = value;
      final int _value = _bedTimeValue.abs().toInt();
      final int _hourValue = _value;

      final List<String> _minList = _bedTimeValue.toStringAsFixed(2).split('.');
      double _currentMinutes = double.parse(_minList[1]);
      _currentMinutes = (_currentMinutes * 60) / 100;
      final String _minutesValue = _currentMinutes.toStringAsFixed(0);

      _bedTimeAnnotation = ((_hourValue >= 0 && _hourValue <= 6)
              ? (_hourValue + 6).toString()
              : (_hourValue >= 6 && _hourValue <= 12)
                  ? '0' + (_hourValue - 6).toString()
                  : '') +
          ':' +
          (_minutesValue.length == 1 ? '0' + _minutesValue : _minutesValue) +
          (_value >= 6 ? ' am' : ' pm');

      _bedTime = (_hourValue < 10
              ? '0' + _hourValue.toString()
              : _hourValue.toString()) +
          ':' +
          (_minutesValue.length == 1 ? '0' + _minutesValue : _minutesValue);

      final intl.DateFormat dateFormat = intl.DateFormat('HH:mm');
      final DateTime _wakeup =
          dateFormat.parse(_wakeupTime == '06:00 am' ? '03:00' : _wakeupTime);
      final DateTime _sleep = dateFormat.parse(_bedTime);
      final String _sleepDuration = _sleep.difference(_wakeup).toString();
      _sleepHours = _sleepDuration.toString().split(':')[0];
      _sleepMinutes = _sleepDuration.toString().split(':')[1];
    });
  }

  void _handleWakeupTimeValueStart(double value) {
    _isBedTime = false;
  }

  void _handleWakeupTimeValueEnd(double value) {
    setState(() {
      _isBedTime = true;
    });

    _wakeupTimePointerWidth = _wakeupTimePointerHeight = 30.0;
  }

  void _handleBedTimeValueStart(double value) {
    _isWakeupTime = false;
  }

  void _handleBedTimeValueEnd(double value) {
    setState(() {
      _isWakeupTime = true;
    });

    _bedTimePointerWidth = _bedTimePointerHeight = 30.0;
  }

  double _wakeupTimeValue = 3;
  double _bedTimeValue = 12;
  String _wakeupTimeAnnotation = '09:00 pm';
  String _bedTimeAnnotation = '06:00 am';
  bool _isWakeupTime = true;
  bool _isBedTime = true;
  String _sleepHours = '9';
  String _sleepMinutes = '00';
  String _bedTime = '09:00 pm';
  String _wakeupTime = '06:00 am';
  double _bedTimePointerWidth = 30.0;
  double _bedTimePointerHeight = 30.0;
  double _wakeupTimePointerWidth = 30.0;
  double _wakeupTimePointerHeight = 30.0;
}

class CustomAnimatedBuilder extends StatefulWidget {
  CustomAnimatedBuilder({
    Key? key,
    required this.value,
    required this.builder,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.child,
  }) : super(key: key);

  final Duration duration;
  final Curve curve;
  final double value;

  final Widget? child;

  final Widget Function(
    BuildContext context,
    Widget? child,
    Animation<dynamic> animation,
  ) builder;

  @override
  _CustomAnimatedBuilderState createState() => _CustomAnimatedBuilderState();
}

class _CustomAnimatedBuilderState extends State<CustomAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      value: widget.value,
      lowerBound: double.negativeInfinity,
      upperBound: double.infinity,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomAnimatedBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _animationController.animateTo(
        widget.value,
        duration: widget.duration,
        curve: widget.curve,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) => widget.builder(
        context,
        widget.child,
        _animationController,
      ),
    );
  }
}
