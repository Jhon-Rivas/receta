class CoctelModel {
  String idDrink;
  String strDrink;
  String strDrinkThumb;

  CoctelModel({
    required this.idDrink,
    required this.strDrink,
    required this.strDrinkThumb,
  });

  factory CoctelModel.fromJsonMap(Map<String, dynamic> json) => CoctelModel(
        idDrink: json["idDrink"],
        strDrink: json["strDrink"],
        strDrinkThumb: json["strDrinkThumb"],
      );
}
