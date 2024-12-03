import 'package:ejercicio6_salazar/controller/controller_numeros.dart';
import 'package:flutter/material.dart';

class PageMostrarIntermedio extends StatefulWidget {
  final int num1;
  final int num2;

  const PageMostrarIntermedio({
    super.key,
    required this.num1,
    required this.num2,
  });

  @override
  State<StatefulWidget> createState() => PageMostrarIntermedioState();
}

class PageMostrarIntermedioState extends State<PageMostrarIntermedio> {
  late ControllerNumeros _controllerNumeros;
  List<int> _intermedios = [];
  String mensaje = "";

  @override
  void initState() {
    super.initState();
    _controllerNumeros = ControllerNumeros();
    _intermedios = _controllerNumeros.mostrarNumeros(widget.num1, widget.num2);
    mensaje = _intermedios.join(" - ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Números Intermedios'),
        backgroundColor: Colors.teal, // Color del AppBar
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Primer Número: ${widget.num1}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Texto en blanco
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Segundo Número: ${widget.num2}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              if (_intermedios.isNotEmpty)
                Text(
                  'Intermedios: $mensaje',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.teal.shade900, // Texto con un verde más oscuro
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              if (_intermedios.isEmpty)
                const Text(
                  'Los números son iguales',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
