import 'package:climate/services/data_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final textController=TextEditingController();
 final dataService=DataService();
 
 
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
body: Column(children: [
TextField(
  controller: textController,
)
,
  IconButton(onPressed:search, icon:const Icon(Icons.add_location),)
],)

    );
  }
   void search()
async{
final response= await dataService.getData('Pune');
// ignore: avoid_print
print(response);
// ignore: avoid_print
print(response.location.name);
print(response.current.tempC);


  }
}