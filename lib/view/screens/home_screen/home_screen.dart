import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_state_management_course/provider/count_provider.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer){
      final countProvider = Provider.of<CountProvider>(context,listen: false);
      countProvider.setValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build ");
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Provider State Management Course"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
          },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Consumer<CountProvider>(builder: (context,value,child){
            print("build onyl");
            return  Text(value.count.toString(),style: TextStyle(fontSize: 100),);
    })
          )
        ],
      ),
    );
  }
}
