import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  HomeProvider? HomeProviderTrue;
  HomeProvider? HomeProviderFalse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getTrain();
  }

  @override
  Widget build(BuildContext context) {
    HomeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    HomeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Train Api",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: HomeProviderFalse!.getTrain(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List? l1 = snapshot.data;
              return ListView.builder(
                itemCount: l1!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${l1[index].name}"),
                    subtitle: Text("${l1[index].data.days.sun}"),
                    leading: Text("${l1[index].trainNum}"),
                    trailing: Text("${l1[index].data.classes[2]}"),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
