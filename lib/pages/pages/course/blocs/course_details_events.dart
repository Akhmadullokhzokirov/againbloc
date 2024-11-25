import 'package:againbloc/common/entities/course.dart';

abstract class CourseDetailsEvents{
  const CourseDetailsEvents();

}

class TriggerCourseDetails extends CourseDetailsEvents{
  const TriggerCourseDetails(this.courseItem) : super();
  final CourseItem courseItem;
}