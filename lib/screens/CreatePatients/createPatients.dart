import 'dart:async';


import 'package:amplify_flutter/amplify_flutter.dart';


import 'package:co_ordinators/models/CreatePatients.dart';
import 'package:co_ordinators/models/ModelProvider.dart';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


import 'package:amplify_core/amplify_core.dart';
import 'package:co_ordinators/amplifyconfiguration.dart';
import 'package:amplify_datastore/amplify_datastore.dart';


class createPatients extends StatefulWidget {
  const createPatients({Key? key}) : super(key: key);

  @override
  State<createPatients> createState() => _createPatientsState();
}

class _createPatientsState extends State<createPatients> {

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }
  @override
  void dispose() {
    super.dispose();
    // to be filled in a later step
  }
  // Future<void> _initializeApp() async {
  //   // to be filled in a later step
  // }


  Future<void> _configureAmplify() async {
    // Add the following lines to your app initialization to add the DataStore plugin
    final datastorePlugin =
    AmplifyDataStore(modelProvider: ModelProvider.instance);
    await Amplify.addPlugin(datastorePlugin);
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      safePrint(
          'Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
    }
  }



  Future<void> _createPatients() async {
    // final Name= controllerName.text;
    // final Age =int.parse(controllerAge.text);
    // final MartialStatus= _dropDown;
    // final Children= int.parse(controllerChildren.text);
    // final Gender= _dropDownValue;
    // final Hospital= controllerHospital.text;
    // final PhoneNumber= int.parse(controllerPhoneNo.text);
    // final Address= controllerAddress.text;
    // final CancerType= controllerCanerType.text;
    // final Stage=controllerCanerType.text;
    // final TreatmentPlan= controllerTreatmentPlan.text;
    // final Comorbidities=  controllerComorbidities.text;
    // final History= controllerHistory.text;
    // final SocialHistory= controllerSocialHistory.text;
    // final FamilyHistory= controllerFamilyHistory.text;
    // final Uhid= int.parse(controllerUHID.text),

    final item = CreatePatients(
    Name: controllerName.text,
    Age: int.parse(controllerAge.text),
    MartialStatus: _dropDown,
    Children: int.parse(controllerChildren.text),
    Gender: _dropDownValue,
    Hospital: controllerHospital.text,
    PhoneNumber: int.parse(controllerPhoneNo.text),
    Address: controllerAddress.text,
    CancerType: controllerCanerType.text,
    Stage: controllerCanerType.text,
    TreatmentPlan: controllerTreatmentPlan.text,
    Comorbidities:  controllerComorbidities.text,
    History: controllerHistory.text,
    SocialHistory: controllerSocialHistory.text,
    FamilyHistory: controllerFamilyHistory.text,
    Uhid: int.parse(controllerUHID.text));
    try {
    await Amplify.DataStore.save(item);
    if (mounted) {
    Navigator.of(context).pop();
    }
    } catch (e) {
    safePrint('An error occurred while saving Todo: $e');
    }
  }

  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerMartialStatus = TextEditingController();
  final controllerChildren = TextEditingController();
  late final controllerGender = TextEditingController();
  final controllerHospital = TextEditingController();
  final controllerDoctor = TextEditingController();
  final controllerUHID = TextEditingController();
  final controllerPhoneNo = TextEditingController();
  final controllerCanerType = TextEditingController();
  final controllerStage = TextEditingController();
  final controllerTreatmentPlan = TextEditingController();
  final controllerComorbidities = TextEditingController();
  final controllerHistory = TextEditingController();
  final controllerSocialHistory = TextEditingController();
  final controllerFamilyHistory = TextEditingController();
  final controllerAddress = TextEditingController();
  final controllerPass = TextEditingController();

  late String _dropDownValue = "";
  late String _dropDown="";


  @override
  Widget build(BuildContext context) {



    // final controllerName = TextEditingController();
    // final controllerAge = TextEditingController();
    // final controllerMartialStatus = TextEditingController();
    // final controllerChildren = TextEditingController();
    // late final controllerGender = TextEditingController();
    // final controllerHospital = TextEditingController();
    // final controllerDoctor = TextEditingController();
    // final controllerUHID = TextEditingController();
    // final controllerPhoneNo = TextEditingController();
    // final controllerCanerType = TextEditingController();
    // final controllerStage = TextEditingController();
    // final controllerTreatmentPlan = TextEditingController();
    // final controllerComorbidities = TextEditingController();
    // final controllerHistory = TextEditingController();
    // final controllerSocialHistory = TextEditingController();
    // final controllerFamilyHistory = TextEditingController();
    // final controllerAddress = TextEditingController();
    // final controllerPass = TextEditingController();
    //
    // late String _dropDownValue = "";
    // late String _dropDown="";





    // Future<void> _createPatients() async {
    //   // get the current text field contents
    //   // final name = _nameController.text;
    //   // final description = _descriptionController.text;
    //   final Name= controllerName.text;
    //   final Age =int.parse(controllerAge.text);
    //   final MartialStatus= _dropDown;
    //   final Children= int.parse(controllerChildren.text);
    //   final Gender= _dropDownValue;
    //   final Hospital= controllerHospital.text;
    //   final PhoneNumber= int.parse(controllerPhoneNo.text);
    //   final Address= controllerAddress.text;
    //   final CancerType= controllerCanerType.text;
    //   final Stage=controllerCanerType.text;
    //   final TreatmentPlan= controllerTreatmentPlan.text;
    //   final Comorbidities=  controllerComorbidities.text;
    //   final History= controllerHistory.text;
    //   final SocialHistory= controllerSocialHistory.text;
    //   final FamilyHistory= controllerFamilyHistory.text;
    //   final Uhid= int.parse(controllerUHID.text),
    //   );
    //
    //   final item = CreatePatients(
    //   Name: controllerName.text,
    //   Age: int.parse(controllerAge.text),
    //   MartialStatus: _dropDown,
    //   Children: int.parse(controllerChildren.text),
    //   Gender: _dropDownValue,
    //   Hospital: controllerHospital.text,
    //   PhoneNumber: int.parse(controllerPhoneNo.text),
    //   Address: controllerAddress.text,
    //   CancerType: controllerCanerType.text,
    //   Stage: controllerCanerType.text,
    //   TreatmentPlan: controllerTreatmentPlan.text,
    //   Comorbidities:  controllerComorbidities.text,
    //   History: controllerHistory.text,
    //   SocialHistory: controllerSocialHistory.text,
    //   FamilyHistory: controllerFamilyHistory.text,
    //   Uhid: int.parse(controllerUHID.text));
    //   try {
    //   await Amplify.DataStore.save(newTodo);
    //   if (mounted) {
    //   Navigator.of(context).pop();
    //   }
    //   } catch (e) {
    //   safePrint('An error occurred while saving Todo: $e');
    //   }
    // }
    return Scaffold(
          appBar: AppBar(
            title: Text(
              "Can-cer vive",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.grey),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              children: [
                Text(
                  "Add New Patients:",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerName,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          suffixIcon: Icon(Icons.person),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerAge,
                      decoration: InputDecoration(
                          labelText: 'Age',
                          suffixIcon: Icon(Icons.numbers),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: DropdownButton(

                      hint: _dropDown.isEmpty
                          ? const Text('Marital Status',style: TextStyle(color: Color(0xff5A5A5A),fontSize: 15),)
                          : Text(
                        _dropDown,
                        style: TextStyle(color: Colors.blue),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.grey[600]),
                      items: ['Single', 'Married', 'Divorced', 'Widowed'].map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        // setState(
                        //       () {
                        //     _dropDown = val as String;
                        //     //controllerGender=_dropDownValue;
                        //   },
                        // );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                // Container(
                //   decoration: BoxDecoration(
                //       color: Colors.grey[200],
                //       border: Border.all(color: Colors.white),
                //       borderRadius: BorderRadius.circular(12)),
                //   child: Padding(
                //     padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                //     child: TextField(
                //       controller: controllerHistory,
                //       decoration: InputDecoration(
                //           labelText: 'Marital Status',
                //           //suffixIcon: Icon(Icons.type_specimen),
                //           // hintText: 'Password',
                //           border: InputBorder.none),
                //     ),
                //   ),
                // ),
                //
                // //TODO dicvoureced and awinndowed and maqriied
                // //TODO gender
                // SizedBox(
                //   height: 24,
                // ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerChildren,
                      decoration: InputDecoration(
                          labelText: 'Children',
                          //suffixIcon: Icon(Icons.type_specimen),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: DropdownButton(

                      hint: _dropDownValue.isEmpty
                          ? const Text('Gender',style: TextStyle(color: Color(0xff5A5A5A),fontSize: 15),)
                          : Text(
                        _dropDownValue,
                        style: TextStyle(color: Colors.blue),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.grey[600]),
                      items: ['Male', 'Female', 'Others'].map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        // setState(
                        //       () {
                        //     _dropDownValue = val as String;
                        //   },
                        // );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerHospital,
                      decoration: InputDecoration(
                          labelText: 'Hospital',
                          suffixIcon: Icon(Icons.local_hospital),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerDoctor,
                      decoration: InputDecoration(
                          labelText: 'Doctor',
                          suffixIcon: Icon(Icons.person),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerUHID,
                      decoration: InputDecoration(
                          labelText: 'UHID',
                          suffixIcon: Icon(Icons.numbers),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerPhoneNo,
                      decoration: InputDecoration(
                          labelText: 'Phone No.',
                          suffixIcon: Icon(Icons.mobile_friendly),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerCanerType,
                      decoration: InputDecoration(
                          labelText: 'Cancer Type',
                          //suffixIcon: Icon(Icons.type_specimen),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerStage,
                      decoration: InputDecoration(
                          labelText: 'Stage',
                          //suffixIcon: Icon(Icons.type_specimen),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerTreatmentPlan,
                      decoration: InputDecoration(
                          labelText: 'Treatment Plan',
                          //suffixIcon: Icon(Icons.type_specimen),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerComorbidities,
                      decoration: InputDecoration(
                          labelText: 'Comorbidities',
                          //suffixIcon: Icon(Icons.type_specimen),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),





                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerHistory,
                      decoration: InputDecoration(
                          labelText: 'History',
                          //suffixIcon: Icon(Icons.type_specimen),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerSocialHistory,
                      decoration: InputDecoration(
                          labelText: 'Social History',
                          //suffixIcon: Icon(Icons.type_specimen),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerFamilyHistory,
                      decoration: InputDecoration(
                          labelText: 'Family History',
                          //suffixIcon: Icon(Icons.type_specimen),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                    child: TextField(
                      controller: controllerAddress,
                      decoration: InputDecoration(
                          labelText: 'Address',
                          suffixIcon: Icon(Icons.location_city),
                          // hintText: 'Password',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[200],
                    ),
                    onPressed: () async {
                      final results = await FilePicker.platform.pickFiles(
                        allowMultiple: true,
                        type: FileType.custom,
                        allowedExtensions: ['png', 'jpg'],
                      );

                      BorderRadius.circular(20);
                      if (results == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('No file Selected.')));
                      }
                      final path = results?.files.single.path!;
                      final fileName = results?.files.single.name;

                      // storage
                      //     .uploadFile(path!, fileName!)
                      //     .then((value) => print('Done'));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upload Files ",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Icon(
                          Icons.attach_file,
                          color: Colors.grey[600],
                        ),
                      ],
                    )),

                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  // //TODO caner => "cancer" ::: hopsital => "hospital"
                  //   onPressed: () {
                  //     dbRef.child(controllerUHID.text).set({
                  //       'name': controllerName.text,
                  //       'age':controllerAge.text,
                  //       'martial status':_dropDown,
                  //       'children':controllerChildren.text,
                  //       'Gender': _dropDownValue,
                  //       'hopsital': controllerHospital.text,
                  //       'doctor': controllerDoctor.text,
                  //       'UHID': controllerUHID.text,
                  //       'phoneNo': controllerPhoneNo.text,
                  //       'canerType': controllerCanerType.text,
                  //       'Stage': controllerCanerType.text,
                  //       'Treatment Plan': controllerTreatmentPlan.text,
                  //       'Comorbidities': controllerComorbidities.text,
                  //       'History': controllerHistory.text,
                  //       'Social History':controllerSocialHistory.text,
                  //       'Family History':controllerFamilyHistory.text,
                  //       'address': controllerAddress.text
                  //     });
                  //     Navigator.pop(context);
                  //   },
                    onPressed: () async {
                      _createPatients();
                    },
                    child: Text('Create'))
              ],
            ),
          ),
        );
    }
}