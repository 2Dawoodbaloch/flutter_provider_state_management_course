import 'package:flutter/material.dart';
class ValueNotifierListner extends StatelessWidget {
   ValueNotifierListner({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Value Notifier Listner"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      floatingActionButton:
      FloatingActionButton(
          onPressed: (){
            _counter.value++;
          },
        backgroundColor: Colors.blue,
      child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context,value,child){
                  return TextField(
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                        suffix: InkWell(
                          onTap: (){
                            toggle.value =! toggle.value;
                          },
                          child: Icon(toggle.value ? Icons.visibility_off  : Icons.visibility  ),
                        ),
                        hint: Text("password"),
                        border: UnderlineInputBorder(

                        )
                    ),
                  );
                }),


            ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context,value,child){
                  return Text(_counter.value.toString());
                }),
          ],
        )
      ),
    );
  }
}
