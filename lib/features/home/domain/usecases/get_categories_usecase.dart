import 'package:dartz/dartz.dart';
import 'package:inthekloud_shop_app/core/error/failures.dart';
import 'package:inthekloud_shop_app/core/use_cases/usecase.dart';
import 'package:inthekloud_shop_app/features/home/domain/repositories/home_repository.dart';

class GetCategoriesUseCase implements UseCase<List<dynamic>, NoParams> {
  final HomeRepository homeRepository;

  GetCategoriesUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<dynamic>>?> call(NoParams params) async {
    return homeRepository.getCategories(params);
  }
}
