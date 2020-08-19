import 'package:flutter/material.dart';
import 'package:wall_collections/src/models/collection_model.dart';


class CollectionWidget extends StatelessWidget {

  var size;

  Collection coleccion;
  Function funcion;

  CollectionWidget({@required this.coleccion, @required this.funcion});

  @override
  Widget build(BuildContext context) {


    size = MediaQuery.of(context).size;

    var gradiente = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(100, 100, 100, 0.5),                        
          // Color.fromRGBO(100, 100, 100, 0.7),                        
          Color.fromRGBO(0, 0, 0, 0.9),                        
        ],
        begin: FractionalOffset(0.0, 0.1),
        end: FractionalOffset(0.0, 1.0)));

    var fondo =  BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.blueGrey,
      image: DecorationImage(
        image: NetworkImage(coleccion.getImage()), fit: BoxFit.fitWidth), //Imagen de Portada
    );


    return GestureDetector(
      onTap: funcion,
      child: Container(
          decoration: fondo,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          height: size.height*0.25,
          width: size.width*0.9,
          
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            
            child: Stack(
              children: <Widget>[
                
                Container(
                  decoration: gradiente,
                  height: double.infinity,
                  width: double.infinity,
                ),

                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.bottomRight,
                  height: double.infinity,
                  width: double.infinity,                
                  child: Text(coleccion.title,        //Nombre de la coleccion
                    style: TextStyle(color: Colors.white,
                    fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                ),

                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  height: double.infinity,
                  width: double.infinity,                
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.image, color: Colors.white, size: 12),
                      SizedBox(width: 5),
                      Text(coleccion.totalPhotos.toString(),         //Numero de Fotos
                        style: TextStyle(color: Colors.white,
                        fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )
                ),

              ],
            ),
          ),
      ),
    );  


  }
}