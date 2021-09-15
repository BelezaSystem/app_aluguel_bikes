import 'package:flutter/material.dart';

class HomeModalAddCart extends StatelessWidget {
  final resp;
  const HomeModalAddCart({key, this.resp }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      height: MediaQuery.of(context).size.height * 0.57,
      width: MediaQuery.of(context).size.width,
      child: Padding(padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text("$resp",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24 ),
            ),

            Icon(Icons.check_outlined,
              size: 100,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}