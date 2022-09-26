import 'package:flutter/material.dart';


class MyItem {
  bool isExpanded;
   Row header;
   Row body;

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
  late bool SingleRommVal= true;
late bool DoubleRommVal= false;
late bool SuiteRommVal=false;

void SingleOnChanged(bool val){
    setState(() {
      SingleRommVal=val;
    });
  }
void  DoubleOnChanged(bool val){
  setState(() {
    DoubleRommVal=val;
  });
}
void SuiteChanged(bool val){
  setState(() {
    SuiteRommVal=val;
  });
}
String ChossenRoom="";
void ChooseRoom(){
  if(SingleRommVal==1&&DoubleRommVal==0&&SuiteRommVal==0)
    {
      ChossenRoom="Single Room";
    }
  else if(SingleRommVal==0&&DoubleRommVal==1&&SuiteRommVal==0)
    {
      ChossenRoom="Double Room";

    }
  else{
    ChossenRoom="Suite Room";
  }
}

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
                 Text(ChossenRoom as String),

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
                    const Text("Your Data Has been sucssesfully submitted"),
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

late final List<MyItem> items = <MyItem>[
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
          Switch(value: SingleRommVal, onChanged: SingleOnChanged,activeColor: Colors.cyan,)

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
           Switch(value: DoubleRommVal, onChanged: DoubleOnChanged)
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
              image: NetworkImage("https://th.bing.com/th/id/R.6a4ecdbcf6ab470953a90650ac96a7f0?rik=ugTcVlSuHYHNpQ&riu=http%3a%2f%2fwww.grandlordhotel.com%2fmedias%2froom%2fbig%2f79%2fdeluxe04.jpg&ehk=SNXCru4%2bvcZuJTd5b3iZH8dFi93nF4lI7z3laq16%2bng%3d&risl=&pid=ImgRaw&r=0"),
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
           Switch(value: SuiteRommVal, onChanged: SuiteChanged)
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
              width: 5,
            ),
            Text(
              "A Room With one bedroom and seprate leaving room",
              style: TextStyle(fontSize: 10),
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
