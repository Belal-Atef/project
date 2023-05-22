import 'package:flutter/material.dart';
import 'package:proximity_sensor/proximity_sensor.dart';

void main() => runApp(App());



class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 6',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(title: 'Task 6'),
    );
  }
}



class HomePage extends StatefulWidget {
  HomePage({required this.title}) : super();

  String title;

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  bool _isObjectNear = true;

  @override
  void initState() {
    super.initState();
    ProximitySensor.events.listen((event) {
      setState(() {
        _isObjectNear = event == 0; 
      });
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Task 6'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 168,
            height: 168,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isObjectNear ? Colors.red : Colors.green,
            ),
          ),
          SizedBox(height: 16),
          Text(
            _isObjectNear ? 'Object is at a distance' : 'Object is nearby',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ),
  );
}

}
