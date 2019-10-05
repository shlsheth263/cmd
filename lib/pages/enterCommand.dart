import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

class _TextFieldExState extends State<TextFieldEx> {
  TextEditingController _c ;
  Future<Post> post;
  String output ;
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
              onPressed: () async {
                //makeRequest();
                //getPost(_text);
                callAPI(_text);
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