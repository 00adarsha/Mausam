import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  UnitCubit() : super(UnitFahranheit());

  toggleUnit() {
    state is UnitCelcius ? emit(UnitFahranheit()) : emit(UnitCelcius());
  }
}
