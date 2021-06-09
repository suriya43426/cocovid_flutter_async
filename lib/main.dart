import 'package:covid19/stat_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      debugShowCheckedModeBanner: false,
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
  void iniState() {
    super.initState();
    print('init');
  }

  Future<CovidTodayResult> getData() async {
    var url = Uri.parse(
        'https://covid19.th-stat.com/json/covid19v2/getTodayCases.json');
    var response = await http.get(url);
    var result = covidTodayResultFromJson(response.body);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getData(),
        builder:
            (BuildContext context, AsyncSnapshot<CovidTodayResult> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var result = snapshot.data;
            return Padding(
              padding: EdgeInsets.fromLTRB(8.0,15.0,8.0,15.0),
              child: ListView(
                children: [
                  StatBox(title:'ยอดผู้ติดเชื้อ',total: result?.confirmed, backgroundColor: Colors.red),
                  SizedBox(height: 12,),
                  StatBox(title:'ยอดหายแล้ว',total: result?.recovered, backgroundColor: Colors.green),
                  SizedBox(height: 12,),
                  StatBox(title:'ยอดผู้กำลังรักษา',total: result?.hospitalized, backgroundColor: Colors.lightBlue),
                  SizedBox(height: 12,),
                  StatBox(title:'ยอดผู้เสียชีวิต',total: result?.deaths, backgroundColor: Colors.black87),
                  SizedBox(height: 12,),
                  ListTile(
                      title: Text(
                        'ผู้ติดเชื้อ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text('${result?.confirmed ?? '....'}')),
                  ListTile(
                    title: Text('ผู้ติดเชื้อ'),
                    subtitle: Text('${result?.confirmed ?? '....'}'),
                  ),
                  ListTile(
                    title: Text('ผู้ติดเชื้อ'),
                    subtitle: Text('${result?.confirmed ?? '....'}'),
                  ),
                  ListTile(
                    title: Text('ผู้ติดเชื้อ'),
                    subtitle: Text('${result?.confirmed ?? '....'}'),
                  ),
                ],
              ),
            );
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
