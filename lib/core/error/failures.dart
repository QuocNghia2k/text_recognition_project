import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  late final List properties;

  Failure([List properties = const <dynamic>[]]) : this.properties = properties;

  @override
  List<Object?> get props => [properties];
}

// General failures
class ServerFailure extends Failure {

  @override
  String toString() {
    return "ServerFailure";
  }
}

class CacheFailure extends Failure {
   @override
  String toString() {
    return "CacheFailure";
  }
}

class UnknownFailure extends Failure {
   @override
  String toString() {
    return "UnknownFailure";
  }
}

class ConnectNetworkFailure extends Failure {
   @override
  String toString() {
    return "ConnectNetworkFailure";
  }
}
