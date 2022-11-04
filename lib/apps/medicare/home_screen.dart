import 'package:flutkit/theme/app_theme.dart';
import 'package:flutx/flutx.dart';

import 'single_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'models/category.dart';
import 'models/doctor.dart';

class MediCareHomeScreen extends StatefulWidget {
  @override
  _MediCareHomeScreenState createState() => _MediCareHomeScreenState();
}

class _MediCareHomeScreenState extends State<MediCareHomeScreen> {
  int selectedCategory = 0;
  List<Category> categoryList = [];
  List<Doctor> doctorList = [];
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    categoryList = Category.categoryList();
    doctorList = Doctor.doctorList();
  }

  Widget _buildSingleCategory(
      {int? index, String? categoryName, IconData? categoryIcon}) {
    return Padding(
      padding: FxSpacing.right(16),
      child: FxContainer(
        paddingAll: 8,
        borderRadiusAll: 8,
        bordered: true,
        border: Border.all(color: customTheme.border, width: 1),
        color: selectedCategory == index
            ? customTheme.card
            : theme.scaffoldBackgroundColor,
        onTap: () {
          setState(() {
            selectedCategory = index!;
          });
        },
        child: Row(
          children: [
            FxContainer.rounded(
              child: Icon(
                categoryIcon,
                color: customTheme.medicarePrimary,
                size: 16,
              ),
              color: theme.colorScheme.onBackground.withAlpha(16),
              paddingAll: 4,
            ),
            FxSpacing.width(8),
            FxText.labelMedium(
              categoryName!,
              fontWeight: 600,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCategoryList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(24));

    for (int i = 0; i < categoryList.length; i++) {
      list.add(_buildSingleCategory(
          index: i,
          categoryName: categoryList[i].category,
          categoryIcon: categoryList[i].categoryIcon));
    }
    return list;
  }

  List<Widget> _buildDoctorList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(16));

    for (int i = 0; i < doctorList.length; i++) {
      list.add(_buildSingleDoctor(doctorList[i]));
    }
    return list;
  }

  Widget _buildSingleDoctor(Doctor doctor) {
    return FxContainer(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (context) => MediCareSingleDoctorScreen(doctor)));
      },
      margin: FxSpacing.fromLTRB(24, 0, 24, 16),
      paddingAll: 16,
      borderRadiusAll: 8,
      child: Row(
        children: [
          FxContainer(
            paddingAll: 0,
            borderRadiusAll: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image(
                width: 72,
                height: 72,
                image: AssetImage(doctor.image),
              ),
            ),
          ),
          FxSpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.bodyLarge(
                  doctor.name,
                  fontWeight: 600,
                ),
                FxSpacing.height(4),
                FxText.bodySmall(
                  doctor.category,
                  xMuted: true,
                ),
                FxSpacing.height(12),
                Row(
                  children: [
                    FxStarRating(
                      rating: doctor.ratings,
                      showInactive: true,
                      size: 15,
                      inactiveColor:
                          theme.colorScheme.onBackground.withAlpha(180),
                    ),
                    FxSpacing.width(4),
                    FxText.bodySmall(
                      doctor.ratings.toString() +
                          ' | ' +
                          doctor.reviews.toString() +
                          ' Reviews',
                      xMuted: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: FxSpacing.top(48),
        children: [
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxSpacing.width(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FxText.bodySmall(
                      'Current Location',
                      color: theme.colorScheme.onBackground,
                      xMuted: true,
                      fontSize: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: customTheme.medicarePrimary,
                          size: 12,
                        ),
                        FxSpacing.width(4),
                        FxText.bodySmall(
                          'Semarang, INA',
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                        ),
                      ],
                    ),
                  ],
                ),
                FxContainer(
                  paddingAll: 4,
                  borderRadiusAll: 4,
                  color: customTheme.card,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Icon(
                        FeatherIcons.bell,
                        size: 20,
                        color: theme.colorScheme.onBackground.withAlpha(200),
                      ),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: FxContainer.rounded(
                          paddingAll: 4,
                          child: Container(),
                          color: customTheme.medicarePrimary,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          FxSpacing.height(24),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: FxTextField(
              focusedBorderColor: customTheme.medicarePrimary,
              cursorColor: customTheme.medicarePrimary,
              textFieldStyle: FxTextFieldStyle.outlined,
              labelText: 'Search a doctor or health issue',
              labelStyle: FxTextStyle.bodySmall(
                  color: theme.colorScheme.onBackground, xMuted: true),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: customTheme.card,
              prefixIcon: Icon(
                FeatherIcons.search,
                color: customTheme.medicarePrimary,
                size: 20,
              ),
            ),
          ),
          FxSpacing.height(24),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.bodyMedium(
                  'Upcoming Schedule',
                  fontWeight: 700,
                ),
                FxText.bodySmall(
                  'See all',
                  color: customTheme.medicarePrimary,
                  fontSize: 10,
                ),
              ],
            ),
          ),
          FxSpacing.height(24),
          FxContainer(
            borderRadiusAll: 8,
            margin: FxSpacing.horizontal(24),
            child: Column(
              children: [
                Row(
                  children: [
                    FxContainer(
                      paddingAll: 0,
                      borderRadiusAll: 8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image(
                          height: 40,
                          width: 40,
                          image: AssetImage(
                            'assets/images/profile/avatar_3.jpg',
                          ),
                        ),
                      ),
                    ),
                    FxSpacing.width(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodySmall(
                            'Dr.Haley lawrence',
                            color: customTheme.medicareOnPrimary,
                            fontWeight: 700,
                          ),
                          FxText.bodySmall(
                            'Dermatologists',
                            fontSize: 10,
                            color: customTheme.medicareOnPrimary.withAlpha(200),
                          ),
                        ],
                      ),
                    ),
                    FxSpacing.width(16),
                    FxContainer.rounded(
                      paddingAll: 4,
                      child: Icon(
                        Icons.videocam_outlined,
                        color: customTheme.medicarePrimary,
                        size: 16,
                      ),
                      color: customTheme.medicareOnPrimary,
                    ),
                  ],
                ),
                FxSpacing.height(16),
                FxContainer(
                  borderRadiusAll: 8,
                  color: theme.colorScheme.onBackground.withAlpha(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.watch_later,
                        color: customTheme.medicareOnPrimary.withAlpha(160),
                        size: 20,
                      ),
                      FxSpacing.width(8),
                      FxText.bodySmall(
                        'Sun, Jan 19, 08:00am - 10:00am',
                        color: customTheme.medicareOnPrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            color: customTheme.medicarePrimary,
          ),
          FxSpacing.height(24),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.bodyMedium(
                  'Let\'s find your doctor',
                  fontWeight: 700,
                ),
                Icon(
                  Icons.tune_outlined,
                  color: customTheme.medicarePrimary,
                  size: 20,
                ),
              ],
            ),
          ),
          FxSpacing.height(24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildCategoryList(),
            ),
          ),
          FxSpacing.height(16),
          Column(
            children: _buildDoctorList(),
          ),
        ],
      ),
    );
  }
}
