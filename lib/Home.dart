import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:hotel_reservation/BookingScreen.dart';

class Home extends  StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
static  var NomOfAdults=0.0;
static  var NomOfChidren=0.0;
  String Selected="";
  DateTime CheckInDate=DateTime.now();
  DateTime CheckOutDate=DateTime.now();
  Future<Null> selectedCheckInDate(BuildContext context)async{
    final DateTime? picked=await showDatePicker(context: context,
      initialDate: CheckInDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),);
    if (picked != null && picked !=CheckInDate)
    {
      setState(() {
        CheckInDate=picked;
        print(CheckInDate.toString());
      });
    }
  }
  Future<Null> selectedCheckOutDate(BuildContext context)async{
    final DateTime? picked=await showDatePicker(context: context,
      initialDate:CheckInDate,
      firstDate: CheckInDate,
      lastDate: DateTime(2025),);
    if (picked != null && picked !=CheckOutDate)
    {
      setState(() {
        CheckOutDate=picked;
        print(CheckOutDate.toString());
      });
    }
  }
static  List <String> extra=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Castaway Resort"),
      ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Stack(
              children: [
                ListView(
                  children: [
                    Image(image: NetworkImage("https://th.bing.com/th/id/R.1694e6acec88d9d61f1593ba0cc0ebf7?rik=%2fmwqv4EsQqjy7w&pid=ImgRaw&r=0")),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("Check-in-Date:",style: TextStyle(color: Colors.cyan,fontSize: 15,),),
                        SizedBox(width: 30,),
                        IconButton(onPressed: (){selectedCheckInDate(context);}, icon: Icon(Icons.date_range)),
                        Text(('${CheckInDate.year} - ${CheckInDate.month} - ${CheckInDate.day}').toString(),
                          style: TextStyle(color: Colors.cyan),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("Check-Out-Date:",style: TextStyle(color: Colors.cyan,fontSize: 15,),),
                        SizedBox(width: 30,),
                        IconButton(onPressed: (){selectedCheckOutDate(context);}, icon: Icon(Icons.date_range)),
                        Text(('${CheckOutDate.year} - ${CheckOutDate.month} - ${CheckOutDate.day}').toString(),
                          style: TextStyle(color: Colors.cyan),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("Number Of Adults",style: TextStyle(color: Colors.cyan,fontSize: 15),),
                        SizedBox(width: 5,),
                        Slider(value: NomOfAdults, onChanged: (newNom){
                          setState(() {
                            NomOfAdults=newNom;
                          });
                        },
                          divisions: 5,
                          label: NomOfAdults.toInt().toString(),
                          min: 0,max: 5,
                        ),

                        Text('$NomOfAdults'),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("Number Of Childreen",style: TextStyle(color: Colors.cyan,fontSize: 14),),

                        Slider(value: NomOfChidren, onChanged: (newNom){
                          setState(() {
                            NomOfChidren=newNom;
                          });
                        },
                          divisions: 5,
                          label: NomOfChidren.toInt().toString(),
                          min: 0,max: 5,
                        ),

                        Text('$NomOfChidren'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Extras",style: TextStyle(color: Colors.cyan),),
                        CheckboxGroup(labels: <String>["Break Fast(50EGP/day)","WIFI(50EGP/day)","Parking(100EGP/day)"],
                          checkColor: Colors.cyan,
                          activeColor: Colors.cyan,
                          onSelected: (List <String> Extras )=>
                              extra=Extras,


                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("View",style: TextStyle(color: Colors.cyan),),
                        RadioButtonGroup(labels: <String>["Graden View","Sea View"],
                          onSelected: (String selected)=>Selected=selected,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(
                        builder:(context){return BookingScreen(Adults: NomOfAdults.toString(),Children:NomOfChidren.toString(),
                          Extras:extra,InDate: CheckInDate.toString(),OutDate: CheckOutDate.toString(),Selected: Selected,);}
                    ));},
                        child: Text("Check Rooms AND rates",), )



                  ],
                )
              ]),
        )
    );
  }
}
