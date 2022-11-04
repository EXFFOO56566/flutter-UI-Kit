import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/localizations/language.dart';
import 'package:flutkit/theme/app_theme.dart';

import 'package:flutkit/images.dart';
import '../controllers/checkout_controller.dart';
import '../models/shipping_address.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  late ThemeData theme;

  late CheckOutController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;

    controller = FxControllerStore.put(CheckOutController());
  }

  Widget buildTabs() {
    List<Widget> tabs = [];

    for (int i = 0; i < controller.tabs.length; i++) {
      bool selected = controller.currentPage == i;
      tabs.add(Expanded(
        flex: selected ? 4 : 3,
        child: FxContainer(
          onTap: () {
            controller.onPageChanged(i, fromUser: true);
          },
          color: selected ? theme.colorScheme.primary : theme.cardTheme.color,
          paddingAll: 12,
          borderRadiusAll: 0,
          child: Column(
            children: [
              Icon(
                controller.tabs[i].iconData,
                size: 20,
                color: selected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onBackground,
              ),
              FxText.bodySmall(
                controller.tabs[i].name,
                fontWeight: 600,
                color: selected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onBackground,
              ),
            ],
          ),
        ),
      ));
    }

    return Row(
      children: tabs,
    );
  }

  Widget _buildSingleShippingAddress(ShippingAddress shippingAddress) {
    bool selected = controller.addressSelected == shippingAddress;
    return FxContainer.bordered(
      onTap: () {
        controller.selectShippingAddress(shippingAddress);
      },
      borderRadiusAll: 4,
      margin: FxSpacing.bottom(20),
      border: Border.all(
          color: selected
              ? theme.colorScheme.primary
              : theme.colorScheme.onBackground),
      color: selected
          ? theme.colorScheme.primary.withAlpha(40)
          : theme.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                shippingAddress.icon,
                size: 20,
                color: theme.colorScheme.onBackground.withAlpha(220),
              ),
              FxSpacing.width(12),
              FxText.bodyMedium(
                shippingAddress.type,
                fontWeight: 700,
              ),
              FxSpacing.width(12),
              shippingAddress.isDefault
                  ? FxContainer(
                      borderRadiusAll: 4,
                      padding: FxSpacing.xy(8, 4),
                      color: theme.colorScheme.primary,
                      child: FxText.bodySmall(
                        'Default',
                        color: theme.colorScheme.onPrimary,
                        fontSize: 11,
                      ),
                    )
                  : Container(),
              selected
                  ? Expanded(
                      child: Align(
                        alignment: Language.autoDirection<AlignmentGeometry>(
                            Alignment.centerRight, Alignment.centerLeft)!,
                        child: FxContainer.roundBordered(
                          paddingAll: 4,
                          border: Border.all(color: theme.colorScheme.primary),
                          color: theme.colorScheme.primary.withAlpha(40),
                          child: Icon(
                            Icons.check,
                            color: theme.colorScheme.primary,
                            size: 10,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
          FxSpacing.height(8),
          FxText.bodySmall(
            shippingAddress.name,
            fontWeight: 600,
          ),
          FxSpacing.height(4),
          FxText.bodySmall(
            shippingAddress.number,
            fontWeight: 600,
          ),
          FxSpacing.height(8),
          FxText.bodySmall(
            shippingAddress.address,
            muted: true,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<CheckOutController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: FxText.titleMedium(
                'Checkout',
                fontWeight: 600,
              ),
              leading: InkWell(
                onTap: () {
                  controller.goBack();
                },
                child: Icon(
                  FeatherIcons.chevronLeft,
                  size: 20,
                ),
              ),
            ),
            body: Column(
              children: [
                FxSpacing.height(8),
                FxContainer(
                  margin: FxSpacing.x(20),
                  paddingAll: 0,
                  color: Colors.transparent,
                  borderRadiusAll: 4,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: buildTabs(),
                ),
                FxSpacing.height(20),
                Expanded(
                  child: PageView(
                    allowImplicitScrolling: true,
                    pageSnapping: true,
                    physics: ClampingScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: (int page) {
                      controller.onPageChanged(page);
                    },
                    children: [shippingInfo(), paymentInfo(), placedInfo()],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget shippingInfo() {
    return Container(
      padding: FxSpacing.x(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FxText.labelLarge(
          'Select delivery address',
          fontWeight: 600,
        ),
        FxSpacing.height(20),
        ...controller.addressList!
            .map((shippingAddress) =>
                _buildSingleShippingAddress(shippingAddress))
            .toList(),
        Row(
          children: [
            FxButton(
              padding: FxSpacing.xy(16, 12),
              onPressed: () {},
              borderRadiusAll: 4,
              elevation: 0,
              splashColor: theme.colorScheme.primary.withAlpha(30),
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FeatherIcons.plus,
                    color: theme.colorScheme.primary,
                    size: 18,
                  ),
                  FxSpacing.width(8),
                  FxText.labelMedium(
                    'Shipping Address',
                    color: theme.colorScheme.primary,
                    fontWeight: 600,
                  ),
                ],
              ),
            ),
            FxSpacing.width(20),
            Expanded(
              child: FxButton(
                padding: FxSpacing.y(12),
                onPressed: () {
                  controller.nextPage();
                },
                borderRadiusAll: 4,
                elevation: 0,
                splashColor: theme.colorScheme.onPrimary.withAlpha(30),
                backgroundColor: theme.colorScheme.primary,
                child: FxText.labelMedium(
                  'Proceed to Payment',
                  color: theme.colorScheme.onPrimary,
                  fontWeight: 600,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget paymentInfo() {
    return Container(
      padding: FxSpacing.x(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText.labelLarge(
            'Select payment method',
            fontWeight: 600,
          ),
          FxSpacing.height(20),
          FxContainer.bordered(
            onTap: () {
              controller.selectPaymentMethod(1);
            },
            borderRadiusAll: 4,
            margin: FxSpacing.bottom(20),
            border: Border.all(
                color: controller.paymentMethodSelected == 1
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onBackground),
            color: controller.paymentMethodSelected == 1
                ? theme.colorScheme.primary.withAlpha(40)
                : theme.scaffoldBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      FeatherIcons.creditCard,
                      size: 20,
                      color: theme.colorScheme.onBackground.withAlpha(220),
                    ),
                    FxSpacing.width(8),
                    FxText.bodyMedium(
                      'Credit Card',
                      fontWeight: 700,
                    ),
                    controller.paymentMethodSelected == 1
                        ? Expanded(
                            child: Align(
                              alignment:
                                  Language.autoDirection<AlignmentGeometry>(
                                      Alignment.centerRight,
                                      Alignment.centerLeft)!,
                              child: FxContainer.roundBordered(
                                paddingAll: 4,
                                border: Border.all(
                                    color: theme.colorScheme.primary),
                                color: theme.colorScheme.primary.withAlpha(40),
                                child: Icon(
                                  Icons.check,
                                  color: theme.colorScheme.primary,
                                  size: 10,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                FxSpacing.height(8),
                FxText.bodySmall(
                  'Nency AnGhan',
                  fontWeight: 600,
                ),
                FxSpacing.height(4),
                FxText.bodySmall(
                  '**** **** **** 7865',
                  fontWeight: 600,
                ),
                FxSpacing.height(4),
                FxText.bodySmall(
                  'Expiry: 06/25',
                  fontWeight: 600,
                ),
                FxSpacing.height(20),
                FxText.bodySmall(
                  'Secure checkout powered by OnePay',
                  muted: true,
                ),
              ],
            ),
          ),
          FxContainer.bordered(
            onTap: () {
              controller.selectPaymentMethod(2);
            },
            borderRadiusAll: 4,
            margin: FxSpacing.bottom(20),
            border: Border.all(
                color: controller.paymentMethodSelected == 2
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onBackground),
            color: controller.paymentMethodSelected == 2
                ? theme.colorScheme.primary.withAlpha(40)
                : theme.scaffoldBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      FeatherIcons.dollarSign,
                      size: 18,
                      color: theme.colorScheme.onBackground.withAlpha(220),
                    ),
                    FxSpacing.width(8),
                    FxText.bodyMedium(
                      'Cash on delivery',
                      fontWeight: 700,
                    ),
                    controller.paymentMethodSelected == 2
                        ? Expanded(
                            child: Align(
                              alignment:
                                  Language.autoDirection<AlignmentGeometry>(
                                      Alignment.centerRight,
                                      Alignment.centerLeft)!,
                              child: FxContainer.roundBordered(
                                paddingAll: 4,
                                border: Border.all(
                                    color: theme.colorScheme.primary),
                                color: theme.colorScheme.primary.withAlpha(40),
                                child: Icon(
                                  Icons.check,
                                  color: theme.colorScheme.primary,
                                  size: 10,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                FxSpacing.height(8),
                FxText.bodySmall(
                  'Additional \$ 20 charges for COD services.',
                  muted: true,
                ),
              ],
            ),
          ),
          FxText.labelLarge(
            'Do you have promo code?',
            fontWeight: 700,
          ),
          FxSpacing.height(20),
          FxContainer(
            paddingAll: 12,
            borderRadiusAll: 4,
            child: Row(
              children: [
                Icon(
                  FeatherIcons.creditCard,
                  size: 18,
                  color: theme.colorScheme.primary,
                ),
                FxSpacing.width(16),
                Expanded(
                    child: FxText.labelLarge(
                  'Black Friday Promo',
                  fontWeight: 600,
                )),
                FxSpacing.width(16),
                FxContainer(
                  borderRadiusAll: 2,
                  padding: FxSpacing.xy(8, 4),
                  color: theme.colorScheme.primary.withAlpha(40),
                  child: FxText.bodySmall(
                    'BLCK20',
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          FxSpacing.height(20),
          FxContainer(
            paddingAll: 12,
            borderRadiusAll: 4,
            child: Row(
              children: [
                Icon(
                  FeatherIcons.creditCard,
                  size: 18,
                  color: theme.colorScheme.primary,
                ),
                FxSpacing.width(16),
                Expanded(
                    child: FxText.labelLarge(
                  'Cyber Week Deal',
                  fontWeight: 600,
                )),
                FxSpacing.width(16),
                FxContainer(
                  borderRadiusAll: 2,
                  padding: FxSpacing.xy(8, 4),
                  color: theme.colorScheme.primary.withAlpha(40),
                  child: FxText.bodySmall(
                    'CYBR00',
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          FxSpacing.height(20),
          FxButton.block(
            onPressed: () {
              controller.nextPage();
            },
            borderRadiusAll: 4,
            elevation: 0,
            splashColor: theme.colorScheme.onPrimary.withAlpha(30),
            backgroundColor: theme.colorScheme.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.bodyMedium(
                  'Place Order',
                  fontWeight: 600,
                  color: theme.colorScheme.onPrimary,
                ),
                FxText.bodyMedium(
                  '\$ 251.55',
                  fontWeight: 700,
                  color: theme.colorScheme.onPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget placedInfo() {
    return Padding(
      padding: FxSpacing.x(20),
      child: Column(
        children: [
          Container(
              margin: FxSpacing.all(20),
              child: Image(
                image: AssetImage(Images.shoppingOrderSuccess),
              )),
          FxSpacing.height(20),
          FxText.titleLarge(
            'Order Success',
            fontWeight: 700,
          ),
          FxSpacing.height(8),
          FxText.labelLarge(
            'Your packet will be sent to your \naddress, thanks for order',
            textAlign: TextAlign.center,
            xMuted: true,
          ),
          FxSpacing.height(24),
          FxButton.block(
            onPressed: () {
              controller.goBack();
            },
            borderRadiusAll: 4,
            elevation: 0,
            splashColor: theme.colorScheme.onPrimary.withAlpha(30),
            backgroundColor: theme.colorScheme.primary,
            child: FxText.labelLarge(
              'Back To Home',
              color: theme.colorScheme.onPrimary,
              fontWeight: 600,
            ),
          ),
        ],
      ),
    );
  }
}
