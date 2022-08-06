// ignore: file_names
import 'dart:ffi';

import 'package:climate/Models/model.dart';
import 'package:climate/services/data_services.dart';
import 'package:climate/widgets/LocationTile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();
  final dataService = DataService();
  Weather? _responce;
  @override
  void initState() {
    super.initState();
    search();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18183F),
      
       body:
       _responce==null?
       FutureBuilder(builder: (context,snapshot){return RefreshIndicator(child: 
       home(responce: _responce,), onRefresh:()async{  final response=await dataService.getData('London');
    setState(() {
      _responce=response;
    });})  ; },future: refresh(),)
      /* RefreshIndicator(child: 
       home(responce: _responce,), onRefresh:()async{  final response=await dataService.getData('London');
    setState(() {
      _responce=response;
    });})*/
        );
  }
  void search() async {
    final response = await dataService.getData('London');
    setState(() {
      _responce = response;
    });
  }


  Future <void>refresh()async{
    final response=await dataService.getData('London');
    setState(() {
      _responce=response;
    });
  }
}






class home extends StatefulWidget {
  
 final Weather? responce;

  const home({Key? key, this.responce}) : super(key: key);
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

   

  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(children: [Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Padding(
      padding: const EdgeInsets.only(left:15.0,top: 20.0),
      child: locationTile(responce: widget.responce),
    ),

    Padding(
      padding: const EdgeInsets.only(right:15.0,top: 20.0),
      // ignore: use_full_hex_values_for_flutter_colors
      child: IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Color(0xfffff638dc),size: 35,)),
    )
    
    
      ],),
      Center(
    child: Column(children: [

        Padding(
          padding: const EdgeInsets.only(top:30.0),
          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(69),
      color:const  Color(0xff020307)),
      height: 300,
      width: 300,
      child: Center(child:
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: use_full_hex_values_for_flutter_colors
        children: [ Text('${widget.responce!.current.tempC}',style: const TextStyle(color: Color(0xfffff638dc),fontSize: 100),),
      
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(widget.responce!.current.condition.text,style: const TextStyle(color: Colors.white,fontSize: 25),),
      ),
      ],)
      
       
       ),
      ),
        ),
const Icon(Icons.shower
,size: 200,color: Colors.white,)
,

//Text(_responce!.location.localtime,style: const TextStyle(color: Colors.white,fontSize: 25),),

      const Padding(
        padding: EdgeInsets.only(left: 15.0,right: 15.0),
        child: Divider(
          color:  Color(0xff494963),
          thickness: 2,
         ),
      ),

Text(widget.responce!.location.name,style: const TextStyle(color: Colors.white,fontSize: 25),),
Text(widget.responce!.location.region,style: const TextStyle(color: Colors.white,fontSize: 25),),
Text(widget.responce!.location.country,style: const TextStyle(color: Colors.white,fontSize: 25),),

    ],),
      )
      
      ],),);

  }
}





// ignore: camel_case_types
class homeScreen extends StatelessWidget {
  const homeScreen({
    Key? key,
    required Weather? responce,
  }) : _responce = responce, super(key: key);

  final Weather? _responce;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(child: Column(children: [Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Padding(
      padding: const EdgeInsets.only(left:15.0,top: 20.0),
      child: locationTile(responce: _responce),
    ),

    Padding(
      padding: const EdgeInsets.only(right:15.0,top: 20.0),
      // ignore: use_full_hex_values_for_flutter_colors
      child: IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Color(0xfffff638dc),size: 35,)),
    )
    
    
      ],),
      Center(
    child: Column(children: [

        Padding(
          padding: const EdgeInsets.only(top:30.0),
          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(69),
      color:const  Color(0xff020307)),
      height: 300,
      width: 300,
      child: Center(child:
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: use_full_hex_values_for_flutter_colors
        children: [ Text('${_responce!.current.tempC}',style: const TextStyle(color: Color(0xfffff638dc),fontSize: 100),),
      
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(_responce!.current.condition.text,style: const TextStyle(color: Colors.white,fontSize: 25),),
      ),
      ],)
      
       
       ),
      ),
        ),
const Icon(Icons.shower
,size: 200,color: Colors.white,)
,

//Text(_responce!.location.localtime,style: const TextStyle(color: Colors.white,fontSize: 25),),

      const Padding(
        padding: EdgeInsets.only(left: 15.0,right: 15.0),
        child: Divider(
          color:  Color(0xff494963),
          thickness: 2,
         ),
      ),

Text(_responce!.location.name,style: const TextStyle(color: Colors.white,fontSize: 25),),
Text(_responce!.location.region,style: const TextStyle(color: Colors.white,fontSize: 25),),
Text(_responce!.location.country,style: const TextStyle(color: Colors.white,fontSize: 25),),

    ],),
      )
      
      ],),);

    



  }
}

// ignore: camel_case_types

/*

SingleChildScrollView(child: Column(children: [
      if(_responce!=null)


      Row(children: [
        Row(
          children: [
            const Icon(Icons.location_city),
              Text(_responce!.location.name),
          ],
        ),
        IconButton(onPressed: (){}, icon: const Icon(Icons.search))
      ],),
      Center(
        child: Column(children: [
          Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(69),
          color:const  Color(0xff020307)),
          height: 250,
          width: 200,
          child: Center(child: Text('25')),
          ),

         const Divider(
            color:  Color(0xff494963),
          ),
          Text(_responce!.location.name),
        Text(_responce!.location.name),  Text(_responce!.location.name),

        ],),
      )

    ],),),


*/ 