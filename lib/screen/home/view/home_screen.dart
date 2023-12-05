import 'package:adhhar_app/screen/home/provider/home_provider.dart';
import 'package:adhhar_app/screen/utils/nertwork_connection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  NetworkConnection networkConnection = NetworkConnection();
  @override
  void initState() {
    super.initState();
    networkConnection.checkConnection(context);
  }
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Aadhaar app"),
          ),
          body: providerW!.isOnline
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 120,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${index}",
                            style: const TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle,),
                  child: const Image(image: AssetImage("assets/image/network.png"),fit: BoxFit.cover),
                ))),
    );
  }
}
