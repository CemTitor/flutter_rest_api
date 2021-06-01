import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:null_rest_api/models/album_for_listing.dart';
import 'package:null_rest_api/models/api_response.dart';

class AlbumService {
  static const API = 'https://jsonplaceholder.typicode.com';
  // static const headers = {'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471'};

  Future<APIResponse<List<AlbumForListing>>> getAlbumList() {
    return http.get(Uri.parse(API + '/albums')).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final albums = <AlbumForListing>[];
        for (var item in jsonData) {
          final note = AlbumForListing(
            userId: item['userId'],
            id: item['id'],
            title: item['title'],
          );
          albums.add(note);
        }
        return APIResponse<List<AlbumForListing>>(data: albums);
      }
      return APIResponse<List<AlbumForListing>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<AlbumForListing>>(
        error: true, errorMessage: 'An error occured'));
  }
}
