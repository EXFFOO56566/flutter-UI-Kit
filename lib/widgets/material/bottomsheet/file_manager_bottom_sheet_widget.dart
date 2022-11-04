/*
* File : Create File Bottom Sheet
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../theme/app_theme.dart';

class FileManagerBottomSheetWidget extends StatefulWidget {
  @override
  _FileManagerBottomSheetWidgetState createState() =>
      _FileManagerBottomSheetWidgetState();
}

class _FileManagerBottomSheetWidgetState
    extends State<FileManagerBottomSheetWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _showBottomSheet(context));
  }

  List<int> _list = List.generate(20, (i) => i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("File Manager", fontWeight: 600),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showBottomSheet(context);
          },
          elevation: 2,
          backgroundColor: theme.colorScheme.primary,
          label: FxText("CREATE",
              color: theme.colorScheme.onPrimary,
              fontWeight: 600,
              letterSpacing: 0.3),
          icon: Icon(
            MdiIcons.plus,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        body: Container(
          color: theme.backgroundColor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return Ink(
                  color: theme.backgroundColor,
                  child: ListTile(
                    leading: Icon(
                      MdiIcons.folder,
                      color: theme.colorScheme.onBackground,
                    ),
                    title: FxText.bodyLarge(
                        'Folder - ' + _list[index].toString(),
                        color: theme.colorScheme.onBackground),
                  ));
            },
          ),
        ));
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 12, bottom: 8),
                      child: FxText.bodySmall("CREATE",
                          color: theme.colorScheme.onBackground.withAlpha(200),
                          letterSpacing: 0.3,
                          fontWeight: 700),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.fileOutline,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: FxText.bodyLarge("File",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.folderOutline,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: FxText.bodyLarge("Folder",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.folderAccountOutline,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: FxText.bodyLarge("Sharable Folder",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    Divider(
                      color: theme.dividerColor,
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.cloudUploadOutline,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: FxText.bodyLarge("Upload photo",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.cameraOutline,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: FxText.bodyLarge("Take Photo",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
