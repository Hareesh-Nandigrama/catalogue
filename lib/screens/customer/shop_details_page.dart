import 'package:flutter/material.dart';

class ShopDetailsPage extends StatefulWidget {
  const ShopDetailsPage({Key? key}) : super(key: key);

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.clear))
        ],
      ),
      body: Column(
        children: [
              FutureBuilder<List<dynamic>>(
                  future: getMenu(),
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
                      List<dynamic> allShops = snapshot.data!;


                      return Expanded(
                          child: allShops.isNotEmpty
                              ? ListView.builder(
                              itemCount: allShops.length,
                              itemBuilder: (context, index) {
                                return Text('hello');
                              })
                              : Center(
                            child:
                            Text("No Result found"),
                          ));
                    }
                    return CircularProgressIndicator();
                  })
                  ],
      ),
    );
  }
}
