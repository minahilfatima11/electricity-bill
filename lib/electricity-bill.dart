import 'package:flutter/material.dart';

class ElectricityBillApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ElectricityBillCalculator(),
    );
  }
}

class ElectricityBillCalculator extends StatefulWidget {
  @override
  _ElectricityBillCalculatorState createState() =>
      _ElectricityBillCalculatorState();
}

class _ElectricityBillCalculatorState
    extends State<ElectricityBillCalculator> {
  final TextEditingController _unitController = TextEditingController();
  String _result = "";

  void calculateBill() {
    int unitConsume = int.tryParse(_unitController.text) ?? 0;
    int pricePerUnit;
    double totalBill, tax, finalBill;
    String taxMessage;

    if (unitConsume < 30) {
      pricePerUnit = 10;
    } else {
      pricePerUnit = 16;
    }

    totalBill = unitConsume * pricePerUnit.toDouble();

    if (totalBill < 10000) {
      tax = totalBill * 0.17;
      taxMessage =
      "17% tax applied because the total bill is less than PKR 10,000.";
    } else {
      tax = totalBill * 0.25;
      taxMessage =
      "25% tax applied because the total bill is greater than PKR 10,000.";
    }

    finalBill = totalBill + tax;

    setState(() {
      _result = "Unit Consumed: $unitConsume\n"
          "Price per Unit: PKR $pricePerUnit\n"
          "Total Bill (Before Tax): PKR ${totalBill.toStringAsFixed(2)}\n"
          "Tax: PKR ${tax.toStringAsFixed(2)}\n"
          "Tax Information: $taxMessage\n"
          "Total Bill (With Tax): PKR ${finalBill.toStringAsFixed(2)}";
    });
  }

  void resetFields() {
    _unitController.clear();
    setState(() {
      _result = "";
    });
  }

  @override
  Widget build(BuildContext context) {

    Color darkenedColor = Color(0xFFD6A5D6);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Electricity Bill Calculator",
          style: TextStyle(color: Color(0xFFFFCCEA), fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [darkenedColor, darkenedColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        color: darkenedColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Enter the units consumed to calculate your electricity bill:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFCCEA),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _unitController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Color(0xFFFFCCEA)),
                decoration: InputDecoration(
                  hintText: "Units Consumed",
                  labelStyle: TextStyle(color: Color(0xFFFFCCEA)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.flash_on, color: Color(0xFFFFCCEA)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: calculateBill,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFCCEA),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Calculate Bill",
                        style: TextStyle(
                          fontSize: 18,
                          color: darkenedColor,
                        ),
                      ),
                    ),
                  ),
                  // Reset Button
                  ElevatedButton(
                    onPressed: resetFields,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFCCEA),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: 18,
                        color: darkenedColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      _result,
                      style: TextStyle(
                        fontSize: 16,
                        color: darkenedColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
