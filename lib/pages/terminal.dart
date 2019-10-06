import 'package:flutter/material.dart';

class terminal extends StatefulWidget {
@override
State<StatefulWidget> createState() {
return _ScrollViewState();
}
}

class _ScrollViewState extends State<terminal>{
    TextEditingController _c ;
    String _command ="";
    String _output = "test output";
  @override
void initState() {
    super.initState();
    _c = new TextEditingController();
    //post = fetchPost();
  }
@override
Widget build(BuildContext context) {
return new Scaffold( 
            appBar: AppBar(
            title: Text('Terminal'),
             backgroundColor: new Color(0xFF000000),
          ),
          backgroundColor: new Color(0xFF000000),
          body: ListView(
              padding: EdgeInsets.all(0.0),
              shrinkWrap: true,
              children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
                TextField(
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  
                  onSubmitted: (v)=>setState((){_command="welcome";}),
                  controller: _c,
                decoration: new InputDecoration(
                  //border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                 hintText: 'Enter Command',
             )
                  ),
                Text(
                 '-->'+ _command,style: TextStyle(color: Colors.white),
                ),
                Text(
                 "-->"+  _output,style: TextStyle(color: Colors.white)
                ),
              ]
          ),
        );
    }
}
