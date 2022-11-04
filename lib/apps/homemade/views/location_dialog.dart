import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/location_dialog_controller.dart';

class LocationDialog extends StatefulWidget {
  const LocationDialog({Key? key}) : super(key: key);

  @override
  _LocationDialogState createState() => _LocationDialogState();
}

class _LocationDialogState extends State<LocationDialog> {
  late ThemeData theme;
  late CustomTheme customAppTheme;

  late LocationDialogController locationDialogController;

  @override
  void initState() {
    super.initState();
    locationDialogController =
        FxControllerStore.putOrFind(LocationDialogController());
    theme = AppTheme.theme;
    customAppTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder(
        controller: locationDialogController,
        builder: (controller) {
          return Dialog(
            insetPadding: FxSpacing.x(16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Container(
              padding: FxSpacing.xy(16, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: FxText.bodyLarge(
                      "Choose Location",
                      color: customAppTheme.homemadePrimary,
                      fontWeight: 600,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FxSpacing.height(24),
                  FxContainer.bordered(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    paddingAll: 0,
                    border: Border.all(color: customAppTheme.card, width: 1),
                    child: Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: FxContainer(
                                  padding: FxSpacing.all(20),
                                  child: Row(
                                    children: [
                                      Icon(
                                        FeatherIcons.mapPin,
                                        size: 20,
                                        color: customAppTheme.homemadePrimary,
                                      ),
                                      FxSpacing.width(16),
                                      FxText.bodyMedium(
                                        "Current",
                                        color: theme.colorScheme.onBackground,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                color: customAppTheme.border,
                                thickness: 0.9,
                                width: 0,
                              ),
                              FxContainer(
                                borderRadiusAll: 0,
                                color: customAppTheme.homemadePrimary
                                    .withAlpha(48),
                                padding: FxSpacing.all(20),
                                child: Row(
                                  children: [
                                    Icon(
                                      FeatherIcons.home,
                                      size: 20,
                                      color: customAppTheme.homemadePrimary,
                                    ),
                                    FxSpacing.width(16),
                                    FxText.bodyMedium(
                                      "Home",
                                      color: customAppTheme.homemadePrimary,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 0,
                          thickness: 0.9,
                          color: customAppTheme.border,
                        ),
                        FxContainer(
                          padding: FxSpacing.fromLTRB(16, 16, 16, 20),
                          child: Row(
                            children: [
                              Icon(
                                FeatherIcons.search,
                                size: 20,
                                color: customAppTheme.homemadePrimary,
                              ),
                              FxSpacing.width(16),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintStyle: FxTextStyle.bodyMedium(),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      hintText: "Search by Location",
                                      contentPadding: FxSpacing.zero),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(24),
                  FxButton(
                      borderRadiusAll: 4,
                      elevation: 0,
                      onPressed: () {
                        locationDialogController.confirm();
                      },
                      backgroundColor: customAppTheme.homemadePrimary,
                      child: FxText(
                        "Confirm",
                        color: customAppTheme.homemadeOnPrimary,
                      ))
                ],
              ),
            ),
          );
        });
  }
}
