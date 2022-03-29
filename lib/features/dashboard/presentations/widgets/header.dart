import 'package:admin/features/dashboard/presentations/bloc/dashboard_bloc.dart';
import 'package:admin/responsive.dart';
import 'package:admin/shared/widgets/profile_card.dart';
import 'package:admin/shared/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatefulWidget {
  Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late DashBoardBloc? _dashboardBloc;

  @override
  void initState() {
    // _loginBloc = LoginBloc(BlocProvider.of<AuthenticationBloc>(context));
    _dashboardBloc = DashBoardBloc();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashBoardBloc>(
      create: (context) => _dashboardBloc!,
      child: BlocListener<DashBoardBloc, DashboardState>(
        listener: (context, state) {
          if (state is DashboardSideMenuOpened) {
            setState(() {
              Scaffold.of(context).openDrawer();
            });
          }
        },
        child: Row(
          children: [
            if (!Responsive.isDesktop(context))
              IconButton(
                onPressed: () {
                  // Scaffold.of(context).openDrawer();
                  _dashboardBloc!.add(DashBoardOpenSideMenu());
                },
                icon: Icon(Icons.menu),
              ),
            Text(
              "Dashboard",
              style: Theme.of(context).textTheme.headline6,
            ),
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
            Expanded(child: SearchField()),
            ProfileCard()
          ],
        ),
      ),
    );
  }
}
