/*
* File : Create File Bottom Sheet
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class FileManagerBottomSheet extends StatefulWidget {
  @override
  _FileManagerBottomSheetState createState() => _FileManagerBottomSheetState();
}

class _FileManagerBottomSheetState extends State<FileManagerBottomSheet> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  List<int> _list = List.generate(20, (i) => i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showBottomSheet(context);
          },
          elevation: 2,
          backgroundColor: theme.colorScheme.primary,
          label: FxText(
            "CREATE",
            fontWeight: 600,
            letterSpacing: 0.3,
            color: theme.colorScheme.onPrimary,
          ),
          icon: Icon(
            Icons.add,
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
                      Icons.folder,
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
                padding: FxSpacing.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: FxSpacing.fromLTRB(12, 0, 0, 8),
                        child: FxText.bodySmall("CREATE",
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            letterSpacing: 0.3,
                            fontWeight: 700)),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.file_copy_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: Text(
                        "File",
                        style: theme.textTheme.bodyText1!.merge(TextStyle(
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.folder_open_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: Text(
                        "Folder",
                        style: theme.textTheme.bodyText1!.merge(TextStyle(
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.folder_open_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: Text(
                        "Sharable Folder",
                        style: theme.textTheme.bodyText1!.merge(TextStyle(
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Divider(
                      color: theme.dividerColor,
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.cloud_upload_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: Text(
                        "Upload photo",
                        style: theme.textTheme.bodyText1!.merge(TextStyle(
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.camera_alt_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: Text(
                        "Take Photo",
                        style: theme.textTheme.bodyText1!.merge(TextStyle(
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
