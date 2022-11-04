import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/single_chat_controller.dart';
import '../models/chat.dart';

class SingleChatScreen extends StatefulWidget {
  final Chat chat;

  const SingleChatScreen(this.chat);

  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late SingleChatController singleChatController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    singleChatController =
        FxControllerStore.putOrFind(SingleChatController(widget.chat));
  }

  Widget _buildReceiveMessage({String? message, String? time}) {
    return Padding(
      padding: FxSpacing.horizontal(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: FxContainer(
              margin: FxSpacing.right(140),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.bodySmall(
                    message!,
                    color: theme.colorScheme.onBackground,
                    xMuted: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FxText.bodySmall(
                      time!,
                      fontSize: 10,
                      color: theme.colorScheme.onBackground,
                      xMuted: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendMessage({String? message, String? time}) {
    return Padding(
      padding: FxSpacing.horizontal(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: FxContainer(
              color: customTheme.homemadePrimary,
              margin: FxSpacing.left(140),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.bodySmall(
                    message!,
                    color: customTheme.homemadeOnPrimary,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FxText.bodySmall(
                      time!,
                      fontSize: 10,
                      color: customTheme.homemadeOnPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleChatController>(
        controller: singleChatController,
        builder: (singleChatController) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (singleChatController.uiLoading) {
      return Scaffold(
        body: Container(
            margin: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
            child: LoadingEffect.getSearchLoadingScreen(
              context,
            )),
      );
    } else {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.top(32),
          child: Column(
            children: [
              FxContainer(
                color: theme.scaffoldBackgroundColor,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            FeatherIcons.chevronLeft,
                            size: 20,
                            color: theme.colorScheme.onBackground,
                          ),
                          FxSpacing.width(4),
                          FxContainer.rounded(
                            paddingAll: 0,
                            child: Image(
                              width: 40,
                              height: 40,
                              image: AssetImage(
                                singleChatController.chat.url,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FxSpacing.width(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodyMedium(
                            singleChatController.chat.name,
                            fontWeight: 600,
                          ),
                          FxSpacing.height(2),
                          Row(
                            children: [
                              FxContainer.rounded(
                                paddingAll: 3,
                                color: customTheme.groceryPrimary,
                                child: Container(),
                              ),
                              FxSpacing.width(4),
                              FxText.bodySmall(
                                'Online',
                                color: theme.colorScheme.onBackground,
                                xMuted: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    FxSpacing.width(16),
                    FxContainer.rounded(
                        color: customTheme.homemadePrimary,
                        paddingAll: 8,
                        child: Icon(
                          Icons.videocam_rounded,
                          color: customTheme.homemadeOnPrimary,
                          size: 16,
                        )),
                    FxSpacing.width(8),
                    FxContainer.rounded(
                      color: customTheme.homemadePrimary,
                      paddingAll: 8,
                      child: Icon(
                        Icons.call,
                        color: customTheme.homemadeOnPrimary,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  _buildReceiveMessage(
                      message: 'Yes, What help do you need?', time: '08:25'),
                  FxSpacing.height(16),
                  _buildSendMessage(
                      message: 'Should I come to hospital tomorrow?',
                      time: '08:30'),
                  FxSpacing.height(16),
                  _buildReceiveMessage(
                      message: 'Yes sure, you can come after 2:00 pm',
                      time: '08:35'),
                  FxSpacing.height(16),
                  _buildSendMessage(
                      message: 'Sure, Thank you!!', time: '08:40'),
                  FxSpacing.height(24),
                ],
              )),
              FxContainer(
                marginAll: 24,
                paddingAll: 0,
                child: FxTextField(
                  focusedBorderColor: customTheme.homemadePrimary,
                  cursorColor: customTheme.homemadePrimary,
                  textFieldStyle: FxTextFieldStyle.outlined,
                  labelText: 'Type Something ...',
                  labelStyle: FxTextStyle.bodySmall(
                      color: theme.colorScheme.onBackground, xMuted: true),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: customTheme.card,
                  suffixIcon: Icon(
                    FeatherIcons.send,
                    color: customTheme.homemadePrimary,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
