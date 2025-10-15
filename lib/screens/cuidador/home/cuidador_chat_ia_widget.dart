import 'package:flutter/material.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class CuidadorChatIaWidget extends StatefulWidget {
  final void Function(String) onSelect;
  const CuidadorChatIaWidget({super.key, required this.onSelect});

  @override
  State<CuidadorChatIaWidget> createState() => _CuidadorChatIaWidgetState();
}

class _CuidadorChatIaWidgetState extends State<CuidadorChatIaWidget> {
  String apiKey = "AIzaSyCM33Yp8GuE9x250w1_bK1jXxSnDb0F4b4";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Chat bot medico",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
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
      body: LlmChatView(
        suggestions: const [
          "He estado mareado últimamente. ¿Qué debo hacer?",
          "¿Cómo sé si necesito ver a un médico?",
          "¿Qué debo comer para fortalecer mi sistema inmunológico?",
        ],
        style: LlmChatViewStyle(
          backgroundColor: Colors.white,
          chatInputStyle: ChatInputStyle(
            hintText: "Ingresa tu mensaje",
            decoration: const BoxDecoration().copyWith(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        provider: GeminiProvider(
          model: GenerativeModel(
            model: "gemini-2.0-flash",
            apiKey: apiKey,
            systemInstruction: Content.system(
              "You are a professional medical health assistant.You will respond in Spanish or english language, Only respond to health and medically related questions and make them concise and straight to the point without too much explanation."
              "If a question is unrelated to health or medicine, politely inform the user that you can only answer medical-related queries.",
            ),
          ),
        ),
        welcomeMessage:
            "Hola, soy MediBot, tu asistente de salud. ¿En qué puedo ayudarte hoy?",
      ),
    );
  }
}
