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
  String? mensaje;
  bool primeraInteraccion = false;
  late final AnimationController _controller;
  late final TextEditingController mensajeController;
  // Lista de mensajes de ejemplo
  final List<String> mensajes = [
    "Hola, ¿en qué puedo ayudarte?",
    "¿Tienes alguna pregunta sobre tu salud?",
    "Recuerda tomar tus medicamentos a tiempo.",
    "Estoy aquí para asistirte con cualquier duda.",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    mensajeController = TextEditingController();
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
      body: SafeArea(
        child: Column(
          children: [
            if (!primeraInteraccion)
              Column(
                children: [
                  Center(
                    child: Lottie.asset(
                      repeat: true,
                      reverse: true,
                      'assets/images/circle.json',
                      controller: _controller,
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                      onLoaded: (composition) {
                        _controller.duration = composition.duration;
                        _controller.repeat();
                      },
                    ),
                  ),
                  Text(
                    "Hola soy medibot tu asistente virtual👋\n¿En que te puedo ayudar hoy?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ],
              )
            else
              const SizedBox(height: 24),
            // Área de mensajes scrollable
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: mensajes.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: index % 2 == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Colors.grey[200]
                            : Colors.blue[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        mensajes[index],
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Input fijo abajo
            Padding(
              padding: EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: MediaQuery.of(context).viewInsets.bottom + 8,
                top: 8,
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: .5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(Icons.image_outlined, color: Colors.blue),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: .5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(Icons.mic_none_outlined, color: Colors.blue),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: .5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  mensaje = value;
                                });
                              },
                              controller: mensajeController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                hintText: "Escribe tu mensaje...",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.send, color: Colors.blue),
                            onPressed: () {
                              // Acción de enviar mensaje
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
