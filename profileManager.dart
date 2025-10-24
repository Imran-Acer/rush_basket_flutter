import 'package:flutter/material.dart';

class Profile extends StatefulWidget{
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var fName=TextEditingController();
  var phone=TextEditingController();
  var Email=TextEditingController();
  var Street=TextEditingController();
  var City=TextEditingController();
  var District=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Center(child: Text('Profile'))),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children:[
          SizedBox(height: 20,),
          CircleAvatar(backgroundColor: Colors.black,maxRadius:40,
            child: Icon(Icons.person,color: Colors.orange,size: 45,),),
          SizedBox(height:25),
          _textField('Full Name', fName),
          SizedBox(height: 10,),
          _textField('Your Phone Number',phone),
          SizedBox(height: 10,),
          _textField('Email', Email),
          SizedBox(height: 10,),
          _textField('Street',Street),
          SizedBox(height: 10,),
          _textField('City', City),
          SizedBox(height: 10,),
          _textField('District',District),
          SizedBox(height:25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            ElevatedButton(onPressed:(){}, child:Text('Save')),
            OutlinedButton(onPressed:(){
              Navigator.pop(context);
            }, child:Text('Cancel'))
          ],)

        ]),
      )
    );
  }

  Widget _textField(String labelText, TextEditingController controller){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide:  BorderSide(color: Colors.orange,width: 2)
          ),
          labelText: labelText
      ),
    );
  }
}