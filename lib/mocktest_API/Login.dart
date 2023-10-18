import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),));
}
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailcontroller=TextEditingController();
  TextEditingController _passcontroller=TextEditingController();

  void Login(String email,password)async{
    try{
       Response response= await post(Uri.parse('https://reqres.in/api/login'),
      body: {
        'email':email,
        'password':password,
      }
      );
       if(response.statusCode==200){
         var data =jsonDecode(response.body.toString());
         print(data['token']);
         print("Login successfull");
       }else{
         print("Login Failed");

       }
    }catch(e){
     print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("WELCOME",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),

              TextFormField(
                controller: _emailcontroller,
                cursorColor: Colors.black,

                decoration: InputDecoration(
                  hintText: "Enter Email" ,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black,width: 2),
                  ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  suffixIcon: Icon(Icons.email_outlined)
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _passcontroller,
                cursorColor: Colors.black,
                obscureText: true,
                decoration: InputDecoration(
                 hintText: "Enter Password" ,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: Icon(Icons.password),

                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 190),
                child: TextButton(onPressed: (){}, child: Text("Forgot password?",style: TextStyle(color: Colors.brown),)),
              ),

              SizedBox(height: 30,),
              Center(
                child: Container(
                  height: 53,width: 380,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),),
                    child:
                    Text("Login",style: TextStyle(fontSize: 20),),
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
