import 'package:desafio_modular_clean_code/app/modules/car_brands/presentation/bloc/bloc.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/presentation/bloc/car_brand_bloc.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/presentation/widgets/car_list.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/presentation/widgets/loading_display.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/presentation/widgets/message_display.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/presentation/widgets/search_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CarBrandList extends StatefulWidget {
  @override
  _CarBrandListState createState() => _CarBrandListState();
}

class _CarBrandListState extends State<CarBrandList> {
  // ignore: close_sinks
  final carBrandBloc = Modular.get<CarBrandBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brand List'),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            BlocBuilder<CarBrandBloc, CarBrandState>(
              bloc: carBrandBloc,
              builder: (context, state) {
                if (state is Empty) {
                  return MessageDisplay(
                    message: 'Click to start searching!',
                  );
                } else if (state is Loading) {
                  return LoadingWidget();
                } else if (state is Loaded) {
                  return CarList(listCarBrand: state.listCarBrand);
                } else if (state is Error) {
                  return MessageDisplay(
                    message: state.message,
                  );
                }
                return MessageDisplay(
                  message: 'Click to start searching!',
                );
              },
            ),
            SizedBox(height: 15.0),
            SearchButton(),
          ],
        ),
      ),
    );
  }
}
