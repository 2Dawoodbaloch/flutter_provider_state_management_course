import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management_course/provider/favorite_app_provider.dart';
import 'package:provider/provider.dart';
class FavoriteApp extends StatefulWidget {
  const FavoriteApp({super.key});

  @override
  State<FavoriteApp> createState() => _FavoriteAppState();
}

class _FavoriteAppState extends State<FavoriteApp> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          InkWell(
            onTap: (){},
            child: Icon(Icons.favorite,color: Colors.white,),
          )
        ],
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: 100,
            itemBuilder: (context,index){
          return Consumer<FavoriteAppProvider>(builder: (context,value,child){
            return ListTile(
              onTap: (){

                if(value.selectedItem.contains(index)){
                  value.removeItem(index);
                }else{
                  value.addItem(index);
                }
              },
              leading: Text("item" + index.toString()),
              trailing: value.selectedItem.contains(index) ? Icon(Icons.favorite) : Icon(Icons.favorite_outline),
            );
          });
        }),
      ),
    );
  }
}
