import 'package:flutter/material.dart';
import 'package:medicare/screens/cuidador/cuidadorhomescreen.dart';
import 'package:medicare/screens/familiar/familiarhome.dart';
import 'package:medicare/screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _initNotifications() async {
  tz.initializeTimeZones();
  // Ajusta a tu zona real si quieres detectar dinámicamente luego
  tz.setLocalLocation(tz.getLocation('America/Mexico_City'));

  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const DarwinInitializationSettings iosSettings =
      DarwinInitializationSettings();
  const InitializationSettings initSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );
  await flutterLocalNotificationsPlugin.initialize(initSettings);

  // Crear el canal de notificaciones para Android
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'medicare_channel_01', // ID único del canal
    'Recordatorios', // Nombre del canal
    description: 'Canal para recordatorios de medicamentos',
    importance: Importance.max,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initNotifications();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String? sesionIniciada;

  @override
  void initState() {
    super.initState();
    obtenerPreferencias();
  }

  List<Widget> pantallas = [const Homescreen(), const Familiarhome()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: sesionIniciada == null
            ? const Homescreen()
            : sesionIniciada == "Familiares"
            ? const Familiarhome()
            : sesionIniciada == "Cuidadores"
            ? Cuidadorhomescreen()
            : const Homescreen(),
      ),
    );
  }

  Future<void> obtenerPreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      sesionIniciada = prefs.getString("TipoLogin");
    });
  }
}
