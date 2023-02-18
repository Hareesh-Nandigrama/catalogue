import 'package:catalogue/widgets/customer/customer_card.dart';
import 'package:catalogue/widgets/customer/search_bar.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';
import '../../apis/seller.dart';
import '../../widgets/common/shimmer.dart';

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
        FutureBuilder<List<dynamic>>(
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
                          child: ShowShimmer(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                          ),
                        );
                      }),
                );
              } else if (snapshot.hasData) {
                List<dynamic> allShops = snapshot.data!;
                if (widget.index == 0) {
                  allShops.retainWhere(
                      (element) => element['businessType'] == 'foodOutlet');
                } else if (widget.index == 1) {
                  allShops.retainWhere(
                      (element) => element['businessType'] == 'stationary');
                } else {
                  allShops.retainWhere(
                      (element) => element['businessType'] == 'others');
                }

                return Expanded(
                  child: allShops.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(226, 226, 226, 1),
                                      width: 1),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomerSearchBar(),
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                        const Color.fromRGBO(226, 226, 226, 1),
                                    child: Image.asset(
                                      'assets/profile.png',
                                      height: 25,
                                      width: 25,
                                    ),
                                    // backgroundImage: AssetImage('assets/profile.png'),
                                  )
                                ],
                              ),
                            ),
                            ListView.builder(
                                itemCount: allShops.length,
                                itemBuilder: (context, index) {
                                  return CustomerCard(
                                    body: allShops[index],
                                  );
                                })
                          ],
                        )
                      // ? ListView.builder(
                      //     itemCount: allShops.length,
                      //     itemBuilder: (context, index) {
                      //       return CustomerCard(
                      //         body: allShops[index],
                      //       );
                      //     })
                      : NoOutlets(),
                );
              }
              return const CircularProgressIndicator();
            })
      ],
    );
  }
}

class NoOutlets extends StatelessWidget {
  const NoOutlets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(color: Color.fromRGBO(226, 226, 226, 1), width: 1),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(),
              ),
              const SizedBox(
                width: 14,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: const Color.fromRGBO(226, 226, 226, 1),
                child: Image.asset(
                  'assets/profile.png',
                  height: 25,
                  width: 25,
                ),
                // backgroundImage: AssetImage('assets/profile.png'),
              )
            ],
          ),
        ),
        const Spacer(),
        Image.asset(
          'assets/outlet.png',
          height: 136,
          width: 136,
        ),
        const Text(
          'No Outlets Available',
          style: TextStyle(fontSize: 20),
        ),
        const Text(
          'We couldn\'t find any shops nearby!',
          style:
              TextStyle(fontSize: 14, color: Color.fromRGBO(117, 117, 117, 1)),
        ),
        const SizedBox(
          height: 24,
        ),
        const CustomButton(isDisabled: false, buttonname: 'Try Again!'),
        const Spacer(),
      ],
    );
  }
}
