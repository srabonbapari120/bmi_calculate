part of 'bmi_bloc.dart';

abstract class BmiState extends Equatable {
  const BmiState();
}

class BmiInitial extends BmiState {
  @override
  List<Object> get props => [];
}

class UpdateState extends BmiState{
  var bmi;
  String? result;
  UpdateState(this.result,this.bmi);

  @override
  // TODO: implement props
  List<Object?> get props => [bmi,result];

}

class ErrorState extends BmiState{
  ErrorState(this.message);
  String message;
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
