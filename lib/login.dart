import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    // Replace 'your_api_endpoint' with the actual API endpoint
    final String apiUrl = 'http://localhost:5000/auth/login';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Successful login, navigate to another screen
        var data = jsonDecode(response.body);
        print(data);
        Navigator.pushReplacementNamed(context, '/userportal');
      } else {
        // Handle API error, show error on this page
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      print('Error: $error');
      // Handle other errors, show error on this page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 90),
                    child: Text(
                      "Track-It",
                      style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Barcode Based Application Tracking System",
                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 60,
                width: 220,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                  //  _login();

                    Navigator.pushNamed(context, 'userportal');
                  },
                  child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),
           Row(
             children: [
               Padding(
                 padding:  EdgeInsets.only(left: 90,top: 20),
                 child: Text("Don't have an account?",style: TextStyle(fontSize: 15,color: Colors.white),),
               ),
               Padding(
                 padding: EdgeInsets.only(top: 20, left:5),
                 child: GestureDetector(
                     onTap: (){
                       Navigator.pushNamed(context, 'signup');
                     },
                     child: Text("SignUp",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight:FontWeight.w900),)),
               ),
             ],
           )
          ],
        ),
      ),
    );
  }
}
