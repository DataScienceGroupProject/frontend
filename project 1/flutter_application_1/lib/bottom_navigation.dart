import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_preference_page.dart';

import 'chatbox_page.dart';
import 'home_page.dart';


 class bottom_Navigation extends StatefulWidget {
   const bottom_Navigation({Key? key}) : super(key: key);

   @override
   State<bottom_Navigation> createState() => _bottom_NavigationState();
 }

 class _bottom_NavigationState extends State<bottom_Navigation>
 {
   int currentIndex = 0;
   final List<Widget> children = [
     home_Screen_1(),
     chat_bot_page(),
     user_preference()

   ];

   void onTappedBar(int index)
   {
    setState(() {
      currentIndex = index;
    });
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body:children[currentIndex] ,
       bottomNavigationBar: BottomNavigationBar(
         backgroundColor: const Color(0xFF0B132B),
         onTap: onTappedBar,
         currentIndex: currentIndex,
         items:const  [
           BottomNavigationBarItem(
                label: " ",
               icon: Icon(Icons.home,
                   color:Colors.white,
                 size:35,
               ),
            ),
           BottomNavigationBarItem(
             label: " ",
             icon: Icon(Icons.message,
               color:Colors.white,
               size:35,
             ),
           ),
           BottomNavigationBarItem(
             label: " ",
             icon: Icon(Icons.account_box,
               color:Colors.white,
               size:35,
             ),
           ),

         ],
       ),
     );
   }
 }
