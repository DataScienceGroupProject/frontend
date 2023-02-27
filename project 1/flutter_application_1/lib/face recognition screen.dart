import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class face_recognition extends StatefulWidget {
  const face_recognition({Key? key}) : super(key: key);

  @override
  State<face_recognition> createState() => _face_recognitionState();
}

class _face_recognitionState extends State<face_recognition> {
  File? selectedImage;
  String? message = "";

  uploadImage()
  async {
    final request = http.MultipartRequest("POST", Uri.parse("https://9bc6-2402-4000-2280-b66e-fd61-2d8b-58c3-da2d.in.ngrok.io/upload"));

    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(http.MultipartFile('image', selectedImage!.readAsBytes().asStream(),selectedImage!.lengthSync(), filename:selectedImage!.path.split("/").last ));

    request.headers.addAll(headers);
    final response =await request.send();
    http.Response res =  await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson['message'];
    setState(() {

    });
  }


  Future getImage()
  async {
   final pickedImage = await ImagePicker().getImage(source:ImageSource.gallery);
   setState(() {
     selectedImage = File(pickedImage!.path);
   });
  }

  Future getImageCamera()
  async {
    final pickedImage = await ImagePicker().getImage(source:ImageSource.camera);
    setState(() {
      selectedImage = File(pickedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF0B132B),
      appBar:AppBar(
        backgroundColor: const Color(0xFF0B132B),
        title:const Text("Emution"),
      ),
      body:Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            selectedImage == null ? const Text("Please pick a image to upload",
            style: TextStyle(color:Colors.white ),):Image.file(selectedImage!),
            const SizedBox(height:15),
            TextButton.icon(
              onPressed:uploadImage,
              icon: const Icon(Icons.upload_file,color:Colors.white,),
              label:const Text("Upload",style:TextStyle(color:Colors.white),),
              style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),

              ),

            ),
            const SizedBox(height:15),
            Center(
              child: Row(
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                  onPressed:getImage,
                  icon: const Icon(Icons.add_a_photo,color:Colors.white,),
                  label:const Text("Gallery",style:TextStyle(color:Colors.white),),
                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),

                  ),

                ),
                  const SizedBox(width:20,),
                  TextButton.icon(
                    onPressed:getImageCamera,
                    icon: const Icon(Icons.camera,color:Colors.white,),
                    label:const Text("Camera",style:TextStyle(color:Colors.white),),
                    style:ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),

                    ),

                  ),],
              ),
            )

          ],
        ),
      ),

    );
  }
}


