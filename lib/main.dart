import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NGVP Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int firstnum;
  late int secondnum;
  String history = "";
  String texttodisplay = "";
  late String res;
  late String operatortoperform;

  void btnclicked(String btnval) {
    if (btnval == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (btnval == "AC") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
      history = "";
    } else if (btnval == "+/-") {
      if (texttodisplay[0] != "-") {
        res = "-" + texttodisplay;
      } else {
        res = texttodisplay.substring(1);
      }
    } else if (btnval == "DEL") {
      res = texttodisplay.substring(0, texttodisplay.length - 1);
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
        history = firstnum.toString() +
            operatortoperform.toString() +
            secondnum.toString();
      }
      if (operatortoperform == "-") {
        res = (firstnum - secondnum).toString();
        history = firstnum.toString() +
            operatortoperform.toString() +
            secondnum.toString();
      }
      if (operatortoperform == "x") {
        res = (firstnum * secondnum).toString();
        history = firstnum.toString() +
            operatortoperform.toString() +
            secondnum.toString();
      }
      if (operatortoperform == "/") {
        res = (firstnum ~/ secondnum).toString();
        history = firstnum.toString() +
            operatortoperform.toString() +
            secondnum.toString();
      }
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnclicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
              fontSize: 25.0, color: Color.fromARGB(255, 255, 102, 0)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NGVP-Calculator',
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$history",
                  style: TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton("AC"),
                custombutton("DEL"),
                custombutton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("+/-"),
                custombutton("0"),
                custombutton("00"),
                custombutton("="),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
