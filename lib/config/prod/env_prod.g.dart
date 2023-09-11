// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_prod.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

class _Env {
  static const List<int> _enviedkeyenvironment = [
    1511497784,
    3351701593,
    1445166669,
    4100414673
  ];
  static const List<int> _envieddataenvironment = [
    1511497800,
    3351701547,
    1445166626,
    4100414645
  ];
  static final String environment = String.fromCharCodes(
    List.generate(_envieddataenvironment.length, (i) => i, growable: false)
        .map((i) => _envieddataenvironment[i] ^ _enviedkeyenvironment[i])
        .toList(growable: false),
  );
}
