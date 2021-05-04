import 'package:desafio_modular_clean_code/app/core/util/app_color_theme.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/presentation/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchButton extends StatefulWidget {
  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  final carBrandBloc = Modular.get<CarBrandBloc>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => AppColorsTheme.primaryColor)),
        child: Text('Search',
            style: TextStyle(color: AppColorsTheme.backgroundColor)),
        onPressed: dispatchCarBrandSearch,
      ),
    );
  }

  void dispatchCarBrandSearch() {
    carBrandBloc.add(GetCarBrandEvent('carros'));
  }
}
