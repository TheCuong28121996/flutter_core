// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_dev.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

class _Env {
  static const List<int> _enviedkeyenvironment = [
    10130199,
    3510934789,
    107099045
  ];
  static const List<int> _envieddataenvironment = [
    10130291,
    3510934880,
    107099091
  ];
  static final String environment = String.fromCharCodes(
    List.generate(_envieddataenvironment.length, (i) => i, growable: false)
        .map((i) => _envieddataenvironment[i] ^ _enviedkeyenvironment[i])
        .toList(growable: false),
  );
}
