import 'dart:io';

import 'package:chat/layout/cubit/cubit.dart';
import 'package:chat/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class showImageScreen extends StatelessWidget {


  final File image;
  showImageScreen({required this.image}) ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit,appStates>(
      listener: (context, state) {
        if(state is appUploadImSuccessState)
          Navigator.pop(context);
      },
      builder:  (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              if(state is! appUploadImLoadingState)
              IconButton(
                onPressed: (){
                  appCubit.get(context).updateImage();
                },
                icon: Icon(Icons.check),
              ),
            ],
          ),
          backgroundColor: Colors.black,
          body: SizedBox.expand(
            child: InteractiveViewer(
              child: Image(image: FileImage(image),),//Image.file(imageUri),
            ),
          ),
        );
      },
    );
  }
}
