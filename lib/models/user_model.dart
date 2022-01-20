class UserModel {
  String? userName;
  String? userAge;
  String? userEmail;
  String? userPassword;
  String? userCellPhone;
  String? userPhone;

  UserModel({
    this.userName,
    this.userAge,
    this.userEmail,
    this.userPassword,
    this.userCellPhone,
    this.userPhone,
  });

  UserModel.fromJson(Map<String, dynamic>? json) {
    userName = json?["userName"] as String;
    userAge = json?["userAge"] as String;
    userAge = json?["userAge"] as String;
    userEmail = json?["userEmail"] as String;
    userPassword = json?["userPassword"] as String;
    userCellPhone = json?["userCellPhone"] as String;
    userPhone = json?["userPhone"] as String;
  }
}
