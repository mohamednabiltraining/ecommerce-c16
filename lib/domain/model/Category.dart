// data class
import 'package:equatable/equatable.dart';

class Category extends Equatable{
  String? id;
  String? image;
  String? title;
  Category({this.id, this.image, this.title});
  @override
  List<Object?> get props => [id];
}