/*
* File : OTP verification
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController? _numberController,
      _otp1Controller,
      _otp2Controller,
      _otp3Controller,
      _otp4Controller;
  FocusNode? _otp1FocusNode, _otp2FocusNode, _otp3FocusNode, _otp4FocusNode;

  late ThemeData theme;
  late CustomTheme customTheme;
  bool isInVerification = false;

  List<bool> _dataExpansionPanel = [true, false];

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    _numberController = TextEditingController(text: "+91 ");
    _otp1Controller = TextEditingController();
    _otp2Controller = TextEditingController();
    _otp3Controller = TextEditingController();
    _otp4Controller = TextEditingController();

    _otp1FocusNode = FocusNode();
    _otp2FocusNode = FocusNode();
    _otp3FocusNode = FocusNode();
    _otp4FocusNode = FocusNode();

    _otp1Controller!.addListener(() {
      if (_otp1Controller!.text.length >= 1) {
        _otp2FocusNode!.requestFocus();
      }
    });

    _otp2Controller!.addListener(() {
      if (_otp2Controller!.text.length >= 1) {
        _otp3FocusNode!.requestFocus();
      }
    });

    _otp3Controller!.addListener(() {
      if (_otp3Controller!.text.length >= 1) {
        _otp4FocusNode!.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _numberController!.dispose();
    _otp1Controller!.dispose();
    _otp2Controller!.dispose();
    _otp3Controller!.dispose();
    _otp4Controller!.dispose();
    _otp1FocusNode!.dispose();
    _otp2FocusNode!.dispose();
    _otp3FocusNode!.dispose();
    _otp4FocusNode!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FxText.titleLarge("OTP Verification"),
              Container(
                margin: EdgeInsets.only(top: 32, left: 16, right: 16),
                child: ExpansionPanelList(
                  expandedHeaderPadding: EdgeInsets.all(0),
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _dataExpansionPanel[index] = !isExpanded;
                    });
                  },
                  animationDuration: Duration(milliseconds: 500),
                  children: <ExpansionPanel>[
                    ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Container(
                              padding: EdgeInsets.all(16),
                              child: FxText.titleMedium("Number",
                                  fontWeight: isExpanded ? 600 : 400));
                        },
                        body: Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                style: FxTextStyle.bodyLarge(
                                    letterSpacing: 0.1,
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                decoration: InputDecoration(
                                  prefixText: "+91 ",
                                  prefixStyle: FxTextStyle.titleSmall(
                                      letterSpacing: 0.1,
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: customTheme.card,
                                  prefixIcon: Icon(
                                    MdiIcons.phoneOutline,
                                    size: 22,
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(200),
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(0),
                                ),
                                keyboardType: TextInputType.number,
                                autofocus: true,
                                textCapitalization:
                                    TextCapitalization.sentences,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          onSendOTP();
                                        },
                                        child: FxText.bodyMedium("Call Me",
                                            fontWeight: 600,
                                            color: theme
                                                .colorScheme.onBackground)),
                                    FxButton(
                                        elevation: 0,
                                        borderRadiusAll: 4,
                                        onPressed: () {
                                          onSendOTP();
                                        },
                                        child: FxText.bodyMedium("Send OTP",
                                            fontWeight: 600,
                                            color:
                                                theme.colorScheme.onPrimary)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        isExpanded: _dataExpansionPanel[0]),
                    ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Container(
                              padding: EdgeInsets.all(16),
                              child: FxText.titleMedium("OTP",
                                  fontWeight: isExpanded ? 600 : 500));
                        },
                        body: Container(
                            padding: EdgeInsets.only(bottom: 16, top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    singleDigitWidget(
                                        _otp1Controller, _otp1FocusNode),
                                    singleDigitWidget(
                                        _otp2Controller, _otp2FocusNode),
                                    singleDigitWidget(
                                        _otp3Controller, _otp3FocusNode),
                                    singleDigitWidget(
                                        _otp4Controller, _otp4FocusNode),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        FxText.bodySmall("Resend in ",
                                            fontWeight: 600,
                                            letterSpacing: 0.2),
                                        FxText.bodySmall("00:59",
                                            fontWeight: 500),
                                      ],
                                    ),
                                    FxButton(
                                        elevation: 0,
                                        borderRadiusAll: 4,
                                        onPressed: () {},
                                        child: FxText("Verify",
                                            color:
                                                theme.colorScheme.onPrimary)),
                                  ],
                                ),
                              ],
                            )),
                        isExpanded: _dataExpansionPanel[1])
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: FxSpacing.safeAreaTop(context) + 12,
          left: 16,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
        )
      ],
    ));
  }

  void onSendOTP() {
    if (!isInVerification) {
      FocusScope.of(context).unfocus();
      setState(() {
        isInVerification = false; // use here own logic
        _dataExpansionPanel[1] = true;
      });
    }
  }

  Widget singleDigitWidget(
      TextEditingController? _controller, FocusNode? _focusNode) {
    return Container(
      width: 36,
      height: 48,
      margin: EdgeInsets.symmetric(horizontal: 4),
      color: Colors.transparent,
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: customTheme.border)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: customTheme.border)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: customTheme.border)),
            helperText: ""),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: TextInputType.number,
      ),
    );
  }
}
