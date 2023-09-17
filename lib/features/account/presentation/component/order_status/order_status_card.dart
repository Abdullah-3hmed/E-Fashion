import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0).r,
      height: 120.h,
      padding: const EdgeInsets.symmetric(horizontal: 12.0).r,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(20).r,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16).r,
            child: CachedNetworkImage(
                width: 90.w,
                height: 100.h,
                fit: BoxFit.cover,
                imageUrl:
                    "https://img.freepik.com/free-photo/high-fashion-portrait-young-elegant-blonde-woman-black-wool-hat-wearing-oversize-white-fringe-poncho-with-long-grey-dress_273443-3799.jpg?w=996&t=st=1694528012~exp=1694528612~hmac=a1192087d370d5a28807a74d25d2673f66a1725590c2223a45560df4f9a7e11a"),
          ),
          SizedBox(
            width: 24.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Black jacket",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Size : XL",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "\$200.00",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Text(
                    'Delivery Status',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
