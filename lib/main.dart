import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tägliche Wasserzufuhr',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 20, 54, 204)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Täglicher Wasserstand'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _waterIntake = 0;
  List<Widget> _waterDrops = []; // Liste für die Wassertropfen

  void _incrementWaterIntake() {
    setState(() {
      _waterIntake += 250;

      // Einen neuen Wassertropfen hinzufügen
      _waterDrops.add(Positioned(
        top: 20.0 + _waterDrops.length * 30.0, // Dynamische Positionierung
        left:
            50.0 + (_waterDrops.length % 3) * 30.0, // Verschiebung nach rechts
        child: Icon(
          Icons.water_drop,
          color: Colors.blue,
          size: 30.0,
        ),
      ));
    });
  }

  void _resetWaterIntake() {
    setState(() {
      _waterIntake = 0;
      _waterDrops.clear(); // Alle Wassertropfen entfernen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Deine tägliche Wasseraufnahme:'),
                Text(
                  '$_waterIntake ml',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _resetWaterIntake,
                  child: const Text('Zurücksetzen'),
                ),
              ],
            ),
          ),
          ..._waterDrops, // Die Tropfen im Stack anzeigen
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementWaterIntake,
        tooltip: 'Wasser hinzufügen',
        child: const Icon(Icons.add),
      ),
    );
  }
}
