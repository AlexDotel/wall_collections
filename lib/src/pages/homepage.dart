import 'package:flutter/material.dart';
import 'package:wall_collections/src/Widgets/widget_collection.dart';
import 'package:wall_collections/src/models/collection_model.dart';
import 'package:wall_collections/src/providers/providers.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  var size;

  var url = 'https://images.unsplash.com/photo-1437021663029-4b6a28719dee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';

  var gradiente = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(100, 100, 100, 0.5),                        
        // Color.fromRGBO(100, 100, 100, 0.7),                        
        Color.fromRGBO(0, 0, 0, 0.9),                        
      ],
      begin: FractionalOffset(0.0, 0.1),
      end: FractionalOffset(0.0, 1.0)));

  final provedor = CollectionProvider();




  @override
  void initState() { 
    super.initState();
    provedor.getCollections();
  }




  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: Text('Collections', style: TextStyle(color: Colors.black87, fontSize: 20),),
          elevation: 0.0,
          backgroundColor: Colors.white,          
        ),


        body: Container(
          color: Colors.white,
          child:FutureBuilder(
            future: provedor.getCollections(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
             
             if(snapshot.hasData){

              List<Collection> lista = snapshot.data;
               return _generacionLista(lista, context);

             }else{

              return Center(child: CircularProgressIndicator());

             }
            },
          ),
        ),
      ),
    );
  }

  ListView _generacionLista(List<Collection> lista, BuildContext context) {
 
    List<Widget> listaWidget = new List();

    lista.map((col){

      listaWidget.add(
        CollectionWidget(
          coleccion: col,
          funcion:(){

            Navigator.of(context).pushNamed('galeria', arguments: col);

          })
      );

    }).toList();

    return ListView(
      children: listaWidget
    );

  }


}