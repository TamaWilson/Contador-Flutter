import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.7,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Text(
                isFull ? "Lotado" : "Pode entrar!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 5
                    ..color = Colors.black,
                ),
              ),
              Text(
                isFull ? "Lotado!" : "Pode entrar!",
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ]),
            Padding(
                padding: const EdgeInsets.all(40),
                child: Stack(
                  children: [
                    Text(
                      '$count',
                      style: TextStyle(
                        fontSize: 100,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 5
                          ..color = isFull ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      '$count',
                      style: TextStyle(
                          fontSize: 100,
                          color: isFull ? Colors.red : Colors.white),
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: isEmpty ? null : decrement,
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: isEmpty
                            ? Colors.white.withOpacity(0.5)
                            : Colors.white,
                        fixedSize: const Size(100, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24))),
                    child: const Text(
                      "Saiu",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                    onPressed: isFull ? null : increment,
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: isFull
                            ? Colors.white.withOpacity(0.5)
                            : Colors.white,
                        fixedSize: const Size(100, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24))),
                    child: const Text(
                      "Entrou",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
