/*
* File : Facebook Chat
* Version : 1.0.0
* */

import 'dart:async';
import 'dart:math';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/custom_chat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChatFacebookScreen extends StatefulWidget {
  @override
  _ChatFacebookScreenState createState() => _ChatFacebookScreenState();
}

class ChatModel {
  String message, from, timestamp, seenType;

  static final String myId = "myId";
  static final String otherId = "otherId";

  ChatModel(this.message, this.from, this.timestamp, this.seenType);
}

class _ChatFacebookScreenState extends State<ChatFacebookScreen> {
  TextEditingController? _chatTextController;
  CustomChatTheme customChatTheme = CustomChatTheme.getFacebookTheme();

  List<ChatModel> _chatList = [];

  ScrollController? _scrollController;

  List<String> _simpleChoice = ["Create shortcut", "Clear chat"];

  List<Timer> _timers = [];
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    customTheme = CustomTheme.darkCustomTheme;
    theme = AppTheme.darkTheme;
    _chatTextController = TextEditingController();
    _scrollController = ScrollController();

    _chatList.add(ChatModel("Hii", ChatModel.myId,
        DateTime.now().millisecondsSinceEpoch.toString(), "sent"));
    _chatList.add(ChatModel("Hii", ChatModel.otherId,
        DateTime.now().millisecondsSinceEpoch.toString(), "sent"));
  }

  dispose() {
    super.dispose();
    _scrollController!.dispose();
    for (Timer timer in _timers) {
      timer.cancel();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customChatTheme.appBarColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Container(
                child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: Material(
                color: Colors.transparent,
                // button color
                child: InkWell(
                  splashColor: Colors.white,
                  // inkwell color
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(
                        FeatherIcons.arrowLeft,
                        color: customChatTheme.btnColor,
                        size: 24,
                      )),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            )),
            Container(
              margin: EdgeInsets.only(left: 8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("./assets/images/profile/avatar_2.jpg"),
                    fit: BoxFit.fill),
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.titleMedium(
                      "Buster Ryan",
                      fontWeight: 700,
                      height: 1.2,
                      color: theme.colorScheme.onBackground,
                    ),
                    FxText("Active 4 hour ago",
                        height: 1.2, color: theme.colorScheme.onBackground),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Icon(
            MdiIcons.phone,
            color: customChatTheme.btnColor,
          ),
          Container(
              margin: EdgeInsets.only(left: 16),
              child: Icon(
                MdiIcons.video,
                color: customChatTheme.btnColor,
              )),
          PopupMenuButton(
            onSelected: (dynamic choice) {
              onSelectedMenu(choice);
            },
            itemBuilder: (BuildContext context) {
              return _simpleChoice.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: FxText(choice),
                );
              }).toList();
            },
            color: theme.backgroundColor,
            icon: Icon(
              MdiIcons.dotsVertical,
              color: customChatTheme.btnColor,
            ),
          ),
        ],
      ),
      body: Container(
        color: customChatTheme.backgroundColor,
        child: Padding(
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Center(
                      child: FxText("16 AUG 2020 AT 9:44 PM",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500)),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.all(0),
                      itemCount: _chatList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: index == 0
                              ? EdgeInsets.only(top: 8, bottom: 1).add(
                                  _chatList[index].from.compareTo(ChatModel.myId) == 0
                                      ? EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width *
                                              0.2)
                                      : EdgeInsets.only(
                                          right: MediaQuery.of(context).size.width *
                                              0.2))
                              : EdgeInsets.only(top: 1, bottom: 1).add(
                                  _chatList[index].from.compareTo(ChatModel.myId) == 0
                                      ? EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width * 0.2)
                                      : EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2)),
                          alignment:
                              _chatList[index].from.compareTo(ChatModel.myId) ==
                                      0
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                          child: singleChat(index),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          child: ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            child: SizedBox(
                                width: 44,
                                height: 44,
                                child: Transform.rotate(
                                  angle: -pi / 4,
                                  child: Icon(
                                    MdiIcons.paperclip,
                                    size: 24,
                                    color: customChatTheme.btnColor,
                                  ),
                                )),
                            onTap: () {
                              addBottomSheet(context);
                            },
                          ),
                        ),
                      )),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(left: 16),
                          decoration: BoxDecoration(
                              color: customChatTheme.textFieldBackground,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24.0))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 4),
                                  child: TextField(
                                    maxLines: 8,
                                    minLines: 1,
                                    style: theme.textTheme.bodyText1!.merge(
                                        TextStyle(
                                            color: customChatTheme
                                                .textOnTextField)),
                                    decoration: InputDecoration(
                                      hintText: "Type a message...",
                                      isDense: true,
                                      hintStyle: theme.textTheme.subtitle1!
                                          .merge(TextStyle(
                                              color: customChatTheme
                                                  .textOnTextField!
                                                  .withAlpha(220))),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                    controller: _chatTextController,
                                  ),
                                ),
                              ),
                              Container(
                                  child: ClipOval(
                                child: Material(
                                  color: Colors.transparent,
                                  // button color
                                  child: InkWell(
                                    splashColor: Colors.white,
                                    // inkwell color
                                    child: SizedBox(
                                        width: 44,
                                        height: 44,
                                        child: Icon(
                                          MdiIcons.emoticonOutline,
                                          size: 24,
                                          color: customChatTheme.btnColor,
                                        )),
                                    onTap: () {},
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 8),
                          child: ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.white,
                                // inkwell color
                                child: SizedBox(
                                    width: 42,
                                    height: 42,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 4),
                                      child: Icon(
                                        MdiIcons.send,
                                        size: 22,
                                        color: customChatTheme.btnColor,
                                      ),
                                    )),
                                onTap: () {
                                  sendMessage(_chatTextController!.text);
                                },
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget singleChat(int index) {
    if (_chatList[index].from.compareTo(ChatModel.myId) == 0) {
      return Container(
          margin: EdgeInsets.only(top: 8),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: customChatTheme.myChatBG,
            borderRadius: makeChatBubble(index),
          ),
          child: FxText.titleMedium(
            _chatList[index].message,
            color: customChatTheme.onMyChat,
            overflow: TextOverflow.fade,
          ));
    } else {
      return Container(
        margin: EdgeInsets.only(top: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 4, right: 8),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("./assets/images/profile/avatar_2.jpg"),
                    fit: BoxFit.fill),
                shape: BoxShape.circle,
              ),
            ),
            Flexible(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: customChatTheme.chatBG,
                    borderRadius: makeChatBubble(index),
                  ),
                  child: FxText.titleMedium(_chatList[index].message,
                      overflow: TextOverflow.fade,
                      color: customChatTheme.onChat)),
            ),
          ],
        ),
      );
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

  BorderRadius makeChatBubble(int index) {
    if (_chatList[index].from.compareTo(ChatModel.myId) == 0) {
      if (index != 0) {
        if (_chatList[index - 1].from.compareTo(ChatModel.myId) == 0) {
          return BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              topRight: Radius.circular(12));
        } else {
          return BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(4),
              bottomLeft: Radius.circular(12),
              topRight: Radius.circular(12));
        }
      } else {
        return BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(4),
            bottomLeft: Radius.circular(12),
            topRight: Radius.circular(12));
      }
    } else {
      if (index != 0) {
        if (_chatList[index - 1].from.compareTo(ChatModel.myId) != 0) {
          return BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              topRight: Radius.circular(12));
        } else {
          return BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              bottomLeft: Radius.circular(4),
              topRight: Radius.circular(12));
        }
      } else {
        return BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(4),
            topRight: Radius.circular(12));
      }
    }
  }

  void onSelectedMenu(choice) {
    if (choice.toString().compareTo(_simpleChoice[0]) == 0) {
    } else if (choice.toString().compareTo(_simpleChoice[1]) == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return deleteAllChatDialog();
          });
    } else {
      print("nothing");
    }
  }

  Widget deleteAllChatDialog() {
    return Dialog(
      backgroundColor: customChatTheme.backgroundColor,
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 0, left: 24, right: 0),
        decoration: BoxDecoration(
          color: customChatTheme.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 24),
              child: FxText.titleMedium(
                "Are you sure to clear messages in this chat",
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 8),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(FxSpacing.xy(16, 0))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: FxText(
                          "Cancel".toUpperCase(),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: FxText(
                          "clear".toUpperCase(),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
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
    const oneSec = Duration(seconds: 1);
    Timer timer = Timer.periodic(
        oneSec, (Timer timer) => {timer.cancel(), sentFromOther(message)});
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

  void addBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            margin: EdgeInsets.only(bottom: 64, left: 16, right: 16),
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    quickActionWidget(
                                      MdiIcons.textBoxOutline,
                                      'Document',
                                    ),
                                    quickActionWidget(
                                      MdiIcons.musicNoteOutline,
                                      'Audio',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    quickActionWidget(
                                      MdiIcons.cameraOutline,
                                      'Camera',
                                    ),
                                    quickActionWidget(
                                      MdiIcons.mapMarkerOutline,
                                      'Location',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    quickActionWidget(
                                      MdiIcons.imageOutline,
                                      'Gallery',
                                    ),
                                    quickActionWidget(
                                      MdiIcons.accountBoxOutline,
                                      'Contact',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget quickActionWidget(IconData iconData, String actionText) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: customChatTheme.btnColor, // button color
              child: InkWell(
                splashColor: Colors.white,
                // inkwell color
                child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Icon(
                      iconData,
                      color: customChatTheme.iconOnBtn,
                      size: 25,
                    )),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: FxText.labelMedium(
              actionText,
              color: theme.colorScheme.onBackground,
            ),
          )
        ],
      ),
    );
  }
}
