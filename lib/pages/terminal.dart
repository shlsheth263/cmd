import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';
class Post1 {
  final String cmd;
  Post1({this.cmd});
 
  factory Post1.fromJson(Map<String, dynamic> json) {
    return Post1(
      cmd: json['cmd'],
    );
  }
  Map<String, dynamic> toJson() => {
    "cmd": cmd,
  };

 
  Map toMap() {
    var map = new Map<String, dynamic>();
    map["cmd"] = cmd;
    
    return map;
  }
}
String postToJson1(Post1 data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
 
Future<http.Response> createPost1(Post1 post) async{
  var url="http://192.168.225.169:5000/terminal";
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: postToJson1(post)
  );

  return response;
}


class terminal extends StatefulWidget {
@override
State<StatefulWidget> createState() {
return _ScrollViewState();
}
}

class _ScrollViewState extends State<terminal>{
    String _command ="";
    String test ="hello\nhii\n";
    List <String> outputArr=[];
  @override
void initState() {
    super.initState();
    //post = fetchPost();
  }
@override
String output1="";
callAPI1(String _text){
    Post1 post = Post1(
      cmd: _text,//'Testing body body body',
      //title: 'Flutter jam6'
    );
    createPost1(post).then((response){
        if(response.statusCode >= 200)
        {
          print(response.body);
          output1 = response.body;
          outputArr=output1.split("n");
          print(test.split('\n'));
          print(outputArr);
        }
        else
          print(response.statusCode);
    }).catchError((error){
      print('error : $error');
    });
  }
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
                  
                  onSubmitted: (v) async {
                    setState((){_command=v;});
                    callAPI1(_command);
                  //controller: _c;
                  },
                decoration: new InputDecoration(
                  //border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                 hintText: 'Enter Command',
             )
                  ),
                Text(
                 '-->'+ _command,style: TextStyle(color: Colors.white,fontSize: 20),
                ),
                Text(
                 "-->"+  output1,style: TextStyle(color: Colors.white,fontSize: 20)
                ),
              ]
          ),
        );
    }
}
