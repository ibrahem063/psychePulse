
class UserModel {
  late String email;
  late String name;
  late String uId;
  late String phone;
  late String image;
  late bool isEmailVerified;
  late String cover;

  UserModel({
    required this.name,
    required this.uId,
    required this.email,
    required this.phone,
    this.isEmailVerified=false,
    required this.image,
    required this.cover,
  });
  
  UserModel.frmojson(Map<String,dynamic>? json){
    email=json!['email'];
    name=json['name'];
    uId=json['uId'];
    phone=json['phone'];
    image=json['image'];
    isEmailVerified=json['isEmailVerified'];
    cover=json['cover'];
  }
  Map<String,dynamic> toMap(){
    return {
      'email':email,
      'name':name,
      'phone':phone,
      'uId':uId,
      'isEmailVerified':isEmailVerified,
      'image':image,
      'cover':cover,
    };
  }


}
