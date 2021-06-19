import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Currency convertor Application',
    home: Converter(),
  ));
}

class Converter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConverterState();
  }
}

class ConverterState extends State<Converter> {
  var selectedVal = 'Dollar';
  var currencyType = ['Dollar', 'Pound'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Convertor'),
      ),
      body: Form(
        child: ListView(
          children: [
            // Currency Edit Field - First (1) element ------------------------
            Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (val) {},
                  decoration: InputDecoration(
                      labelText: 'Rupees',
                      hintText: 'Enter Rupees',
                      border: OutlineInputBorder()),
                )),
            // Dropdown field - Second (2) element ------------------------
            Padding(
              padding: EdgeInsets.all(20.0),
              child: DropdownButton(
                // isExpanded: true,
                value: selectedVal,
                onChanged: (val) {
                  setState(() {
                    selectedVal = val;
                  });
                },
                items: currencyType.map((val) {
                  return DropdownMenuItem(child: Text(val), value: val);
                }).toList(),
              ),
            ),
            // Button - Third (3) element ------------------------
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 40.0,
                child: ElevatedButton(
                  child: Text(
                    'Convert',
                    style: TextStyle(fontSize: 19.0),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            // Result Text Field - Fourth (4) element ------------------------
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Result',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            // Image - Fifth (5) element ------------------------
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 180.0,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
