part of 'bmi_bloc.dart';

abstract class BmiEvent extends Equatable {
  const BmiEvent();
}

class Calculate extends BmiEvent{
  final heightFeet;
  final heightInch;
  final weight;
  Calculate(this.heightFeet,this.heightInch,this.weight);
  @override
  // TODO: implement props
  List<Object?> get props => [heightFeet,heightInch,weight];

}
