import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_final/core/Repository/kyc_repository.dart';
import 'package:taxi_final/core/app_export.dart';

class DocuploadScreen extends StatefulWidget {
  @override
  State<DocuploadScreen> createState() => _DocuploadScreenState();
}

class _DocuploadScreenState extends State<DocuploadScreen> {
  XFile? licenseImg;
  XFile? identityImg;
  bool isAdding = false;
  bool isKycAdded = false;
  bool isLoading = true;
  dynamic kyc;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    getMyKYC();
  }

  getMyKYC() async {
    var res = await KYC().getUserKyc();
    if (res == 500) {
      setState(() {
        isLoading = false;
      });
      return;
    } else if (res == false) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red, content: Text('Something went wrong')));
    } else {
      print(res);
      setState(() {
        kyc = res;
        isKycAdded = true;
        isLoading = false;
      });
    }
  }

  _chooseImage(type) {
    showDialog(
        context: context,
        builder: (context) {
          return UnconstrainedBox(
            child: SizedBox(
              height: 130,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text('Select image from'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              final image = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                if (type == 'L') {
                                  licenseImg = image;
                                } else {
                                  identityImg = image;
                                }
                              });
                            },
                            child: const Text('Gallery'),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              final image = await _picker.pickImage(
                                  source: ImageSource.camera);
                              setState(() {
                                if (type == 'L') {
                                  licenseImg = image;
                                } else {
                                  identityImg = image;
                                }
                              });
                            },
                            child: const Text('Camera'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : isKycAdded == true
              ? Center(
                  child: Column(
                    children: [
                      Text(
                        'Here are your kyc documents',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                child: Image(
                                    fit: BoxFit.contain,
                                    image: CachedNetworkImageProvider(
                                        ApiURL().imgUrl + kyc['licenseImage'])),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                              ),
                              Text('Driving License')
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                child: Image(
                                    image: CachedNetworkImageProvider(
                                        ApiURL().imgUrl +
                                            kyc['identityImage'])),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                              ),
                              Text('Identity card')
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text('Upload Document',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'The [mainAxisAlignment], [mainAxisSize], [crossAxisAlignment], and [verticalDirection] arguments must not be null. If [crossAxisAlignment] is [CrossAxisAlignment.baseline], then [textBaseline] must not be null.',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _chooseImage('L');
                                    },
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      child: licenseImg != null
                                          ? Image.file(File(licenseImg!.path))
                                          : Center(
                                              child: Icon(
                                                Icons.camera_alt,
                                                size: 50,
                                              ),
                                            ),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                  ),
                                  Text('Driving License')
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _chooseImage('I');
                                    },
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      child: Center(
                                        child: identityImg != null
                                            ? Image.file(
                                                File(identityImg!.path))
                                            : Icon(
                                                Icons.camera_alt,
                                                size: 50,
                                              ),
                                      ),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                  ),
                                  Text('Identity card')
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: licenseImg == null || identityImg == null
                          ? null
                          : () async {
                              setState(() {
                                isAdding = true;
                              });
                              var res =
                                  await KYC().addKYC(licenseImg!, identityImg!);
                              if (res == true) {
                                getMyKYC();
                                setState(() {
                                  isAdding = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.green,
                                        content:
                                            Text('Kyc Added successfully')));
                              } else {
                                setState(() {
                                  isAdding = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text('Cannot add.')));
                              }
                            },
                      child: Container(
                        height: 50,
                        color: licenseImg == null || identityImg == null
                            ? Colors.grey
                            : Color(0XFFE5B8F4),
                        child: Center(
                          child: Text(
                            isAdding == true ? 'Wait....' : 'Continue',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
    );
  }
}
