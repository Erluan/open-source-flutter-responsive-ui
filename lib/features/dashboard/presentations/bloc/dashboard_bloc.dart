import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashBoardBloc extends Bloc<DashboardEvent, DashboardState>{
  DashBoardBloc() : super (DashboardInitial()) {
    on<DashBoardStart>((event, emit) async {
      await emit.forEach<DashboardState>(_dashboardInitial(), onData: (DashboardState state) {
        return state;
      });
    });
    on<DashBoardOpenSideMenu>((event, emit) async {
      await emit.forEach<DashboardState>(_dashboardOpenSideMenu(), onData: (DashboardState state) {
        return state;
      });
    });
  }

  Stream<DashboardState> _dashboardInitial() async* {
    yield DashboardPageStarted();
  }

  Stream<DashboardState> _dashboardOpenSideMenu() async* {
    yield DashboardSideMenuOpened();
  }

}