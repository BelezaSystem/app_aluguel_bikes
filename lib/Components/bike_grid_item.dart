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
      child: GridTile(
        child: Image(image: CachedNetworkImageProvider(bike.imagemURL),
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            '${bike.nome}',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "R\$: ${bike.preco}",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: GestureDetector(
              child: Icon(Icons.add_shopping_cart_sharp),
              onTap: (){
                String resp = cartProvider.CheckListCart(bike, cartProvider.addBike);

                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("$resp", textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                    content: Icon(Icons.check_rounded, color: Colors.green, size: 100,),
                    actions: <Widget>[

                      ElevatedButton.icon(
                        style:  ElevatedButton.styleFrom(
                          minimumSize: Size(170,40),
                          primary: Colors.black87,
                        ),

                        label: Text("Pagamento"),
                        icon: Icon(Icons.monetization_on_outlined),

                        onPressed: (){
                          Navigator.of(context).pushNamed(AppRoutes.Cart_Default);
                        },
                      ),

                      ElevatedButton.icon(
                        style:  ElevatedButton.styleFrom(
                          minimumSize: Size(170,40),
                          primary: Colors.black87,
                        ),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(40,0,0,0,),
                          child: Text("Fechar"),
                        ),
                        icon: Icon(Icons.close),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
              }
          ),
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(AppRoutes.Bike_Default, arguments: bike);
      },
    );
  }
}