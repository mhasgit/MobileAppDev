import 'package:flutter/material.dart';
import 'services/database_service.dart';

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
  final databaseService = DatabaseService();
  List<Map<String, dynamic>> students = [];
  TextEditingController tcRegNo = TextEditingController();
  TextEditingController tcName = TextEditingController();
  TextEditingController tcCellNo = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Reg. No."),
              controller: tcRegNo,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Name"),
              controller: tcName,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Cell No"),
              controller: tcCellNo,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: addRecord, child: Text("Save")),
                ElevatedButton(onPressed: fetchData, child: Text("Refresh Data")),
              ],
            ),
            Expanded(child: StudentsList(students: students)),
          ],
        ),
      ),
    );
  }

  void addRecord() async {
    if (tcRegNo.text.isEmpty || tcName.text.isEmpty || tcCellNo.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    await databaseService.addStudent(tcRegNo.text, tcName.text, tcCellNo.text);
    tcRegNo.clear();
    tcName.clear();
    tcCellNo.clear();
    fetchData();
  }

  void fetchData() async {
    final data = await databaseService.getStudents();
    setState(() {
      students = data;
    });
  }
}

class StudentsList extends StatelessWidget {
  final List<Map<String, dynamic>> students;

  const StudentsList({Key? key, required this.students}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (students.isEmpty) {
      return Center(child: Text('No students found.'));
    }

    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return ListTile(
          title: Text(student['name']),
          subtitle: Text('Reg No: ${student['reg_no']}, Cell No: ${student['cell_no']}'),
        );
      },
    );
  }
}
