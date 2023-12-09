import 'dart:math';
import 'package:flutter/material.dart';
import 'package:barcode/barcode.dart';

import 'PrintedFormScreen.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController applicationToController = TextEditingController();
  final TextEditingController applicationContentController = TextEditingController();

  int currentBarcodeValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 0),
                child: Text(
                  "Application\n     Form",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: SizedBox(
                        width: 170,
                        child: TextField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                              hintText: 'First name',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                              )),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: SizedBox(
                        width: 170,
                        child: TextField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                              hintText: 'Last name',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                              )),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 2),
                child: SizedBox(
                  width: 359,
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                        hintText: 'Address',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 2),
                child: SizedBox(
                  width: 359,
                  child: TextField(
                    controller: applicationToController,
                    decoration: InputDecoration(
                        hintText: 'Application To',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 2),
                child: SizedBox(
                  width: 359,
                  child: TextFormField(
                      maxLines: 10,
                      controller: applicationContentController,
                      // This allows the text field to be scrollable
                      decoration: InputDecoration(
                        hintText: 'Write your application here...',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 60,
                  width: 290,
                  child: ElevatedButton(
                    onPressed: () {
                      // Generate the barcode
                      final String barcodeData =
                          '${currentBarcodeValue.toString().padLeft(4, '0')}';
                      currentBarcodeValue++;

                      final barcode = Barcode.code128();
                      final barcodeSvg =
                      barcode.toSvg(barcodeData, width: 200, height: 80);

                      // Navigate to PrintedFormScreen with barcode and form data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrintedFormScreen(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            address: addressController.text,
                            applicationTo: applicationToController.text,
                            applicationContent:
                            applicationContentController.text,
                            barcodeSvg: barcodeSvg,
                            barcodeData:barcodeData,
                          ),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: Text(
                      'Submit and Generate Printed Form',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
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
