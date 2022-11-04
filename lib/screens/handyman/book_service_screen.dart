import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'worker_information_screen.dart';

class BookServiceScreen extends StatefulWidget {
  @override
  _BookServiceScreenState createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int selectedDate = 1;

  _pickDate(BuildContext context) async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: customTheme.card,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MdiIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: FxText.titleLarge("Book a Worker",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: Container(
          color: customTheme.card,
          child: ListView(
            padding: FxSpacing.fromLTRB(24, 16, 24, 0),
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WorkerInformationScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: customTheme.border, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  padding: FxSpacing.all(16),
                  child: Row(
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Image(
                            image: AssetImage(
                                './assets/images/profile/avatar.jpg'),
                            width: 72,
                            height: 72,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: FxSpacing.left(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.bodyMedium(
                                "Dolcie Pineda",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600,
                              ),
                              FxText.bodySmall("Plumber",
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 600,
                                  xMuted: true),
                              Container(
                                margin: FxSpacing.top(4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          MdiIcons.star,
                                          color: Generator.starColor,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        FxText.bodyMedium("4.5",
                                            color:
                                                theme.colorScheme.onBackground,
                                            fontWeight: 600)
                                      ],
                                    ),
                                    FxText.bodyMedium("\$10 per Hour",
                                        color: theme.colorScheme.onBackground,
                                        fontWeight: 500,
                                        letterSpacing: 0)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: FxSpacing.top(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodySmall("DATE & TIME",
                        color: theme.colorScheme.onBackground,
                        muted: true,
                        fontWeight: 700),
                    InkWell(
                      onTap: () {
                        _pickDate(context);
                      },
                      child: Icon(
                        MdiIcons.calendarOutline,
                        size: 22,
                        color: theme.colorScheme.onBackground,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.top(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    singleDateWidget(date: "12\nTue", index: 0),
                    singleDateWidget(date: "13\nWed", index: 1),
                    singleDateWidget(date: "14\nThu", index: 2),
                    singleDateWidget(date: "15\nFri", index: 3),
                    singleDateWidget(date: "16\nSat", index: 4),
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.top(24),
                child: FxText.bodySmall("ADDRESS",
                    color: theme.colorScheme.onBackground,
                    muted: true,
                    fontWeight: 700),
              ),
              FxCard(
                margin: FxSpacing.top(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      style: FxTextStyle.titleSmall(
                          fontWeight: 500, letterSpacing: 0.2),
                      decoration: InputDecoration(
                        hintStyle: FxTextStyle.titleSmall(
                            fontWeight: 500,
                            letterSpacing: 0,
                            color:
                                theme.colorScheme.onBackground.withAlpha(180)),
                        hintText: "Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        prefixIcon: Icon(MdiIcons.mapMarkerOutline, size: 24),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                    Divider(
                      height: 0,
                    ),
                    TextFormField(
                      style: FxTextStyle.titleSmall(
                          fontWeight: 500, letterSpacing: 0.2),
                      decoration: InputDecoration(
                        hintStyle: FxTextStyle.titleSmall(
                            fontWeight: 500,
                            letterSpacing: 0,
                            color:
                                theme.colorScheme.onBackground.withAlpha(180)),
                        hintText: "Phone",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          MdiIcons.phoneOutline,
                          size: 24,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    Divider(
                      height: 0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            style: FxTextStyle.titleSmall(
                                fontWeight: 500, letterSpacing: 0.2),
                            decoration: InputDecoration(
                              hintStyle: FxTextStyle.titleSmall(
                                  fontWeight: 500,
                                  letterSpacing: 0,
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(180)),
                              hintText: "City",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              prefixIcon: Icon(
                                MdiIcons.homeCityOutline,
                                size: 24,
                              ),
                            ),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: TextFormField(
                              style: FxTextStyle.titleSmall(
                                  fontWeight: 500, letterSpacing: 0.2),
                              decoration: InputDecoration(
                                hintStyle: FxTextStyle.titleSmall(
                                    fontWeight: 500,
                                    letterSpacing: 0,
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(180)),
                                hintText: "PIN",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                prefixIcon: Icon(
                                  MdiIcons.numeric,
                                  size: 24,
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 0,
                    ),
                    TextFormField(
                      style: FxTextStyle.titleSmall(
                          fontWeight: 500, letterSpacing: 0.2),
                      decoration: InputDecoration(
                        hintStyle: FxTextStyle.titleSmall(
                            fontWeight: 500,
                            letterSpacing: 0,
                            color:
                                theme.colorScheme.onBackground.withAlpha(180)),
                        hintText: "Work",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          MdiIcons.informationOutline,
                          size: 24,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.top(32),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withAlpha(28),
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(FxSpacing.xy(16, 0))),
                        onPressed: () {},
                        child: FxText.bodyMedium("BOOK NOW",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                            letterSpacing: 0.5)),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget singleDateWidget({String? date, required int index}) {
    if (selectedDate == index) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedDate = index;
          });
        },
        child: Container(
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: theme.colorScheme.primary,
          ),
          padding: FxSpacing.fromLTRB(0, 8, 0, 14),
          child: Column(
            children: [
              FxText.bodySmall(
                date!,
                fontWeight: 600,
                color: theme.colorScheme.onPrimary,
                height: 1.9,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: FxSpacing.top(12),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary, shape: BoxShape.circle),
              )
            ],
          ),
        ),
      );
    }
    return InkWell(
      onTap: () {
        setState(() {
          selectedDate = index;
        });
      },
      child: Container(
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: customTheme.card,
            boxShadow: [
              BoxShadow(
                color: customTheme.shadowColor,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 8),
              )
            ]),
        padding: FxSpacing.fromLTRB(0, 8, 0, 14),
        child: Column(
          children: [
            FxText.bodySmall(
              date!,
              fontWeight: 600,
              color: theme.colorScheme.onBackground,
              height: 1.9,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget singleWorker(
      {required String image,
      required String name,
      required String profession,
      double? perHour,
      double? rate}) {
    return Container(
      margin: FxSpacing.bottom(16),
      decoration: BoxDecoration(
          border: Border.all(color: customTheme.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: FxSpacing.all(16),
      child: Row(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image(
                image: AssetImage(image),
                width: 72,
                height: 72,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: FxSpacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodyMedium(
                    name,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                  ),
                  FxText.bodySmall(profession,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600,
                      xMuted: true),
                  Container(
                    margin: FxSpacing.top(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              MdiIcons.star,
                              color: Generator.starColor,
                              size: 18,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            FxText.bodyMedium(rate.toString(),
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600)
                          ],
                        ),
                        FxText.bodyMedium(
                            "\$" + perHour.toString() + " per Hour",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
