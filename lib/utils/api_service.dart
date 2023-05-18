// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as devlog;

import '../models/song_model.dart';

class ApiService {
  Future<List<SongModel>> getAllFetchMusicData() async {
    const url = "https://storage.googleapis.com/uamp/catalog.json";
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json['music'] as List<dynamic>;
        final musicList = result.map((e) {
          return SongModel.fromJson(e);
        }).toList();

        devlog.log(musicList.toString(), name: "MyMusicData");
        return musicList;
      } else {
        return throw ("Data fetch failed");
      }
    } catch (e) {
      return throw ("Data fetch failed");
    }
  }
}
