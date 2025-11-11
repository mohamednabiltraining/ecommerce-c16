 class Failure{
  final String message;
  Failure(this.message);
}

class ValidationError extends Failure{

   ValidationError(super.message);
}