import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EventFilterDialog extends StatefulWidget {
  @override
  _EventFilterDialogState createState() => _EventFilterDialogState();
}

class _EventFilterDialogState extends State<EventFilterDialog> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  double _startValue = 30;
  double _endValue = 60;
  int selectedLocation = 0, selectedDate = 2, selectedTOD = 1;

  _pickDate(BuildContext context) async {
    await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
  }

  _pickTime(BuildContext context) async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: FxSpacing.fromLTRB(24, 16, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.close,
                      color: theme.colorScheme.onBackground,
                      size: 16,
                    ),
                  ),
                  FxText.bodySmall("Filter".toUpperCase(),
                      fontWeight: 700, color: theme.colorScheme.onBackground),
                  FxText.bodySmall("Reset",
                      fontSize: 12,
                      xMuted: true,
                      letterSpacing: 0,
                      fontWeight: 600,
                      color: theme.colorScheme.onBackground),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 24, 24, 0),
              child: FxText.titleSmall("Location",
                  color: theme.colorScheme.onBackground, fontWeight: 700),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 12, 24, 0),
              child: locationWidget(),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 24, 24, 0),
              child: FxText.titleSmall("Date",
                  color: theme.colorScheme.onBackground, fontWeight: 700),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 12, 24, 0),
              child: dateWidget(),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 24, 24, 0),
              child: FxText.titleSmall("Time of day",
                  color: theme.colorScheme.onBackground, fontWeight: 700),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 12, 24, 0),
              child: todWidget(),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 24, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.titleSmall("Price",
                      color: theme.colorScheme.onBackground, fontWeight: 700),
                  Container(
                    margin: FxSpacing.top(4),
                    child: FxText.bodySmall(
                        ((_startValue == 0)
                                ? "Free"
                                : "\$" + _startValue.floor().toString()) +
                            " - \$" +
                            _endValue.floor().toString(),
                        color: theme.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(12, 0, 12, 0),
              child: SliderTheme(
                data: SliderThemeData(
                  rangeThumbShape:
                      RoundRangeSliderThumbShape(enabledThumbRadius: 7),
                  trackHeight: 2,
                ),
                child: RangeSlider(
                  values: RangeValues(_startValue, _endValue),
                  min: 0,
                  max: 199,
                  onChanged: (values) {
                    setState(() {
                      _startValue = values.start.roundToDouble();
                      _endValue = values.end.roundToDouble();
                    });
                  },
                ),
              ),
            ),
            Container(
              margin: FxSpacing.vertical(16),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: FxText.bodySmall("CANCEL",
                            fontSize: 12,
                            color: theme.colorScheme.primary,
                            letterSpacing: 0.5,
                            fontWeight: 600),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: FxButton(
                        borderRadiusAll: 4,
                        elevation: 0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: FxText.bodySmall("APPLY",
                            fontWeight: 600,
                            fontSize: 12,
                            letterSpacing: 0.5,
                            color: theme.colorScheme.onPrimary),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget locationWidget() {
    return Container(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedLocation = 0;
              });
            },
            child: singleChip(
                isSelected: selectedLocation == 0,
                text: "Current location",
                iconData: MdiIcons.mapMarkerOutline),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedLocation = 1;
              });
            },
            child: singleChip(
                isSelected: selectedLocation == 1,
                text: "Search",
                iconData: MdiIcons.magnify),
          ),
        ],
      ),
    );
  }

  Widget todWidget() {
    return Container(
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedTOD = 0;
              });
            },
            child: singleChip(isSelected: selectedTOD == 0, text: "Day"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedTOD = 1;
              });
            },
            child: singleChip(isSelected: selectedTOD == 1, text: "Night"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedTOD = 2;
                _pickTime(context);
              });
            },
            child: singleChip(
                isSelected: selectedTOD == 2,
                text: "Choose time",
                iconData: MdiIcons.clockOutline),
          ),
        ],
      ),
    );
  }

  Widget dateWidget() {
    return Container(
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedDate = 0;
              });
            },
            child: singleChip(isSelected: selectedDate == 0, text: "Today"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedDate = 1;
              });
            },
            child: singleChip(isSelected: selectedDate == 1, text: "Tomorrow"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedDate = 2;
              });
            },
            child: singleChip(
              isSelected: selectedDate == 2,
              text: "This week",
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedDate = 3;
                _pickDate(context);
              });
            },
            child: singleChip(
                isSelected: selectedDate == 3,
                text: "Choose a date",
                iconData: MdiIcons.calendarOutline),
          ),
        ],
      ),
    );
  }

  Widget singleChip({IconData? iconData, String? text, bool? isSelected}) {
    if (iconData != null) {
      return Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: isSelected!
            ? theme.colorScheme.primary
            : theme.colorScheme.primary.withAlpha(24),
        avatar: Icon(iconData,
            size: 16,
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.primary),
        label: FxText.bodySmall(text!,
            fontSize: 12.5,
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.primary,
            letterSpacing: 0,
            wordSpacing: 0,
            fontWeight: 500),
        padding: FxSpacing.fromLTRB(12, 6, 12, 6),
      );
    }

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: isSelected!
          ? theme.colorScheme.primary
          : theme.colorScheme.primary.withAlpha(24),
      label: FxText.bodySmall(text!,
          color: isSelected
              ? theme.colorScheme.onPrimary
              : theme.colorScheme.primary,
          letterSpacing: 0,
          wordSpacing: 0,
          fontWeight: 500),
      padding: FxSpacing.fromLTRB(12, 6, 12, 6),
    );
  }
}
