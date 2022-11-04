import 'intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late IntroController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(IntroController());
  }

  Widget build(BuildContext context) {
    return FxBuilder<IntroController>(
        controller: controller,
        builder: (controller) {
          return WillPopScope(
            child: Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    controller.goBack();
                  },
                  child: Icon(
                    FeatherIcons.chevronLeft,
                    size: 20,
                  ),
                ),
                elevation: 1,
                title: FxText('Page Tour'),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Placeholder(
                          key: controller.intro.keys[1],
                          fallbackHeight: 100,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Placeholder(
                        key: controller.intro.keys[2],
                        fallbackHeight: 100,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Placeholder(
                              key: controller.intro.keys[3],
                              fallbackHeight: 100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                /// 1st guide
                key: controller.intro.keys[0],
                child: Icon(
                  Icons.play_arrow,
                ),
                onPressed: () {
                  controller.startIntro();
                },
              ),
            ),
            onWillPop: () => controller.onWillPop(),
          );
        });
  }
}
