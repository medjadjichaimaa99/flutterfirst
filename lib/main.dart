
import 'package:flutter/material.dart';
import 'package:flutterfirst/screens/Formulaire.dart';
import 'package:flutterfirst/screens/code_postal.dart';
import 'package:flutterfirst/screens/home_material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
        }
      }
final Formulaire form=new Formulaire(null,null,null,null);
class HomeScreen extends StatefulWidget{
  HomeScreen({Key key, @required this.form}) : super (key: key);
  final Formulaire form;
  @override
  HomeScreenPage createState()=> HomeScreenPage();
}
final List<String> wilaya = ["Adrar","Chlef","Laghouat","Oum bouaghi","Alger","Oran","Blida","Constantine","Sétif","Tizi Ouzou"] ;
String selectedItem = wilaya[0];

class HomeScreenPage extends  State<HomeScreen> {
  get logIn => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
               elevation: 0,
              iconTheme: new IconThemeData(color: Colors.black),
                title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0), ),
                  Image.asset(
                 'assets/images/Logo.png',
                  fit: BoxFit.contain,
                  width: 70,
                  height: 60,
                  ),
            ],
            ),
            backgroundColor: Colors.transparent,),
      //extendBodyBehindAppBar: true,
      body: Column(
        children: <Widget>[
          Center( 
            child: Column(children: <Widget>[
                   Container(
              width: 330.0,
              height: 350.0,
              decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.cover,
                image: new AssetImage('assets/images/1.jpg')
                )
             )),
                     Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                       child: 
                        Text("Veuillez sélectionner votre Wilaya\n",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
 
                     ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Color(0xFF3383CD),)),
                      child: Row(children: <Widget>[
                          Icon(Icons.room,color: Color(0xFF3383CD),),
                          Expanded(
                            child:  DropdownButton<String>(
                             value: selectedItem, 
                             isExpanded: true,
                             underline: SizedBox(),   
                            onChanged: (value){
                            form.wilaya=value;
                            setState(() {
                               selectedItem=value;
                            });
                          },
                          items: wilaya.map<DropdownMenuItem<String>>((value){
                                  return DropdownMenuItem(child: Text(value),
                                  value: value,
                                  );
                                }).toList(),
                           ),),
                        ],),
                    ),
                    SizedBox(height: 20),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                  )
                    ],
                    ),
          ),
           Container(
             margin: EdgeInsets.only(top: 150),
             child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                 new Container(
                       child: new MaterialButton( 
                        height: 60.0, 
                        minWidth: 350.0, 
                        color: Color(0xFFDD208A), 
                        textColor: Colors.white, 
                        child: new Text("Suivant "), 
                        onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Codepostal(form : form)),);},
                        splashColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(side: BorderSide(
                        color: Color(0xFFDD208A),
                        width: 1,
                        style: BorderStyle.solid
                        ), borderRadius: BorderRadius.circular(20)),
                   ),
                      margin: new EdgeInsets.only(top: 20.0),
                  ),
                ],),
           ),
        ],
      ),
              drawer: SideMenu(), backgroundColor: Colors.white,
            );
          }
        }


