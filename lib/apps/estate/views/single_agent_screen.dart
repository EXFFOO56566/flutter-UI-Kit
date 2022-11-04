import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/single_agent_controller.dart';
import '../models/agent.dart';
import '../models/house.dart';
import 'single_estate_screen.dart';

class EstateSingleAgentScreen extends StatefulWidget {
  final Agent agent;

  const EstateSingleAgentScreen(this.agent);

  @override
  _EstateSingleAgentScreenState createState() =>
      _EstateSingleAgentScreenState();
}

class _EstateSingleAgentScreenState extends State<EstateSingleAgentScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late EstateSingleAgentController estateSingleAgentController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateSingleAgentController =
        FxControllerStore.putOrFind(EstateSingleAgentController(widget.agent));
  }

  Widget _buildSingleHouse(House house) {
    return FxCard(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EstateSingleEstateScreen(house)));
      },
      margin: FxSpacing.right(16),
      width: 200,
      paddingAll: 16,
      borderRadiusAll: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxContainer(
            paddingAll: 0,
            borderRadiusAll: 8,
            clipBehavior: Clip.hardEdge,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(house.image),
            ),
          ),
          FxSpacing.height(8),
          FxText.bodyLarge(
            house.name,
            fontWeight: 700,
          ),
          FxSpacing.height(4),
          FxText.bodySmall(
            house.location,
            xMuted: true,
          ),
          FxSpacing.height(4),
          FxText.bodySmall(
            house.price,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));

    for (House house in estateSingleAgentController.houses!) {
      list.add(_buildSingleHouse(house));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateSingleAgentController>(
        controller: estateSingleAgentController,
        builder: (estateSingleAgentController) {
          return Scaffold(
            body: Padding(
              padding: FxSpacing.top(32),
              child: Column(
                children: [
                  Container(
                    height: 2,
                    child: estateSingleAgentController.showLoading
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
    if (estateSingleAgentController.uiLoading) {
      return Container(
          margin: FxSpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return ListView(
        padding: FxSpacing.top(8),
        children: [
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: FxContainer.bordered(
                    paddingAll: 4,
                    child: Icon(
                      Icons.chevron_left_outlined,
                      color: theme.colorScheme.onBackground.withAlpha(200),
                    ),
                  ),
                ),
                FxSpacing.width(64),
                FxText.bodyLarge(
                  'Agent Profile',
                  fontWeight: 700,
                ),
              ],
            ),
          ),
          FxSpacing.height(24),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: FxContainer(
              paddingAll: 12,
              borderRadiusAll: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FxContainer(
                        paddingAll: 0,
                        borderRadiusAll: 12,
                        clipBehavior: Clip.hardEdge,
                        child: Image(
                          height: 56,
                          fit: BoxFit.cover,
                          image: AssetImage(
                              estateSingleAgentController.agent.image),
                        ),
                      ),
                      FxSpacing.width(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodyLarge(
                            estateSingleAgentController.agent.name,
                            fontWeight: 700,
                          ),
                          FxSpacing.height(8),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(180),
                              ),
                              FxSpacing.width(4),
                              FxText.bodySmall(
                                estateSingleAgentController.agent.address,
                                xMuted: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  FxSpacing.height(16),
                  FxText.bodySmall(
                    'Information',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(8),
                  Row(
                    children: [
                      FxContainer.rounded(
                          paddingAll: 4,
                          color: customTheme.estatePrimary.withAlpha(40),
                          child: Icon(
                            Icons.phone,
                            color: customTheme.estatePrimary,
                            size: 14,
                          )),
                      FxSpacing.width(12),
                      FxText.bodySmall(
                        estateSingleAgentController.agent.number,
                      ),
                    ],
                  ),
                  FxSpacing.height(8),
                  Row(
                    children: [
                      FxContainer.rounded(
                          paddingAll: 4,
                          color: customTheme.estatePrimary.withAlpha(40),
                          child: Icon(
                            Icons.house,
                            color: customTheme.estatePrimary,
                            size: 14,
                          )),
                      FxSpacing.width(12),
                      FxText.bodySmall(
                        estateSingleAgentController.agent.properties,
                      ),
                    ],
                  ),
                  FxSpacing.height(16),
                  FxText.bodySmall(
                    'About Me',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(8),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: estateSingleAgentController.agent.description,
                          style: FxTextStyle.bodySmall(
                            color: theme.colorScheme.onBackground,
                            xMuted: true,
                            height: 1.5,
                          )),
                      TextSpan(
                        text: " Read more",
                        style: FxTextStyle.bodySmall(
                          color: customTheme.estatePrimary,
                        ),
                      ),
                    ]),
                  ),
                  FxSpacing.height(16),
                  FxButton.block(
                    padding: FxSpacing.symmetric(horizontal: 24, vertical: 16),
                    onPressed: () {
                      estateSingleAgentController.goToAgentChat();
                    },
                    child: FxText.bodyMedium(
                      'Ask A Question',
                      color: customTheme.estateOnPrimary,
                      fontWeight: 700,
                    ),
                    backgroundColor: customTheme.estatePrimary,
                    borderRadiusAll: 12,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
          FxSpacing.height(16),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.bodyMedium(
                  'Agent Listings',
                  fontWeight: 700,
                ),
                FxText.labelSmall(
                  'See All',
                  xMuted: true,
                ),
              ],
            ),
          ),
          FxSpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildHouseList(),
            ),
          ),
        ],
      );
    }
  }
}
