import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 150,left: 1),
              child: Text("Create Account",style: TextStyle(fontSize:35,color: Colors.white,fontWeight: FontWeight.w500,),),


            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 4, color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 4, color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 4, color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
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
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                      onPressed: (){

                        Navigator.pushNamed(context, 'adminscanner');
                      }, child: Text("Sign Up",style: TextStyle(fontSize: 20,color: Colors.white),))),
            ),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 90,top: 20),
                  child: Text("Already have an account?",style: TextStyle(fontSize: 15,color: Colors.white),),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left:5),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, 'login');
                      },
                      child: Text("LogIn",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight:FontWeight.w900),)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}