import 'package:equatable/equatable.dart';

class Recommendations extends Equatable {
  final int id;

  final String? backdropPat;

  const Recommendations({required this.id, this.backdropPat});
  @override
  List<Object?> get props => [id, backdropPat];
}
