import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/chat_controller.dart';
import '../models/chat.dart';
import '../views/single_chat_screen.dart';

class EstateChatScreen extends StatefulWidget {
  const EstateChatScreen({Key? key}) : super(key: key);

  @override
  _EstateChatScreenState createState() => _EstateChatScreenState();
}

class _EstateChatScreenState extends State<EstateChatScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late EstateChatController estateChatController;

  @override
  void initState() {
    super.initState();
    estateChatController = FxControllerStore.putOrFind(EstateChatController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  List<Widget> _buildChatList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(16));

    for (Chat chat in estateChatController.chats!) {
      list.add(_buildSingleChat(chat));
    }
    return list;
  }

  Widget _buildSingleChat(Chat chat) {
    return FxContainer(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (context) => EstateSingleChatScreen(chat)));
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
                      color: customTheme.estatePrimary,
                      child: FxText.bodySmall(
                        chat.messages,
                        fontSize: 10,
                        color: customTheme.estateOnPrimary,
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
    return FxBuilder<EstateChatController>(
        controller: estateChatController,
        builder: (estateHomeController) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    height: 2,
                    child: estateHomeController.showLoading
                        ? LinearProgressIndicator(
                            color: customTheme.estatePrimary,
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
          );
        });
  }

  Widget _buildBody() {
    if (estateChatController.uiLoading) {
      return Container(
          margin: FxSpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return ListView(
        padding: FxSpacing.horizontal(
          24,
        ),
        children: [
          FxSpacing.height(16),
          Center(
            child: FxText.bodyLarge(
              'Chats',
              fontWeight: 700,
            ),
          ),
          FxSpacing.height(16),
          FxTextField(
            textFieldStyle: FxTextFieldStyle.outlined,
            labelText: 'Search your agent',
            focusedBorderColor: customTheme.estatePrimary,
            cursorColor: customTheme.estatePrimary,
            labelStyle: FxTextStyle.bodySmall(
                color: theme.colorScheme.onBackground, xMuted: true),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: customTheme.estatePrimary.withAlpha(40),
            suffixIcon: Icon(
              FeatherIcons.search,
              color: customTheme.estatePrimary,
              size: 20,
            ),
          ),
          FxSpacing.height(20),
          Column(
            children: _buildChatList(),
          ),
        ],
      );
    }
  }
}
