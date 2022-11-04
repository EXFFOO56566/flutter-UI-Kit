import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../theme/app_theme.dart';
import 'checkout_screen.dart';
import 'coupon_screen.dart';
import 'models/cart.dart';

class GroceryCartScreen extends StatefulWidget {
  final BuildContext rootContext;

  const GroceryCartScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _GroceryCartScreenState createState() => _GroceryCartScreenState();
}

class _GroceryCartScreenState extends State<GroceryCartScreen>
    with SingleTickerProviderStateMixin {
  late List<Cart> carts;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    carts = Cart.getList();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: FxText.titleMedium("Cart", fontWeight: 600),
        ),
        body: ListView(
          padding: FxSpacing.fromLTRB(24, 8, 24, 70),
          children: <Widget>[
            Column(
              children: buildCarts(),
            ),
            FxSpacing.height(16),
            FxContainer(
              color: customTheme.card,
              padding: FxSpacing.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: FxTextField(
                      hintText: "Promo Code",
                      hintStyle: FxTextStyle.bodyMedium(),
                      labelStyle: FxTextStyle.bodyMedium(),
                      style: FxTextStyle.bodyMedium(),
                      labelText: "Promo Code",
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: FxSpacing.right(16),
                      focusedBorderColor: Colors.transparent,
                      cursorColor: customTheme.groceryPrimary,
                      prefixIcon: Icon(
                        MdiIcons.ticketPercentOutline,
                        size: 22,
                        color: theme.colorScheme.onBackground.withAlpha(150),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  FxButton.medium(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroceryCouponScreen()));
                    },
                    child: FxText.labelMedium("Find",
                        letterSpacing: 0.5,
                        fontWeight: 600,
                        color: customTheme.groceryOnPrimary),
                    backgroundColor: customTheme.groceryPrimary,
                    borderRadiusAll: 4,
                    padding: FxSpacing.xy(32, 12),
                    elevation: 0,
                  ),
                ],
              ),
            ),
            FxSpacing.height(16),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodyMedium("Subtotal", fontWeight: 600),
                    FxText.bodyMedium("\$86.50",
                        letterSpacing: 0.25, fontWeight: 600),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodyMedium("Delivery", fontWeight: 600),
                    FxText.bodyMedium("\$18.50",
                        letterSpacing: 0.25, fontWeight: 600),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodyMedium("Tax & Fee", fontWeight: 600),
                    FxText.bodyMedium("\$9.99",
                        letterSpacing: 0.25, fontWeight: 600),
                  ],
                ),
                FxSpacing.height(12),
                FxDashedDivider(
                  dashSpace: 6,
                  height: 1.2,
                  dashWidth: 8,
                  color: theme.colorScheme.onBackground,
                ),
                FxSpacing.height(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodyLarge("Total", fontWeight: 700),
                    FxText.bodyLarge("\$99.50",
                        letterSpacing: 0.25, fontWeight: 700),
                  ],
                ),
              ],
            ),
            FxSpacing.height(24),
            Center(
              child: FxButton.medium(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroceryCheckoutScreen()));
                },
                child: FxText.labelMedium(
                  "CHECKOUT",
                  letterSpacing: 0.5,
                  fontWeight: 600,
                  color: customTheme.groceryOnPrimary,
                ),
                backgroundColor: customTheme.groceryPrimary,
                borderRadiusAll: 4,
                padding: FxSpacing.xy(32, 12),
                elevation: 0,
              ),
            )
          ],
        ));
  }

  List<Widget> buildCarts() {
    List<Widget> list = [];

    for (int i = 0; i < carts.length; i++) {
      list.add(SingleCartWidget(context, carts[i]));
      if (i + 1 < carts.length) list.add(FxSpacing.height(16));
    }

    return list;
  }
}

class SingleCartWidget extends StatefulWidget {
  final BuildContext rootContext;
  final Cart cart;

  const SingleCartWidget(this.rootContext, this.cart);

  @override
  _SingleCartWidgetState createState() => _SingleCartWidgetState();
}

class _SingleCartWidgetState extends State<SingleCartWidget> {
  late int quantity;
  late BuildContext rootContext;

  String? heroKey;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    quantity = widget.cart.quantity;
    rootContext = widget.rootContext;
    heroKey = FxTextUtils.randomString(10);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        background: Container(
          color: customTheme.card,
        ),
        secondaryBackground: Container(
          decoration: BoxDecoration(
              color: customTheme.cardDark,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: FxSpacing.horizontal(20),
          alignment: AlignmentDirectional.centerEnd,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: FxSpacing.right(8),
                padding: FxSpacing.all(16),
                decoration: BoxDecoration(
                    color: CustomTheme.red.withAlpha(40),
                    shape: BoxShape.circle),
                child: Icon(
                  FeatherIcons.trash,
                  size: 22,
                  color: CustomTheme.red,
                ),
              ),
            ],
          ),
        ),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            setState(() {
              //TODO: perform delete operation
            });
          }
        },
        child: FxContainer(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxContainer(
                color: customTheme.groceryPrimary.withAlpha(32),
                padding: FxSpacing.all(8),
                child: Hero(
                  tag: heroKey!,
                  child: ClipRRect(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.cart.image,
                      width: 72,
                      height: 72,
                    ),
                  ),
                ),
              ),
              FxSpacing.width(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.bodyLarge(widget.cart.name, fontWeight: 600),
                    FxSpacing.height(8),
                    widget.cart.discountedPrice != widget.cart.price
                        ? Row(
                            children: [
                              FxText.bodySmall(
                                  "\$" +
                                      FxTextUtils.doubleToString(
                                          widget.cart.price),
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: 500),
                              // Space.width(8),
                              FxSpacing.width(8),
                              FxText.bodyMedium(
                                  "\$" +
                                      FxTextUtils.doubleToString(
                                          widget.cart.discountedPrice),
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 700),
                            ],
                          )
                        : FxText.bodyMedium(
                            "\$" +
                                FxTextUtils.doubleToString(widget.cart.price),
                            color: theme.colorScheme.onBackground,
                            fontWeight: 700),
                    FxSpacing.height(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FxContainer(
                          onTap: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                          paddingAll: 8,
                          borderRadiusAll: 4,
                          color: customTheme.groceryPrimary.withAlpha(48),
                          child: Icon(
                            MdiIcons.minus,
                            size: 14,
                            color: customTheme.groceryPrimary,
                          ),
                        ),
                        FxSpacing.width(12),
                        FxText.bodyLarge(quantity.toString(), fontWeight: 600),
                        FxSpacing.width(12),
                        FxContainer(
                          padding: FxSpacing.all(8),
                          borderRadiusAll: 4,
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          color: customTheme.groceryPrimary,
                          child: Icon(
                            MdiIcons.plus,
                            size: 14,
                            color: customTheme.groceryOnPrimary,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
