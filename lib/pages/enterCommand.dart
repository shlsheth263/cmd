import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './terminal.dart';

class Post {
  final String eng;
  
  Post({this.eng});
 
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      eng: json['eng'],
    );
  }
  Map<String, dynamic> toJson() => {
    "eng": eng,
  };

 
  Map toMap() {
    var map = new Map<String, dynamic>();
    map["eng"] = eng;
    
    return map;
  }
}
String postToJson(Post data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
 
Future<http.Response> createPost(Post post) async{
  var url="http://192.168.225.34:5000/engtocmd";
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: postToJson(post)
  );

  return response;
}
//  Future<Post> fetchPost() async {
//   final response =
//       await http.get('http://192.168.225.34:5000/engtocmd');

//   if (response.statusCode == 200) {
//     // If server returns an OK response, parse the JSON.
//     return Post.fromJson(json.decode(response.body));
//   } else {
//     // If that response was not OK, throw an error.
//     throw Exception('Failed to load post');
//   }
// }
// Future<Post> createPost(String url, {Map body}) async {
//   return http.post(url, body: body).then((http.Response response) {
//     final int statusCode = response.statusCode;
 
//     if (statusCode < 200 || statusCode > 400 || json == null) {
//       throw new Exception("Error while fetching data");
//     }
//     return Post.fromJson(json.decode(response.body));
//   });
// }
 class TextFieldEx extends StatefulWidget {
  @override
  //String ip ="";
  //String port ="";
  final String _ip;
  final String _port;

 callAPI(String _text){
    Post post = Post(
      eng: _text,//'Testing body body body',
      //title: 'Flutter jam6'
    );
    
  } // creati 
TextFieldEx(this._ip, this._port, {Key key}): super(key: key);//add also..example this.abc,this...
@override
  State<StatefulWidget> createState() => _TextFieldExState();
  //_TextFieldExState createState() => new _TextFieldExState();
}
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

class _TextFieldExState extends State<TextFieldEx> {
  TextEditingController _c ;
  Future<Post> post;
  String output="" ;
  String output1="";
  String name="";
  String send_to_api1="";
  Map s1={};
  String _text = "Enter Description";
  //static final CREATE_POST_URL = 'https://jsonplaceholder.typicode.com/posts';
  // @override
  // void initState() {
  //     super.initState();
  //   }
  //
  String url="http://192.168.225.34:5000/engtocmd";
  // Future<String> makeRequest () async {
  //   var response = 
  //   await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
  //   print(response.body);
  // }
  
  // Future<String> getPost (String userip) async {
  // var url = 'http://192.168.225.34:5000/engtocmd';
  // var response = await http.post(url, headers: {"Accept": "application/json"}, body: {'eng': userip});
  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');

//print(await http.read('http://example.com/foobar.txt'));
  //}
  @override
  void initState() {
    super.initState();
    _c = new TextEditingController();
    //post = fetchPost();
  }
callAPI(String _text){
    Post post = Post(
      eng: _text,//'Testing body body body',
      //title: 'Flutter jam6'
    );
    createPost(post).then((response){
        if(response.statusCode >= 200)
        {
          print(response.body);
          output = response.body;
          s1 =jsonDecode(output);
          send_to_api1=s1['cmd'][0];
        }
        else
          print(response.statusCode);
    }).catchError((error){
      print('error : $error');
    });
  }
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
//          Map<String, dynamic> user = jsonDecode(output);
  //        name = user['cmd'];
        }
        else
          print(response.statusCode);
    }).catchError((error){
      print('error : $error');
    });
  }

  @override
  void dispose(){
   _c?.dispose();
   super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        return new Scaffold( 
            appBar: AppBar(
            title: Text('Commands Page'),
            backgroundColor: new Color(0xFF000000),
          ),
          body: new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
    
                Text("Enter Command Description :",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(left:20.0,right: 20.0,top:20),
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
                  child: new Text("Get Command",style: TextStyle(fontSize: 20)),  
                  textColor: Colors.white,
                  color: Colors.blue,    
                  onPressed: () async {
                    //makeRequest();
                    //getPost(_text);
                    callAPI(_text);
                    callAPI1(send_to_api1);
                    setState((){
                      _c.text = "";
                      output=output;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top:10),
                ),
                new Text("Description entered : $_text"),
                Padding(
                  padding: EdgeInsets.only(top:20),
                ),
                new Text("Command : " + output,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal)),
                new Text("Output :" + send_to_api1,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal) ),

              Padding(
                  padding: EdgeInsets.only(top:30),
                ),

              FloatingActionButton(
              elevation: 0.0,
              child: new Icon(Icons.comment),
              backgroundColor: new Color(0xFF000000),
              onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => terminal()));
              }
            ),
            
            
            //Text("IP : " + widget._ip),
            //Text("PORT : " + widget._port),
          ],
        )
      )
    );
  }
}