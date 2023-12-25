import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mongodb_app/admin_panel/popups/done_popup.dart';
import 'package:flutter_mongodb_app/db_references/realtime_reference.dart';
import 'package:flutter_mongodb_app/providers/provider_class.dart';
import 'package:flutter_mongodb_app/resources/assets_manager.dart';
import 'package:flutter_mongodb_app/resources/colors_const.dart';
import 'package:flutter_mongodb_app/resources/route_manager.dart';
import 'package:flutter_mongodb_app/resources/string_const.dart';
import 'package:flutter_mongodb_app/resources/theme_manager.dart';
import 'package:flutter_mongodb_app/resources/values_const.dart';
import 'package:provider/provider.dart';

import '../../../../resources/controller/constant_radiobutton.dart';
import '../../../../resources/controller/constant_textfield.dart';

class AdminRestaurantDetails extends StatefulWidget {
  const AdminRestaurantDetails({super.key});

  @override
  State<AdminRestaurantDetails> createState() => _AdminRestaurantDetailsState();
}

class _AdminRestaurantDetailsState extends State<AdminRestaurantDetails> {
  final TextEditingController _restoname = TextEditingController();
  final TextEditingController _foodlicense = TextEditingController();
  final TextEditingController _restoaddress = TextEditingController();
  final TextEditingController _restoownername = TextEditingController();
  void popup(){
    setState(() {
      showDialog(context: context, builder: (BuildContext context)=>const DonePopup());
    });
  }
  void selectFile() async{
    final result = await FilePicker.platform.pickFiles();
    if(result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }
  Future uploadFile() async{
    final path = 'restaurantimages/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
      UploadTask uploadTask= ref.putFile(file);


     uploadTask.whenComplete(() async {
       try{
         final downloadurl =  await ref.getDownloadURL();
         setState(() {
           imageurl = downloadurl;
         });

       }catch(e){
         print(e);
       }
       print('Download Link : $imageurl');
     });
  }
  @override

  String? imageurl;
  bool isButtonActiveUpload = true;
  bool isButtonActiveSubmit = false;
  PlatformFile? pickedFile;
  String _selectedValue = "";
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return  Consumer<MyProviders>(
      builder:((context,provider,child)=>Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: ()async{
                    await FirebaseAuth.instance.signOut();
                    Navigator.popAndPushNamed(context, Routes.loginscreen);
                    }, icon: Icon(Icons.logout,color: ColorManager.black,)),
                  // Center(
                  //   child: SizedBox(
                  //     height: MediaQuery.of(context).size.height/4,
                  //     width: MediaQuery.of(context).size.width/2,
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(10),
                  //       child: const Image(image: AssetImage(ImageAssets.foodieslogo),fit: BoxFit.cover,),
                  //     ),
                  //   ),
                  // ),
                  //  SizedBox(height: MediaQuery.of(context).size.height/10,),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/4,
                          width: MediaQuery.of(context).size.width/1,
                          decoration: BoxDecoration(color: ColorManager.gray,borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectFile();
                                });
                              },
                                child: pickedFile != null ? Image.file(File(pickedFile!.path!),fit: BoxFit.cover,) : Icon(Icons.add_a_photo_outlined))
                          ),
                        ),
                        Center(child: ElevatedButton(onPressed: isButtonActiveUpload ? () {
                          uploadFile();
                          setState(() {
                            isButtonActiveSubmit = true;
                          });
                        } : null,child: Text('UploadFile'),),)
                        // Center(child: buildProgress()),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.restoname,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.medium, ColorManager.black),),
                      SizedBox(height: MediaQuery.of(context).size.height/60,),
                      ConstantTextField(controller: _restoname, labelText: 'Enter name',validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter restaurant name.';
                        }
                        return null;
                      },)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.foodlicense,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.medium, ColorManager.black),),
                      SizedBox(height: MediaQuery.of(context).size.height/60,),
                      ConstantTextField(controller: _foodlicense, labelText: 'Enter food license no',validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter foodlicense no.';
                        }
                        return null;
                      },)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.restoaddress,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.medium, ColorManager.black),),
                      SizedBox(height: MediaQuery.of(context).size.height/60,),
                      ConstantTextField(controller: _restoaddress, labelText: 'Enter full address',validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid info.';
                        }
                        return null;
                      },
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.restoowner,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.medium, ColorManager.black),),
                      SizedBox(height: MediaQuery.of(context).size.height/60,),
                      ConstantTextField(controller: _restoownername, labelText: 'Enter owner name',validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid info.';
                        }
                        return null;
                      },)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.type,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width / 25, FontWeightManager.medium, ColorManager.black),),
                      SizedBox(height: MediaQuery.of(context).size.height/60,),
                      ConstantRadioGroup<String>(items: ['Pure Veg','Non Veg'], value: _selectedValue,onChanged: (value){
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                      crossAxisAlignment: CrossAxisAlignment.start, itemBuilder: (String item) {
                        return Text(item,style: TextStyle(color: ColorManager.black),);
                        },)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/15,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child:SizedBox(
                        height: MediaQuery.of(context).size.height/15,
                        width: MediaQuery.of(context).size.width/1 ,
                        child: ElevatedButton(onPressed: isButtonActiveSubmit && imageurl != null  ? () async{
                          if (_formKey.currentState!.validate()) {
                            //await uploadFile();
                            setState(() {
                              _isLoading = true;
                            });
                            await Future.delayed(const Duration(seconds: 1));

                            try{

                              await RealTime.AddRestaurantData(_restoname.text, _restoaddress.text, _restoownername.text, _selectedValue.toString(), _foodlicense.text,imageurl.toString());
                              popup();
                            }catch(e){
                              print(e);
                            }

                          }
                          setState(()=>imageurl = null);
                          setState(()=>_isLoading = false);
                          setState(()=>isButtonActiveSubmit = false);
                          _restoownername.clear();
                          _restoaddress.clear();
                          _foodlicense.clear();
                          _restoname.clear();
                        } : (){
                          showDialog(
                              context: context,
                              builder: (context) {
                                return  AlertDialog(
                                  title:
                                  const Center(child: Text(AppString.error)),
                                  content: Text(
                                    'Fetching Issue please Try Again!',
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              });
                        },
                          style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: ColorManager.orangelight),
                          child: _isLoading ? CircularProgressIndicator(color: ColorManager.loadingcolor) :Text(AppString.submit,style: UpdateUser.customTextStyle(MediaQuery.of(context).size.width/15, FontWeightManager.medium, ColorManager.black),),),
                      ),
                    ),
                  )
                ],
              ),
            ),]
          ),
        ),
      )),
    );
  }
  // Widget buildProgress()=>StreamBuilder<TaskSnapshot>(
  //     stream: uploadTask?.snapshotEvents,
  //     builder: (context,snapshot){
  //       if(snapshot.hasData){
  //         final data = snapshot.data!;
  //         double progress = data.bytesTransferred / data.totalBytes;
  //
  //         return SizedBox(
  //           height: MediaQuery.of(context).size.height / 50,
  //           child: Stack(
  //             fit: StackFit.expand,
  //             children: [
  //               LinearProgressIndicator(
  //                 value: progress,
  //                 backgroundColor: ColorManager.faintgray,
  //                 color: ColorManager.green,
  //               ),
  //               Center(
  //                 child:Text('${(100 * progress).roundToDouble()}%',style: TextStyle(color: ColorManager.white),),
  //               )
  //             ],
  //           ),
  //         );
  //       }
  //       return SizedBox();
  //     });
}
