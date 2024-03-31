import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:manitoba_driving_test/shared/%20cache/hive_boxes.dart';
import 'package:manitoba_driving_test/shared/logger/logger.dart';

class HiveCacheImageSource extends ScalableImageSource {
  final String _url;
  @override
  final bool warn;
  late final _SIFetcher _fetcher = _SIFetcher(warn);

  HiveCacheImageSource(this._url, {this.warn = true});

  @override
  bool operator ==(Object other) {
    return other is HiveCacheImageSource &&
        _url == other._url &&
        warn == other.warn;
  }

  @override
  int get hashCode => Object.hash(_url, warn) ^ 0x5eb3bb2c;

  @override
  Future<ScalableImage> createSI() async => _fetcher.get(_url);
}

abstract class _AsyncCanonicalizingFetcher<String, ScalableImage> {
  final Map<String, Future<ScalableImage>> _pending = {};

  Future<ScalableImage> get(String key) => _pending.putIfAbsent(key, () async {
        try {
          return await create(key);
        } finally {
          final check = _pending.remove(key);
          assert(check != null);
        }
      });

  @protected
  Future<ScalableImage> create(String key);
}

class _SIFetcher extends _AsyncCanonicalizingFetcher<String, ScalableImage> {
  final bool _warn;
  Box<Object> get _box => HiveBoxes.svgCacheBox;

  _SIFetcher(this._warn);

  @override
  Future<ScalableImage> create(String url) async {
    Object? cached;
    cached = _box.get(url);
    if (cached is Uint8List) {
      if (_warn) {
        logger.d('FROM CACHE: $url');
      }
      return ScalableImage.fromSIBytes(cached, compact: true);
    }
    try {
      final si = await ScalableImageSource.fromSvgHttpUrl(
        Uri.parse(url),
        compact: true,
        bigFloats: true,
        warnF: _nullWarn,
      ).createSI();
      await _box.put(url, si.toSIBytes());
      if (_warn) {
        logger.d('FROM NETWORK: $url');
      }
      return si.toDag();
    } catch (err) {
      if (_warn) {
        logger.d('Network error $err');
      }
      rethrow;
    }
  }
}

void _nullWarn(String message) {}
