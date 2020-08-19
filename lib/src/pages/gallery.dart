import 'package:flutter/material.dart';
import 'package:wall_collections/src/models/collection_model.dart';
import 'package:wall_collections/src/models/foto_model.dart';
import 'package:wall_collections/src/providers/providers.dart';

class Gallery extends StatefulWidget {

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final provedorFoto = CollectionProvider();

  Collection coleccion;

  @override
  Widget build(BuildContext context) {

  coleccion = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: 
      Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: Text(coleccion.title, style: TextStyle(color: Colors.black87),),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),


        body: Container(
          color: Colors.white,

          child: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), 
                color: Colors.black,
              ),

              child:getFoto(),

            ),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            onPressed: (){

              setState(() {
                
              });

            },
            child: Icon(Icons.loop),
            backgroundColor: Colors.black,
          ),
        ),

      ),
      
    );
  }

  getFoto() {


    return FutureBuilder(
          future: provedorFoto.getFoto(coleccion.id.toString()),
    builder: (BuildContext context, AsyncSnapshot<Foto> snapshot) {

    if(snapshot.hasData){

    final foto = snapshot.data;
    return showFoto(foto);

    }else{

    return Center(child: CircularProgressIndicator());

        }

      },
    );

    

  }

    showFoto(Foto foto){

      return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image(
            image: NetworkImage(foto.urls.regular), // Aqui va la foto que queremos mostrar
            fit: BoxFit.cover
        ),
      );


  }
}