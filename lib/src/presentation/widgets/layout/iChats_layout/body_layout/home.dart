import 'package:flutter/material.dart';
import '../../../drawable/custom_search.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(3.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSearch(
                styleOutLineEmail: StyleOutLineSearch.outlineInputBorder,
                backgroundColor: Colors.grey.shade300,
                prefixIcon: Icons.search,
                radius: 50,
                onTap: () {

                },
              ),
            ],
          ),
        ));
  }
}
