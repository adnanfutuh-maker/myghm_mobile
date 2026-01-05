// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: .env.dev
final class _Env {
  static const List<int> _enviedkeybaseEndpoint = <int>[
    3548009062,
    53746264,
    1903005159,
    1510374326,
    83695625,
    2851650549,
    2088924000,
    3852115787,
    3675933557,
    227971690,
    2604496355,
    1439098642,
    3621048697,
    2798098553,
    2864654527,
    2533049452,
    3529128194,
    1832651666,
    906943963,
    1251063692,
    1729363951,
    319405376,
    3214234056,
    2942034149,
    1623730888,
    3474866152,
    3671711182,
    1140152939,
    1342355157,
    162134651,
  ];

  static const List<int> _envieddatabaseEndpoint = <int>[
    3548008974,
    53746220,
    1903005075,
    1510374342,
    83695738,
    2851650511,
    2088923983,
    3852115812,
    3675933460,
    227971610,
    2604496266,
    1439098684,
    3621048593,
    2798098444,
    2864654546,
    2533049357,
    3529128300,
    1832651771,
    906943925,
    1251063784,
    1729363840,
    319405422,
    3214234027,
    2942034058,
    1623730853,
    3474866119,
    3671711151,
    1140152859,
    1342355132,
    162134612,
  ];

  static final String baseEndpoint = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseEndpoint.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseEndpoint[i] ^ _enviedkeybaseEndpoint[i]),
  );

  static const List<int> _enviedkeyapiKey = <int>[
    3012457798,
    3206705991,
    3638679354,
    3451650322,
    804161831,
    40858582,
    2270951774,
    2389342838,
    73332233,
    2951199236,
    3027668582,
    3152157782,
    2975352504,
    1557138063,
  ];

  static const List<int> _envieddataapiKey = <int>[
    3012457762,
    3206705954,
    3638679372,
    3451650367,
    804161876,
    40858547,
    2270951741,
    2389342724,
    73332332,
    2951199344,
    3027668555,
    3152157757,
    2975352541,
    1557138166,
  ];

  static final String apiKey = String.fromCharCodes(
    List<int>.generate(
      _envieddataapiKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]),
  );

  static const bool showDebugInfo = true;
}
