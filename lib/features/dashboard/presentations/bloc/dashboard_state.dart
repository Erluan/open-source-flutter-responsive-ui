part of 'dashboard_bloc.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardPageStarted extends DashboardState {}

class DashboardSideMenuOpened extends DashboardState {}

class DashboardFailed extends DashboardState {
  String? error;

  DashboardFailed({
    this.error});

  @override
  String toString() => 'DashboardFailed { error: $error }';
}