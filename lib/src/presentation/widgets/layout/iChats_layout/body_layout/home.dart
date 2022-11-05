import 'package:flutter/material.dart';
import 'package:i_chat/src/presentation/widgets/item/item_chat.dart';
import '../../../../../config/app_const.dart';
import '../../../drawable/custom_search.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> a = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
    a.insert(0, 0);

    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(3.0),
        child: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          edgeOffset: 0,
          onRefresh: () { return _onRefresh(); },
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: a.length,
              itemBuilder: (context, index) {
                return index == 0
                    ? CustomSearch(
                        styleOutLineEmail: StyleOutLineSearch.outlineInputBorder,
                        backgroundColor: Colors.grey.shade300,
                        prefixIcon: Icons.search,
                        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                        radius: 50,
                        onTap: () {
                          Navigator.pushNamed(context, RouteConst.searchRoutes);
                        },
                      )
                    : ItemChat(index: index,);
              }),
        ));
  }
}
 Future<void> _onRefresh(){
  return Future.delayed(const Duration(seconds: 1));
 }