import 'package:flutter/material.dart';
import 'page_mostrar_intermedio.dart';

class PageIngresarDatos extends StatelessWidget {
  final TextEditingController _controllerNum1 = TextEditingController();
  final TextEditingController _controllerNum2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingresar Datos'),
        backgroundColor: Colors.teal, // Color del AppBar
        centerTitle: true, // Centrar título
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.format_list_numbered,
                size: 50,
                color: Colors.white, // Icono más grande y de color blanco
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _controllerNum1,
                decoration: InputDecoration(
                  labelText: 'Primer Número',
                  labelStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.numbers, color: Colors.white),
                  filled: true,
                  fillColor: Colors.teal.shade700.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _controllerNum2,
                decoration: InputDecoration(
                  labelText: 'Segundo Número',
                  labelStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.numbers, color: Colors.white),
                  filled: true,
                  fillColor: Colors.teal.shade700.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (int.tryParse(_controllerNum1.text.trim()) != null &&
                      int.tryParse(_controllerNum2.text.trim()) != null) {
                    int num1 = int.tryParse(_controllerNum1.text.trim()) ?? 0;
                    int num2 = int.tryParse(_controllerNum2.text.trim()) ?? 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageMostrarIntermedio(
                          num1: num1,
                          num2: num2,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Datos incorrectos o incompletos'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade700, // Botón verde oscuro
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15), // Tamaño del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Calcular Edad',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
