import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutx/flutx.dart';

import '../controllers/single_estate_controller.dart';
import '../models/house.dart';
import 'single_agent_screen.dart';
import 'package:flutter/material.dart';

class EstateSingleEstateScreen extends StatefulWidget {
  final House house;

  const EstateSingleEstateScreen(this.house);

  @override
  _EstateSingleEstateScreenState createState() =>
      _EstateSingleEstateScreenState();
}

class _EstateSingleEstateScreenState extends State<EstateSingleEstateScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late EstateSingleEstateController estateSingleEstateController;

  @override
  void initState() {
    super.initState();
    estateSingleEstateController =
        FxControllerStore.putOrFind(EstateSingleEstateController(widget.house));
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateSingleEstateController>(
        controller: estateSingleEstateController,
        builder: (estateSingleEstateController) {
          return Scaffold(
            body: Padding(
              padding: FxSpacing.top(32),
              child: Column(
                children: [
                  Container(
                    height: 2,
                    child: estateSingleEstateController.showLoading
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
    if (estateSingleEstateController.uiLoading) {
      return Container(
          margin: FxSpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return Container(
        padding: FxSpacing.fromLTRB(24, 8, 24, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                FxText.bodyLarge(
                  'Details',
                  fontWeight: 700,
                ),
                FxContainer.bordered(
                  paddingAll: 6,
                  child: FxContainer.rounded(
                    paddingAll: 4,
                    color: customTheme.estateSecondary,
                    child: Icon(
                      Icons.favorite,
                      size: 12,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: FxSpacing.y(16),
                children: [
                  FxContainer(
                    paddingAll: 0,
                    borderRadiusAll: 16,
                    clipBehavior: Clip.hardEdge,
                    child: Image(
                      fit: BoxFit.cover,
                      image:
                          AssetImage(estateSingleEstateController.house.image),
                    ),
                  ),
                  FxSpacing.height(16),
                  FxCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EstateSingleAgentScreen(
                                  estateSingleEstateController.house.agent)));
                    },
                    paddingAll: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxContainer(
                          paddingAll: 0,
                          borderRadiusAll: 8,
                          clipBehavior: Clip.hardEdge,
                          child: Image(
                            height: 52,
                            fit: BoxFit.cover,
                            image: AssetImage(
                                estateSingleEstateController.house.agent.image),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.bodyMedium(
                              estateSingleEstateController.house.agent.name,
                              fontWeight: 700,
                            ),
                            FxSpacing.height(8),
                            FxText.bodySmall(
                              'View Agent Profile',
                              xMuted: true,
                            ),
                          ],
                        ),
                        FxSpacing.width(60),
                        Icon(
                          Icons.chevron_right_sharp,
                          color: theme.colorScheme.onBackground,
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(16),
                  FxContainer(
                    paddingAll: 16,
                    borderRadiusAll: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FxText.bodyLarge(
                              estateSingleEstateController.house.name,
                              fontWeight: 700,
                            ),
                            FxText.bodyMedium(
                              estateSingleEstateController.house.price,
                              fontWeight: 600,
                              color: customTheme.estateSecondary,
                            ),
                          ],
                        ),
                        FxSpacing.height(8),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(180),
                            ),
                            FxSpacing.width(4),
                            FxText.bodySmall(
                              estateSingleEstateController.house.location,
                              xMuted: true,
                            ),
                          ],
                        ),
                        FxSpacing.height(8),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.king_bed,
                                    size: 16,
                                    color: FxAppTheme
                                        .theme.colorScheme.onBackground
                                        .withAlpha(180),
                                  ),
                                  FxSpacing.width(4),
                                  FxText.bodySmall(
                                    estateSingleEstateController.house.bedrooms,
                                    xMuted: true,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.bathtub,
                                    size: 16,
                                    color: FxAppTheme
                                        .theme.colorScheme.onBackground
                                        .withAlpha(180),
                                  ),
                                  FxSpacing.width(4),
                                  FxText.bodySmall(
                                    estateSingleEstateController
                                        .house.bathrooms,
                                    xMuted: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        FxSpacing.height(8),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.square_foot,
                                    size: 16,
                                    color: FxAppTheme
                                        .theme.colorScheme.onBackground
                                        .withAlpha(180),
                                  ),
                                  FxSpacing.width(4),
                                  FxText.bodySmall(
                                    estateSingleEstateController.house.floors,
                                    xMuted: true,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.aspect_ratio,
                                    size: 16,
                                    color: FxAppTheme
                                        .theme.colorScheme.onBackground
                                        .withAlpha(180),
                                  ),
                                  FxSpacing.width(4),
                                  FxText.bodySmall(
                                    estateSingleEstateController.house.area,
                                    xMuted: true,
                                    height: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        FxSpacing.height(20),
                        FxText.bodyMedium(
                          'Description',
                          fontWeight: 700,
                        ),
                        FxSpacing.height(8),
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: estateSingleEstateController
                                    .house.description,
                                style: FxTextStyle.bodyMedium(
                                  color: theme.colorScheme.onBackground,
                                  xMuted: true,
                                  height: 1.5,
                                )),
                            TextSpan(
                              text: "Read more",
                              style: FxTextStyle.bodyMedium(
                                color: customTheme.estateSecondary,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(16),
            FxButton.block(
              onPressed: () {},
              child: FxText.bodyMedium(
                'Rent Now',
                color: customTheme.estateOnPrimary,
                fontWeight: 700,
              ),
              backgroundColor: customTheme.estatePrimary,
              borderRadiusAll: 12,
              elevation: 0,
            ),
            FxSpacing.height(16),
          ],
        ),
      );
    }
  }
}
