import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/auth/custom_auth/auth_util.dart';

String upperCaseFirstLetter(String letter) {
  List<String> words = letter.split(' ');
  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    if (word.isNotEmpty) {
      words[i] = word[0].toUpperCase() + word.substring(1);
    }
  }
  return words.join(' ');
}

List<bool>? compareList(
  List<String>? listaItems,
  List<String> listaResultApi,
) {
  // verifica se existe um valor em uma lista e retorna true or false
  if (listaItems == null || listaResultApi == null) {
    return null;
  }
  List<bool> result = [];
  for (String item in listaItems) {
    result.add(listaResultApi.contains(item));
  }
  return result;
}
