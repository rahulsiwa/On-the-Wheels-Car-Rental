import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_final/core/Repository/kyc_repository.dart';
import 'package:taxi_final/core/app_export.dart';

class EditprofileScreen extends StatefulWidget {
  @override
  State<EditprofileScreen> createState() => _EditprofileScreenState();
}

class _EditprofileScreenState extends State<EditprofileScreen> {
  bool isLoading = true;
  bool isUpdatingProfile = false;
  dynamic profile;
  XFile? image;
  var sourceimage = null;
  var name = null;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  getUserProfile() async {
    var res = await KYC().getUserProfile();
    print(res);
    if (res != false) {
      setState(() {
        profile = res;
        log(profile.toString());
        _emailController.text = profile['email'];
        _nameController.text = profile['name'];
        isLoading = false;
      });
    }
  }

  _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return UnconstrainedBox(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Choose one'),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () async {
                              var img = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              Navigator.pop(context);
                              setState(() {
                                image = img;
                              });
                            },
                            child: Text('Gallery ')),
                        TextButton(
                            onPressed: () async {
                              var img = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              Navigator.pop(context);
                              setState(() {
                                image = img;
                              });
                            },
                            child: Text('Camera '))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.clear();
    _nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Map? data;
        log(name.toString());
        log(sourceimage.toString());

        if (name != null && sourceimage != null) {
          data = {
            "name": name,
            "sourceImage": sourceimage,
          };
          Navigator.pop(context, data);
          return true;
        }

        return true;
      },
      child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                'Edit profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: isLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                _showDialog();
                              },
                              child: image == null && profile['image'] == null
                                  ? CircleAvatar(
                                      radius: 80,
                                      backgroundImage: AssetImage(ImageConstant
                                          .imgBrezzaremovebgpreview),
                                    )
                                  : image != null
                                      ? CircleAvatar(
                                          radius: 80,
                                          backgroundImage:
                                              FileImage(File(image!.path)),
                                        )
                                      : CircleAvatar(
                                          radius: 80,
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                                  ApiURL().imgUrl +
                                                      profile['image']),
                                        ),
                            ),
                            Positioned(
                                right: 0,
                                bottom: 0,
                                child: GestureDetector(
                                  onTap: () async {
                                    ImagePicker picker = ImagePicker();
                                    var newFile = await picker.pickImage(
                                        source: ImageSource.camera);
                                    if (newFile != null) {
                                      setState(() {
                                        this.image = newFile;
                                      });
                                    }
                                  },
                                  child: Chip(
                                    label: Text(
                                      'Change',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.green[800],
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                  hintText: '${profile['name']}'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: _emailController,
                              decoration: InputDecoration(
                                  hintText: '${profile['email']}'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )),
                      )
                    ],
                  ),
            bottomNavigationBar: InkWell(
              onTap: () async {
                try {
                  setState(() {
                    isUpdatingProfile = true;
                  });
                  var data = {
                    "name": _nameController.value.text == ""
                        ? profile['name']
                        : _nameController.value.text,
                    "email": _emailController.value.text == ""
                        ? profile['email']
                        : _emailController.value.text,
                    "image": image == null
                        ? null
                        : await MultipartFile.fromFile(image!.path,
                            filename: image!.path.split('/').last)
                  };

                  var formData = FormData.fromMap(data);
                  var res = await KYC().updateUserProfile(formData);
                  if (res != false) {
                    log(this.image!.name);
                    getUserProfile();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Profile updated successfully')));

                    setState(() {
                      name = this._nameController.text;
                      sourceimage = '/media/images/' + this.image!.name;
                      isUpdatingProfile = false;
                    });
                  } else {
                    setState(() {
                      isUpdatingProfile = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Cannot update profile')));
                  }
                } catch (e) {
                  SnackBar snackBar = new SnackBar(
                    content: Text("please choose image too"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Container(
                height: 50,
                color: Colors.pink[100],
                child: Center(
                  child: Text(
                    isUpdatingProfile == true ? 'Updating...' : 'Update',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
