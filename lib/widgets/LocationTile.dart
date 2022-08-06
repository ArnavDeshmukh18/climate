// ignore: file_names
import 'package:climate/Models/model.dart';
import 'package:flutter/material.dart';
// ignore: camel_case_types
class locationTile extends StatelessWidget {
  const locationTile({
    Key? key,
    required Weather? responce,
  }) : _responce = responce, super(key: key);

  final Weather? _responce;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(Icons.location_pin,color: Color(0xffF638DC),size: 35,),

      Text(_responce!.location.name,style: const TextStyle(fontSize: 25,color: Colors.white),),
    ],);
  }
}