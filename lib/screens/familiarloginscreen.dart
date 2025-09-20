import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Familiarloginscreen extends StatefulWidget {
  const Familiarloginscreen({super.key});

  @override
  State<Familiarloginscreen> createState() => _FamiliarloginscreenState();
}

class _FamiliarloginscreenState extends State<Familiarloginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    "assets/images/heart.svg",
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "MediCare",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 150),
            ],
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(31, 21, 93, 252),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Icon(
                    Icons.people_outline,
                    color: Color.fromARGB(255, 21, 93, 252),
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
