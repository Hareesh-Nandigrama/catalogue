import 'package:catalogue/models/shopkeeper.dart';
import 'package:flutter/material.dart';

import '../../apis/seller.dart';

class ShopsScreen extends StatefulWidget {
  final int index;
  const ShopsScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<Shopkeeper>>(
            future: getShops(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CircularProgressIndicator()
                        );
                      }),
                );
              } else if (snapshot.hasData) {
                return Container();
                // List<KritiEventModel> allKritiResults = snapshot.data!;
                // return Observer(builder: (context) {
                //   List<KritiEventModel> filteredEventSchedules = kritiFilterSchedule(input: allKritiResults, cup: kritiStore.selectedCup, club: kritiStore.selectedClub);
                //   return Expanded(
                //       child: filteredEventSchedules.isNotEmpty
                //           ? ListView.builder(
                //           itemCount: filteredEventSchedules.length,
                //           itemBuilder: (context, index) {
                //             return KritiResultCard(
                //                 eventModel:
                //                 filteredEventSchedules[index]);
                //           })
                //           : Center(
                //         child:
                //         Text("No Result found"),
                //       ));
                // });
              }
              return CircularProgressIndicator();
            })
      ],
    );
  }
}
