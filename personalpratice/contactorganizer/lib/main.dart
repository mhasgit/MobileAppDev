import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(ECPContactsApp());
}

class ECPContactsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactsScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  String selectedProvince = 'KPK';
  String selectedPosition = 'DEC';
  String selectedDistrict = '[DISTRICT]';

  final List<String> names = ['Zeeshan Khan', 'Ajmal Hafeez', 'Habib-ur-Rehman', 'Muhammad Aslam', 'Riaz Ahmed', 'Najeeb Ullah'];
  final List<String> position = ['District Election Commissioner', 'Deputy Commissioner', 'Assistant Commissioner', 'Tehsil Municipal Officer', 'District Police Officer', 'Station House Officer'];
  final List<String> area = ['Abbottabad', 'Bajour', 'Bannu', 'Battagram', 'Hangu', 'Malakand'];
  final List<String> districts = ['[DISTRICT]', 'Lahore', 'Karachi', 'Islamabad', 'Peshawar', 'Quetta', 'Multan'];
  final List<String> provinces = ['Punjab', 'Sindh', 'KPK', 'Balochistan', 'Gilgit-Baltistan', 'Azad Kashmir'];
  final List<String> personPosition = ['DEC', 'DPO', 'DRO', 'DCO', 'SHO', 'DSP'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ECP Contacts',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.blueAccent,
            child: Row(
              children: [
                Expanded(
                  child: getDropdown(selectedProvince, provinces, (newValue) {
                    setState(() {
                      selectedProvince = newValue!;
                    });
                  }),
                ),
                SizedBox(width: 10), // Adjust the spacing as needed
                Expanded(
                  child: getDropdown(selectedPosition, personPosition, (newValue) {
                    setState(() {
                      selectedPosition = newValue!;
                    });
                  }),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blueAccent,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: getDropdown(selectedDistrict, districts, (newValue) {
                    setState(() {
                      selectedDistrict = newValue!;
                    });
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                names[index],
                                style: TextStyle(fontSize: 19, color: Colors.black),
                              ),
                              Text(
                                position[index],
                                style: TextStyle(fontSize: 19, color: Colors.black),
                              ),
                              Container(
                                width: 280,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      area[index],
                                      style: TextStyle(fontSize: 19, color: Colors.black),
                                    ),
                                    Container(
                                      width: 30,
                                      color: Colors.black,
                                      child: Text(
                                        personPosition[index],
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.phone, size: 20),
                                onPressed: () => print('Opening Phone'),
                              ),
                              IconButton(
                                icon: Icon(Icons.message, size: 20),
                                onPressed: () => print('Opening Message App'),
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.whatsapp, size: 20),
                                onPressed: () => print('Opening Whatsapp'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getDropdown(String userValue, List<String> userItems, ValueChanged<String?> onChanged) {
    return DropdownButton<String>(
      value: userValue,
      dropdownColor: Colors.blueAccent,
      style: TextStyle(color: Colors.white),
      items: userItems.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
