import 'package:burger_king/fakedatabase/db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  FakeDB dB = FakeDB();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            top: width / 10, right: width / 30, left: width / 30),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                child: Image.asset(
                  "assets/logo.png",
                  scale: 4,
                ),
              ),
              Container(
                // color: Colors.red,
                width: width/2.5,
                child: Text(
                  "Your Order",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              )
            ]),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Consumer<FakeDB>(
                      builder: (context, value, child) => ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: dB.orderList.length,
                          itemBuilder: (context, index) {
                            return ListItems(
                              index: index,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),

            Consumer<FakeDB>(
              builder: (context, value, child) => Container(
                  width: width,
                  height: height / 14,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 10, color: Colors.grey[400])
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Text(
                            "Rs ${dB.totalAmount.toString()} /-",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: FlatButton(
                          onPressed: () {},
                          // color: Colors.amber,
                          // color: Colors.blue[800],
                          color: Colors.green[500],
                          child: Text(
                            "   Place Order  ",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  )
                  // Text(dB.totalAmount.toString())
                  ),
            ),
            // Container(
            //       margin: EdgeInsets.only(bottom: 10, top: 5),
            //       height: height / 9,
            //       decoration: BoxDecoration(
            //           color: Colors.blue[800],
            //           borderRadius: BorderRadius.circular(30)),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           FlatButton.icon(
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(18)),
            //             color: Colors.blue[900],
            //             padding: EdgeInsets.zero,
            //             onPressed: () {
            //               Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
            //             },
            //             icon: Icon(
            //               Icons.home,
            //               color: Colors.white,
            //             ),
            //             label: Text(
            //               "Home",
            //               style: TextStyle(color: Colors.white),
            //             ),
            //           ),
            //           Icon(
            //             Icons.location_on,
            //             color: Colors.white,
            //           ),
            //           Icon(
            //             Icons.shopping_basket,
            //             color: Colors.white,
            //           ),
            //           Icon(
            //             Icons.person,
            //             color: Colors.white,
            //           ),
            //         ],
            //       ),
            //     )
          ],
        ),
      ),
    );
  }
}

class ListItems extends StatefulWidget {
  final index;
  ListItems({this.index});

  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
//   List db = [];
  FakeDB dB = FakeDB();
  inc() {
    dB.orderList[widget.index]['count'] += 1;
  }

  dec() {
    dB.orderList[widget.index]['count'] -= 1;
  }

  totalAmt() {
    dB.totalAmount = 0;
    dB.items = 0;
    (dB.orderList as List<dynamic>).forEach((element) {
      if (element["count"] != 0) {
        dB.items += 1;
        dB.totalAmount += element["count"] * element["cost"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("dbdbdbbddb${dB.newproduct}");
    return Consumer<FakeDB>(
      builder: (context, value, child) => Container(
        margin: widget.index == (dB.orderList as List<dynamic>).length - 1
            ? EdgeInsets.only(bottom: 80)
            : EdgeInsets.only(bottom: 20),
        child: Stack(
          children: [
            Container(
              height: 165,
              color: Colors.white,
            ),
            Container(
              height: 140,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(blurRadius: 5, color: Colors.grey[400])
                  ]),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      child: Image.asset(
                        // widget.image,
                        dB.orderList[widget.index]["image"].toString(),
                        scale: 2,
                      ),
                    ),
                    Container(
                      width: 160,
                      child: Column(
                        children: [
                          Container(
                            width: 140,
                            child: Text(
                              dB.orderList[widget.index]["title"].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.grey[600],
                            endIndent: 70,
                            indent: 10,
                          ),
                          Container(
                            width: 140,
                            child: Text(
                              dB.orderList[widget.index]["subtitle"].toString(),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 20,
              child: Container(
                height: 50,
                width: 230,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(blurRadius: 5, color: Colors.grey[400])
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Rs ${dB.orderList[widget.index]["cost"].toString()}/-",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    dB.orderList[widget.index]["count"] == 0
                        ? FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("ADD"),
                            color: Colors.amber,
                            onPressed: () {
                              inc();
                              totalAmt();
                            },
                          )
                        : Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  dec();
                                  totalAmt();
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.amber),
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                child: Text(
                                  "${dB.orderList[widget.index]["count"].toString()}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  inc();
                                  totalAmt();
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.amber),
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
