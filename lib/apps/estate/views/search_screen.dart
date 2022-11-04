import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/search_controller.dart';
import '../models/house.dart';

class EstateSearchScreen extends StatefulWidget {
  const EstateSearchScreen({Key? key}) : super(key: key);

  @override
  _EstateSearchScreenState createState() => _EstateSearchScreenState();
}

class _EstateSearchScreenState extends State<EstateSearchScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late EstateSearchController estateSearchController;

  @override
  void initState() {
    super.initState();

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateSearchController =
        FxControllerStore.putOrFind(EstateSearchController());
    estateSearchController.addMarkers();
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];

    for (House house in estateSearchController.houses!) {
      list.add(_SinglePosition(house));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateSearchController>(
        controller: estateSearchController,
        builder: (estateSearchController) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                  height: 2,
                  child: estateSearchController.showLoading
                      ? LinearProgressIndicator(
                          color: customTheme.estatePrimary,
                          minHeight: 2,
                        )
                      : Container(
                          height: 0,
                        ),
                ),
                Expanded(
                  child: _buildBody(),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildBody() {
    if (estateSearchController.uiLoading) {
      return Container(
          margin: FxSpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return Stack(
        children: [
          GoogleMap(
            markers: estateSearchController.marker,
            onMapCreated: estateSearchController.onMapCreated,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
              new Factory<OneSequenceGestureRecognizer>(
                () => new EagerGestureRecognizer(),
              ),
            ].toSet(),
            initialCameraPosition: CameraPosition(
              target: estateSearchController.center,
              zoom: 7.0,
            ),
          ),
          Positioned(
            top: FxSpacing.safeAreaTop(context) + 20,
            left: 24,
            right: 24,
            child: Row(
              children: [
                Expanded(
                  child: FxTextField(
                    textFieldStyle: FxTextFieldStyle.outlined,
                    filled: true,
                    fillColor: customTheme.card,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    autoFocusedBorder: true,
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      color: customTheme.estatePrimary,
                      size: 20,
                    ),
                    labelTextColor: customTheme.estatePrimary,
                    cursorColor: customTheme.estatePrimary,
                    labelText: 'Search Location',
                    labelStyle: TextStyle(
                        fontSize: 12, color: customTheme.estatePrimary),
                    focusedBorderColor: customTheme.estatePrimary,
                    enabledBorderColor: customTheme.estatePrimary,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              height: 100,
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                controller: estateSearchController.pageController,
                onPageChanged: estateSearchController.onPageChange,
                children: _buildHouseList(),
              ),
            ),
          ),
        ],
      );
    }
  }
}

class _SinglePosition extends StatelessWidget {
  final House house;

  const _SinglePosition(this.house);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return FxCard(
      color: themeData.backgroundColor,
      borderRadiusAll: 8,
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
      margin: EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: AssetImage(house.image),
              fit: BoxFit.cover,
              width: 72,
              height: 72,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyLarge(house.name,
                      fontWeight: 600, overflow: TextOverflow.ellipsis),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          MdiIcons.mapMarker,
                          color: themeData.colorScheme.onBackground,
                          size: 14,
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 2),
                              child: FxText.bodySmall(house.location,
                                  fontWeight: 400)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
