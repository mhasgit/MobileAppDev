import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 7, 107, 189)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ECP Contacts'),
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
  String dropdownValueProvince = 'KP';
  String dropdownValueDistrict = 'Abbottabad';
  String dropdownValuePosition = 'DEC';

  @override
  Widget build(BuildContext context) {
    var Names = ['Zeeshan Khan', 'Ajmal Hafeez', 'Habib-ur-Rehman', 'Muhammad Aslam'];
    var Location = ['Abbottabad', 'Bajour', 'Bannu', 'Battagram'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ECP Contacts', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton<String>(
                        dropdownColor: Colors.blue,
                        value: dropdownValueProvince,

                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueProvince = newValue!;
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 'KP',
                            child: Text('KP', style: TextStyle(color: Colors.white)),
                          ),
                          DropdownMenuItem(
                            value: 'Punjab',
                            child: Text('Punjab', style: TextStyle(color: Colors.white)),
                          ),
                          DropdownMenuItem(
                            value: 'Sindh',
                            child: Text('Sindh', style: TextStyle(color: Colors.white)),
                          ),
                          DropdownMenuItem(
                            value: 'Balochistan',
                            child: Text('Balochistan', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      DropdownButton<String>(
                        dropdownColor: Colors.blue,
                        value: dropdownValueDistrict,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueDistrict = newValue!;
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 'Abbottabad',
                            child: Text('Abbottabad', style: TextStyle(color: Colors.white)),
                          ),
                          DropdownMenuItem(
                            value: 'Bajour',
                            child: Text('Bajour', style: TextStyle(color: Colors.white)),
                          ),
                          DropdownMenuItem(
                            value: 'Bannu',
                            child: Text('Bannu', style: TextStyle(color: Colors.white)),
                          ),
                          DropdownMenuItem(
                            value: 'Battagram',
                            child: Text('Battagram', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton<String>(
                        dropdownColor: Colors.blue,
                        value: dropdownValuePosition,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValuePosition = newValue!;
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 'DEC',
                            child: Text('DEC', style: TextStyle(color: Colors.white)),
                          ),
                          DropdownMenuItem(
                            value: 'SHO',
                            child: Text('SHO', style: TextStyle(color: Colors.white)),
                          ),
                          DropdownMenuItem(
                            value: 'DSP',
                            child: Text('DSP', style: TextStyle(color: Colors.white)),
                          ),
                          DropdownMenuItem(
                            value: 'SP',
                            child: Text('SP', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
  child: ListView.builder(
    itemCount: Names.length,
    itemBuilder: (context, index) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        Names[index],
                        style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'District Election Commissioner',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    Container(
                      width: 240,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Location[index],
                            style: TextStyle(fontSize: 19, color: Colors.black),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            color: Colors.black,
                            child: Text(
                              'DEC',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 5),
                    Icon(Icons.phone, size: 30),
                    SizedBox(height: 5),
                    Icon(Icons.message, size: 30),
                    SizedBox(height: 5),
                    Icon(FontAwesomeIcons.whatsapp, size: 30),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    },
  ),
)

        ],
      ),
    );
  }
}
