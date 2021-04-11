import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  final String data;
  FirstPage({Key key, this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage> {
  final TextEditingController _userNameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = "";

  void _clearInput() {
    setState(() {
      _userNameController.clear();
      _passwordController.clear();
    });
  }

  void _welcome() {
    setState(() {
      if(_userNameController.text.isNotEmpty && _passwordController.text.isNotEmpty)
        _welcomeString = 'Welcome, ' + _userNameController.text + '!';
      else
        _welcomeString = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(50),
        child: ListView(children: <Widget>[
          Column(children: <Widget>[
            Image.asset(
              'images/login.png',
              width: 120,
              height: 120,
            ),
            Text(
              widget.data,
              style: TextStyle(fontSize: 20),
            ),
            Column(children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Username',
                ),
                controller: _userNameController,
              ),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Password',
                ),
                controller: _passwordController,
                obscureText: true,
              ),
              Row(children: <Widget>[
                RaisedButton(
                  child: Text('Login'),
                  onPressed: _welcome,
                ),
                RaisedButton(
                  child: Text('Clear'),
                  onPressed: _clearInput,
                ),
              ],
              ),
              Text(
                _welcomeString,
              ),
            ]
            ),
          ]),
        ],),

      ),
    );
  }

}