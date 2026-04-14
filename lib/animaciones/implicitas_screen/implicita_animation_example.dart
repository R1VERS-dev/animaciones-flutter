import 'package:flutter/material.dart';

class ImplicitaAnimationExample extends StatefulWidget {
  const ImplicitaAnimationExample({super.key});

  @override
  State<ImplicitaAnimationExample> createState() =>
      ImplicitaAnimationExampleState();
}

class ImplicitaAnimationExampleState extends State<ImplicitaAnimationExample> {
  // Aquí declaro un estado para controlar si la caja está grande (true) o pequeña (false)
  bool _big = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animación Implícita')),
      body: Center(
        // Uso un GestureDetector para detectar cuándo toco la caja y desencadenar el cambio de estado
        child: GestureDetector(
          onTap: () {
            // Actualizo mi variable _big haciendo que alterne su valor
            setState(() {
              _big = !_big;
            });
          },
          // Este AnimatedContainer hace todo el trabajo de animación por mí usando la duración que establecí
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            // Dependiendo de si "_big" es verdadero o falso, asigno estos tamaños y colores
            width: _big ? 200 : 100,
            height: _big ? 200 : 100,
            color: _big ? Colors.blue : Colors.orange,
            child: Center(
              child: Text(
                'Toca aquí',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
