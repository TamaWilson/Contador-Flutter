import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode entrar!";

  Color _baseColor = kIsWeb ? Colors.black : Colors.white;

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
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("images/hotel.jpg",
          fit: BoxFit.fitHeight,
          color: Color.fromRGBO(255, 255, 255, 0.5),
          colorBlendMode: BlendMode.modulate,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(60.0),
                child: Text("Hotel Tama",
                  style: TextStyle(color: _baseColor),)
            ),
            Text(
              "Pessoas: $_people",
              style: TextStyle(color: _baseColor, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0),
                  child:   TextButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: _baseColor),
                    ),
                    onPressed: (){_changePeople(1);},
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0),
                  child:   TextButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: _baseColor),
                    ),
                      onPressed: (){_changePeople(-1);}
                  ),
                ),
              ],
            ),
            SelectableText(
              _infoText,
              style: TextStyle(
                  color: _baseColor,
                  fontStyle: FontStyle.italic,
                  fontSize: 15.0),
            ),
          ],
        )
      ],
    );
  }
}
