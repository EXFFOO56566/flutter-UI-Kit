import 'dart:async';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChatAudioScreen extends StatefulWidget {
  @override
  _ChatAudioScreenState createState() => _ChatAudioScreenState();
}

class _ChatAudioScreenState extends State<ChatAudioScreen> {
  late Timer _timer;
  int _nowTime = 0;
  String timeText = "00 : 00";

  bool isAudioOn = false, isVideoOn = true;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          _nowTime = _nowTime + 1;
          timeText = Generator.getTextFromSeconds(time: _nowTime);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: topWidget(),
          ),
          Expanded(
            child: Container(
              padding: FxSpacing.all(24),
              child: Wrap(
                spacing: 24,
                runSpacing: 24,
                children: [
                  singleCall(
                      name: "You",
                      image: './assets/images/profile/avatar_1.jpg',
                      cameraOn: isVideoOn,
                      micOn: isAudioOn),
                  singleCall(
                      name: "Zaine Sumner",
                      image: './assets/images/profile/avatar_2.jpg',
                      micOn: true),
                  singleCall(
                      name: "Kaja Langley",
                      image: './assets/images/profile/avatar_3.jpg',
                      cameraOn: true),
                  singleCall(
                      name: "Clifford Carey",
                      image: './assets/images/profile/avatar_4.jpg',
                      cameraOn: true,
                      micOn: true),
                ],
              ),
            ),
          ),
          Container(
            child: bottomWidget(),
          )
        ],
      ),
    ));
  }

  Widget singleCall(
      {required String name,
      required String image,
      bool micOn = false,
      bool cameraOn = false}) {
    return FxContainer.bordered(
      width: (MediaQuery.of(context).size.width - 74) / 2,
      height: 180,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(34)),
            child: Image(
              image: AssetImage(image),
              height: 68,
              width: 68,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: FxSpacing.top(8),
            child: FxText(
              name,
            ),
          ),
          Container(
            margin: FxSpacing.top(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  micOn ? MdiIcons.microphoneOutline : MdiIcons.microphoneOff,
                  color: micOn
                      ? theme.colorScheme.onBackground
                      : theme.colorScheme.onBackground.withAlpha(180),
                  size: 22,
                ),
                Container(
                  margin: FxSpacing.left(8),
                  child: Icon(
                      cameraOn
                          ? MdiIcons.videoOutline
                          : MdiIcons.videoOffOutline,
                      color: cameraOn
                          ? theme.colorScheme.onBackground
                          : theme.colorScheme.onBackground.withAlpha(180),
                      size: 22),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget topWidget() {
    return FxContainer(
      height: 60,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      border: Border.all(width: 1, color: customTheme.border),
      padding: FxSpacing.fromLTRB(24, 0, 24, 0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MdiIcons.chevronLeft,
              size: 24,
              color: theme.colorScheme.onBackground,
            ),
          ),
          Expanded(
            child: Container(
              margin: FxSpacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.titleSmall("Group Call",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  FxText.bodySmall(timeText,
                      color: theme.colorScheme.onBackground)
                ],
              ),
            ),
          ),
          Container(
            child: Icon(
              MdiIcons.accountPlusOutline,
              color: theme.colorScheme.onBackground,
              size: 22,
            ),
          )
        ],
      ),
    );
  }

  Widget bottomWidget() {
    return FxContainer(
      height: 68,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isAudioOn = !isAudioOn;
              });
            },
            child: Container(
              padding: FxSpacing.all(12),
              decoration: BoxDecoration(
                  color:
                      theme.colorScheme.primary.withAlpha(isAudioOn ? 40 : 0),
                  shape: BoxShape.circle),
              child: Icon(
                isAudioOn ? MdiIcons.microphoneOutline : MdiIcons.microphoneOff,
                color: isAudioOn
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onBackground.withAlpha(200),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isVideoOn = !isVideoOn;
              });
            },
            child: Container(
              padding: FxSpacing.all(12),
              decoration: BoxDecoration(
                  color:
                      theme.colorScheme.primary.withAlpha(isVideoOn ? 40 : 0),
                  shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  isVideoOn ? MdiIcons.videoOutline : MdiIcons.videoOffOutline,
                  color: isVideoOn
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onBackground.withAlpha(200),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: FxSpacing.all(12),
              decoration: BoxDecoration(
                  color: customTheme.colorError, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  MdiIcons.phoneHangupOutline,
                  color: customTheme.onError,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
