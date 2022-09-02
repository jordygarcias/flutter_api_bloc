import 'dart:convert';
import 'dart:io';

String readFile(String filename) =>
    File('test/fixtures/$filename').readAsStringSync();

Map<String, dynamic> jsonFileToMap(String filename) =>
    json.decode(readFile(filename));
