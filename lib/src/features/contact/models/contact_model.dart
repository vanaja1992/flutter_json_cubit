import 'dart:convert';
ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));
String contactModelToJson(ContactModel data) => json.encode(data.toJson());
class ContactModel {
  ContactModel({
      String? name, 
      String? address, 
      String? contact, 
      String? photo, 
      String? url,}){
    _name = name;
    _address = address;
    _contact = contact;
    _photo = photo;
    _url = url;
}

  ContactModel.fromJson(dynamic json) {
    _name = json['name'];
    _address = json['address'];
    _contact = json['contact'];
    _photo = json['photo'];
    _url = json['url'];
  }
  String? _name;
  String? _address;
  String? _contact;
  String? _photo;
  String? _url;
ContactModel copyWith({  String? name,
  String? address,
  String? contact,
  String? photo,
  String? url,
}) => ContactModel(  name: name ?? _name,
  address: address ?? _address,
  contact: contact ?? _contact,
  photo: photo ?? _photo,
  url: url ?? _url,
);
  String? get name => _name;
  String? get address => _address;
  String? get contact => _contact;
  String? get photo => _photo;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['address'] = _address;
    map['contact'] = _contact;
    map['photo'] = _photo;
    map['url'] = _url;
    return map;
  }

}