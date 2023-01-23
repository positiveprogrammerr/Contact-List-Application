import 'package:contact_list/widget/user_info.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

// ignore: must_be_immutable
class MyHome extends StatefulWidget {
   const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool switchs = false;
  List<Map<String,String>> list =[
  {'id':'user1','name':'Messi','number':'+15852826651','photourl':'assets/images/7.png'},
  {'id':'user2','name':'Jack','number':'+18143008828','photourl':'assets/images/2.jpg'},
  {'id':'user3','name':'John','number':'+16102347964','photourl':'assets/images/1.jpg'},
  {'id':'user4','name':'Mehmet','number':'+18143008839','photourl':'assets/images/4.jpg'},
  {'id':'user5','name':'Ahmet','number':'+14844731201','photourl':'assets/images/5.jpg'},
  {'id':'user6','name':'Selim','number':'+14844731201','photourl':'assets/images/5.jpg'},
  {'id':'user7','name':'Selim','number':'+14844731201','photourl':'assets/images/5.jpg'},
  {'id':'user9','name':'John','number':'+14844731201','photourl':'assets/images/2.jpg'},
  {'id':'user10','name':'Selim','number':'+14844731201','photourl':'assets/images/7.png'},
  {'id':'user11','name':'Selim','number':'+14844731201','photourl':'assets/images/4.jpg'},
  {'id':'user12','name':'Selim','number':'+14844731201','photourl':'assets/images/2.jpg'},
];

  void userdel(String ids){
   setState((){
    list.removeWhere((element){
        if (element['id'] == ids){
            return true;
       }
          else{
          return false;
          }
        }
         );
      }
      );
   }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: switchs? Colors.black:Colors.white,
      appBar: AppBar(
        leading: 
           Padding(
          padding: const EdgeInsets.only(left:30.0),
          child: Icon(Icons.list_alt_rounded,size: 40,color:switchs?Colors.white:Colors.black,),
        ),
        centerTitle: true,
         actions: [
        CircleAvatar(
          backgroundColor:switchs? Colors.white:Colors.black,
          radius: 19,
          child: IconButton(
            onPressed: (){
              setState(() {
                switchs = !switchs;
              });
            }, 
            icon: switchs? const Icon(Icons.light_mode_rounded):const Icon(Icons.dark_mode_rounded),
            color: switchs? Colors.black:Colors.white,
            ),
        ),
        const SizedBox(width: 9,)
      ],
        backgroundColor: switchs? Colors.black:Colors.white,
        elevation: 0,
        title: Text(
                  'Contact List',
                  style: TextStyle(
                    fontFamily: 'Gothic',
                      color: switchs?Colors.white:Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                      ),
                ),
        ),
        
      body: ListView(
            itemExtent: 85,
            children:
                list.map((lists){
                    return  
                    UserInfo(
                      id: lists['id']!, 
                      name: lists['name']!,
                       number: lists['number']!, 
                        function: userdel, 
                        switchs: switchs, 
                        urlPhoto: lists['photourl']!,
                       );
                }).toList(),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor:switchs? Colors.white:Colors.black,
            child:  Icon(Icons.search,color: switchs?Colors.black:Colors.white),
            onPressed: () {
            
          },),
    );
  }
}
