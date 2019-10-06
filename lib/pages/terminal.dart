import 'package:flutter/material.dart';


class terminal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Terminal();
  }
}

class Terminal extends State<terminal>  {

  @override
  Widget build(BuildContext context) {  
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Terminal"),
        backgroundColor: new Color(0xFF000000)
      ),
      
    );
  }

}
