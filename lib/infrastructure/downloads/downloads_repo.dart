import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/downloads/i_downlod_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/filaures/main_failurs.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepostery implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response reopen =
          await Dio(BaseOptions()).get(ApiEndPoint.downloads);
      if (reopen.statusCode == 200 || reopen.statusCode == 2001) {
        final downloadslists = (reopen.data["results"] as List).map((e) {
          return Downloads.fromJson(e);
        }).toString();

        final List<Downloads> downloadslist = [];
        print(downloadslist);
        return right(downloadslist);
      } else {
        return left(MainFailure.clientFailure());
      }
    } catch (e) {
      log(e.toString());
      return left(MainFailure.serverFailure());
    }
  }
}
