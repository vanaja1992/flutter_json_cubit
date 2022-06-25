import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/contact_model.dart';

class ContactRepository {
  Future<String> loadRecordJsonFile() async {
    String data = await rootBundle.loadString("assets/data/records.json");
    return data;
  }

  Future<List<ContactModel>> getContactsData() async {
    String rowJson = await loadRecordJsonFile();
    List<dynamic> decodedData = jsonDecode(rowJson);
    List<ContactModel> contactListModel =
        decodedData.map((e) => ContactModel.fromJson(e)).toList();
    return contactListModel;
  }
}
