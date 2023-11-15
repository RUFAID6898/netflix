import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/filaures/main_failurs.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
