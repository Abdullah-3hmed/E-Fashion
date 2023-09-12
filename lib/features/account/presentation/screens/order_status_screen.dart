import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/features/account/presentation/component/order_status/order_status_card.dart';

@RoutePage()
class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            title: Text(
              "Order Status",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
        body: ListView.builder(
          itemBuilder: (context, index) => const OrderStatusCard(),
          itemCount: 10,
        ),
      ),
    );
  }
}
