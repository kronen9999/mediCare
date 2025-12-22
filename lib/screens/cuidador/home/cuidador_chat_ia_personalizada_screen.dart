import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/models/familiares/familiares_chatbot.dart';
import 'package:medicare/repositories/familiares/familiares_reposotory_global.dart';

class CuidadorChatIaPersonalizadaScreen extends StatefulWidget {
  final String? idCuidador;
  final void Function(String) onSelect;
  const CuidadorChatIaPersonalizadaScreen({
    super.key,
    required this.idCuidador,
    required this.onSelect,
  });

  @override
  State<CuidadorChatIaPersonalizadaScreen> createState() =>
      _CuidadorChatIaPersonalizadaScreenState();
}

class _CuidadorChatIaPersonalizadaScreenState
    extends State<CuidadorChatIaPersonalizadaScreen>
    with SingleTickerProviderStateMixin {
  String? mensaje;
  bool primeraInteraccion = false;
  late final AnimationController _controller;
  late final TextEditingController mensajeController;
  // Lista de mensajes de ejemplo
  final List<String> mensajes = [];

  bool mensajeEspera = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    mensajeController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    mensajeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Medibot",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                widget.onSelect("default");
              },
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Animación y mensaje inicial
            Center(
              child: Lottie.asset(
                repeat: true,
                reverse: true,
                'assets/images/aicuidador.json',
                controller: _controller,
                width: 200,
                height: 200,
                frameRate: FrameRate.max,
                fit: BoxFit.fill,
                onLoaded: (composition) {
                  _controller.duration = composition.duration;
                  _controller.forward();
                  Future.delayed(Duration(seconds: 2), () {
                    if (!mounted) return;
                    _controller.stop();
                  });
                },
              ),
            ),
            if (!primeraInteraccion)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    "Hola soy medibot tu asistente virtual👋\n¿En que te puedo ayudar hoy?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ),
              ),
            // Área de mensajes fija
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
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Colors.green[100]
                            : Colors.transparent,
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
            // Área de entrada fija
            Padding(
              padding: EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: MediaQuery.of(context).viewInsets.bottom + 8,
                top: 8,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: .5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(Icons.image_outlined, color: Colors.green),
                      ),
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
                      child: Icon(Icons.mic_none_outlined, color: Colors.green),
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
                            icon: Icon(Icons.send, color: Colors.green),
                            onPressed: () {
                              if (!mensajeEspera) {
                                enviarMensaje();
                              }
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

  void enviarMensaje() async {
    String? mensajeChat = mensaje;
    final fechaActual = DateTime.now();
    final fechaFormateada =
        "${fechaActual.year}-${fechaActual.month.toString().padLeft(2, '0')}-${fechaActual.day.toString().padLeft(2, '0')} ${fechaActual.hour.toString().padLeft(2, '0')}:${fechaActual.minute.toString().padLeft(2, '0')}:${fechaActual.second.toString().padLeft(2, '0')}";
    if (mensaje != null && mensaje!.trim().isNotEmpty) {
      setState(() {
        mensajes.add(mensaje!.trim());
        mensajes.add('Dame un segundo estoy trabajando en tu solicitud...');
        mensajeEspera = true;
        mensajeController.clear();
        mensaje = null;
        primeraInteraccion = true;
      });
      try {
        final repo = FamiliaresReposotoryGlobal();
        final respuesta = await repo.envioMensaje(
          FamiliaresChatbot(
            idUsuario: widget.idCuidador ?? '',
            mensaje: mensajeChat ?? "",
            fechaActual: fechaFormateada,
            tipoUsuario: "cuidador",
          ),
        );
        if (!mounted) return;
        recibirRespuesta(respuesta.response);
      } catch (e) {
        if (!mounted) return;
        recibirRespuesta(
          "Parece que ha habido un error al procesar tu solicitud. Por favor intenta de nuevo o verifica tu conexión a internet.",
        );
      }
    }
  }

  void recibirRespuesta(String respuesta) {
    setState(() {
      final lastIndex = mensajes.length - 1;
      if (lastIndex >= 0 &&
          mensajes[lastIndex] ==
              'Dame un segundo estoy trabajando en tu solicitud...') {
        mensajes[lastIndex] = respuesta;
      } else {
        mensajes.add(respuesta);
      }
      mensajeEspera = false;
    });
  }
}
