import 'package:animated_state_loader/animated_state_loader.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  AnimationType _currentAnimationType = AnimationType.loading;

  void _incrementCounter() async {
    setState(() {
      _counter += 1;
      _currentAnimationType = AnimationType.loading;
    });

    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {
      _currentAnimationType =
          _counter % 2 == 0 ? AnimationType.success : AnimationType.error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedStateLoader(
      size: 60,
      animationType: _currentAnimationType,
      content: Text(
        _currentAnimationType == AnimationType.loading
            ? 'Loading...'
            : (_counter % 2 == 0)
                ? 'Success'
                : 'Failure',
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
