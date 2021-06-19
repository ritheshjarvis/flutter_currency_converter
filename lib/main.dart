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
  var _formKey = GlobalKey<FormState>();
  var result = '';

  TextEditingController rupeesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            // Currency Edit Field - First (1) element ------------------------
            Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: rupeesController,
                  validator: (val) {
                    val = val.trim().replaceAll(' ', '');
                    if (val.isEmpty || val == null) {
                      return 'Enter Rupees';
                    } else if (val.contains(',') || val.contains('-')) {
                      return 'Enter Rupees in digits';
                    } else if (val.contains(' ')) {
                      return 'Spaces are not allowed';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
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
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      if (_formKey.currentState.validate()) {
                        result = calculateResult();
                      }
                    });
                  },
                ),
              ),
            ),
            // Result Text Field - Fourth (4) element ------------------------
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Container(
                    // width: 300.0,
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.blueAccent)),
                    child: Text(
                      result,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                )),
            // Image - Fifth (5) element ------------------------
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Container(
                height: 180.0,
                // color: Colors.blue,
                child: Image(
                  image: AssetImage('img/money.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String calculateResult() {
    print("--->");
    double rupees =
        double.parse(rupeesController.text.trim().replaceAll(' ', ''));
    if (selectedVal == 'Dollar') {
      return '${(rupees / 74.14).toStringAsFixed(2)} Dollars';
    } else if (selectedVal == 'Pound') {
      return '${(rupees / 102.40).toStringAsFixed(2)} Pounds';
    }
    return null;
  }
}
