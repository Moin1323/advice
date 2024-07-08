import 'package:advice/1_domain/entities/advice_entity.dart';
import 'package:advice/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    //call a repository to get data(failure or data)
    //proceed with business logic (manipulate the data)
    //for example
    await Future.delayed(const Duration(seconds: 3), () {});

    //call to repo went good -> return data not failure
    return right(const AdviceEntity(advice: "advice for testing", id: 1));

    //call to repo went wrong -> return warning, error message
    //return left(ServerFailure());
  }
}
