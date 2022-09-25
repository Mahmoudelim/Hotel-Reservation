import 'package:flutter/material.dart';
import 'package:hotel_reservation/Home.dart';

class MyItem {
  bool isExpanded;
  late final Row header;
  final Row body;

  MyItem({this.isExpanded = false, required this.header, required this.body});
}

class BookingScreen extends StatefulWidget {
  String? Children;
  String? Adults;

  String? InDate;

  String? OutDate;

  List<String>? Extras;

  String? Selected;

  BookingScreen(
      {Key? key,
      String? this.Children,
      String? this.Adults,
      String? this.InDate,
      String? this.OutDate,
      List<String>? this.Extras,
      String? this.Selected})
      : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  bool SingleRommVal=false;
  bool  DoubleRommVal = false;
  bool  SuiteRommVal=false ;



  void ShowAlertDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Are you Sure You Want to Procced"),
      content: Container(
        child: Column(
          children: [
            Text(
                "This is a Confirmation Message that You Agreed To ALL Data You Entered"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Check In Date",
                  style: TextStyle(fontSize: 10),
                ),
                // SizedBox(width: 5,),
                Text(widget.InDate as String),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Check out Date :",
                  style: TextStyle(fontSize: 10),
                ),
                //SizedBox(width: 5,),
                Text(widget.OutDate as String),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Number of Adults"),
                SizedBox(
                  width: 5,
                ),
                Text(widget.Adults as String),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Number of children"),
                SizedBox(
                  width: 5,
                ),
                Text(widget.Children as String),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Extras"),
                SizedBox(
                  width: 5,
                ),
                Text(widget.Extras.toString() as String)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("View:"),
                SizedBox(
                  width: 5,
                ),
                Text(widget.Selected as String),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Choosen Room:"),
                SizedBox(
                  width: 5,
                ),

              ],
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    const Text("Your form Has been sucssesfully submitted"),
                duration: Duration(seconds: 3),
              ),
            );
          },
          child: Text("confirm"),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Discard")),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

 late List<MyItem> items = <MyItem>[
    MyItem(
        header: Row(
          children: [
            Image(
              image: NetworkImage(
                  "https://th.bing.com/th/id/R.7d6d3f2949e843e94c8b222ccc8a78b8?rik=0KJ6ONS0d8RgIw&pid=ImgRaw&r=0"),
              width: 80,
              height: 150,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Single Room",
              style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
           Switch(value:SingleRommVal, onChanged: (val) {
             setState(() {
               SingleRommVal = val;
             });
           },),

          ],
        ),
        body: Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            Icon(
              Icons.star,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "A Room Assigned to One Person",
              style: TextStyle(fontSize: 13),
            )
          ],
        )),
    MyItem(
        header: Row(
          children: [
            Image(
              image: NetworkImage(
                  "https://th.bing.com/th/id/R.c6d4695d1a13c5e493951fb458142de4?rik=6%2fzgbeEPv1ZQ5g&pid=ImgRaw&r=0"),
              width: 80,
              height: 150,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Double Room",
              style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Switch(value:DoubleRommVal, onChanged: (val) {
              setState(() {
                DoubleRommVal=val;
              });
            },
            activeColor: Colors.cyan,),
          ],
        ),
        body: Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "A Room Assigned to more One Person",
              style: TextStyle(fontSize: 13),
            )
          ],
        )),
    MyItem(
        header: Row(
          children: [
            Image(
              image: NetworkImage(
                  "https://th.bing.com/th/id/R.7d6d3f2949e843e94c8b222ccc8a78b8?rik=0KJ6ONS0d8RgIw&pid=ImgRaw&r=0"),
              width: 80,
              height: 150,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Suite Room",
              style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Switch(value: SuiteRommVal, onChanged: (val) {
              setState(() {
                SuiteRommVal=val;
              });
            })
          ],
        ),
        body: Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "A Room With one bedroom and seprate leaving room",
              style: TextStyle(fontSize: 15),
            )
          ],
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Castaway Resort"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Stack(children: [
            ListView(
              shrinkWrap: true,
              children: [
                ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      items[index].isExpanded = !isExpanded;
                    });
                  },
                  children: items.map<ExpansionPanel>((MyItem item) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: item.header,
                        );
                      },
                      body: ListTile(
                        title: item.body,
                      ),
                      isExpanded: item.isExpanded,
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      ShowAlertDialog(context);
                    },
                    child: Text("Book Now")),
              ],
            ),
          ]),
        ));
  }
}
