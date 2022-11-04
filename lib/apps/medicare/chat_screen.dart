import 'package:flutkit/theme/app_theme.dart';
import 'package:flutx/flutx.dart';

import 'single_chat_screen.dart';
import 'models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MediCareChatScreen extends StatefulWidget {
  const MediCareChatScreen({Key? key}) : super(key: key);

  @override
  _MediCareChatScreenState createState() => _MediCareChatScreenState();
}

class _MediCareChatScreenState extends State<MediCareChatScreen> {
  List<Chat> chatList = [];
  late ThemeData theme;
  late CustomTheme customTheme;

  List<Widget> _buildChatList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(16));

    for (int i = 0; i < chatList.length; i++) {
      list.add(_buildSingleChat(chatList[i]));
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    chatList = Chat.chatList();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildSingleChat(Chat chat) {
    return FxContainer(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (context) => MediCareSingleChatScreen(chat)));
      },
      margin: FxSpacing.bottom(16),
      paddingAll: 16,
      borderRadiusAll: 16,
      child: Row(
        children: [
          Stack(
            children: [
              FxContainer.rounded(
                paddingAll: 0,
                child: Image(
                  height: 54,
                  width: 54,
                  image: AssetImage(chat.image),
                ),
              ),
              Positioned(
                right: 4,
                bottom: 2,
                child: FxContainer.rounded(
                  paddingAll: 5,
                  child: Container(),
                  color: customTheme.groceryPrimary,
                ),
              )
            ],
          ),
          FxSpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.bodyMedium(
                  chat.name,
                  fontWeight: 600,
                ),
                FxSpacing.height(4),
                FxText.bodySmall(
                  chat.chat,
                  xMuted: chat.replied,
                  muted: !chat.replied,
                  fontWeight: chat.replied ? 400 : 600,
                ),
              ],
            ),
          ),
          FxSpacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FxText.bodySmall(
                chat.time,
                fontSize: 10,
                color: theme.colorScheme.onBackground,
                xMuted: true,
              ),
              chat.replied
                  ? FxSpacing.height(16)
                  : FxContainer.rounded(
                      paddingAll: 6,
                      color: customTheme.medicarePrimary,
                      child: FxText.bodySmall(
                        chat.messages,
                        fontSize: 10,
                        color: customTheme.medicareOnPrimary,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FxText.bodyLarge(
          'Chats',
          fontWeight: 700,
          letterSpacing: 0.5,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: FxSpacing.horizontal(
          24,
        ),
        children: [
          FxTextField(
            textFieldStyle: FxTextFieldStyle.outlined,
            labelText: 'Search, e.g. Dr',
            focusedBorderColor: customTheme.medicarePrimary,
            cursorColor: customTheme.medicarePrimary,
            labelStyle: FxTextStyle.bodySmall(
                color: theme.colorScheme.onBackground, xMuted: true),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: customTheme.medicarePrimary.withAlpha(40),
            suffixIcon: Icon(
              FeatherIcons.search,
              color: customTheme.medicarePrimary,
              size: 20,
            ),
          ),
          FxSpacing.height(20),
          Column(
            children: _buildChatList(),
          ),
        ],
      ),
    );
  }
}
