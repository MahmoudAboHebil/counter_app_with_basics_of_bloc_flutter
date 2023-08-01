part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool? wasIncremented;
  CounterState({
    required this.counterValue,
    this.wasIncremented,
  });

  static CounterState? fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return null;

    return CounterState(
      counterValue: map['counterValue'],
      wasIncremented: map['wasIncremented'],
    );
  }

  static CounterState? fromJson(String source) {
    return CounterState.fromMap(json.decode(source));
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {'counterValue': counterValue, 'wasIncremented': wasIncremented};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue, wasIncremented];
}
