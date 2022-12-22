class UserModel {
  String? name;
  String? phone;
  String? mail;


  UserModel({
    this.name,
    this.phone,
    this.mail,

  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    mail = json['mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['mail'] = mail;

    return data;
  }

  String toString() {
    return "Name: " +
        this.name.toString() +
        "\nphone: "+
        this.phone.toString()+
        "\nE-mail :" +
        this.mail.toString() ;

  }
}