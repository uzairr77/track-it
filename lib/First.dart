import 'package:flutter/material.dart';

class MyFirst extends StatefulWidget {
  const MyFirst({super.key});

  @override
  State<MyFirst> createState() => _MyFirstState();
}

class _MyFirstState extends State<MyFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body:Container(
        width: double.infinity,
        height: double.infinity,

        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 165),
              child: Text("Track-It",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w500),),
            ),
            Text("Barcode based Application Tracking",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),),
            Padding(
              padding:  EdgeInsets.only(top: 70),
              child: Text("Sign Up as",style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.w500),),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector


                (
                  onTap:(){
                    Navigator.pushNamed(context, 'login');
                  },
                  child: Text("Already have an account? Login",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),)),
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
                        Navigator.pushNamed(context, 'login');

                      }, child: Text("Administrator",style: TextStyle(fontSize: 20,color: Colors.white),))),
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

                        Navigator.pushNamed(context, "applicationform");
                      }, child: Text("Applicant",style: TextStyle(fontSize: 20,color: Colors.white),))),
            ),
          ],

        ),
      ),

    );
  }
}