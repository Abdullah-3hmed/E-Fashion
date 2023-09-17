import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/features/cart/component/cart_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                alignment: AlignmentDirectional.centerStart,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              Text(
                "Shopping Bag",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => const CartCard(),
              separatorBuilder: (context, index) => SizedBox(
                height: 8.h,
              ),
              itemCount: 10,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub total:",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "\$600.00",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    );
  }
}
