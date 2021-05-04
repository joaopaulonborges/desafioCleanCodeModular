import 'package:flutter/cupertino.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/entities/car_brand_entite.dart';
import 'package:flutter/material.dart';

class CarList extends StatelessWidget {
  final List<CarBrand> listCarBrand;

  const CarList({
    Key key,
    this.listCarBrand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: listCarBrand.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text('${listCarBrand[index].id}'),
          title: Text('${listCarBrand[index].name}'),
          subtitle: Text('${listCarBrand[index].fipeName}'),
          trailing: Text('${listCarBrand[index].key}'),
        );
      },
    );
  }
}
