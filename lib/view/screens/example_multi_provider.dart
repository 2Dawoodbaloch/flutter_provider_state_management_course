import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management_course/provider/multi_provider_example.dart';
import 'package:provider/provider.dart';
class ExampleMultiProvider extends StatefulWidget {
  const ExampleMultiProvider({super.key});

  @override
  State<ExampleMultiProvider> createState() => _ExampleMultiProviderState();
}

class _ExampleMultiProviderState extends State<ExampleMultiProvider> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Provider Ecample"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<MultiProviderExample>(builder: (context,val,child) {
            return  Slider(
                min: 0.0,
                max: 1.0,
                value: val.value,
                onChanged: (value){
                  val.setValue(value);
                  print(val.value);
                });
          }),

          SizedBox(height: 30,),
          Consumer<MultiProviderExample>(builder: (context,val,child){
            return Row(
              children: [
                Expanded(
                  child: Opacity(
                    opacity: val.value,
                    child: Container(
                      height: 50,
                      color: Colors.green,
                      child: Center(
                        child: Text("Green"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Opacity(
                    opacity: val.value,
                    child: Container(
                      height: 50,
                      color: Colors.red,
                      child: Center(
                        child: Text("Red"),
                      ),
                    ),
                  ),
                )
              ],
            );
          })

        ],
      ),
    );
  }
}
