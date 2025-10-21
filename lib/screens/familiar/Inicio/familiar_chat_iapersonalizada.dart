import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FamiliarChatIapersonalizada extends StatefulWidget {
  const FamiliarChatIapersonalizada({super.key});

  @override
  State<FamiliarChatIapersonalizada> createState() =>
      _FamiliarChatIapersonalizadaState();
}

class _FamiliarChatIapersonalizadaState
    extends State<FamiliarChatIapersonalizada>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void empezarHablar() {
    _controller.duration = Duration(seconds: 2);
    _controller.repeat();
  }

  void dejarDeHablar() {
    _controller.stop();
  }

  void hablarPorFrames(
    int frameInicio,
    int frameFin, {
    Duration? fragmentDuration,
  }) {
    final dur = _controller.duration;
    if (dur == null) return;
    const totalFrames = 82; // Tu animación tiene 82 frames
    final start = frameInicio / totalFrames;
    final end = frameFin / totalFrames;

    // Duración del fragmento (por defecto 1 segundo si no se pasa)
    final duration = fragmentDuration ?? Duration(seconds: 1);

    _controller.stop();
    _controller.duration = duration;
    _controller.value = start;
    _controller.repeat(min: start, max: end, reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MediCare bot",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            repeat: true,
            reverse: true,
            'assets/images/circle.json',
            controller: _controller,
            width: 300,
            height: 300,
            fit: BoxFit.fill,
            onLoaded: (composition) {
              _controller.duration = composition.duration;
              _controller.stop();
            },
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: empezarHablar, child: Text("Hablar")),
              const SizedBox(width: 16),
              ElevatedButton(onPressed: dejarDeHablar, child: Text("Callar")),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  // Hablar por 3 segundos y luego detener
                  hablarPorFrames(
                    48,
                    82,
                    fragmentDuration: Duration(milliseconds: 900),
                  );
                },
                child: Text("Hablar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
