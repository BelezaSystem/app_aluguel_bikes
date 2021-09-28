import 'package:bikes/Models/bike.dart';
import 'package:bikes/Providers/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_routes.dart';

class BikeGridItem extends StatelessWidget {
  final Bike bike;
  const BikeGridItem( {Key? key, required this.bike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.BIKE_DETAIL, arguments: bike);
      },
      child: GridTile(
        child: Image(
          image: CachedNetworkImageProvider(bike.imagemURL),
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            '${bike.nome}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          subtitle: Text(
            'Diária: R\$ ${bike.preco.toStringAsFixed(2)}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          trailing: GestureDetector(
            child: Icon(Icons.add_shopping_cart),
            onTap: () {
              String resp = cartProvider.CheckListCart(bike, cartProvider.addBike);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  backgroundColor: Colors.black54,
                  content: Center(
                    child: Container(
                      height: 100,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("$resp",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Icon(Icons.check_circle, color: Colors.green, size: 50,),
                          ),
                        ],
                      ),
                    ),
                  )
              ));
            },
          ),
        ),
      ),
    );
  }
}