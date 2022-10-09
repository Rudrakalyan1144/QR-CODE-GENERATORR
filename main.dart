// QR code Generator
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  //const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _editingController=TextEditingController(text: 'qrgenerate');
  String data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('QR CODE GENETATOR')),
      body:Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(contentPadding: EdgeInsets.all(10)),
              controller:_editingController,
            ),
            RaisedButton(
                onPressed: (){
                  setState(() {
                    data= _editingController.text;
                  });
                },
              child: Text('Generate QR'),
            ),
            Center(
              child: QrImage(
                data: '$data',
                version: QrVersions.auto,
                size: 400,
                ),
            )
          ]),
      ) ));
  }
} 