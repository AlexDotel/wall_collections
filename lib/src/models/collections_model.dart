import 'package:wall_collections/src/models/collection_model.dart';

class Collections{

  List<Collection> listaColecciones = new List();

  Collections.fromJsonList(List<dynamic> jsonList){

    if(jsonList == null) return;

    jsonList.forEach((col){

      final coleccion = Collection.fromJson(col);
      listaColecciones.add(coleccion);

    });


  }

}

