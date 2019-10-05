import 'package:kjsce/pages/enterCommand.dart';
import 'package:flutter/material.dart';
import './enterCommand.dart';
class homePage extends StatefulWidget {

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<homePage> {
  final _priceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('CMD'),
        backgroundColor: new Color(0xFF000000),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50,top: 30.0,left: 15,right: 15),
        child: Form(
          child: ListView(
            children: <Widget>[
              Padding(
              padding: EdgeInsets.only(bottom:20.0),
              child :Text(
                'Enter Local system details',
                 style: TextStyle(fontSize: 30.0),
              ),),
              TextFormField(
                decoration: InputDecoration(labelText: 'IP address'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Port'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
              ),
              RaisedButton(
  onPressed: () {
 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => enterCommand()),
  );
  },
  child: Text('Submit'),
),
            ],
          ),
        ),
      ),
    ),),);
  }
}
