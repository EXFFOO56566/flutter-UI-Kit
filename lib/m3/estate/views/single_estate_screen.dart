import 'package:flutx/flutx.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../../../theme/constant.dart';
import '../controllers/single_estate_controller.dart';
import '../models/house.dart';
import 'package:flutter/material.dart';

class SingleEstateScreen extends StatefulWidget {
  final House house;

  const SingleEstateScreen(this.house);

  @override
  _SingleEstateScreenState createState() => _SingleEstateScreenState();
}

class _SingleEstateScreenState extends State<SingleEstateScreen> {
  late ThemeData theme;
  late SingleEstateController controller;

  @override
  void initState() {
    super.initState();
    controller =
        FxControllerStore.putOrFind(SingleEstateController(widget.house));
    theme = AppTheme.estateTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleEstateController>(
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
                  child: FxContainer(
                    paddingAll: 4,
                    color: theme.colorScheme.primaryContainer,
                    child: Icon(
                      Icons.chevron_left_outlined,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: FxText.bodyLarge(
                    'Details',
                    fontWeight: 700,
                    textAlign: TextAlign.center,
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
                    borderRadiusAll: Constant.containerRadius.large,
                    clipBehavior: Clip.hardEdge,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(controller.house.image),
                    ),
                  ),
                  FxSpacing.height(16),
                  FxContainer(
                    onTap: () {
                      controller.goToSingleAgentScreen(controller.house.agent);
                    },
                    color: theme.colorScheme.primaryContainer,
                    paddingAll: 8,
                    borderRadiusAll: Constant.containerRadius.medium,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxContainer(
                          paddingAll: 0,
                          borderRadiusAll: Constant.containerRadius.medium,
                          clipBehavior: Clip.hardEdge,
                          child: Image(
                            height: 52,
                            fit: BoxFit.cover,
                            image: AssetImage(controller.house.agent.image),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.bodyMedium(
                              controller.house.agent.name,
                              fontWeight: 700,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                            FxSpacing.height(8),
                            FxText.bodySmall(
                              'View Agent Profile',
                              xMuted: true,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ],
                        ),
                        FxSpacing.width(60),
                        Icon(
                          Icons.chevron_right_sharp,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(16),
                  FxContainer(
                    paddingAll: 16,
                    borderRadiusAll: Constant.containerRadius.medium,
                    color: theme.colorScheme.primaryContainer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FxText.bodyLarge(
                              controller.house.name,
                              fontWeight: 700,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                            FxText.bodyMedium(
                              "\$" +
                                  controller.house.price.toString() +
                                  '/month',
                              fontWeight: 600,
                              color: theme.colorScheme.secondary,
                            ),
                          ],
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
                              controller.house.location,
                              xMuted: true,
                              color: theme.colorScheme.onPrimaryContainer,
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
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                  FxSpacing.width(4),
                                  FxText.bodySmall(
                                    controller.house.bedrooms.toString() +
                                        ' Beds',
                                    xMuted: true,
                                    color: theme.colorScheme.onPrimaryContainer,
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
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                  FxSpacing.width(4),
                                  FxText.bodySmall(
                                    controller.house.bathrooms.toString() +
                                        ' Baths',
                                    xMuted: true,
                                    color: theme.colorScheme.onPrimaryContainer,
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
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                  FxSpacing.width(4),
                                  FxText.bodySmall(
                                    controller.house.floors.toString() +
                                        ' Floors',
                                    xMuted: true,
                                    color: theme.colorScheme.onPrimaryContainer,
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
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                  FxSpacing.width(4),
                                  FxText.bodySmall(
                                    controller.house.area.toString() + ' sqft',
                                    xMuted: true,
                                    height: 1,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        FxSpacing.height(20),
                        FxText.bodyLarge(
                          'Description',
                          fontWeight: 700,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                        FxSpacing.height(8),
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: controller.house.description,
                                style: FxTextStyle.bodyMedium(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  xMuted: true,
                                  height: 1.5,
                                )),
                            TextSpan(
                              text: "Read more",
                              style: FxTextStyle.bodyMedium(
                                color: theme.colorScheme.secondary,
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
                color: theme.colorScheme.onPrimary,
                fontWeight: 700,
              ),
              backgroundColor: theme.colorScheme.primary,
              borderRadiusAll: Constant.containerRadius.large,
              elevation: 0,
            ),
            FxSpacing.height(16),
          ],
        ),
      );
    }
  }
}
