// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddLiftScreen]
class AddLiftRoute extends PageRouteInfo<AddLiftRouteArgs> {
  AddLiftRoute({
    Key? key,
    required MovementLogsForSpecificLift movementLogsForSpecificLift,
    required String lift,
    required PageController pageController,
    required ValueNotifier<int> navigatorIndex,
    List<PageRouteInfo>? children,
  }) : super(
          AddLiftRoute.name,
          args: AddLiftRouteArgs(
            key: key,
            movementLogsForSpecificLift: movementLogsForSpecificLift,
            lift: lift,
            pageController: pageController,
            navigatorIndex: navigatorIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'AddLiftRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddLiftRouteArgs>();
      return AddLiftScreen(
        key: args.key,
        movementLogsForSpecificLift: args.movementLogsForSpecificLift,
        lift: args.lift,
        pageController: args.pageController,
        navigatorIndex: args.navigatorIndex,
      );
    },
  );
}

class AddLiftRouteArgs {
  const AddLiftRouteArgs({
    this.key,
    required this.movementLogsForSpecificLift,
    required this.lift,
    required this.pageController,
    required this.navigatorIndex,
  });

  final Key? key;

  final MovementLogsForSpecificLift movementLogsForSpecificLift;

  final String lift;

  final PageController pageController;

  final ValueNotifier<int> navigatorIndex;

  @override
  String toString() {
    return 'AddLiftRouteArgs{key: $key, movementLogsForSpecificLift: $movementLogsForSpecificLift, lift: $lift, pageController: $pageController, navigatorIndex: $navigatorIndex}';
  }
}

/// generated route for
/// [CalculatorsScreen]
class RoutesRoute extends PageRouteInfo<void> {
  const RoutesRoute({List<PageRouteInfo>? children})
      : super(
          RoutesRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoutesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CalculatorsScreen();
    },
  );
}

/// generated route for
/// [CreateRoutineScreen]
class CreateRoutineRoute extends PageRouteInfo<CreateRoutineRouteArgs> {
  CreateRoutineRoute({
    Key? key,
    required ValueNotifier<Map<String, Map<String, List<int>>>> routineList,
    List<PageRouteInfo>? children,
  }) : super(
          CreateRoutineRoute.name,
          args: CreateRoutineRouteArgs(
            key: key,
            routineList: routineList,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateRoutineRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateRoutineRouteArgs>();
      return CreateRoutineScreen(
        key: args.key,
        routineList: args.routineList,
      );
    },
  );
}

class CreateRoutineRouteArgs {
  const CreateRoutineRouteArgs({
    this.key,
    required this.routineList,
  });

  final Key? key;

  final ValueNotifier<Map<String, Map<String, List<int>>>> routineList;

  @override
  String toString() {
    return 'CreateRoutineRouteArgs{key: $key, routineList: $routineList}';
  }
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardScreen();
    },
  );
}

/// generated route for
/// [FatPercentageCalculator]
class FatPercentageRoute extends PageRouteInfo<void> {
  const FatPercentageRoute({List<PageRouteInfo>? children})
      : super(
          FatPercentageRoute.name,
          initialChildren: children,
        );

  static const String name = 'FatPercentageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FatPercentageCalculator();
    },
  );
}

/// generated route for
/// [LiftLogScreen]
class LiftLogRoute extends PageRouteInfo<LiftLogRouteArgs> {
  LiftLogRoute({
    Key? key,
    required String lift,
    List<PageRouteInfo>? children,
  }) : super(
          LiftLogRoute.name,
          args: LiftLogRouteArgs(
            key: key,
            lift: lift,
          ),
          initialChildren: children,
        );

  static const String name = 'LiftLogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LiftLogRouteArgs>();
      return LiftLogScreen(
        key: args.key,
        lift: args.lift,
      );
    },
  );
}

class LiftLogRouteArgs {
  const LiftLogRouteArgs({
    this.key,
    required this.lift,
  });

  final Key? key;

  final String lift;

  @override
  String toString() {
    return 'LiftLogRouteArgs{key: $key, lift: $lift}';
  }
}

/// generated route for
/// [LogScreen]
class LogRoute extends PageRouteInfo<void> {
  const LogRoute({List<PageRouteInfo>? children})
      : super(
          LogRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LogScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [OneRepMaxCalculator]
class OneRepMaxRoute extends PageRouteInfo<void> {
  const OneRepMaxRoute({List<PageRouteInfo>? children})
      : super(
          OneRepMaxRoute.name,
          initialChildren: children,
        );

  static const String name = 'OneRepMaxRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OneRepMaxCalculator();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterScreen();
    },
  );
}

/// generated route for
/// [RoutineDetailsPage]
class RoutineDetailsRoute extends PageRouteInfo<RoutineDetailsRouteArgs> {
  RoutineDetailsRoute({
    Key? key,
    required String routineName,
    List<PageRouteInfo>? children,
  }) : super(
          RoutineDetailsRoute.name,
          args: RoutineDetailsRouteArgs(
            key: key,
            routineName: routineName,
          ),
          rawPathParams: {'routineName': routineName},
          initialChildren: children,
        );

  static const String name = 'RoutineDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<RoutineDetailsRouteArgs>(
          orElse: () => RoutineDetailsRouteArgs(
              routineName: pathParams.getString('routineName')));
      return RoutineDetailsPage(
        key: args.key,
        routineName: args.routineName,
      );
    },
  );
}

class RoutineDetailsRouteArgs {
  const RoutineDetailsRouteArgs({
    this.key,
    required this.routineName,
  });

  final Key? key;

  final String routineName;

  @override
  String toString() {
    return 'RoutineDetailsRouteArgs{key: $key, routineName: $routineName}';
  }
}

/// generated route for
/// [StrengthLevelCalculator]
class StrengthLevelRoute extends PageRouteInfo<void> {
  const StrengthLevelRoute({List<PageRouteInfo>? children})
      : super(
          StrengthLevelRoute.name,
          initialChildren: children,
        );

  static const String name = 'StrengthLevelRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StrengthLevelCalculator();
    },
  );
}

/// generated route for
/// [UpdateUserScreen]
class UpdateUserRoute extends PageRouteInfo<void> {
  const UpdateUserRoute({List<PageRouteInfo>? children})
      : super(
          UpdateUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateUserRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UpdateUserScreen();
    },
  );
}

/// generated route for
/// [WorkoutScreen]
class WorkoutRoute extends PageRouteInfo<void> {
  const WorkoutRoute({List<PageRouteInfo>? children})
      : super(
          WorkoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkoutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WorkoutScreen();
    },
  );
}
