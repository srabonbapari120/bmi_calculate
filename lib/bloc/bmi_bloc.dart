import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'bmi_event.dart';
part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(BmiInitial()) {
    on<Calculate>((event, emit){

      if(event.heightFeet == ""){
        emit(ErrorState("Enter Height Feet"));
      }else if(event.heightInch==""){
        emit(ErrorState("Enter Height Inch"));
      }else if(event.weight==""){
        emit(ErrorState("Enter Weight"));
      }else{
        var feet= int.parse(event.heightFeet);
        var inch= int.parse(event.heightInch);
        var weight= int.parse(event.weight);
        var tInch= (feet*12)+inch;
        var tCm= tInch*2.54;
        var tM= tCm/100;
        var bmi= weight/(tM*tM);
        var result="";
        if(bmi>25){
          result="OverWeight";
        }else if(bmi<18){
          result="UnderWeight";
        }else{
          result="Good";
        }
        emit(UpdateState(result, bmi));
      }
    });
  }
}
