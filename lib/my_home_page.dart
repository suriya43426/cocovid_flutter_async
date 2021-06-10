import 'package:covid19/stat_box.dart';
import 'package:flutter/material.dart';
import 'covid_today_result.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get http => null;

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
              padding: EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 15.0),
              child: ListView(
                children: [
                  StatBox(
                    title: 'ยอดผู้ติดเชื้อ',
                    total: result?.confirmed,
                    backgroundColor: Colors.red,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  StatBox(
                    title: 'ยอดหายแล้ว',
                    total: result?.recovered,
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  StatBox(
                    title: 'ยอดผู้กำลังรักษา',
                    total: result?.hospitalized,
                    backgroundColor: Colors.lightBlue,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  StatBox(
                    title: 'ยอดผู้เสียชีวิต',
                    total: result?.deaths,
                    backgroundColor: Colors.black87,
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
