import 'package:flutkit/theme/app_theme.dart';
import 'package:flutx/flutx.dart';
import 'appointment_screen.dart';
import 'models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'single_chat_screen.dart';
import 'models/doctor.dart';

class MediCareSingleDoctorScreen extends StatefulWidget {
  final Doctor doctor;

  const MediCareSingleDoctorScreen(this.doctor);

  @override
  _MediCareSingleDoctorScreenState createState() =>
      _MediCareSingleDoctorScreenState();
}

class _MediCareSingleDoctorScreenState
    extends State<MediCareSingleDoctorScreen> {
  late Doctor doctor;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    doctor = widget.doctor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: FxSpacing.fromLTRB(24, 44, 24, 24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: FxContainer(
                  child: Icon(
                    Icons.chevron_left,
                    color: theme.colorScheme.onBackground.withAlpha(160),
                    size: 24,
                  ),
                  paddingAll: 4,
                  borderRadiusAll: 8,
                ),
              ),
              FxContainer.rounded(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MediCareSingleChatScreen(
                        Chat(doctor.image, doctor.name, '', '', '', false),
                      ),
                    ),
                  );
                },
                child: Icon(
                  FeatherIcons.messageCircle,
                  color: theme.colorScheme.onBackground.withAlpha(160),
                  size: 20,
                ),
                paddingAll: 8,
              ),
            ],
          ),
          FxSpacing.height(32),
          Row(
            children: [
              FxContainer(
                paddingAll: 0,
                borderRadiusAll: 16,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Image(
                    fit: BoxFit.cover,
                    height: 160,
                    width: 120,
                    image: AssetImage(doctor.image),
                  ),
                ),
              ),
              FxSpacing.width(24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.bodyLarge(
                      doctor.name,
                      fontWeight: 700,
                      fontSize: 18,
                    ),
                    FxSpacing.height(8),
                    FxText.bodyMedium(
                      doctor.category,
                      color: theme.colorScheme.onBackground,
                      xMuted: true,
                    ),
                    FxSpacing.height(12),
                    Row(
                      children: [
                        FxContainer(
                          child: Icon(
                            Icons.star_rounded,
                            color: AppTheme.customTheme.colorWarning,
                          ),
                          paddingAll: 8,
                        ),
                        FxSpacing.width(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.bodySmall(
                              'Rating',
                              color: theme.colorScheme.onBackground,
                              xMuted: true,
                            ),
                            FxSpacing.height(2),
                            FxText.bodySmall(
                              doctor.ratings.toString() + ' out of 5',
                              color: theme.colorScheme.onBackground,
                              fontWeight: 700,
                            ),
                          ],
                        ),
                      ],
                    ),
                    FxSpacing.height(8),
                    Row(
                      children: [
                        FxContainer(
                          child: Icon(
                            Icons.group,
                            color: CustomTheme.blue,
                          ),
                          paddingAll: 8,
                        ),
                        FxSpacing.width(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.bodySmall(
                              'Patients',
                              color: theme.colorScheme.onBackground,
                              xMuted: true,
                            ),
                            FxSpacing.height(2),
                            FxText.bodySmall(
                              doctor.patients.toString() + '+',
                              color: theme.colorScheme.onBackground,
                              fontWeight: 700,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          FxSpacing.height(32),
          FxContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.bodyLarge(
                  'Biography',
                  fontWeight: 600,
                ),
                FxSpacing.height(16),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: doctor.biography,
                        style: FxTextStyle.bodySmall(
                          color: theme.colorScheme.onBackground,
                          xMuted: true,
                          height: 1.5,
                        )),
                    TextSpan(
                      text: " Read more",
                      style: FxTextStyle.bodySmall(
                        color: CustomTheme.blue,
                      ),
                    ),
                  ]),
                ),
                FxSpacing.height(24),
                FxText.bodyLarge(
                  'Location',
                  fontWeight: 600,
                ),
                FxSpacing.height(16),
                FxContainer(
                  paddingAll: 0,
                  borderRadiusAll: 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Image(
                      fit: BoxFit.cover,
                      height: 140,
                      width: MediaQuery.of(context).size.width - 96,
                      image: AssetImage('assets/other/map-md-snap.png'),
                    ),
                  ),
                ),
              ],
            ),
            paddingAll: 24,
            borderRadiusAll: 16,
          ),
          FxSpacing.height(32),
          FxButton.block(
            elevation: 0,
            borderRadiusAll: 8,
            backgroundColor: AppTheme.customTheme.medicarePrimary,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                  builder: (context) => MediCareAppointmentScreen()));
            },
            child: FxText.bodyLarge(
              'Make Appointment',
              color: AppTheme.customTheme.medicareOnPrimary,
              fontWeight: 600,
            ),
          ),
        ],
      ),
    );
  }
}
