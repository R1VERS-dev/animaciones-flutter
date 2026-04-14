import 'package:animaciones/animaciones/explicitas_screen/explicita_animation_example.dart';
import 'package:flutter/material.dart';
import 'package:animaciones/animaciones/implicitas_screen/implicita_animation_example.dart';
//Hice los imports para poder usar las clases de los otros archivos

void main() {
  // Aquí arranco mi aplicación principal
  runApp(AnimacionesAPP());
}

class AnimacionesAPP extends StatelessWidget {
  const AnimacionesAPP({super.key});

  @override
  Widget build(BuildContext context) {
    // Aquí configuro el MaterialApp para establecer el título, el tema y la ruta inicial
    return MaterialApp(
      title: 'Demo Animaciones',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animaciones en Flutter')),
      // Centro los botones en la pantalla para la navegación
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Este botón me navega a la pantalla de la animación implícita
            ElevatedButton(
              child: const Text('Animación Implícita'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImplicitaAnimationExample(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            // Y este otro botón me sirve para ir a ver la animación explícita en acción
            ElevatedButton(
              child: const Text('Animación Explícita'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExplicitAnimationExample(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
