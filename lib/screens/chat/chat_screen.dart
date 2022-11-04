import 'dart:async';

import 'package:flutkit/screens/chat/chat_audio_screen.dart';
import 'package:flutkit/screens/chat/chat_video_screen.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class ChatModel {
  String message, from, timestamp, seenType;

  static final String myId = "myId";
  static final String otherId = "otherId";

  ChatModel(this.message, this.from, this.timestamp, this.seenType);
}

class _ChatScreenState extends State<ChatScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  bool isExpanded = false, showMenu = false;

  ScrollController? _scrollController;
  TextEditingController? _chatTextController;

  List<String> _simpleChoice = ["Create shortcut", "Clear chat"];
  List<ChatModel> _chatList = [];
  List<Timer> _timers = [];

  bool isChatTextEmpty = true;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _chatTextController = TextEditingController();
    _scrollController = ScrollController();
    _chatList.add(ChatModel(Generator.getDummyText(10), ChatModel.myId,
        DateTime.now().millisecondsSinceEpoch.toString(), "seen"));
    _chatList.add(ChatModel(Generator.getDummyText(10), ChatModel.otherId,
        DateTime.now().millisecondsSinceEpoch.toString(), "sent"));
    _chatList.add(ChatModel(Generator.getDummyText(10), ChatModel.myId,
        DateTime.now().millisecondsSinceEpoch.toString(), "seen"));
    _chatList.add(ChatModel(Generator.getDummyText(10), ChatModel.myId,
        DateTime.now().millisecondsSinceEpoch.toString(), "seen"));
    _chatList.add(ChatModel(Generator.getDummyText(10), ChatModel.otherId,
        DateTime.now().millisecondsSinceEpoch.toString(), "sent"));

    _chatTextController!.addListener(() {
      setState(() {
        isChatTextEmpty = _chatTextController!.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController!.dispose();
    for (Timer timer in _timers) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context)),
      child: Column(
        children: [
          Container(
            child: appBarWidget(),
          ),
          Expanded(
              child: Container(
            margin: FxSpacing.horizontal(16),
            child: ListView.builder(
              controller: _scrollController,
              padding: FxSpacing.zero,
              itemCount: _chatList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: index == 0
                      ? FxSpacing.only(top: 12, bottom: 6).add(
                          _chatList[index].from.compareTo(ChatModel.myId) == 0
                              ? EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.2)
                              : EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.2))
                      : FxSpacing.only(top: 6, bottom: 6).add(
                          _chatList[index].from.compareTo(ChatModel.myId) == 0
                              ? EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.2)
                              : EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.2)),
                  alignment:
                      _chatList[index].from.compareTo(ChatModel.myId) == 0
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: singleChat(index),
                );
              },
            ),
          )),
          Container(
            child: bottomBarWidget(),
          )
        ],
      ),
    ));
  }

  Widget appBarWidget() {
    return FxContainer(
      padding: FxSpacing.fromLTRB(16, 4, 4, 4),
      color: theme.scaffoldBackgroundColor,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MdiIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
            ),
          ),
          Container(
            margin: FxSpacing.left(8),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image(
                image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                width: 32,
                height: 32,
              ),
            ),
          ),
          Container(
            margin: FxSpacing.left(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.bodyLarge("Zoey Melton",
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                FxText.bodySmall("Online",
                    color: theme.colorScheme.onBackground,
                    muted: true,
                    fontWeight: 600),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatAudioScreen()));
                    },
                    child: Container(
                      padding: FxSpacing.all(4),
                      child: Icon(
                        MdiIcons.phoneOutline,
                        color: theme.colorScheme.onBackground,
                        size: 18,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatVideoScreen()));
                    },
                    child: Container(
                      margin: FxSpacing.left(8),
                      padding: FxSpacing.all(4),
                      child: Icon(
                        MdiIcons.videoOutline,
                        color: theme.colorScheme.onBackground,
                        size: 22,
                      ),
                    ),
                  ),
                  Container(
                    margin: FxSpacing.left(4),
                    child: PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return _simpleChoice.map((String choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: FxText.bodyMedium(choice,
                                letterSpacing: 0.15,
                                color: theme.colorScheme.onBackground),
                          );
                        }).toList();
                      },
                      color: customTheme.card,
                      icon: Icon(
                        MdiIcons.dotsVertical,
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomBarWidget() {
    return FxContainer(
      padding: FxSpacing.fromLTRB(24, 12, 24, 12),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        onEnd: () {
          setState(() {
            showMenu = isExpanded;
          });
        },
        height: isExpanded ? 124 : 42,
        child: ListView(
          padding: FxSpacing.zero,
          children: [
            Row(
              children: [
                FxContainer.rounded(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                      if (!showMenu) showMenu = true;
                    });
                  },
                  padding: FxSpacing.all(8),
                  color: theme.colorScheme.primary.withAlpha(28),
                  child: Icon(
                    MdiIcons.plus,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: FxSpacing.left(16),
                    child: TextFormField(
                      style: FxTextStyle.bodyMedium(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Type here",
                        hintStyle: FxTextStyle.bodyMedium(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            fontWeight: 500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            borderSide: BorderSide(
                                color: customTheme.border, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            borderSide: BorderSide(
                                color: customTheme.border, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            borderSide: BorderSide(
                                color: customTheme.border, width: 1)),
                        isDense: true,
                        contentPadding: FxSpacing.fromLTRB(16, 12, 16, 12),
                        filled: true,
                        fillColor: customTheme.card,
                      ),
                      textInputAction: TextInputAction.send,
                      onFieldSubmitted: (message) {
                        sendMessage(message);
                      },
                      controller: _chatTextController,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                ),
                FxContainer.rounded(
                  margin: FxSpacing.left(16),
                  width: 38,
                  onTap: () {
                    sendMessage(_chatTextController!.text);
                  },
                  height: 38,
                  padding: FxSpacing.left(isChatTextEmpty ? 0 : 4),
                  color: theme.colorScheme.primary.withAlpha(28),
                  child: Icon(
                    isChatTextEmpty
                        ? MdiIcons.microphoneOutline
                        : MdiIcons.sendOutline,
                    color: theme.colorScheme.primary,
                    size: isChatTextEmpty ? 20 : 18,
                  ),
                )
              ],
            ),
            showMenu
                ? Container(
                    margin: FxSpacing.top(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        optionWidget(
                            color: Colors.blue,
                            iconData: MdiIcons.imageOutline,
                            title: "Image"),
                        optionWidget(
                            color: Colors.pink,
                            iconData: MdiIcons.mapMarkerOutline,
                            title: "Location"),
                        optionWidget(
                            color: Colors.orange,
                            iconData: MdiIcons.accountOutline,
                            title: "Contact"),
                        optionWidget(
                            color: Colors.purple,
                            iconData: MdiIcons.fileDocumentOutline,
                            title: "File"),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget optionWidget(
      {IconData? iconData, required Color color, String title = ""}) {
    return Column(
      children: [
        Container(
          padding: FxSpacing.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withAlpha(40),
          ),
          child: Icon(
            iconData,
            color: color,
            size: 22,
          ),
        ),
        Container(
          margin: FxSpacing.top(4),
          child: FxText.bodySmall(title,
              fontSize: 12,
              color: theme.colorScheme.onBackground,
              fontWeight: 600),
        )
      ],
    );
  }

  Widget singleChat(int index) {
    if (_chatList[index].from.compareTo(ChatModel.myId) == 0) {
      return Container(
          padding: FxSpacing.fromLTRB(16, 10, 16, 10),
          decoration: BoxDecoration(
            border: Border.all(color: customTheme.border, width: 1),
            borderRadius: makeChatBubble(index),
          ),
          child: FxText.titleSmall(
            _chatList[index].message,
            color: _chatList[index].seenType == "seen"
                ? theme.colorScheme.onBackground
                : theme.colorScheme.onBackground.withAlpha(150),
            letterSpacing: 0.1,
            fontWeight: _chatList[index].seenType == "seen" ? 500 : 600,
            overflow: TextOverflow.fade,
          ));
    } else {
      return Container(
          padding: FxSpacing.fromLTRB(16, 10, 16, 10),
          decoration: BoxDecoration(
            color: Color(0xff4d7af7),
            borderRadius: makeChatBubble(index),
          ),
          child: FxText.titleSmall(
            _chatList[index].message,
            color: theme.colorScheme.onPrimary,
            letterSpacing: 0.1,
            overflow: TextOverflow.fade,
          ));
    }
  }

  BorderRadius makeChatBubble(int index) {
    if (_chatList[index].from.compareTo(ChatModel.myId) == 0) {
      if (index != 0) {
        if (_chatList[index - 1].from.compareTo(ChatModel.myId) == 0) {
          return BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              topRight: Radius.circular(4));
        } else {
          return BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              topRight: Radius.circular(0));
        }
      } else {
        return BorderRadius.only(
            topLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            topRight: Radius.circular(0));
      }
    } else {
      if (index != 0) {
        if (_chatList[index - 1].from.compareTo(ChatModel.myId) != 0) {
          return BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              topRight: Radius.circular(4));
        } else {
          return BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              topRight: Radius.circular(4));
        }
      } else {
        return BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            topRight: Radius.circular(4));
      }
    }
  }

  String getStringTimeFromMilliseconds(String timestamp) {
    try {
      int time = int.parse(timestamp);
      var date = DateTime.fromMillisecondsSinceEpoch(time);
      int hour = date.hour, min = date.minute;
      if (hour > 12) {
        if (min < 10) {
          return (hour - 12).toString() + ":0" + min.toString() + " pm";
        } else {
          return (hour - 12).toString() + ":" + min.toString() + " pm";
        }
      } else {
        if (min < 10) {
          return (hour).toString() + ":0" + min.toString() + " am";
        } else {
          return (hour).toString() + ":" + min.toString() + " am";
        }
      }
    } catch (e) {
      return "";
    }
  }

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _chatTextController!.clear();
        _chatList.add(ChatModel(message, ChatModel.myId,
            DateTime.now().millisecondsSinceEpoch.toString(), "sent"));
        startTimer(_chatList.length - 1, message);
      });
      scrollToBottom(isDelayed: true);
    }
  }

  void startTimer(int index, String message) {
    print(index);
    const twoSec = Duration(seconds: 2);
    const threeSec = Duration(seconds: 3);

    Timer timerSeen = Timer.periodic(
        twoSec,
        (Timer timer) => {
              timer.cancel(),
              setState(() {
                _chatList[index].seenType = "seen";
              })
            });
    _timers.add(timerSeen);
    Timer timer = Timer.periodic(
        threeSec, (Timer timer) => {timer.cancel(), sentFromOther(message)});
    _timers.add(timer);
  }

  void sentFromOther(String message) {
    setState(() {
      _chatList.add(ChatModel(message, ChatModel.otherId,
          DateTime.now().millisecondsSinceEpoch.toString(), "sent"));
      scrollToBottom(isDelayed: true);
    });
  }

  scrollToBottom({bool isDelayed = false}) {
    final int delay = isDelayed ? 400 : 0;
    Future.delayed(Duration(milliseconds: delay), () {
      _scrollController!.animateTo(_scrollController!.position.maxScrollExtent,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }
}
