import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
   const UserInfo({
    Key? key,
    required this.name,
    required this.switchs,
    required this.number,
    required this.urlPhoto,
    required this.function,
    required this.id,
  }) : super(key: key);

  final String name;
  final String id;
  final bool switchs;
  final String number;
  final String urlPhoto;
  final Function function;

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.switchs?Colors.black:Colors.white,
         elevation: 0,
        child: ListTile(
          
          leading: CircleAvatar(backgroundImage: AssetImage(widget.urlPhoto),radius: 30,),
          title: Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.5,fontFamily: 'Gothic',color: widget.switchs?Colors.white:Colors.black,),),
          subtitle: Text(widget.number,style: TextStyle(fontFamily: 'Gothic',color: widget.switchs? Colors.white: const Color.fromARGB(255, 79, 68, 68))),
          trailing: IconButton(
            onPressed: (){
              widget.function(widget.id);
            },
            icon: Icon(Icons.delete_outline,color: widget.switchs?Colors.white:Colors.black,),
            ),
        ),
    );
  }
}