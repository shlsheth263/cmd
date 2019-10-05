import 'package:flutter/material.dart';
class enterCommand extends StatefulWidget {

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<enterCommand> {
   // TextEditingController descController = TextEditingController();
  final _priceFocusNode = FocusNode();
 // String desc="";
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
              padding: EdgeInsets.only(bottom:40.0),
              child :Text(
                'Enter Command Details',
                 style: TextStyle(fontSize: 30.0),
              ),),
              TextFormField(
                decoration: InputDecoration(labelText: 'Command description'),
                //controller: descController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
              ),
              Padding(    
              padding: EdgeInsets.only(top:10.0),
              child :RaisedButton(
                onPressed: () {
                    //desc=descController.text;
                },
                child: Text('Get Command'),
              ),),
            ],
          ),
        ),
      
      ),
    ),
    ),
  );
    
  }
}
