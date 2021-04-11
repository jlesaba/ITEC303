import 'package:flutter/material.dart';

class LearningStatefulWidgets extends StatefulWidget{
  final String title;
  LearningStatefulWidgets({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HelloFlutter();
  }
}

class HelloFlutter extends State<LearningStatefulWidgets> {
  void _downloadThis() {
    print("Download Button Tapped!");
  }

  int _counter = 0;
  void incrementByOne() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.get_app),
              onPressed: _downloadThis,
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => debugPrint("Search Button Tapped"),
            )
          ],
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      color: Colors.orange,
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      color: Colors.white,
                      width: 50,
                      height: 50,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        color: Colors.red,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      color: Colors.purple,
                      width: 50,
                      height: 50,
                    )
                  ],
                ),
                InkWell(
                  child: Text("Text # 2",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                  onTap: () => debugPrint("Text # 2 Tapped"),
                ),
                Text("$_counter",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 40
                    )),
                CustomizedButton(),
                navigateToFirstPage(),
                RaisedButton(
                  child: Text('Go to Connect Page'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/connectwww');
                  },
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: incrementByOne,
          tooltip: 'Add Button Tooltip',
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.pets),
              title: Text("Pets"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.accessible),
              title: Text("Accessible"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text("Book"),
            ),
          ],
          onTap: (int i) => debugPrint("Button $i Tapped"),
        )
    );
  }
}

class CustomizedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackbar = SnackBar(content: Text("SnackBar using Gesture Detector"));
        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15.0),
        color: Theme.of(context).buttonColor,
        child: Text("Button"),
        width: 100,
      ),
    );
  }
}

class navigateToFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // final snackbar = SnackBar(content: Text("SnackBar using Gesture Detector"));
        // Scaffold.of(context).showSnackBar(snackbar);
        Navigator.of(context).pushNamed('/first', arguments: 'Data from Home Page');
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
        color: Theme.of(context).buttonColor,
        child: Text("Go to First Page"),
        width: 150,
      ),
    );
  }

}