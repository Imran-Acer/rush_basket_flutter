import 'package:flutter/material.dart';
import 'package:rush_basket/Pages/otp_verification_screen.dart';

class loginPage extends StatelessWidget{
  var mobileNo=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(color: Colors.white,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 45,),
          Center(
            child: SizedBox(
              height: 350,
                width: 350,
                child: Image.asset('assets/images/login.jpg')),
          ),
          Text('Login',style:TextStyle(fontSize:30,fontWeight: FontWeight.bold)),
          SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width:5),
              Text('+91'),
              SizedBox(width: 5,),
              Icon(Icons.arrow_drop_down_outlined),
              SizedBox(width:10),
              SizedBox(
                width:300,
                child: TextField(
                  controller: mobileNo,
                  keyboardType: TextInputType.phone,
                  decoration:InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(color: Colors.black,width: 2)
                    ),
                    label: Text('Mobile No:'),
                    hint: Text('9876543219',style: TextStyle(color: Colors.grey),)
                  )
                ),
              )

          ],),
          SizedBox(height: 25,),
          SizedBox(width: 380,
            height: 50,
            child: ElevatedButton(onPressed: () {
              if(mobileNo.text.isNotEmpty){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>OtpVerification()));
              }
            },
              style:ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent,
              shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(11))) ,
              child:Text('Next',style: TextStyle(color:Colors.white),),),
          )
        ],
      ),)
    );
  }
}