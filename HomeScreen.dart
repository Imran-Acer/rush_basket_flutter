import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rush_basket/provider/themeProvider.dart';
import 'package:rush_basket/provider/cardSlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rush_basket/Pages/loginPage.dart';
import 'package:rush_basket/Pages/profileManager.dart';
import 'package:rush_basket/provider/productProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState()=> _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();

  }
  int i=0;
  List photo=['b1.png','b2.png','b3.png'];
  List catList=['https://rukminim2.flixcart.com/fk-p-flap/64/64/image/2ebb95ec20eae8f1.png?q=100',
    'https://rukminim2.flixcart.com/fk-p-flap/64/64/image/4d6b13d5a0e0724a.png?q=100',
    'https://rukminim2.flixcart.com/fk-p-flap/64/64/image/cd6aca4f61e8ea95.png?q=100',
    'https://rukminim2.flixcart.com/fk-p-flap/64/64/image/ec2982e5564fe07c.png?q=100',
    'https://rukminim2.flixcart.com/fk-p-flap/64/64/image/febcb9896245caf4.png?q=100',
    'https://rukminim2.flixcart.com/fk-p-flap/64/64/image/d9eea6cd0e7b68bb.png?q=100'];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
    ChangeNotifierProvider<CardSlider>(create:(context)=>CardSlider()),
    ChangeNotifierProvider<ProductProvider>(create:(context)=>ProductProvider())
    ],child:Scaffold(
          appBar: AppBar(title:Row(
            children: [
              Text('Rush',style:TextStyle(fontSize:18,
                  fontWeight:FontWeight.bold,color:Colors.black),),
              Text('Basket',style:TextStyle(fontSize:18,
                  fontWeight:FontWeight.bold,color:Colors.orange))
            ],
          )
          ),
          drawer: Drawer(
              child:ListView(
                children: [
                  DrawerHeader(decoration: BoxDecoration(color:Colors.orange),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(onTap:(){
                              Navigator.push(context,MaterialPageRoute(builder:(context)=>Profile()));
                            }
                              ,child: CircleAvatar(backgroundColor: Colors.black,maxRadius: 20,
                                child: Icon(Icons.person,color: Colors.orange,size: 35,),),
                            ),
                            Consumer<ThemeManager>(builder:(context,themeManager,child){
                              return IconButton(onPressed:(){
                                themeManager.changeTheme();
                              }, icon:Icon(themeManager.getTheme()==ThemeMode.light?Icons.sunny:Icons.nights_stay_rounded));
                            })

                          ],
                        ),
                        SizedBox(height:30),
                        Text('My Account',style:TextStyle(fontSize: 18,fontWeight: FontWeight.w800)),
                        SizedBox(height:4 ,),
                        Text('9695464387')
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10,right:10,top: 20),
                    padding: EdgeInsets.all(10),
                    height: 60,
                    width:70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(width:2,color:Colors.black)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FaIcon(FontAwesomeIcons.hand),
                          ),onTap: (){},
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FaIcon(FontAwesomeIcons.moneyBill),
                          ),onTap: (){},
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FaIcon(FontAwesomeIcons.gifts),
                          ),onTap: (){},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:10),
                  ListTile(
                    title:Text('Your Order'),
                    leading:CircleAvatar(child:Icon(Icons.shopping_cart),),
                    onTap: (){},
                  ),
                  ListTile(
                    title:Text('Collected Coupons'),
                    leading:CircleAvatar(child:Icon(Icons.newspaper_outlined),),
                    onTap: (){},
                  ),
                  ListTile(
                    title:Text('Share App'),
                    leading:CircleAvatar(child:Icon(Icons.share),),
                    onTap: (){},
                  ),
                  ListTile(
                    title:Text('Log Out'),
                    leading:CircleAvatar(child:Icon(Icons.logout),),
                    onTap: ()async{
                      var prefs=await SharedPreferences.getInstance();
                      prefs.setBool('title',false);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginPage()));
                    },
                  )
                ],
              )
          ),
          body:SafeArea(
              child:ListView(
                  children:[
                    ListTile(
                      title:Text('Saharanpur'),
                      subtitle: Text('Dholaheri, 247231'),
                      leading:CircleAvatar(backgroundColor: Colors.white,child:Icon(Icons.location_pin,color: Colors.orange,size: 36,),),
                      trailing: InkWell(child: Icon(Icons.arrow_forward_ios),onTap:(){},),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      margin:EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: Colors.grey,width:.8)
                      ),
                      child: ListTile(
                        title:TextField(decoration:InputDecoration(hintText:'Search....',
                            border:OutlineInputBorder()),
                        ),
                        leading:IconButton(iconSize: 34,
                          icon:Icon(Icons.search),color: Colors.black,onPressed: (){},),
                        trailing:InkWell(child: Icon(Icons.mic_none,color: Colors.orange,),onTap:(){},),),
                    ),
                    SizedBox(
                      height: 150,
                      width:150,
                      child: Consumer<CardSlider>(builder:(context,cardSlider,child){
                        return Card(color: Colors.deepOrange,
                          child: Image.asset(
                            'assets/images/${photo[cardSlider.getIndex()]}',
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        );
                      }),),
                    SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Categories',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 21)),
                    ),
                    SizedBox(
                      height: 120, // required!
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: catList.length,
                        itemBuilder: (context, index) {
                          return Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child:InkWell(
                                    child: Image.network(catList[index],
                                      width: 90,
                                      height: 90,
                                      fit: BoxFit.cover,
                                    ),onTap: (){},
                                  ),
                                ),
                                const SizedBox(height:1),
                                Text('Category ${index+1}'),
                              ],
                            );
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Your Previous Order'),
                      trailing:IconButton(onPressed: (){}, icon:Icon(Icons.arrow_forward_ios)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left:15,right:15,top:0),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: Colors.black)
                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Delivered',style:TextStyle(fontWeight:FontWeight.w600,color:Colors.indigo)),
                        Text('On wed, 27 july 2025'),
                        Row(children: [
                          Image.network('https://rukminim2.flixcart.com/fk-p-flap/64/64/image/cd6aca4f61e8ea95.png?q=100'),
                          TextButton(onPressed:(){}, child:Text('+5 more'))
                        ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Your Order id: #2829679857'),
                                Text('Final Total: Rs 123',style:TextStyle(fontSize: 25,fontWeight:FontWeight.w400)),
                              ],
                            ),
                            ElevatedButton(onPressed:(){},
                                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.orange)),
                                child:Text('Order Again'))
                          ],),
                      ],)
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(11)
                      ),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Consumer<ProductProvider>(
                        builder: (context, productProvider, child) {
                          return GridView.builder(
                            physics: NeverScrollableScrollPhysics(), // scroll disable
                            shrinkWrap: true,                        // height fix
                            itemCount: productProvider.allProduct.length,
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 150,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemBuilder: (context, index) {
                              var newProduct = productProvider.allProduct[index];
                              return Card(
                                color: Colors.orange,
                                shadowColor: Colors.indigo,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      newProduct.image!,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 3),
                                    Text('₹ ${newProduct.price}',
                                      style: const TextStyle(fontWeight: FontWeight.bold),),
                                    Text('⭐ ${newProduct.rating}'),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )


        ]
              )
          ),
      ) , );
  }
}