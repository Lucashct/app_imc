import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
    title: 'IMCapp',
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _pesoControl = TextEditingController();
  final TextEditingController _alturaControl = TextEditingController();
  String _result = 'Informe seus dados';
  double _resultado = 0.0;

  void calcularIMC() {
    setState(() {
      double peso = double.parse(_pesoControl.text);
      double altura = double.parse(_alturaControl.text);

      _resultado = peso / (altura * altura);

      if (_resultado < 18.6) {
        _result = 'Abaixo do Peso';
        _pesoControl.text = '';
        _alturaControl.text = '';
      } else if (_resultado >= 18.6 && _resultado <= 24.9) {
        _result = 'Peso ideal';
        _pesoControl.text = '';
        _alturaControl.text = '';
      } else if (_resultado >= 25 && _resultado <= 29.9) {
        _result = 'Levemente acima do peso';
        _pesoControl.text = '';
        _alturaControl.text = '';
      } else if (_resultado >= 30 && _resultado <= 34.9) {
        _result = 'Obesidade grau I';
        _pesoControl.text = '';
        _alturaControl.text = '';
      } else if (_resultado >= 35 && _resultado <= 39.9) {
        _result = 'Obesidade grau II';
        _pesoControl.text = '';
        _alturaControl.text = '';
      } else {
        _result = 'Obesidade grau II';
        _pesoControl.text = '';
        _alturaControl.text = '';
      }
      debugPrint(_result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(13),
          children: [
            Center(
              child: Image.asset(
                'assets/pessoa.png',
                width: 100,
                height: 100,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _pesoControl,
                    decoration: InputDecoration(
                      hintText: 'Peso(Kg)',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _alturaControl,
                    decoration: InputDecoration(hintText: 'Altura(cm)'),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: RaisedButton(
                onPressed: calcularIMC,
                child: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 18),
                ),
                color: Colors.greenAccent,
              ),
            ),
            Center(
              child: Text(
                '$_result(${_resultado.toStringAsPrecision(4)})',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
            )
          ],
        ),
      ),
    );
  }
}
