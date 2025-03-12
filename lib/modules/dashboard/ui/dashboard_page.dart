import '../../../../utils/exports.dart';

@RoutePage()
class DashboardPage extends BaseResponsiveView {
  const DashboardPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        MovieListRoute(),
        SearchRoute()
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.list_alt_outlined,
                  color: Colors.blueGrey,
                ),
                activeIcon: const Icon(
                  Icons.list_alt_outlined,
                  color: Colors.blue,
                ),
                label: "List",
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.search,
                  color: Colors.blueGrey,
                ),
                activeIcon: const Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                label: "Search",
              ),
            ],
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
          ),
        );
      },
    );
  }

  @override
  buildDesktopWidget(BuildContext context) {
    return _buildView(context);
  }

  @override
  buildMobileWidget(BuildContext context) {
    return _buildView(context);
  }

  @override
  buildTabletWidget(BuildContext context) {
    return _buildView(context);
  }
}
