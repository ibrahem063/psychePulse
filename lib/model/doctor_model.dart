
class DrModel {
  late String Jurisdiction;
  late String name;
  late String email;
  late String DId;
  late String type;
  late String phone;
  late String image;
  late String rate;
  late String bio;
  late String timeOpen;
  late String timeClose;
  late String location;
  late String price;

  DrModel({
    required this.name,
    required this.email,
    required this.DId,
    required this.type,
    required this.Jurisdiction,
    required this.phone,
    required this.image,
    required this.rate,
    required this.bio,
    required this.timeOpen,
    required this.timeClose,
    required this.location,
    required this.price,
  });
  
  DrModel.frmojson(Map<String,dynamic>? json){
    Jurisdiction=json!['Jurisdiction'];
    name=json['name'];
    email=json['email'];
    DId=json['DId'];
    phone=json['phone'];
    image=json['image'];
    rate=json['rate'];
    bio=json['bio'];
    timeOpen=json['timeOpen'];
    timeClose=json['timeClose'];
    location=json['location'];
    price=json['price'];
    type=json['type'];
  }
  Map<String,dynamic> toMap(){
    return {
      'Jurisdiction':Jurisdiction,
      'name':name,
      'phone':phone,
      'DId':DId,
      'image':image,
      'rate':rate,
      'bio':bio,
      'timeOpen':timeOpen,
      'timeClose':timeClose,
      'location':location,
      'price':price,
      'email':email,
      'type':type,
    };
  }


}
