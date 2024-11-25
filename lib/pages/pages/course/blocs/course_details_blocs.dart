import 'package:againbloc/pages/pages/course/blocs/course_details_events.dart';
import 'package:againbloc/pages/pages/course/blocs/course_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvents, CourseDetailsStates> {
  CourseDetailsBloc() : super(const CourseDetailsStates()) {
    on<TriggerCourseDetails>(_triggerCourseDetails);
  }
  void _triggerCourseDetails(
      TriggerCourseDetails event, Emitter<CourseDetailsStates> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
