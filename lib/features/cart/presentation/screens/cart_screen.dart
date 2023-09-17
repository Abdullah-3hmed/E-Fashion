import 'package:auto_route/annotations.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/util/assets_manager.dart';
import 'package:flutter_ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce/core/widgets/primary_button.dart';
import 'package:flutter_ecommerce/features/cart/component/cart_screen_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isBottomSheetShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          const Expanded(
            child: CartScreenBody(),
          ),
          PrimaryButton(
            buttonTitle: "Checkout",
            onTap: () {
              setState(() {
                _isBottomSheetShown = true;
              });
              _scaffoldKey.currentState!
                  .showBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0),
                    )),
                    (context) => buildBottomSheet(),
                  )
                  .closed
                  .then(
                    (_) => setState(
                      () => _isBottomSheetShown = false,
                    ),
                  );
            },
          ),
          SizedBox(
            height: 100.h,
          ),
        ],
      ),
    );
  }

  Widget buildBottomSheet() => FractionallySizedBox(
        heightFactor: .85,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0).r,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    "Checkout",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        _isBottomSheetShown = false;
                      });
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage(AssetsManager.payment1),
                  ),
                  Image(
                    image: AssetImage(AssetsManager.payment2),
                  ),
                  Image(
                    image: AssetImage(AssetsManager.payment3),
                  ),
                  Image(
                    image: AssetImage(AssetsManager.payment4),
                  ),
                  Image(
                    image: AssetImage(AssetsManager.payment5),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextFormField(
                type: TextInputType.text,
                hintText: "Payment Method",
                enableBorderColor: Theme.of(context).colorScheme.outlineVariant,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextFormField(
                prefixIcon: Iconsax.location,
                type: TextInputType.text,
                hintText: "Delivery location",
                suffixIcon: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Edit",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                enableBorderColor: Theme.of(context).colorScheme.outlineVariant,
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                color: Theme.of(context).colorScheme.outlineVariant.withOpacity(.25),
                child: CustomTextFormField(
                  type: TextInputType.text,
                  hintText: "Apply Promo Code",
                  enableBorderColor: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sub total :",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "\$400.00",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipping :",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "\$30.00",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              const DottedLine(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.5,
                dashLength: 4.0,
                dashColor: Colors.black,
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "\$400.00",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                buttonTitle: "Confirm & Pay",
                onTap: () {},
              ),
              const Spacer(),
            ],
          ),
        ),
      );
}
