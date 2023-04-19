abstract class AppState {
  const factory AppState.guest() = Guest;
  const factory AppState.authenticated() = Authenticated;
  const factory AppState.loading() = AppLoading;
}

class Guest implements AppState {
  const Guest();
}

class Authenticated implements AppState {
  const Authenticated();
}

class AppLoading implements AppState {
  const AppLoading();
}
