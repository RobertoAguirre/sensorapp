import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const platform = MethodChannel('com.example.sensor_app/beacon');

  @override
  void initState() {
    super.initState();
    _initializeMTCentralManager();
  }

  Future<void> _initializeMTCentralManager() async {
    try {
      final String result = await platform.invokeMethod('initializeMTCentralManager');
      print(result);
    } on PlatformException catch (e) {
      print("Failed to initialize MTCentralManager: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BeaconPlus Demo'),
      ),
      body: Center(
        child: Text('BeaconPlus Example'),
      ),
    );
  }
}
