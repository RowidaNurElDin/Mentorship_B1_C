class Failure {
  final String? message;
  const Failure({this.message});

}

class OfflineFailure extends Failure {
  const OfflineFailure({super.message});

}

class DioErrorFailure extends Failure {
  const DioErrorFailure({super.message});

}