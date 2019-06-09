import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "App Aula 01 - Contadores", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode entrar!";
  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if (_people < 0) {
        _infoText = "Hotel vazio, não há pessoas para sair";
        _people++;
      } else if (_people == 0) {
        _infoText = "Hotel vazio, pode entrar!";
      } else if (_people > 10) {
        _infoText = "Hotel cheio!";
        _people--;
      } else {
        _infoText = "Pode entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      SizedBox.expand(
          child: Image.asset(
        "images/hotel.jpg",
        color: Color.fromRGBO(255, 255, 255, 0.5),
        colorBlendMode: BlendMode.modulate,
        fit: BoxFit.fill,
      )),
      Padding(
        padding: EdgeInsets.all(60.0),
        child: Text("Hotel Tama",
        style: TextStyle(color: Colors.white),)
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Pessoas: $_people",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text("-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white)),
                  onPressed: () {
                    _changePeople(-1);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text("+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white)),
                  onPressed: () {
                    _changePeople(1);
                  },
                ),
              ),
            ],
          ),
          Text(
            _infoText,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 15.0),
          )
        ],
      ),
    ]);
  }
}
