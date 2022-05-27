import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  var weight = "";
  var pincode = "";
  String bqcode = '';
  var receiver_address = '';
  var sender_address = '';
  WelcomePage({Key? key, required this.bqcode}) : super(key: key);
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final weightController = TextEditingController();
  final pincodeController = TextEditingController();
  final receiver_addressController = TextEditingController();
  final sender_addressController = TextEditingController();

  @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   nameController.dispose();
  //   weightController.dispose();
  //   pincodeController.dispose();
  //   //super.dispose();
  // }

  clearText() {
    nameController.clear();
    weightController.clear();
    pincodeController.clear();
    receiver_addressController.clear();
    sender_addressController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Articles details"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  initialValue: bqcode,
                  decoration: InputDecoration(
                    hintText: "Enter Code",
                    labelText: "Barcode",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Barcode cannot be empty";
                    }

                    return null;
                  },
                  onChanged: (value) {
                    name = value;
                    //setState(() {});
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Weight: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: weightController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Wight';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Pincode: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: pincodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty && value.length != 6) {
                      return 'Please Enter Corrent Pincode';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  minLines: 2,
                  maxLines: 5,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Sender address: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: sender_addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Address';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  minLines: 2,
                  maxLines: 5,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Receiver address: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: receiver_addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Address';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        // if (_formKey.currentState!.validate()) {
                        //   setState(() {
                        //     name = nameController.text;
                        //     weight = weightController.text;
                        //     pincode = pincodeController.text;
                        //     addUser();
                        //     clearText();
                        //   });
                        // }
                      },
                      child: Text(
                        'BookPost',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
                      child: Text(
                        'Reset',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _formKey {}
