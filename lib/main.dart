import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Tip Calculator',
    home: TipCalculator(),
    debugShowCheckedModeBanner: false,
  ));
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double billAmount = 0.0;
  double tipPercentage = 0.0;
  TextEditingController billController = TextEditingController();
  TextEditingController tipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Calculator"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              "Enter Bill Amount and Tip Percentage",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: billController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Bill Amount",
                labelStyle: TextStyle(color: Colors.teal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                prefixIcon: Icon(Icons.attach_money, color: Colors.teal),
              ),
              onChanged: (value) {
                setState(() {
                  billAmount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: tipController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tip Percentage",
                labelStyle: TextStyle(color: Colors.teal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                prefixIcon: Icon(Icons.percent, color: Colors.teal),
              ),
              onChanged: (value) {
                setState(() {
                  tipPercentage = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                setState(() {
                  double tipAmount = (billAmount * tipPercentage) / 100;
                  double totalAmount = billAmount + tipAmount;

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Tip Calculation"),
                        content: Text(
                          "Tip Amount: ₹${tipAmount.toStringAsFixed(2)}\nTotal Amount: ₹${totalAmount.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 16),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.teal),
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                });
              },
              child: Text("Calculate"),
            ),
          ],
        ),
      ),
    );
  }
}
