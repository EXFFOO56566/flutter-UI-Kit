import 'package:flutkit/screens/auth/forgot_password1_screen.dart';
import 'package:flutkit/screens/auth/forgot_password2_screen.dart';
import 'package:flutkit/screens/auth/login1_screen.dart';
import 'package:flutkit/screens/auth/login2_screen.dart';
import 'package:flutkit/screens/auth/login_register_screen.dart';
import 'package:flutkit/screens/auth/otp_verification_screen.dart';
import 'package:flutkit/screens/auth/register1_screen.dart';
import 'package:flutkit/screens/auth/register2_screen.dart';
import 'package:flutkit/screens/chat/chat_facebook_page.dart';
import 'package:flutkit/screens/chat/chat_home_screen.dart';
import 'package:flutkit/screens/chat/chat_whatsapp_page.dart';
import 'package:flutkit/screens/course/course_full_app.dart';
import 'package:flutkit/screens/dashboard/lms_dashboard_screen.dart';
import 'package:flutkit/screens/dashboard/seller_dashboard_screen.dart';
import 'package:flutkit/screens/event/event_full_app.dart';
import 'package:flutkit/screens/food/food_on_boarding_screen.dart';
import 'package:flutkit/screens/handyman/handyman_full_app.dart';
import 'package:flutkit/screens/health/health_full_app.dart';
import 'package:flutkit/screens/hotel/hotel_login_screen.dart';
import 'package:flutkit/screens/hotel/hotel_onboarding_screen.dart';
import 'package:flutkit/screens/hotel/hotel_password_screen.dart';
import 'package:flutkit/screens/hotel/hotel_profile_screen.dart';
import 'package:flutkit/screens/hotel/hotel_register_screen.dart';
import 'package:flutkit/screens/mail/mail_home_screen.dart';
import 'package:flutkit/screens/music/music_login_screen.dart';
import 'package:flutkit/screens/music/music_onboarding_screen.dart';
import 'package:flutkit/screens/music/music_password_screen.dart';
import 'package:flutkit/screens/music/music_register_screen.dart';
import 'package:flutkit/screens/news/news_categery_screen.dart';
import 'package:flutkit/screens/other/about_app_screen.dart';
import 'package:flutkit/screens/other/empty_cart_screen.dart';
import 'package:flutkit/screens/other/faq_question_screen.dart';
import 'package:flutkit/screens/other/maintenance_screen.dart';
import 'package:flutkit/screens/other/no_internet_screen.dart';
import 'package:flutkit/screens/other/page_not_found_screen.dart';
import 'package:flutkit/screens/other/product_sold_out_screen.dart';
import 'package:flutkit/screens/other/terms_screen.dart';
import 'package:flutkit/screens/profile/company_profile_screen.dart';
import 'package:flutkit/screens/profile/edit_profile_screen.dart';
import 'package:flutkit/screens/profile/profile_screen.dart';
import 'package:flutkit/screens/quiz/quiz_customize_screen.dart';
import 'package:flutkit/screens/quiz/quiz_question_type1_screen.dart';
import 'package:flutkit/screens/quiz/quiz_question_type2_screen.dart';
import 'package:flutkit/screens/setting/account_setting_screen.dart';
import 'package:flutkit/screens/setting/basic_setting_screen.dart';
import 'package:flutkit/screens/setting/notification_setting_screen.dart';
import 'package:flutkit/screens/setting/privacy_security_setting_screen.dart';
import 'package:flutkit/screens/shopping/shopping_login_screen.dart';
import 'package:flutkit/screens/shopping/shopping_onboarding_screen.dart';
import 'package:flutkit/screens/shopping/shopping_password_screen.dart';
import 'package:flutkit/screens/shopping/shopping_profile_screen.dart';
import 'package:flutkit/screens/shopping/shopping_register_screen.dart';
import 'package:flutkit/screens/social/social_full_app.dart';
import 'package:flutkit/screens/wallet/wallet_crypto_screen.dart';
import 'package:flutkit/screens/wallet/wallet_home_screen.dart';
import 'package:flutkit/screens/wallet/wallet_payment_screen.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:provider/provider.dart';

import '../theme/app_notifier.dart';
import 'single_grid_item.dart';

class ScreensHome extends StatefulWidget {
  @override
  _ScreensHomeState createState() => _ScreensHomeState();
}

class _ScreensHomeState extends State<ScreensHome> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return Container(
            padding: FxSpacing.fromLTRB(20, 0, 20, 20),
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                FxText.titleSmall(
                  "APPS",
                  fontWeight: 700,
                  muted: true,
                ),
                GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    padding: FxSpacing.top(20),
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    children: <Widget>[
                      SinglePageItem(
                        title: "Shopping",
                        icon: './assets/icons/shop-outline.png',
                        navigation: ShoppingOnboardingScreen(),
                      ),
                      SinglePageItem(
                        icon: './assets/icons/health-outline.png',
                        title: "Health",
                        navigation: HealthFullApp(),
                      ),
                      SinglePageItem(
                        title: "Food",
                        icon: './assets/icons/food-outline.png',
                        navigation: FoodOnboardingScreen(),
                      ),
                      SinglePageItem(
                        title: "Hotel",
                        icon: './assets/icons/hotel-outline.png',
                        navigation: HotelOnboardingScreen(),
                      ),
                      SinglePageItem(
                        icon: './assets/icons/course-outline.png',
                        title: "Course",
                        navigation: CourseFullApp(),
                      ),
                      SinglePageItem(
                        icon: './assets/icons/instagram-outline.png',
                        title: "Social",
                        navigation: SocialFullApp(),
                      ),
                      SinglePageItem(
                        title: "Event",
                        icon: './assets/icons/ticket-outline.png',
                        navigation: EventFullApp(),
                      ),
                      SinglePageItem(
                        title: "Music",
                        icon: './assets/icons/music-outline.png',
                        navigation: MusicOnboardingScreen(),
                      ),
                      SinglePageItem(
                        title: "Chat",
                        icon: './assets/icons/chat-outline.png',
                        navigation: ChatHomeScreen(),
                      ),
                      SinglePageItem(
                        icon: './assets/icons/worker.png',
                        title: "Handyman",
                        navigation: HandymanFullApp(),
                      ),
                      SinglePageItem(
                        icon: './assets/icons/newspaper-outline.png',
                        title: "News",
                        navigation: NewsCategoryScreen(),
                      ),
                    ]),
                FxSpacing.height(20),
                FxText.titleSmall(
                  "PAGES",
                  fontWeight: 700,
                  muted: true,
                ),
                GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    padding: FxSpacing.top(20),
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    children: <Widget>[
                      SingleGridItem(
                        title: "Quiz",
                        icon: './assets/icons/quiz-outline.png',
                        isComingSoon: true,
                        comingSoonText: "Quiz app is coming soon",
                        items: [
                          SinglePageItem(
                            icon: './assets/icons/quiz-outline.png',
                            title: "Customize",
                            navigation: QuizCustomizeScreen(),
                          ),
                          SinglePageItem(
                            icon: './assets/icons/quiz-outline.png',
                            title: "Question 1",
                            navigation: QuizQuestionType1Screen(),
                          ),
                          SinglePageItem(
                            icon: './assets/icons/quiz-outline.png',
                            title: "Question 2",
                            navigation: QuizQuestionType2Screen(),
                          ),
                        ],
                      ),
                      SinglePageItem(
                        title: "Mail",
                        icon: './assets/icons/email-outline.png',
                        navigation: MailHomeScreen(),
                      ),
                      SingleGridItem(
                        title: "Authentication",
                        icon: './assets/icons/auth-outline.png',
                        items: <SinglePageItem>[
                          SinglePageItem(
                            title: "Login 1",
                            navigation: ShoppingLoginScreen(),
                            icon: './assets/icons/auth-outline.png',
                          ),
                          SinglePageItem(
                            title: "Login 2",
                            icon: './assets/icons/auth-outline.png',
                            navigation: HotelLoginScreen(),
                          ),
                          SinglePageItem(
                            title: "Login 3",
                            icon: './assets/icons/auth-outline.png',
                            navigation: MusicLoginScreen(),
                          ),
                          SinglePageItem(
                            title: "Login 4",
                            icon: './assets/icons/auth-outline.png',
                            navigation: Login1Screen(),
                          ),
                          SinglePageItem(
                            title: "Login 5",
                            icon: './assets/icons/auth-outline.png',
                            navigation: Login2Screen(),
                          ),
                          SinglePageItem(
                            title: "Register 1",
                            icon: './assets/icons/auth-outline.png',
                            navigation: ShoppingRegisterScreen(),
                          ),
                          SinglePageItem(
                            title: "Register 2",
                            icon: './assets/icons/auth-outline.png',
                            navigation: HotelRegisterScreen(),
                          ),
                          SinglePageItem(
                            title: "Register 3",
                            icon: './assets/icons/auth-outline.png',
                            navigation: MusicRegisterScreen(),
                          ),
                          SinglePageItem(
                            title: "Register 4",
                            icon: './assets/icons/auth-outline.png',
                            navigation: Register1Screen(),
                          ),
                          SinglePageItem(
                            title: "Register 5",
                            icon: './assets/icons/auth-outline.png',
                            navigation: Register2Screen(),
                          ),
                          SinglePageItem(
                            title: "Reset Password 1",
                            icon: './assets/icons/auth-outline.png',
                            navigation: ShoppingPasswordScreen(),
                          ),
                          SinglePageItem(
                            title: "Reset Password 2",
                            icon: './assets/icons/auth-outline.png',
                            navigation: HotelPasswordScreen(),
                          ),
                          SinglePageItem(
                            title: "Reset Password 3",
                            icon: './assets/icons/auth-outline.png',
                            navigation: MusicPasswordScreen(),
                          ),
                          SinglePageItem(
                            title: "Reset Password 4",
                            icon: './assets/icons/auth-outline.png',
                            navigation: ForgotPassword1Screen(),
                          ),
                          SinglePageItem(
                            title: "Reset Password 5",
                            icon: './assets/icons/auth-outline.png',
                            navigation: ForgotPassword2Screen(),
                          ),
                          SinglePageItem(
                            title: "Login \& Register",
                            icon: './assets/icons/auth-outline.png',
                            navigation: LoginRegisterScreen(),
                          ),
                          SinglePageItem(
                            title: "OTP Verification",
                            icon: './assets/icons/auth-outline.png',
                            navigation: OTPVerificationScreen(),
                          ),
                        ],
                      ),
                      SingleGridItem(
                        title: "Settings",
                        icon: './assets/icons/setting-outline.png',
                        items: <SinglePageItem>[
                          SinglePageItem(
                            title: "Basic",
                            icon: './assets/icons/setting-outline.png',
                            navigation: BasicSettingScreen(),
                          ),
                          SinglePageItem(
                            title: "Account",
                            icon: './assets/icons/setting-outline.png',
                            navigation: AccountSettingScreen(),
                          ),
                          SinglePageItem(
                            title: "Notification",
                            icon: './assets/icons/setting-outline.png',
                            navigation: NotificationSettingScreen(),
                          ),
                          SinglePageItem(
                            title: "Privacy",
                            icon: './assets/icons/setting-outline.png',
                            navigation: PrivacySecuritySettingScreen(),
                          ),
                        ],
                      ),
                      SingleGridItem(
                        title: "Profile",
                        icon: './assets/icons/profile-outline.png',
                        items: <SinglePageItem>[
                          SinglePageItem(
                            title: "Social",
                            icon: './assets/icons/profile-outline.png',
                            navigation: ProfileScreen(),
                          ),
                          SinglePageItem(
                            title: "Company",
                            icon: './assets/icons/profile-outline.png',
                            navigation: CompanyProfileScreen(),
                          ),
                          SinglePageItem(
                            title: "Shopping",
                            icon: './assets/icons/profile-outline.png',
                            navigation: ShoppingProfileScreen(),
                          ),
                          SinglePageItem(
                            title: "Hotel",
                            icon: './assets/icons/profile-outline.png',
                            navigation: HotelProfileScreen(),
                          ),
                          SinglePageItem(
                            title: "Edit",
                            icon: './assets/icons/profile-outline.png',
                            navigation: EditProfileScreen(),
                          ),
                        ],
                      ),
                      SingleGridItem(
                        title: "Dashboard",
                        icon: './assets/icons/dashboard-outline.png',
                        items: <SinglePageItem>[
                          SinglePageItem(
                            title: "LMS",
                            icon: './assets/icons/dashboard-outline.png',
                            navigation: LMSDashboardScreen(),
                          ),
                          SinglePageItem(
                            title: "Seller",
                            icon: './assets/icons/dashboard-outline.png',
                            navigation: SellerDashboardScreen(),
                          ),
                        ],
                      ),
                      SingleGridItem(
                        title: "Wallet",
                        icon: './assets/icons/wallet-outline.png',
                        items: <SinglePageItem>[
                          SinglePageItem(
                            title: "Home",
                            icon: './assets/icons/wallet-outline.png',
                            navigation: WalletHomeScreen(),
                          ),
                          SinglePageItem(
                            title: "Payment",
                            icon: './assets/icons/wallet-outline.png',
                            navigation: WalletPaymentScreen(),
                          ),
                          SinglePageItem(
                            title: "Crypto",
                            icon: './assets/icons/wallet-outline.png',
                            navigation: WalletCryptoScreen(),
                          ),
                        ],
                      ),
                      SingleGridItem(
                        title: "Other",
                        icon: './assets/icons/tablet-landscape-outline.png',
                        items: <SinglePageItem>[
                          SinglePageItem(
                            title: "Whatsapp",
                            icon: './assets/icons/chat-outline.png',
                            navigation: ChatWhatsAppPage(),
                          ),
                          SinglePageItem(
                            title: "Facebook",
                            icon: './assets/icons/chat-outline.png',
                            navigation: ChatFacebookScreen(),
                          ),
                          SinglePageItem(
                            title: "About App",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: AboutAppScreen(),
                          ),
                          SinglePageItem(
                            title: "Empty cart",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: EmptyCartScreen(),
                          ),
                          SinglePageItem(
                            title: "FAQ",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: FAQQuestionScreen(),
                          ),
                          SinglePageItem(
                            title: "Maintenance",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: MaintenanceScreen(),
                          ),
                          SinglePageItem(
                            title: "No internet",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: NoInternetScreen(),
                          ),
                          SinglePageItem(
                            title: "Page not found",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: PageNotFoundScreen(),
                          ),
                          SinglePageItem(
                            title: "Sold out",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: ProductSoldOutScreen(),
                          ),
                          SinglePageItem(
                            title: "Terms",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: TermsScreen(),
                          ),
                        ],
                      ),
                    ]),
                FxContainer(
                  margin: FxSpacing.top(20),
                  borderRadiusAll: 4,
                  color: theme.colorScheme.primary.withAlpha(24),
                  child: Center(
                    child: FxText.bodyMedium("More Apps are coming soon...",
                        fontWeight: 600, color: theme.colorScheme.primary),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
