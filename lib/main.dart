import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gardenal_tracker/appInfo.dart';
import 'package:gardenal_tracker/doseCard.dart';
import 'package:gardenal_tracker/doseGardenalDao.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gardenal Tracker',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: Color(0xFFF4F4F4),
        primaryColor: Color(0xFFF4F4F4),
        accentColor: Color(0xFF3F8CCB),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      home: MyHomePage(title: 'Gardenal Tracker'),
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
  final db = DoseGardenalDao.instance;
  List<Map<String, dynamic>> doses = [];

  @override
  void initState() {
    super.initState();
    getAll();
  }

  getCurrentDate() {
    return DateFormat('dd/MM').format(DateTime.now());
  }

  Future<void> getAll() async {
    var resp = await db.queryAllRowsDesc();
    setState(() {
      doses = resp;
    });
  }

  Future<void> adicionarDose() async {
    Map<String, dynamic> row = {
      DoseGardenalDao.columnDiaDose: getCurrentDate().toString(),
    };
    final id = await db.insert(row);
    getAll();
  }

  Future<void> _delete(int id) async {
    final deleted = await db.delete(id);
    getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => AppInfo(),
                  fullscreenDialog: true,
                ));
          }, icon: Icon(Icons.info_outline_rounded))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: doses.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1.15,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return DoseCard(
                    key: UniqueKey(),
                    delete: _delete,
                    diaDose: doses[index]['diaDose'],
                    id: doses[index]['id'],
                  );
                }),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: FloatingActionButton.extended(
          onPressed: () {
            adicionarDose();
          },
          backgroundColor: Colors.blue[700],
          label: Text('Adicionar Dose Diária',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
          icon: Icon(Icons.add,size: 25,),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
