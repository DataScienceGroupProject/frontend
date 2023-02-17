import 'package:flutter/material.dart';
import 'package:flutter_application_1/sidebar.dart';

import 'face recognition screen.dart';


class home_Screen_1 extends StatefulWidget {
  const home_Screen_1({Key? key}) : super(key: key);

  @override
  State<home_Screen_1> createState() => _home_Screen_1State();
}

class _home_Screen_1State extends State<home_Screen_1> {
  int currentIndex = 0;

  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF0B132B),
      drawer:sideBar(),
      appBar:AppBar(
        backgroundColor: const Color(0xFF0B132B),
        title:const Text("Emution"),

      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15),
            child: Container(
              height:220,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(image:AssetImage('assets/images/face.jpg',))
              ),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:90,vertical:80),
                  child: SizedBox(
                    width:double.infinity,
                    child:RawMaterialButton(
                      fillColor:const Color(0xFFffffff),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder:(_)
                        {
                          return const face_recognition();
                        }));
                      },
                      child:const Text("Face recognition",style:TextStyle(
                        fontFamily:'Inder-Regular',
                        fontSize:20,
                      ),),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15),
            child: Container(
              height:220,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(image:AssetImage('assets/images/face.jpg',))
              ),
              child:Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:90,vertical:80),
                  child: SizedBox(
                    width:double.infinity,
                    child:RawMaterialButton(
                      fillColor:const Color(0xFFffffff),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      onPressed: () {},
                      child:const Text("Voice recognition",style:TextStyle(
                        fontFamily:'Inder-Regular',
                        fontSize:20,
                      ),),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ) ,


    );
  }
}
