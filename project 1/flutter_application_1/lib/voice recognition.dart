import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class voice_recognition extends StatefulWidget {
  const voice_recognition({Key? key}) : super(key: key);

  @override
  State<voice_recognition> createState() => _voice_recognitionState();
}

class _voice_recognitionState extends State<voice_recognition> {
  File? selectedImage;
  String? message = "";

  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  pickFile() async
  {
    setState(() {
      isLoading = true;
    });
    result = await FilePicker.platform.pickFiles(
      type:FileType.any,
      allowMultiple:false,
    );

    if(result!= null){
      _fileName = result!.files.first.name;
      pickedfile = result!.files.first;
      fileToDisplay =File(pickedfile!.path.toString());

      print("file name $_fileName");
    }


    setState(() {
      isLoading = false;
    });

  }

  // uploadImage()
  // async {
  //   final request = http.MultipartRequest("POST", Uri.parse("https://9bc6-2402-4000-2280-b66e-fd61-2d8b-58c3-da2d.in.ngrok.io/upload"));
  //
  //   final headers = {"Content-type": "multipart/form-data"};
  //   request.files.add(http.MultipartFile('image', selectedImage!.readAsBytes().asStream(),selectedImage!.lengthSync(), filename:selectedImage!.path.split("/").last ));
  //
  //   request.headers.addAll(headers);
  //   final response =await request.send();
  //   http.Response res =  await http.Response.fromStream(response);
  //   final resJson = jsonDecode(res.body);
  //   message = resJson['message'];
  //   setState(() {
  //
  //   });
  // }


  // Future getImage()
  // async {
  //   final pickedImage = await ImagePicker().getImage(source:ImageSource.gallery);
  //   setState(() {
  //     selectedImage = File(pickedImage!.path);
  //   });
  // }
  //
  // Future getImageCamera()
  // async {
  //   final pickedImage = await ImagePicker().getImage(source:ImageSource.camera);
  //   setState(() {
  //     selectedImage = File(pickedImage!.path);
  //   });
  // }

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
            fileToDisplay == null ? const Text("Please pick a audio file to upload",
              style: TextStyle(color:Colors.white ),):Image.file(fileToDisplay!),
            const SizedBox(height:15),
            TextButton.icon(
              onPressed:(){},
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
                    onPressed:pickFile,
                    icon: const Icon(Icons.file_copy,color:Colors.white,),
                    label:const Text("Device",style:TextStyle(color:Colors.white),),
                    style:ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),

                    ),

                  ),

                  ],
              ),
            )

          ],
        ),
      ),

    );
  }
}


