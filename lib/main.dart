import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid19/covid_today_result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CovidTodayResult? _dataFromWebAPI;
  int _counter = 0;

  @override
  void iniState() {
    super.initState();
    print('init');
  }

  Future<void> getData() async {
    var url = Uri.parse(
        'https://covid19.th-stat.com/json/covid19v2/getTodayCases.json');
    var response = await http.get(url);
    setState(() {
      _dataFromWebAPI = covidTodayResultFromJson(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    var indicator;
    if (_dataFromWebAPI == null) {
      indicator = LinearProgressIndicator();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          indicator ?? Container(),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('ผู้ติดเชื้อ'),
                  subtitle: Text('${_dataFromWebAPI?.confirmed ?? '....'}'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
