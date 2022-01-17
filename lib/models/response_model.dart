class QuestionModel{
  String? response;
  int? fieldPosition;

  QuestionModel({
    this.response,
    this.fieldPosition
  });

  QuestionModel.fromJson(Map json){
    response = json["response"];
    fieldPosition = json["fildPosition"];
  }

  Map toJson() {
    Map map = Map();
    { 
      map["response"] = response;
      map["fieldPosition"] = fieldPosition;
    }
  return map;
  }
}