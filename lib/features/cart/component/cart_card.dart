import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const ValueKey<int>(1),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
          color: Theme.of(context).colorScheme.error,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Iconsax.trash,
              color: Theme.of(context).colorScheme.onError,
            ),
            SizedBox(width: 40.w),
          ],
        ),
      ),
      onDismissed: (direction) {
        debugPrint("item deleted");
      },
      child: Container(
        height: 125.h,
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
                  SizedBox(
                    height: 10.h,
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "\$200.00",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Iconsax.minus_cirlce,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        "1",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Iconsax.add_circle,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
