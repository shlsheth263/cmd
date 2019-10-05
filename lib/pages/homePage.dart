import 'package:flutter/material.dart';
import './enterCommand.dart';
class homePage extends StatefulWidget {
  @override
  _TextFieldExState createState() => new _TextFieldExState();
}

class _TextFieldExState extends State<homePage> {
  TextEditingController _ipc ;
  TextEditingController _portc;

  String _ip = "Enter IP";
  String _port = "Enter PORT" ;
  String _text = "Enter Description";

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
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left:20.0,right: 20.0),
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
              keyboardType: TextInputType.text,
              onChanged: (v)=>setState((){_port=v;}),
              controller: _portc,
            ),),
            Padding(
              padding: EdgeInsets.only(top:50),
            ),
            new RaisedButton(
              child: new Text("SUBMIT"),
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
              padding: EdgeInsets.only(top:35),
            ),
            new Text("Description entered : $_text"),
            Padding(
              padding: EdgeInsets.only(top:20),
            ),
            new Text("Command : " ),
            new Text("IP : $_ip"),
            new Text("PORT :$_port")
          ],
        )
      )
    );
  }
}