import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rush_basket/Pages/HomeScreen.dart';

class OtpVerification extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                    height: 350,
                    width: 350,
                    child: Image.asset('assets/images/OTP-SMS-1.png')),
              ),
              Text('Phone Verification',style:TextStyle(fontSize:30,fontWeight: FontWeight.bold)),
              SizedBox(height:10),
              Text('Enter your OTP ',style:TextStyle(color:Colors.grey )),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _otpBox(),
                  SizedBox(width:5),
                  _otpBox(),
                  SizedBox(width:5),
                  _otpBox(),
                  SizedBox(width:5),
                  _otpBox(),

                ],),

              SizedBox(height:15),

              SizedBox(width: 400,
                height: 40,
                child: ElevatedButton(onPressed: ()async {
                    var prefs= await SharedPreferences.getInstance();
                    prefs.setBool('login', true);
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomePage()));
                },
                  style:ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent,
                      shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(11))) ,
                  child:Text('Verify',style: TextStyle(color:Colors.white),),),
              )
            ],
          ),)
    );
  }

  Widget _otpBox(){
    return SizedBox(
      width:50,
      child: TextField(maxLength: 1,
          keyboardType: TextInputType.phone,
          decoration:InputDecoration(
            counterText: '',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(21),
                borderSide: BorderSide(color: Colors.black,width: 2)
            ),
          )
      ),
    );
  }
}

