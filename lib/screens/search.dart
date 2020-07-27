import 'package:burger_king/fakedatabase/db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  List dummyList = [];
  FakeDB dB = FakeDB();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40, left: width / 30, right: width / 30),
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                if (searchController.text.isNotEmpty) {
                  dummyList = [];
                  (dB.searchList as List<dynamic>).forEach((element) {
                    if(element["title"].toString().toLowerCase()==searchController.text.toLowerCase()){
                      dummyList.add(element);
                    }
                  });
                  dB.searchList = dummyList;
                  print("from search page${dB.searchList}");
                }
              },
              controller: searchController,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: "Search...",
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                            itemCount: dB.searchList.length,
                            itemBuilder: (context, index) {
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
                  return dB.searchAmount == 0
                      ? Container()
                      : Positioned(
                          bottom: 30,
                          child: Container(
                              width: width / 1.07,
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
                                          "Rs ${dB.searchAmount.toString()}/-",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "${dB.searchItems.toString()} items",
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
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  final index;
  ListItem(
      {
      this.index});

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
//   List db = [];
  FakeDB dB = FakeDB();
  inc() {
    dB.searchList[widget.index]['count'] += 1;
  }

  dec() {
    dB.searchList[widget.index]['count'] -= 1;
  }

  searchAmt() {
    dB.searchAmount = 0;
    dB.searchItems = 0;
    (dB.searchList as List<dynamic>).forEach((element) {
      if (element["count"] != 0) {
        dB.searchItems += 1;
        dB.searchAmount += element["count"] * element["cost"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("dbdbdbbddb${dB.newproduct}");
    return Consumer<FakeDB>(
      builder: (context, value, child) => Container(
        margin: widget.index == (dB.searchList as List<dynamic>).length - 1
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
                        dB.searchList[widget.index]["image"].toString(),
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
                              dB.searchList[widget.index]["title"].toString(),
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
                              dB.searchList[widget.index]["subtitle"]
                                  .toString(),
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
                      "Rs ${dB.searchList[widget.index]["cost"].toString()}/-",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    dB.searchList[widget.index]["count"] == 0
                        ? FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("ADD"),
                            color: Colors.amber,
                            onPressed: () {
                              inc();
                              // Provider.of<FakeDB>(context, listen: false)
                              //     .incCount(dB.newproduct, widget.index);
                              searchAmt();
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
                                  searchAmt();
                                  // Provider.of<FakeDB>(context, listen: false)
                                  //     .totAmount(dB.newproduct);
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
                                  "${dB.searchList[widget.index]["count"].toString()}",
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
                                  searchAmt();
                                  // Provider.of<FakeDB>(context, listen: false)
                                  //     .totAmount(dB.newproduct);
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
