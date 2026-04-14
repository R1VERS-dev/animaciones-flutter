import 'package:flutter/material.dart';

class ExplicitAnimationExample extends StatefulWidget {
  const ExplicitAnimationExample({super.key});

  @override
  ExplicitAnimationExampleState createState() =>
      ExplicitAnimationExampleState();
}

// Aquí uso SingleTickerProviderStateMixin porque el AnimationController necesita sincronizarse con la pantalla
class ExplicitAnimationExampleState extends State<ExplicitAnimationExample>
    with SingleTickerProviderStateMixin {
  // Aquí declaro mi controlador manual y la animación de tamaño
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    // Inicializo mi controlador, diciendo que todo el proceso debe durar 1 segundo
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    // Configuro mi animación para que vaya de 100 a 200 usando una curva suave (easeInOut)
    _sizeAnimation = Tween<double>(
      //el tween lo que hace es interpolar valores entre el begin y el end
      begin: 100,
      end: 200,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Le agrego este listener a mi controlador para forzar a que la pantalla se dibuje (setState) en cada "frame" de la animación
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Es muy importante acordarme de destruir mi controlador cuando ya no lo necesite, sino se consumen recursos innecesarios como comentaba en el video
    _controller.dispose();
    super.dispose();
  }

  // Guardo el estado para saber cuándo está grande o pequeño
  bool _isExpanded = false;

  void _toggleAnimation() {
    // Reviso cómo está actualmente para decidir si corro la animación al derecho o en reversa
    if (_isExpanded) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _isExpanded = !_isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animación Explícita')),
      body: Center(
        // Envuelvo mi caja con GestureDetector para reaccionar y arrancar o regresar la animación
        child: GestureDetector(
          onTap: _toggleAnimation,
          child: Container(
            // Asigno el ancho y alto con los valores que va calculando mi animación
            width: _sizeAnimation.value,
            height: _sizeAnimation.value,
            // También asigno el color base de este contenedor usando mi propio condicional
            color: _isExpanded ? Colors.purple : Colors.red,
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
