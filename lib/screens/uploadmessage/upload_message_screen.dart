import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mytagcall/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../calllog/call_log_screen_provider.dart';
import '../activationcode/activation_code_model.dart';
import '../activationcode/activation_code_provider.dart';

class UploadMessageScreen extends StatefulWidget {
  const UploadMessageScreen({super.key});

  @override
  State<UploadMessageScreen> createState() => _UploadMessageScreenState();
}

class _UploadMessageScreenState extends State<UploadMessageScreen> {
  bool uploadmessage = false;

  changeuploadmessagestate(val) {
    setState(() {
      uploadmessage = val;
    });
  }

  @override
  void initState() {
    super.initState();

    placevalue();
  }

  ImagePicker picker = ImagePicker();

  //TextEditingController whatsappcontroller = TextEditingController();
  TextEditingController msgcontroller = TextEditingController();

  placevalue() async {
    await getimgstring();

    await getmsgcontent();

    setState(() {
      msgcontroller.text = (msgcontent == "null" ? "" : msgcontent)!;
      base64Image = imagestring == "null" ? "" : imagestring;
    });
  }

  showbottomsheetfunction() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () {
                  getfromgallery(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () {
                  getfromcamera(context);
                },
              )
            ],
          );
        });
  }

  dynamic imageFile;
  String base64Image = "";
  getfromgallery(context) async {
    var pickedfile = await (picker.pickImage(source: ImageSource.gallery));
    if (pickedfile != null) {
      imageFile = File(pickedfile.path);
      final bytes = File(pickedfile.path).readAsBytesSync();
      setState(() {
        base64Image = base64Encode(bytes);
      });

      Navigator.pop(context);
    }
  }

  getfromcamera(context) async {
    var pickedfile = await (picker.pickImage(source: ImageSource.camera));
    if (pickedfile != null) {
      imageFile = File(pickedfile.path);
      final bytes = File(pickedfile.path).readAsBytesSync();
      setState(() {
        base64Image = base64Encode(bytes);
      });
      Navigator.pop(context);
    }
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  hituploadmsgapi(val) {
    changeuploadmessagestate(true);
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accesstoken'
    };
    var url = "$baseurl/updatemessage";

    var rbody = json.encode({
      "message_type": "WhatsApp",
      "whatsapp_content": val,
      "sms_content": val,
      "whatsapp_img": "data:image/png;base64,$base64Image"
    });
    try {
      http
          .post(Uri.parse(url), headers: headers, body: rbody)
          .then((response) async {
        if (response.statusCode == 200) {
          changeuploadmessagestate(false);
          await getactivationcode();
          await functionactivationcode(activationcode, context);
          setimgstring(base64Image);
          setmsgcontent(val);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: greencolor,
              content: const Text("Updated Successfully"),
            ),
          );
          debugPrint(response.statusCode.toString());
          debugPrint(response.body);
          placevalue();
        } else {
          changeuploadmessagestate(true);

          debugPrint(response.statusCode.toString());
          debugPrint(response.body);
        }
      });
    } catch (e) {
      changeuploadmessagestate(false);

      debugPrint(e.toString());
    }
  }

  LoginResponse loginresponse = LoginResponse();

  functionactivationcode(code, context) async {
    var headers = {'Content-Type': 'application/json'};

    var url = "$baseurl/login";

    var body = json.encode({"code": code});

    http
        .post(Uri.parse(url), headers: headers, body: body)
        .then((response) async {
      if (response.statusCode == 200) {
        debugPrint(response.body);
        loginresponse = loginResponseFromJson(response.body);
        await setimageurlstring(
            loginresponse.data!.detail!.whatsappImg.toString());
      } else {
        debugPrint(response.statusCode.toString());
        debugPrint(response.body);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: appcolor,
        title: const Text("Upload Message"),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         getimageurlstring();
        //       },
        //       icon: Icon(Icons.add))
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Upload Image :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              InkWell(
                  onTap: () {
                    showbottomsheetfunction();
                  },
                  child: base64Image == ""
                      ? Image.asset("assest/imgupload.jpeg")
                      : Image.memory(base64Decode(base64Image))),
              // TextFormField(
              //   controller: whatsappcontroller,
              //   keyboardType: TextInputType.text,
              //   style: const TextStyle(fontWeight: FontWeight.bold),
              //   maxLines: 5,
              //   decoration: InputDecoration(
              //     // prefixIcon: const Icon(Icons.message),
              //     hintText: "Enter your WhatsApp message",
              //     filled: true,
              //     fillColor: orangecolor.shade50,
              //     focusedBorder: OutlineInputBorder(
              //       borderSide:
              //           BorderSide(color: appcolor, width: 2), //<-- SEE HERE
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide:
              //           BorderSide(color: lightcolor, width: 2), //<-- SEE HERE
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //   ),
              // ),
              //sizedboxh(20.0),
              TextFormField(
                controller: msgcontroller,
                keyboardType: TextInputType.text,
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 5,
                decoration: InputDecoration(
                  // prefixIcon: const Icon(Icons.message),
                  hintText: "Enter your message",
                  filled: true,
                  fillColor: orangecolor.shade50,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: appcolor, width: 2), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: lightcolor, width: 2), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              sizedboxh(20.0),
              InkWell(
                onTap: () async {
                  hituploadmsgapi(msgcontroller.text);
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: appcolor, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: uploadmessage
                          ? const CircularProgressIndicator()
                          : const Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
