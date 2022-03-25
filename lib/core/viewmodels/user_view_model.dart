import 'package:flutter/material.dart';
import 'package:spacepal/core/models/staff_model.dart';
import 'package:spacepal/core/services/userapi.dart';

class UserViewModel extends ChangeNotifier {
  UserApi userApi = UserApi();
  List<Staff> staff = [];
  Future<List<Staff>> getAllStaff() async {
    var result = await userApi.getDocuments();
    staff = result.docs
        .map((doc) => Staff.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
    return staff;
  }

  Future<Staff> getStaffById(String id) async {
    var doc = await userApi.getDocumentById(id);
    return Staff.fromMap(doc.data() as Map<String, dynamic>, doc.id);
  }

  makeAdmin(userId) {
    Map<String, dynamic> data = {
      "isAdmin": true,
    };
    return userApi.updateData(data, userId);
  }
}
