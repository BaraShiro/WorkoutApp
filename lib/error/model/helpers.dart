import 'package:workout_model/workout_model.dart';

String interpretErrorCode(RepositoryError error) {
  switch (error) {
    case RepositoryError.notFoundError:
      return "The element was not found in the database!";
    case RepositoryError.alreadyExistsError:
      return "The element already exists in the database!";
    case RepositoryError.databaseError:
      return "Could not read from or write to the database!";
    case RepositoryError.unknownError:
      return "An unknown error occurred!";
  }
}