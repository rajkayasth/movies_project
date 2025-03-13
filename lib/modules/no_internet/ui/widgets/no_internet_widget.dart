import '../../../../utils/exports.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({
    required this.childWidget,
    super.key,
    this.onTryAgain, // Initialize callback in the constructor
  });

  final Function()? onTryAgain; // Callback parameter
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    const double padding = 16;
    const double tryAgainFontSize = 16;
    const double noInternetFontSize = 18;
    const double errorInternetFontSize = 14;
    const double sizeMobTab14_22 = 14;
    const double sizeMobTab9_13 = 8;
    const double sizeMobTab23_35 = 24;
    return BlocConsumer<InternetCubit, NoInternetState>(
      builder: (BuildContext context, NoInternetState state) =>
          (!state.isInternetConnected)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/ic_no_internet.jpg"),
                      const SizedBox(
                        height: sizeMobTab14_22,
                      ),
                      Text(
                        "No Internet available",
                        style: context.textTheme.headlineMedium?.copyWith(
                          fontSize: noInternetFontSize,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: sizeMobTab9_13,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Your device is not connected with internet.Please check internet",
                          style: context.textTheme.labelSmall?.copyWith(
                            color: Colors.black,
                            fontSize: errorInternetFontSize,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: sizeMobTab23_35,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: ElevatedButton(
                          child: Text("Retry",
                              style: context.textTheme.headlineSmall?.copyWith(
                                fontSize: tryAgainFontSize,
                                color: Colors.black,
                              )),
                          onPressed: () async {
                            if (await context
                                .read<InternetCubit>()
                                .checkConnectivity()) {
                              onTryAgain?.call();
                            }
                          }, // Invoke the callback on button press
                        ),
                      ),
                    ],
                  ),
                )
              : childWidget,
      buildWhen: (NoInternetState previous, NoInternetState current) =>
          previous.isInternetConnected != current.isInternetConnected,
      listener: (BuildContext context, NoInternetState state) {
        if (state.isInternetConnected) {
          onTryAgain?.call();
        }
      },
      listenWhen: (NoInternetState previous, NoInternetState current) =>
          previous.isInternetConnected != current.isInternetConnected,
    );
  }
}
