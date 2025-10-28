import 'package:flutter/material.dart';

class fuelcostestscreen extends StatefulWidget {
  const fuelcostestscreen({super.key});

  @override
  State<fuelcostestscreen> createState() => _fuelcostestscreenState();
}

class _fuelcostestscreenState extends State<fuelcostestscreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController distanceController = TextEditingController();
  TextEditingController efficiencyController = TextEditingController();
  String selectedFuelType = 'RON95 Subsidized';
  final Map<String, double> fuelPrices = {
    'RON95 Subsidized': 1.99,
    'RON95': 2.60,
    'RON97': 3.14,
    'Diesel': 2.89,
    'Diesel Euro5': 3.09,
  };
  double estimatedCost = 0.0;
  

  @override
  Widget build(BuildContext context) {
    double selectedFuelPrice = fuelPrices[selectedFuelType] ?? 0.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip Fuel Cost Estimator Home Page'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Trip Fuel Cost Estimator',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
              SizedBox(height: 40),

              Row(
                children: [
                  SizedBox(width: 100, child: Text('Distance (KM)')
                  ),
                  Expanded(child: TextFormField(
                    controller: distanceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Distance e.g. 150',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Distance';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Enter a Valid Number';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          
            Row(
              children: [
                SizedBox(
                  width: 100, child: Text('Fuel Efficiency (KM/L)')
                ),
                Expanded(
                  child: TextFormField(
                  controller: efficiencyController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Fuel Efficiency e.g. 10',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Fuel Efficiency';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Enter a Valid Number';
                    }
                    return null;
                  },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              children: [
                SizedBox(width: 100, child: Text('Fuel Type')
                ),
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedFuelType,
                    isExpanded: true,
                    items: fuelPrices.keys.map((String type){
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                        );             
                    }
                  ).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFuelType = newValue!;
                    });
                  },
                  ),
                ),
              ],
              ),
              SizedBox(height: 10),

              Text(
                'Fuel Price: RM${selectedFuelPrice.toStringAsFixed(2)} per Liter',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          calculateFuelCost();
                        }
                      }, 
                      child: Text('Calculate Fuel Cost'),
                      ),     
                  ],
                ),
                SizedBox(width: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: resetFields, 
                      child: Text('Reset All'),
                      ),     
                  ],
                ),
                SizedBox(width: 30),

                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.orange)
                  ),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Estimated Fuel Cost',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'RM ${estimatedCost.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                ),
              ),
            ],
            ),
          ),
        ),
    );
  }

  void calculateFuelCost() {
    double distance = double.parse(distanceController.text);
    double efficiency = double.parse(efficiencyController.text);
    double fuelPrice = fuelPrices[selectedFuelType] ?? 0.0;
    double fuelCost = 0.0;

    if (selectedFuelType == 'RON95 Subsidized') {
      fuelCost = (distance / efficiency) * fuelPrice;
    } else if (selectedFuelType == 'RON95') {
      fuelCost = (distance / efficiency) * fuelPrice;
    } else if (selectedFuelType == 'RON97') {
      fuelCost = (distance / efficiency) * fuelPrice;
    } else if (selectedFuelType == 'Diesel') {
      fuelCost = (distance / efficiency) * fuelPrice;
    } else if (selectedFuelType == 'Diesel Euro5') {
      fuelCost = (distance / efficiency) * fuelPrice;
    }

    setState(() {
      estimatedCost = fuelCost;
    });
}

  void resetFields() {
    setState(() {
      distanceController.clear();
      efficiencyController.clear();
      selectedFuelType = 'RON95 Subsidized';
      estimatedCost = 0.0;
    });
    
  }
}
