import 'package:flutter/material.dart';

class TextFieldEx extends StatefulWidget {
  @override
  //String ip ="";
  //String port ="";
  final String _ip;
  final String _port;
TextFieldEx(this._ip, this._port, {Key key}): super(key: key);//add also..example this.abc,this...
@override
  State<StatefulWidget> createState() => _TextFieldExState();
  //_TextFieldExState createState() => new _TextFieldExState();
}

class _TextFieldExState extends State<TextFieldEx> {
  TextEditingController _c ;

  String _text = "Enter Description";
  @override
  void initState() {
      _c = new TextEditingController();
      super.initState();
    }

  @override
  void dispose(){
   _c?.dispose();
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
                decoration: InputDecoration(labelText: 'Enter Description'),
              keyboardType: TextInputType.text,
              onChanged: (v)=>setState((){_text=v;}),
              controller: _c,
            ),),
            Padding(
              padding: EdgeInsets.only(top:50),
            ),
            new RaisedButton(
              child: new Text("Get Command"),
              onPressed: (){
                setState((){
                  //_metal = double.parse(_c.text);
                  //_total = _metal+0.025;
                  _c.text = "";
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
            Text(widget._ip),
            Text(widget._port)

          ],
        )
      )
    );
  }
}