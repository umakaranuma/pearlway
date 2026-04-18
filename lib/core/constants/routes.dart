import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static const String splashRoute = '/';
  static const String homePath = '/home';
  static const String scoringPath = '/scoring';
  static const String interviewPath = '/interview';
  static const String dashboardPath = '/dashboard';
  static const String mainPath = '/main';
  static const String findJobPath = '/find-job';
  static const String myApplicationPath = '/my-application';
  static const String jobSingleView = '/job-single';
  static const String companySinglePath = '/company-profile';
  static const String onboardingPersonalDetailsScreen = '/onboarding';
  static const String onBoardingCvUpdateScreen = '/onboarding-cv';
  static const String onBoardingContactDetailsScreen = '/onboarding-contact';
  static const String onBoardingSocialDetailsScreen = '/onboarding-social';
  static const String onBoardingWorkExpereinceScreen =
      '/onboarding-work-expereince';
  static const String onBoardingEducationDetailsScreen =
      '/onboarding-education';
  static const String onBoardingSkillsDetailsScreen = '/onboarding-skills';
  static const String onBoardingSalaryRateScreen = '/onboarding-salary-rate';
  static const String onBoardingJobRolesScreen = '/onboarding-job-roles';
  static const String onBoardingSuccessScreen = '/onboarding-success';
  static const String schedulingScreenPath = '/scheduling-screen';
  static const String schedulingSelectedPath = '/scheduling-selected';
  static const String schedulingSuccessPath = '/scheduling-completed';
  static const String signUp = '/auth/sign-in';

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: splashRoute,
    // Add this redirect to handle root path after splash screen
    redirect: (context, state) {
      return null; // no redirection
    },
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: signUp, builder: (context, state) => const SignIn()),
      GoRoute(
        path: onboardingPersonalDetailsScreen,
        builder: (context, state) => const OnboardingPersonalDetailsScreen(),
      ),
      GoRoute(
        path: onBoardingCvUpdateScreen,
        builder: (context, state) => const OnboardingCvDetailsScreen(),
      ),
      GoRoute(
        path: onBoardingContactDetailsScreen,
        builder: (context, state) => const OnboardingContactDetailsScreen(),
      ),
      GoRoute(
        path: onBoardingSocialDetailsScreen,
        builder: (context, state) => const OnboardingSocialDetailsScreen(),
      ),
      GoRoute(
        path: onBoardingWorkExpereinceScreen,
        builder: (context, state) =>
            const OnboardingWorkExperienceDetailsScreen(),
      ),
      GoRoute(
        path: onBoardingEducationDetailsScreen,
        builder: (context, state) => const OnboardingEducationDetailsScreen(),
      ),
      GoRoute(
        path: onBoardingSkillsDetailsScreen,
        builder: (context, state) => const OnboardingSkillsDetailsScreen(),
      ),
      GoRoute(
        path: onBoardingSalaryRateScreen,
        builder: (context, state) => const OnboardingSalaryDetailsScreen(),
      ),
      GoRoute(
        path: onBoardingJobRolesScreen,
        builder: (context, state) => const OnboardingJobRolesDetailsScreen(),
      ),
      GoRoute(
        path: onBoardingSuccessScreen,
        builder: (context, state) => const OnboardingSuccessScreen(),
      ),
      GoRoute(
        path: jobSingleView,
        builder: (context, state) => const JobSingleScreen(),
      ),
      GoRoute(
        path: companySinglePath,
        builder: (context, state) => const CompanyProfileScreen(),
      ),
      GoRoute(
        path: schedulingScreenPath,
        builder: (context, state) => const SchedulingScreen(),
      ),
      GoRoute(
        path: schedulingSelectedPath,
        builder: (context, state) => const SchedulingSelectedScreen(),
      ),
      GoRoute(
        path: schedulingSuccessPath,
        builder: (context, state) => const SchedulingSuccessScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(child: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: dashboardPath,
                builder: (context, state) => const DashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: findJobPath,
                builder: (context, state) => const FindJobScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: myApplicationPath,
                builder: (context, state) => const MyApplicationScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: scoringPath,
                builder: (context, state) => const ScoringScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: interviewPath,
                builder: (context, state) => const InterviewScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
  // Use StatefulShellRoute instead of ShellRoute for better tab management
}

// Dummy classes to satisfy route builders since the actual screens haven't been implemented yet.
class SignIn extends StatelessWidget { const SignIn({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class SplashScreen extends StatelessWidget { const SplashScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class OnboardingPersonalDetailsScreen extends StatelessWidget { const OnboardingPersonalDetailsScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class OnboardingCvDetailsScreen extends StatelessWidget { const OnboardingCvDetailsScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class OnboardingContactDetailsScreen extends StatelessWidget { const OnboardingContactDetailsScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class OnboardingSocialDetailsScreen extends StatelessWidget { const OnboardingSocialDetailsScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class OnboardingWorkExperienceDetailsScreen extends StatelessWidget { const OnboardingWorkExperienceDetailsScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class OnboardingEducationDetailsScreen extends StatelessWidget { const OnboardingEducationDetailsScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class OnboardingSkillsDetailsScreen extends StatelessWidget { const OnboardingSkillsDetailsScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class OnboardingSalaryDetailsScreen extends StatelessWidget { const OnboardingSalaryDetailsScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class OnboardingJobRolesDetailsScreen extends StatelessWidget { const OnboardingJobRolesDetailsScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class OnboardingSuccessScreen extends StatelessWidget { const OnboardingSuccessScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class JobSingleScreen extends StatelessWidget { const JobSingleScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class CompanyProfileScreen extends StatelessWidget { const CompanyProfileScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class SchedulingScreen extends StatelessWidget { const SchedulingScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class SchedulingSelectedScreen extends StatelessWidget { const SchedulingSelectedScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class SchedulingSuccessScreen extends StatelessWidget { const SchedulingSuccessScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class HomeScreen extends StatelessWidget { final Widget child; const HomeScreen({super.key, required this.child}); @override Widget build(BuildContext context) => Scaffold(body: child); }
class DashboardScreen extends StatelessWidget { const DashboardScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class FindJobScreen extends StatelessWidget { const FindJobScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class MyApplicationScreen extends StatelessWidget { const MyApplicationScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class ScoringScreen extends StatelessWidget { const ScoringScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
class InterviewScreen extends StatelessWidget { const InterviewScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(); }
