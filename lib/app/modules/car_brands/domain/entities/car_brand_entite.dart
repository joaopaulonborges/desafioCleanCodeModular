class CarBrand {
  int id;
  String key;
  String name;
  String fipeName;

  CarBrand({
    this.id,
    this.key,
    this.name,
    this.fipeName,
  });

  List<Object> get props => [id, key, name, fipeName];
}
