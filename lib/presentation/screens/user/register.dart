part of '../screens.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  // List of allowed servers
  final List<String> _allowedServers = [
    "http://max84.a8slate.com:2052",
    "http://speed.manef2025.xyz:80",
    "http://speed4k.pro:80",
    "http://max.amigo00.com:2052",
    "http://larache.pro:80"
        "http://24h.trialott.xyz:80"
  ];

  // Validation function
  bool _isValidCredentials(String username, String password) {
    // Implement your own validation logic here
    // For this example, we'll just check if the username and password are not empty
    return username.isNotEmpty && password.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final style = Get.textTheme.bodyMedium!.copyWith(
      color: Colors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: Ink(
        width: getSize(context).width,
        height: getSize(context).height,
        decoration: kDecorBackground,
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, stateSetting) {
            return AzulEnvatoChecker(
              uniqueKey: stateSetting.setting,
              successPage: SafeArea(
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthFailed) {
                      showWarningToast(
                        context,
                        'Login failed.',
                        'Please check your IPTV credentials and try again.',
                      );
                    } else if (state is AuthSuccess) {
                      context.read<LiveCatyBloc>().add(GetLiveCategories());
                      context.read<MovieCatyBloc>().add(GetMovieCategories());
                      context.read<SeriesCatyBloc>().add(GetSeriesCategories());
                      Get.offAndToNamed(screenWelcome);
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;

                    return IgnorePointer(
                      ignoring: isLoading,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(
                                  FontAwesomeIcons.chevronLeft,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 1.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        kIconSplash,
                                        width: .7.dp,
                                        height: .7.dp,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'قم بتسجيل الدخول لاكتشاف جميع الأفلام والبرامج التلفزيونية والبث التلفزيوني المباشر، واستمتع بمميزاتنا.',
                                    textAlign: TextAlign.center,
                                    style: Get.textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                      fontFamily: GoogleFonts.notoKufiArabic()
                                          .fontFamily,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: _username,
                                    decoration: InputDecoration(
                                      hintText: "اسم المستخدم",
                                      hintStyle:
                                          Get.textTheme.bodyMedium!.copyWith(
                                        color: Colors.grey,
                                        fontFamily: GoogleFonts.notoKufiArabic()
                                            .fontFamily,
                                      ),
                                      suffixIcon: const Icon(
                                        FontAwesomeIcons.solidUser,
                                        size: 18,
                                        color: kColorPrimary,
                                      ),
                                    ),
                                    style: style,
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: _password,
                                    decoration: InputDecoration(
                                      hintText: "كلمة المرور",
                                      hintStyle:
                                          Get.textTheme.bodyMedium!.copyWith(
                                        color: Colors.grey,
                                        fontFamily: GoogleFonts.notoKufiArabic()
                                            .fontFamily,
                                      ),
                                      suffixIcon: const Icon(
                                        FontAwesomeIcons.lock,
                                        size: 18,
                                        color: kColorPrimary,
                                      ),
                                    ),
                                    obscureText: true,
                                    style: style,
                                  ),
                                  const SizedBox(height: 15),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.solidCircle,
                                          color: Colors.white70,
                                          size: 12.sp,
                                        ),
                                        const SizedBox(width: 8),
                                        InkWell(
                                          onTap: () async {
                                            var url = Uri.parse(kPrivacy);
                                            await launchUrl(url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          },
                                          child: Text(
                                            'سياسة الخصوصية',
                                            style: Get.textTheme.bodyMedium!
                                                .copyWith(
                                              color: kColorPrimary
                                                  .withOpacity(.70),
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  GoogleFonts.notoKufiArabic()
                                                      .fontFamily,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'من خلال التسجيل فإنك توافق على',
                                          style: Get.textTheme.bodyMedium!
                                              .copyWith(
                                            color: Colors.white70,
                                            fontFamily:
                                                GoogleFonts.notoKufiArabic()
                                                    .fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: CardTallButton(
                              label: "إضافة مستخدم",
                              isLoading: isLoading,
                              onTap: () {
                                String username = _username.text;
                                String password = _password.text;

                                if (_isValidCredentials(username, password)) {
                                  bool validServerFound = false;

                                  // Loop through the allowed servers to check if credentials match any of them
                                  for (String server in _allowedServers) {
                                    // Here we add a logic that should attempt a network call, but for simplicity,
                                    // we’re simulating a successful check with our AuthBloc and assuming a server match
                                    // if the server is in our allowed list.

                                    // Trigger authentication attempt with current server in the loop
                                    context.read<AuthBloc>().add(AuthRegister(
                                          username,
                                          password,
                                          server,
                                        ));

                                    // Set flag to true since the server is in the allowed list
                                    validServerFound = true;
                                    break; // Stop loop if we have a valid match
                                  }

                                  if (!validServerFound) {
                                    // Show error if no valid server was found in _allowedServers
                                    showWarningToast(
                                      context,
                                      'Invalid subscription',
                                      'Your subscription is not from our approved servers. Please get your subscription from MansoryTv.com',
                                    );
                                  }
                                } else {
                                  // Show error if username or password is empty
                                  showWarningToast(
                                    context,
                                    'Login failed',
                                    'Please enter a valid username and password.',
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
