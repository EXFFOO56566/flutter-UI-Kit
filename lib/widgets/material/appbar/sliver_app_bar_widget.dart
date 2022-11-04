/*
* File : Sliver Appbar widget
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

class SliverAppBarWidget extends StatefulWidget {
  @override
  _SliverAppBarWidgetState createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                backgroundColor: theme.colorScheme.primary,
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    FeatherIcons.chevronLeft,
                    color: theme.colorScheme.onPrimary,
                  ).autoDirection(),
                ),
                flexibleSpace: FlexibleSpaceBar(
                    title: Text("Collapsing Toolbar",
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 16.0,
                        )),
                    background: Image(
                      image: AssetImage(Images.squares[13]),
                      fit: BoxFit.cover,
                    )),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.info), text: "Tab 1"),
                      Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Center(
            child: Text("Sample text"),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
