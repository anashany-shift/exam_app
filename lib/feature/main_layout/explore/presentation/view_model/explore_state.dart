part of 'explore_cubit.dart';

@immutable
sealed class ExploreState {}

 class SubjectExploreInitial extends ExploreState {}
 class SubjectExploreLoading extends ExploreState {}
 class SubjectExploreSuccess extends ExploreState {
 final List<SubjectEntity>subjects;

  SubjectExploreSuccess({required this.subjects});
 }
 class SubjectExploreError extends ExploreState {
 final String errorMessage;

  SubjectExploreError({required this.errorMessage});
 }
