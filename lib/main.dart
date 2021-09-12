import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/bike_details_screen.dart';
import 'Screens/bikes_overview_screen.dart';
import 'app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: ChangeNotifierProvider(
        create: (context) => CartItem(),
        child:MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BikeOverviewScreen(),
          routes: {
            AppRoutes.BIKE_DETAIL: (context) => BikeDetailsScreen(),
            AppRoutes.CART_DETAIL: (context) => CartDetailScreen(),
          },
        ),
      ),
    );
  }
}