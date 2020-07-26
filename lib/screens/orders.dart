import 'package:flutter/material.dart';

import 'homepage.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Expanded(child: Container()),
        Container(
              margin: EdgeInsets.only(bottom: 10, top: 5),
              height: height / 9,
              decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    color: Colors.blue[900],
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                    },
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ],
              ),
            )
      ],
    );
  }
}
