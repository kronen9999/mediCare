import 'package:flutter/material.dart';

class ApartadoEstadisticas extends StatefulWidget {
  final String? pacientes;
  final String? cuidadores;
  const ApartadoEstadisticas({
    super.key,
    required this.pacientes,
    required this.cuidadores,
  });

  @override
  State<ApartadoEstadisticas> createState() => _ApartadoEstadisticasState();
}

class _ApartadoEstadisticasState extends State<ApartadoEstadisticas> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 25, right: 25),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(221, 214, 212, 212),
              spreadRadius: .5,
              blurRadius: 8,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromRGBO(79, 172, 196, 1), width: .5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Estadisticas",
                    style: TextStyle(
                      color: Color.fromRGBO(85, 150, 255, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 145,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 238, 253, 1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromRGBO(79, 172, 196, 1),
                        width: .5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            widget.cuidadores.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(85, 150, 255, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Cuidadores",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 121, 120, 120),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 145,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 238, 253, 1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromRGBO(79, 172, 196, 1),
                        width: .5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            widget.pacientes.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(85, 150, 255, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Pacientes",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 121, 120, 120),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
