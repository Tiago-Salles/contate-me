class WorkerModel{

  String? name;
  String? email;
  String? phone;
  String? site;
  String? instagramProfile;
  String? city;
  String? profession;
  String? service;
  String? differential;
  String? userMessage;
  String? cellPhone;

  WorkerModel({
    this.name, 
    this.email, 
    this.phone,
    this.site,
    this.instagramProfile, 
    this.city, 
    this.profession, 
    this.service, 
    this.differential, 
    this.userMessage,
    this.cellPhone,
    });

  WorkerModel.fromJson(Map json) {
    name = json["name"] as String;
    email = json["email"] as String;
    phone = (json["phone"] ?? "") as String;
    cellPhone = json["cellPhone"]  as String;
    site = (json["site"] ?? "") as String;
    instagramProfile = (json["instagramProfile"] ?? "") as String;
    city = json["city"] as String;
    profession = json["profession"] as String;
    service = json["service"] as String;
    differential = json["differential"] as String;
    userMessage = json["userMessage"] as String;
  }


  Map<String, String> toJson(WorkerModel workerModel) => {
    "name" : "${workerModel.name}",
    "email" : "${workerModel.email}",
    "phone" : "${workerModel.phone}",
    "cellPhone" : "${workerModel.cellPhone}",
    "site" : "${workerModel.site}",
    "instagramProfile" : "${workerModel.instagramProfile}",
    "city" : "${workerModel.city}",
    "profession" : "${workerModel.profession}",
    "service" : "${workerModel.service}",
    "differential" : "${workerModel.differential}",
    "userMessage" : "${workerModel.userMessage}",
  };

}