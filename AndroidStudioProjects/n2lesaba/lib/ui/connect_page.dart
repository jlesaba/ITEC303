import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ConnectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConnectPageState();
  }
}

class ConnectPageState extends State<ConnectPage> {
  Future<List> _future;

  @override
  void initState() {
    super.initState();
    _future = getJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Connecting to WWW'),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: FutureBuilder<List>(
            future: _future,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Column(children: <Widget>[
                      Divider(),
                      ListTile(
                        title: Text('${snapshot.data[position]['email']}'),
                        subtitle: Text('${snapshot.data[position]['name']}'),
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Text('${snapshot.data[position]['id']}',
                              style: TextStyle(
                                color: Colors.black,
                              )
                          ),
                        ),
                        onTap: () => showContent(context, snapshot.data[position]['email'], snapshot.data[position]['body'] ),
                      ),
                    ],);
                  },
                );
              }else{
                return Text('Loading...');
              }
            },
          ),
        )
    );
  }
}

void showContent(BuildContext context, String email, String body) {
  var alert = AlertDialog(
      title: Text(email),
      content: Text(body),
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ]
  );

  showDialog(context: context, builder: (context) => alert);
}

Future<List> getJSON() async {
  String url = 'https://jsonplaceholder.typicode.com/comments';

  http.Response response = await http.get(url);

  return json.decode(response.body);
}