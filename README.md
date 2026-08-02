# kaagapay

Kaagapay is a prototype Flutter app for bringing health services to communities with
limited or no internet access. It's built around two modes:

- **Online** — a centralized hospital appointment system, an online doctor consultation
  hub, and a health-information encyclopedia (diseases, hospitals, COVID-19 guidance).
- **Offline** — the same disease/hospital/emergency information bundled into the app so
  it's usable without a connection, distributable as a standalone APK. In this mode the
  app can send a free SMS to the nearest hospital to request an appointment.

This is a prototype/thesis-style project, not a production app — some flows (e.g. the
consult and emergency-chat screens, user profiles) are UI scaffolding without a wired-up
backend yet.

## Tech stack

- **Flutter** (Dart SDK `>=2.12.0 <3.0.0`)
- **Firebase** — `firebase_core`, `firebase_auth` for email/password auth, `cloud_firestore`
- **google_fonts** for the Raleway/Roboto type used throughout the UI

## Project structure

```
lib/
  main.dart                MaterialApp entry point
  LoginPage.dart            Sign-in screen
  CreateAccount.dart        Registration screen
  HomePage.dart             Post-login landing screen (emergency / consult / info)
  auth/
    fire_auth.dart          Firebase email/password sign-in & registration
    validator.dart          Form-field validation (name/email/password)
  Content/
    Info.dart               Info hub: routes into Diseases / Hospitals / COVID-19
    Diseases.dart           Disease reference content
    Hospitals.dart          Hospital directory, links into SJGH.dart
    SJGH.dart                San Jose General Hospital detail page
    Covid.dart               COVID-19 guidance content
    OffHome.dart             Offline-mode landing page
  Profile/
    UserProfile.dart, UserData.dart, JuanProfile.dart
                             Profile screen scaffolding (placeholder sample data)
  widget/
    NaviDrawer.dart          App-wide navigation drawer, adapts to signed-in state
  Animations/
    ScaleRoute.dart          Custom page-transition route
test/
  validator_test.dart       Unit tests for the form-validation logic
```

## Setup

1. Install [Flutter](https://docs.flutter.dev/get-started/install) and run:
   ```
   flutter pub get
   ```
2. This app depends on Firebase (Auth + Firestore). `android/app/google-services.json`
   is already checked in for the existing prototype Firebase project; if you're pointing
   this at your own Firebase project instead, replace it with the config file for your
   project (via the Firebase console or `flutterfire configure`).
3. Run on a connected device or emulator:
   ```
   flutter run
   ```

## Testing

```
flutter test
```

Runs the validator unit tests in `test/`. Note: the UI screens that touch Firebase
(`LoginPage`, `CreateAccount`) aren't currently covered by widget tests, since that
requires mocking the `firebase_core` platform channel rather than a real Firebase
backend.

## Security note

`android/app/google-services.json` contains a Firebase API key for the prototype
project. Per Firebase's own guidance this key isn't a secret by itself (it ships inside
every built APK regardless), but it does mean the project's Firestore/Auth **security
rules** are what actually gate access to data — worth double-checking those are locked
down before treating any data behind this project as private.
