import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spacepal/core/models/staff_model.dart';
import 'package:spacepal/core/services/userapi.dart';
import 'package:spacepal/locator.dart';
class UserViewModel extends ChangeNotifier {
   UserApi userApi = locator<UserApi>();
   List<Staff> staff = [];
    Future<List<Staff>> getAllStaff() async{
      var result = await userApi.getDocuments();
      staff = result.docs
              .map((doc) => Staff.fromMap(doc.data() as Map<String, dynamic>, doc.id)).toList();
      return staff;
  }
 
  Future<Staff> getStaffById(String id) async{
    var doc = await userApi.getDocumentById(id);
    return Staff.fromMap(doc.data() as Map<String, dynamic>, doc.id);
  }
  Future createStaffProfile(Staff data){
        var result = userApi.addData(data.toJson());
        return result;
  }
    updateData(Staff data, String id){
      return userApi.updateData(data.toJson(), id);
    }
}