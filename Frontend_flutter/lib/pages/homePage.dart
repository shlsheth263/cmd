import 'package:flutter/material.dart';
import './enterCommand.dart';
class homePage extends StatefulWidget {
  @override
  _TextFieldExState createState() => new _TextFieldExState();
}

class _TextFieldExState extends State<homePage> {
  TextEditingController _ipc ;
  TextEditingController _portc;

  String _ip = "";
  String _port = "" ;

  @override
  void initState() {
      _ipc = new TextEditingController();
      _portc = new TextEditingController();
      super.initState();
    }

  @override
  void dispose(){
   _ipc?.dispose();
   _portc?.dispose();
   super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
        appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: new Color(0xFF000000),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:0,bottom: 10),
            ),
            Text("Enter Local Server Details :",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,)),
            Padding(
              padding: EdgeInsets.only(left:20.0,right: 10.0,top: 10),
              child :TextField(
                decoration: InputDecoration(labelText: 'Enter IP'),
              keyboardType: TextInputType.text,
              onChanged: (v)=>setState((){_ip=v;}),
              controller: _ipc,
            ),),
              Padding(
              padding: EdgeInsets.only(left:20.0,right: 20.0),
              child :TextField(
                decoration: InputDecoration(labelText: 'Enter PORT'),
              keyboardType: TextInputType.number,
              onChanged: (v)=>setState((){_port=v;}),
              controller: _portc,
            ),),
            Padding(
              padding: EdgeInsets.only(top:30),
            ),
            new RaisedButton(
              child: new Text("SUBMIT",style: TextStyle(fontSize: 20)),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: (){
                Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TextFieldEx(_ip, _port)));
                setState((){
                  _portc.text = "";
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top:10),
            ),
          ],
        )
      )
    );
  }
}