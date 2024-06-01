import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mobile App Development'),
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
  TextEditingController tcName = TextEditingController();
  TextEditingController tcCellNo = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              child: TextField(controller: tcName, decoration: InputDecoration(labelText: 'Name')),
            ),
            Container(
              width: 200,
              height: 80,
              child: TextField(controller: tcCellNo, decoration: InputDecoration(labelText: 'Cell No')),
            ),
            ElevatedButton(onPressed: saveData, child: Text('Save')),
            // SizedBox(height: 80,),
            // ElevatedButton(onPressed: getData, child: Text('Get'))
          ],
        ),
      ),
    );
  }

  // Show success message
  void showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data successfully added'))
    );
  }

  // Data Persistence
  void saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('name', tcName.text);
    await preferences.setString('cellNo', tcCellNo.text);

    tcName.clear();
    tcCellNo.clear();

    showSuccessMessage();

  }

  void getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? name = await preferences.getString('name');
    tcName.text = name ?? '';

    String? cellNo = await preferences.getString('cellNo');
    tcCellNo.text = cellNo ?? '';

    setState(() {
    });
  }
  //GridView
  Widget BasicWidget02(){
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      children: [
        Container(
            width: 100,
            height: 100,
            color: Colors.yellowAccent,
            margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            child: Text('Hello', style: TextStyle(color: Colors.blueAccent) )),
        Container(
            width: 100,
            height: 100,
            color: Colors.yellowAccent,
            margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            child: Text('Hello', style: TextStyle(color: Colors.blueAccent),)),
        Container(
            width: 100,
            height: 100,
            color: Colors.yellowAccent,
            margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            child: Text('Hello', style: TextStyle(color: Colors.blueAccent),)),
        Container(
            width: 100,
            height: 100,
            color: Colors.yellowAccent,
            margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            child: Text('Hello', style: TextStyle(color: Colors.blueAccent),)),
        Container(
            width: 100,
            height: 100,
            color: Colors.yellowAccent,
            margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            child: Text('Hello', style: TextStyle(color: Colors.blueAccent),)),
        Container(
            width: 100,
            height: 100,
            color: Colors.yellowAccent,
            margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            child: Text('Hello', style: TextStyle(color: Colors.blueAccent),)),
        Container(
            width: 100,
            height: 100,
            color: Colors.yellowAccent,
            margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            child: Text('Hello', style: TextStyle(color: Colors.blueAccent),))
      ],
    );
  }

  // ListView.Builder
  Widget BaiscWidget01(){
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) =>
            Container(width: 50, height: 50, color: Colors.green,
                child: Center(child: Text("Hello $index"))
            )
    );
  }
}