import 'package:equatable/equatable.dart';

class Brand extends Equatable{
  String? id;
  String? name;
  String? image;
  Brand({this.id, this.name, this.image});
  @override
  List<Object?> get props => [id];
}