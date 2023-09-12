import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/util/assets_manager.dart';
import 'package:flutter_ecommerce/features/account/presentation/component/order_status/custom_easy_stepper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DeliveryStatusScreen extends StatefulWidget {
  const DeliveryStatusScreen({super.key});

  @override
  State<DeliveryStatusScreen> createState() => _DeliveryStatusScreenState();
}

class _DeliveryStatusScreenState extends State<DeliveryStatusScreen> {
  final int _activeStep = 0;
  List<String> orderStatusImages = const [
    AssetsManager.stepperImage1,
    AssetsManager.stepperImage2,
    AssetsManager.stepperImage3,
  ];

  List<String> orderStatusCations = const [
    'Your order still on progress\n it may take hours.',
    'The delivery man on his\n way to your location.',
    'Your order has been\n delivered, hope you liked it.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Status",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          CustomEasyStepper(
            activeStep: _activeStep,
          ),
          const Spacer(),
          Image(image: AssetImage(orderStatusImages[_activeStep])),
          SizedBox(
            height: 24.h,
          ),
          Text(
            orderStatusCations[_activeStep],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
