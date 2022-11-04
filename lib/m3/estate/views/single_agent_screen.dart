import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../../../theme/constant.dart';
import '../controllers/single_agent_controller.dart';
import '../models/agent.dart';
import '../models/house.dart';

class SingleAgentScreen extends StatefulWidget {
  final Agent agent;

  const SingleAgentScreen(this.agent);

  @override
  _SingleAgentScreenState createState() => _SingleAgentScreenState();
}

class _SingleAgentScreenState extends State<SingleAgentScreen> {
  late ThemeData theme;
  late SingleAgentController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.estateTheme;
    controller =
        FxControllerStore.putOrFind(SingleAgentController(widget.agent));
  }

  Widget _buildSingleHouse(House house) {
    return FxContainer(
      onTap: () {
        controller.goToSingleHouseScreen(house);
      },
      margin: FxSpacing.right(16),
      width: 200,
      paddingAll: 16,
      borderRadiusAll: Constant.containerRadius.medium,
      color: theme.colorScheme.secondaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxContainer(
            paddingAll: 0,
            borderRadiusAll: Constant.containerRadius.medium,
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
            color: theme.colorScheme.onSecondaryContainer,
          ),
          FxSpacing.height(4),
          FxText.bodySmall(
            house.location,
            xMuted: true,
            color: theme.colorScheme.onSecondaryContainer,
          ),
          FxSpacing.height(4),
          FxText.bodySmall(
            house.price.toString(),
            color: theme.colorScheme.onSecondaryContainer,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));

    for (House house in controller.houses!) {
      list.add(_buildSingleHouse(house));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleAgentController>(
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
      return ListView(
        padding: FxSpacing.fromLTRB(0, 8, 0, 20),
        children: [
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: FxContainer(
                    paddingAll: 4,
                    color: theme.colorScheme.primaryContainer,
                    child: Icon(
                      Icons.chevron_left_outlined,
                      color: theme.colorScheme.primary,
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
              borderRadiusAll: Constant.containerRadius.large,
              color: theme.colorScheme.primaryContainer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FxContainer(
                        paddingAll: 0,
                        borderRadiusAll: Constant.containerRadius.medium,
                        clipBehavior: Clip.hardEdge,
                        child: Image(
                          height: 56,
                          fit: BoxFit.cover,
                          image: AssetImage(controller.agent.image),
                        ),
                      ),
                      FxSpacing.width(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodyLarge(
                            controller.agent.name,
                            fontWeight: 700,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                          FxSpacing.height(8),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                              FxSpacing.width(4),
                              FxText.bodySmall(
                                controller.agent.address,
                                xMuted: true,
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  FxSpacing.height(16),
                  FxText.bodyMedium(
                    'Information',
                    fontWeight: 700,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                  FxSpacing.height(8),
                  Row(
                    children: [
                      FxContainer.rounded(
                          paddingAll: 4,
                          color: theme.colorScheme.primary.withAlpha(40),
                          child: Icon(
                            Icons.phone,
                            color: theme.colorScheme.primary,
                            size: 14,
                          )),
                      FxSpacing.width(12),
                      FxText.bodySmall(
                        controller.agent.number,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ],
                  ),
                  FxSpacing.height(8),
                  Row(
                    children: [
                      FxContainer.rounded(
                          paddingAll: 4,
                          color: theme.colorScheme.primary.withAlpha(40),
                          child: Icon(
                            Icons.house,
                            color: theme.colorScheme.primary,
                            size: 14,
                          )),
                      FxSpacing.width(12),
                      FxText.bodySmall(
                        controller.agent.properties,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ],
                  ),
                  FxSpacing.height(16),
                  FxText.bodyMedium(
                    'About Me',
                    fontWeight: 700,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                  FxSpacing.height(8),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: controller.agent.description,
                          style: FxTextStyle.bodySmall(
                            color: theme.colorScheme.onPrimaryContainer,
                            xMuted: true,
                            height: 1.5,
                          )),
                      TextSpan(
                        text: " Read more",
                        style: FxTextStyle.bodySmall(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ]),
                  ),
                  FxSpacing.height(16),
                  FxButton.block(
                    padding: FxSpacing.symmetric(horizontal: 24, vertical: 16),
                    onPressed: () {},
                    child: FxText.bodyMedium(
                      'Ask A Question',
                      color: theme.colorScheme.onPrimary,
                      fontWeight: 700,
                    ),
                    backgroundColor: theme.colorScheme.primary,
                    borderRadiusAll: Constant.containerRadius.large,
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
                FxText.bodySmall(
                  'See All',
                  xMuted: true,
                  fontSize: 10,
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
