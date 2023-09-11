// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_stg.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

class _StgEnv {
  static const List<int> _enviedkeyenvironment = [
    2143245568,
    3148026848,
    2116067901
  ];
  static const List<int> _envieddataenvironment = [
    2143245683,
    3148026772,
    2116067930
  ];
  static final String environment = String.fromCharCodes(
    List.generate(_envieddataenvironment.length, (i) => i, growable: false)
        .map((i) => _envieddataenvironment[i] ^ _enviedkeyenvironment[i])
        .toList(growable: false),
  );
}
