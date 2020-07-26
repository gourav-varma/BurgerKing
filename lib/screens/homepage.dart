import 'package:burger_king/fakedatabase/db.dart';
import 'package:burger_king/screens/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List db;
  FakeDB dB = FakeDB();
  int totalAmt = 0;

  fetchAmount() {
    setState(() {
      totalAmt = dB.totalAmount;
    });
  }

  fetchProducts(query, result) {
    FakeDB dB = FakeDB();
    dB.api(query, result);
    db = dB.newproduct;
  }

  @override
  void initState() {
    fetchProducts("category", "King Saver Combo");
    fetchAmount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // print(width);
    // print(height);
    // print(db);
    print("hellooooooo$db");
    print("total amount - $totalAmt");
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            top: width / 10, right: width / 30, left: width / 30),
        child: Column(
          children: [
            AppBar(),
            Container(
              margin: EdgeInsets.only(top: width / 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: FlatButton(
                        onPressed: () {
                          // Provider.of<FakeDB>(context, listen: false).fetchKS();
                          setState(() {
                            fetchProducts("category", "King Saver Combo");
                            Provider.of<FakeDB>(context, listen: false)
                                .api("category", "King Saver Combo");
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        child: Text("King Saver..."),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            fetchProducts("category", "Whopper");
                            Provider.of<FakeDB>(context, listen: false)
                                .api("category", "Whopper");
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        child: Text("Whopper"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: FlatButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        child: Text("Meal Combos"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: FlatButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        child: Text("Classic Burgers"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dB.newproduct[0]["category"],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.5),
                  ),
                  Text(
                    "Veg",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.5),
                  )
                ],
              ),
            ),
            Expanded(
                child: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Consumer<FakeDB>(
                        builder: (context, value, child) => ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: db.length,
                            itemBuilder: (context, index) {
                              print(db.length);
                              return ListItem(
                                // image: db[index]["image"].toString(),
                                // title: db[index]["title"].toString(),
                                // subtitle: db[index]["subtitle"].toString(),
                                // count: db[index]["count"].toString(),
                                // cost: db[index]["cost"].toString(),
                                // veg: db[index]["veg"].toString(),
                                // db: db,
                                index: index,
                              );
                            }),
                      )
                    ],
                  ),
                ),
                Consumer<FakeDB>(builder: (context, value, child) {
                  return dB.totalAmount == 0
                      ? Container()
                      : Positioned(
                          bottom: 0,
                          child: Container(
                              width: width / 1.08,
                              height: height / 10,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.green[500],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Rs ${dB.totalAmount.toString()}/-",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "${dB.items.toString()} items",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "View Order",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.shopping_basket,
                                          color: Colors.white,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )

                              // Text(dB.totalAmount.toString()
                              //     // totalAmt.toString()),
                              //     ),
                              ));
                })
              ],
            )),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
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
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Orders(),
                          ));
                    },
                    child: Icon(
                      Icons.shopping_basket,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/logo.png",
          scale: 4,
        ),
        Row(
          children: [
            Container(
              child: Icon(
                Icons.search,
                color: Colors.grey,
                size: 30,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Container(
              child: Icon(
                Icons.local_offer,
                color: Colors.grey,
              ), //TODO: change the icon
            ),
          ],
        )
      ],
    );
  }
}

class ListItem extends StatefulWidget {
  // final title;
  // final subtitle;
  // final cost;
  // final count;
  // final veg;
  // final image;
  // final db;
  final index;
  ListItem(
      {
      // this.cost,
      // this.count,
      // this.subtitle,
      // this.title,
      // this.veg,
      // this.image,
      // this.db,
      this.index});

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
//   List db = [];
  FakeDB dB = FakeDB();
  inc() {
    dB.newproduct[widget.index]['count'] += 1;
  }

  dec() {
    dB.newproduct[widget.index]['count'] -= 1;
  }

  totalAmt() {
    dB.totalAmount = 0;
    dB.items = 0;
    (dB.newproduct as List<dynamic>).forEach((element) {
      if (element["count"] != 0) {
        dB.items += 1;
        dB.totalAmount += element["count"] * element["cost"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("dbdbdbbddb${dB.newproduct}");
    return 
    // Consumer<FakeDB>(
      // builder: (context, value, child) => 
      Container(
        margin: widget.index == (dB.newproduct as List<dynamic>).length - 1
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
                        dB.newproduct[widget.index]["image"].toString(),
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
                              dB.newproduct[widget.index]["title"].toString(),
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
                              dB.newproduct[widget.index]["subtitle"].toString(),
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
                      "Rs ${dB.newproduct[widget.index]["cost"].toString()}/-",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    dB.newproduct[widget.index]["count"] == 0
                        ? FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("ADD"),
                            color: Colors.amber,
                            onPressed: () {
                              inc();
                              // Provider.of<FakeDB>(context, listen: false)
                              //     .incCount(dB.newproduct, widget.index);
                              totalAmt();
                              // Provider.of<FakeDB>(context, listen: false)
                              //     .totAmount(dB.newproduct);
                            },
                          )
                        : Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  dec();
                                  // Provider.of<FakeDB>(context, listen: false)
                                  //     .decCount(dB.newproduct, widget.index);
                                  totalAmt();
                                  // Provider.of<FakeDB>(context, listen: false)
                                  //     .totAmount(dB.newproduct);
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
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
                                  "${dB.newproduct[widget.index]["count"].toString()}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  inc();
                                  // Provider.of<FakeDB>(context, listen: false)
                                  //     .incCount(dB.newproduct, widget.index);
                                  totalAmt();
                                  // Provider.of<FakeDB>(context, listen: false)
                                  //     .totAmount(dB.newproduct);
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
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
      // ),
    );
  }
}
