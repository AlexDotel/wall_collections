import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wall_collections/src/models/collection_model.dart';
import 'package:wall_collections/src/models/collections_model.dart';

import 'package:wall_collections/src/models/foto_model.dart';



class CollectionProvider{

  String _url = 'api.unsplash.com';
  // String _api = 'PfU1RMbM7BGXTEWoBfzZOJRGSNY2ako6w_MR2u_pVAE';
  String _api = '_bRVvd55N5aQMA0ivaA0AsCKifCU2eVNPKTODu9kHhU';
  String _version = 'v1';
  String _coleccion = '/collections';
  String _random = '/photos/random';
  String _orientation = 'portrait';



  Future<List<Collection>> getCollections() async {
    
    final url = Uri.https(_url, _coleccion, {

      'client_id' : _api,

    });
    
    return resolverUri(url);
    
  }



  Future<Foto> getFoto(String id) async {

    final url = Uri.https(_url, _random, {

      'client_id'   : _api,
      'collections' : id,
      'orientation' : _orientation

    });

    return resolverUriFoto(url);
    
  }





  Future<List<Collection>> resolverUri(Uri url) async{

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    final listado = Collections.fromJsonList(decodedData);

    print(listado.listaColecciones[0].coverPhoto.urls.small);

    return listado.listaColecciones;

  }



  Future<Foto> resolverUriFoto(Uri url) async{

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    final foto = Foto.fromJson(decodedData);

    print(foto.id);

    return foto;

  }


}