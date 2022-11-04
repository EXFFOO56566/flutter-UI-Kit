import 'package:flutx/flutx.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../../../theme/constant.dart';
import '../controllers/single_chat_controller.dart';
import '../models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SingleChatScreen extends StatefulWidget {
  final Chat chat;

  const SingleChatScreen(this.chat);

  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  late ThemeData theme;
  late SingleChatController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.estateTheme;
    controller = FxControllerStore.putOrFind(SingleChatController(widget.chat));
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
              color: theme.colorScheme.primaryContainer,
              margin: FxSpacing.right(140),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Constant.containerRadius.medium),
                  bottomRight: Radius.circular(Constant.containerRadius.medium),
                  bottomLeft: Radius.circular(Constant.containerRadius.medium)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.bodySmall(
                    message!,
                    color: theme.colorScheme.onPrimaryContainer,
                    xMuted: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FxText.bodySmall(
                      time!,
                      fontSize: 10,
                      color: theme.colorScheme.onPrimaryContainer,
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
              color: theme.colorScheme.primary,
              margin: FxSpacing.left(140),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Constant.containerRadius.medium),
                  bottomRight: Radius.circular(Constant.containerRadius.medium),
                  bottomLeft: Radius.circular(Constant.containerRadius.medium)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.bodySmall(
                    message!,
                    color: theme.colorScheme.onPrimary,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FxText.bodySmall(
                      time!,
                      fontSize: 10,
                      color: theme.colorScheme.onPrimary,
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
        controller: controller,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: theme.colorScheme.primaryContainer)),
            child: Scaffold(
              body: Padding(
                padding: FxSpacing.top(FxSpacing.safeAreaTop(context)),
                child: Column(
                  children: [
                    Container(
                      height: 2,
                      child: controller.showLoading
                          ? LinearProgressIndicator(
                              color: theme.colorScheme.primary,
                              minHeight: 2,
                            )
                          : Container(
                              height: 2,
                            ),
                    ),
                    Expanded(
                      child: _buildBody(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Container(
          margin: FxSpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return Column(
        children: [
          FxContainer(
            color: theme.scaffoldBackgroundColor,
            child: Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                FxSpacing.width(8),
                FxContainer.rounded(
                  paddingAll: 0,
                  child: Image(
                    width: 40,
                    height: 40,
                    image: AssetImage(controller.chat.image),
                  ),
                ),
                FxSpacing.width(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.bodyMedium(
                        controller.chat.name,
                        fontWeight: 600,
                      ),
                      FxSpacing.height(2),
                      Row(
                        children: [
                          FxContainer.rounded(
                            paddingAll: 3,
                            color: Colors.green,
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
                    color: theme.colorScheme.primary,
                    paddingAll: 8,
                    child: Icon(
                      Icons.videocam_rounded,
                      color: theme.colorScheme.onPrimary,
                      size: 16,
                    )),
                FxSpacing.width(8),
                FxContainer.rounded(
                  color: theme.colorScheme.primary,
                  paddingAll: 8,
                  child: Icon(
                    Icons.call,
                    color: theme.colorScheme.onPrimary,
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
                  message: 'Should I come to meet you tomorrow?',
                  time: '08:30'),
              FxSpacing.height(16),
              _buildReceiveMessage(
                  message: 'Yes sure, you can come after 2:00 pm',
                  time: '08:35'),
              FxSpacing.height(16),
              _buildSendMessage(message: 'Sure, Thank you!!', time: '08:40'),
              FxSpacing.height(24),
            ],
          )),
          FxContainer(
            marginAll: 24,
            paddingAll: 0,
            borderRadiusAll: Constant.containerRadius.medium,
            child: FxTextField(
              focusedBorderColor: theme.colorScheme.primary,
              cursorColor: theme.colorScheme.primary,
              enabledBorderRadius: Constant.containerRadius.medium,
              focusedBorderRadius: Constant.containerRadius.medium,
              textFieldStyle: FxTextFieldStyle.outlined,
              labelText: 'Type Something ...',
              labelStyle: FxTextStyle.bodySmall(
                  color: theme.colorScheme.primary, xMuted: true),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: theme.colorScheme.primaryContainer,
              suffixIcon: Icon(
                FeatherIcons.send,
                color: theme.colorScheme.primary,
                size: 20,
              ),
            ),
          ),
        ],
      );
    }
  }
}
