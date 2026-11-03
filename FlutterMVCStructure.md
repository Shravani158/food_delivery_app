# Flutter MVC + GetX Architecture Standard — Food Delivery App (Foodie)

**Purpose:** This document is the canonical folder-structure, architectural layering, and implementation standard specifically tailored for the **Food Delivery App (Foodie)** codebase. It is written for developers and AI coding agents.

**Tech Stack:**
- **Framework:** Flutter (Material 3)
- **State Management, Dependency Injection & Routing:** GetX (`GetxController`, `.obs`, `Obx`, `Bindings`, `GetPage`, `Get.toNamed`)
- **Backend & Cloud Services:** Firebase (Firebase Auth, Cloud Firestore, Firebase Storage, Cloud Messaging / FCM)
- **Networking:** REST APIs via `http` client
- **Local Storage / Caching:** Hive (`hive_flutter`) wrapped through a typed storage service
- **Environment & Secrets:** `flutter_dotenv` (`.env`)

> **AI Session Starter (Copy & paste to agent prompts):**
> You must follow `FlutterMVCStructure.md` strictly. Stack: Flutter + GetX (`GetxController`, `.obs`, `Obx`, `Bindings`, `GetPage`), Firebase (Auth, Firestore, Storage, Messaging), REST API via `http`, Hive for local cache, `flutter_dotenv` for environment config. Strict layering: `Screen -> Controller -> Repository / Service -> Model`. Widgets must NEVER call Firestore, `http`, or Hive directly. Place every file according to Section 5 decision table under `lib/app/`. Do not invent new top-level folders under `lib/app/`. Use design tokens from `utils/constants/` (`Ucolors`, `Utextstyles`, `Uimages`, `Uicons`) and never hardcode colors, strings, or dimensions. Use `Obx` only around the smallest subtree reading an `.obs` property.

---

## 1. Architecture & Layering

```text
                  routes/app_routes.dart
                         |  GetPage (name, page, binding)
                         v
     bindings/  ----->  features/<feature>/controllers/
     (Get.lazyPut)         state (.obs), business logic, validation
                                       ^
                                       |
                        screens/ + widgets/
                          (Pure UI presentation, Obx only)
                                       |
                                       v
                          data/repositories/
                           Firestore / Local Cache coordination
                                       |
                                       v
                          data/services/
                           REST API clients, Location, Delivery APIs
                                       |
                                       v
                          data/models/
                           Typed entities, JSON & Firestore serializers

     services/   Platform infrastructure (Firebase, Push Notifications, Payment)
     utils/      Design constants (Colors, TextStyles, Images, Icons), Theme,
                 Validators, Formatters, Hive storage wrapper, Shared UI widgets
     assets/     Images, Icons, Fonts, Animations
```

### Typical Food Delivery Action Flow:
`User taps "Add to Cart" -> CartController method -> CartRepository (Hive/Firestore) -> CartItemModel update -> cartItems.value updated -> Obx rebuilds cart badge & subtotal`

### Direction of Dependencies:
- `features` -> `data` -> `utils`
- `data` and `utils` must **NEVER** import from `features`.
- Platform services in `services/` are wired at startup (`main.dart`) or injected via bindings, never creating reverse feature dependencies.

---

## 2. Canonical Directory Structure

Every file in this project lives inside this structure. Use lowercase `snake_case` for all folder and file names.

```text
food_delivery_app/
├── lib/
│   ├── main.dart
│   ├── my_app.dart
│   └── app/
│       ├── bindings/
│       │   ├── initial_binding.dart
│       │   ├── auth/
│       │   │   └── auth_binding.dart
│       │   ├── home/
│       │   │   └── home_binding.dart
│       │   ├── cart/
│       │   │   └── cart_binding.dart
│       │   ├── order/
│       │   │   └── order_binding.dart
│       │   └── profile/
│       │       └── profile_binding.dart
│       ├── routes/
│       │   └── app_routes.dart
│       ├── data/
│       │   ├── models/
│       │   │   ├── auth/
│       │   │   │   └── user_model.dart
│       │   │   ├── home/
│       │   │   │   ├── food_item_model.dart
│       │   │   │   ├── category_model.dart
│       │   │   │   └── deal_banner_model.dart
│       │   │   ├── cart/
│       │   │   │   ├── cart_item_model.dart
│       │   │   │   └── cart_model.dart
│       │   │   └── order/
│       │   │       ├── order_model.dart
│       │   │       └── order_status_model.dart
│       │   ├── repositories/
│       │   │   ├── auth/
│       │   │   │   └── auth_repository.dart
│       │   │   ├── food/
│       │   │   │   └── food_repository.dart
│       │   │   ├── cart/
│       │   │   │   └── cart_repository.dart
│       │   │   └── order/
│       │   │       └── order_repository.dart
│       │   └── services/
│       │       ├── api/
│       │       │   ├── api_client.dart
│       │       │   └── food_api_service.dart
│       │       └── location/
│       │           └── location_service.dart
│       ├── services/
│       │   ├── firebase/
│       │   │   ├── firebase_service.dart
│       │   │   └── notification_service.dart
│       │   └── payment/
│       │       └── payment_service.dart
│       ├── features/
│       │   ├── splash/
│       │   │   ├── controllers/
│       │   │   │   └── splash_controller.dart
│       │   │   └── screens/
│       │   │       └── splash_screen.dart
│       │   ├── onboarding/
│       │   │   ├── controllers/
│       │   │   │   └── onboarding_controller.dart
│       │   │   ├── screens/
│       │   │   │   ├── onboarding_screen_1.dart
│       │   │   │   └── onboarding_screen_2.dart
│       │   │   └── widgets/
│       │   │       └── onboarding_page.dart
│       │   ├── loginandsignup/
│       │   │   ├── controllers/
│       │   │   │   ├── login_controller.dart
│       │   │   │   └── signup_controller.dart
│       │   │   ├── screens/
│       │   │   │   ├── login.dart
│       │   │   │   └── signup.dart
│       │   │   └── widgets/
│       │   │       ├── app_text_fields.dart
│       │   │       ├── auth_card.dart
│       │   │       ├── auth_footer.dart
│       │   │       ├── auth_logo_header.dart
│       │   │       └── curved_header.dart
│       │   ├── home/
│       │   │   ├── controllers/
│       │   │   │   └── home_controller.dart
│       │   │   ├── screens/
│       │   │   │   ├── home_screen.dart
│       │   │   │   └── category_items_screen.dart
│       │   │   └── widgets/
│       │   │       ├── bottom_nav_widget.dart
│       │   │       ├── deal_banner_widget.dart
│       │   │       ├── food_item_card.dart
│       │   │       ├── food_section_widget.dart
│       │   │       └── search_bar_widget.dart
│       │   ├── food_details/
│       │   │   ├── controllers/
│       │   │   │   └── food_details_controller.dart
│       │   │   ├── screens/
│       │   │   │   └── food_details_screen.dart
│       │   │   └── widgets/
│       │   ├── cart/
│       │   │   ├── controllers/
│       │   │   │   └── cart_controller.dart
│       │   │   ├── screens/
│       │   │   │   └── cart_screen.dart
│       │   │   └── widgets/
│       │   ├── checkout/
│       │   │   ├── controllers/
│       │   │   │   └── checkout_controller.dart
│       │   │   ├── screens/
│       │   │   │   └── checkout_screen.dart
│       │   │   └── widgets/
│       │   └── order/
│       │       ├── controllers/
│       │       │   ├── order_controller.dart
│       │       │   └── order_tracking_controller.dart
│       │       ├── screens/
│       │       │   ├── order_history_screen.dart
│       │       │   └── order_tracking_screen.dart
│       │       └── widgets/
│       └── utils/
│           ├── constants/
│           │   ├── colors/
│           │   │   └── Ucolors.dart
│           │   ├── textstyles/
│           │   │   └── Utextstyles.dart
│           │   ├── icons/
│           │   │   └── Uicons.dart
│           │   ├── images/
│           │   │   └── Uimages.dart
│           │   ├── app_config.dart
│           │   └── storage_keys.dart
│           ├── exceptions/
│           │   ├── app_exceptions.dart
│           │   └── firebase_exceptions.dart
│           ├── formatters/
│           │   ├── currency_formatter.dart
│           │   └── date_formatter.dart
│           ├── helper/
│           │   ├── app_dialogs.dart
│           │   └── snackbar_helper.dart
│           ├── localization/
│           │   ├── app_translations.dart
│           │   └── strings_en.dart
│           ├── storage/
│           │   └── hive_storage.dart
│           ├── theme/
│           │   └── app_theme.dart
│           ├── validators/
│           │   └── form_validators.dart
│           └── widgets/
│               ├── buttons/
│               │   └── app_button.dart
│               ├── inputs/
│               │   └── custom_text_field.dart
│               ├── feedback/
│               │   ├── empty_state_widget.dart
│               │   └── error_state_widget.dart
│               └── shimmer/
│                   ├── food_card_shimmer.dart
│                   └── banner_shimmer.dart
├── assets/
│   ├── fonts/
│   │   ├── OpenSans-Regular.ttf
│   │   └── OpenSans-Bold.ttf
│   ├── icons/
│   │   ├── google-icon.svg
│   │   └── facebook-icon.svg
│   └── onboarding/
│       ├── logo/
│       │   ├── main_logo.png
│       │   └── logo_white.png
│       └── images/
│           ├── splash_screen_image.png
│           ├── onboarding_base_image1.png
│           ├── onboarding_top_image1.png
│           ├── onboarding_base_image2.png
│           └── onboarding_top_image2.png
├── test/
├── .env.example
├── pubspec.yaml
└── README.md
```

---

## 3. Layer Responsibilities & Rules

### 3.1 `bindings/` (Dependency Injection)
- **`initial_binding.dart`**: Registers dependencies that must exist before the app runs, such as `HiveStorage`, `FirebaseService`, `AuthRepository`.
- **Feature Bindings (`<domain>_binding.dart`)**: Uses `Get.lazyPut<T>(() => T())` so controllers and repositories are allocated only when navigating to that route, and disposed when navigating away.
- **Rule**: Never call `Get.put(Controller())` inside a widget's `build()` method.

### 3.2 `routes/` (Routing)
- All route paths are defined as static constants in `AppRoutes`:
  ```dart
  class AppRoutes {
    static const String splash = '/splash';
    static const String onboarding1 = '/onboarding-1';
    static const String onboarding2 = '/onboarding-2';
    static const String login = '/login';
    static const String signup = '/signup';
    static const String home = '/home';
    static const String foodDetails = '/food-details';
    static const String cart = '/cart';
    static const String checkout = '/checkout';
    static const String orderTracking = '/order-tracking';
  }
  ```
- Use kebab-case for paths (`/food-details`, `/order-tracking`).
- Each route binds its page and binding in `AppPages.pages`.

### 3.3 `data/models/` (Data Entities)
- Models represent typed domain data (e.g. `FoodItem`, `Category`, `CartItem`, `OrderModel`, `UserModel`).
- Must include `fromJson`, `toJson`, and `fromFirestore` (when mapping Firestore documents).
- Provide `copyWith()` for immutable state updates.
- Models must **NOT** contain UI logic, HTTP requests, or database queries.

### 3.4 `data/repositories/` (Data Coordination)
- Repositories coordinate data persistence (Cloud Firestore and Hive local cache).
- Example: `FoodRepository.getPopularItems()` checks Hive cache first, falls back to Firestore, and caches the result.
- Repositories return pure typed models or throw typed `AppException`. They never trigger snackbars or UI dialogs.

### 3.5 `data/services/` (External APIs)
- Handles external REST API clients, third-party food catalogs, Google Maps / location services, and delivery distance calculation.
- Does not depend on feature controllers or presentation code.

### 3.6 `services/` (Platform Infrastructure)
- **`firebase/`**: Firebase App initialization, Firebase Auth wrappers, Firebase Cloud Messaging (FCM) handlers, and crash logging.
- **`payment/`**: Razorpay / Stripe gateway integration, signature verification, and callback handling.

### 3.7 `features/<feature>/` (Presentation & State)
- **`controllers/`**: GetX controllers manage UI state (`.obs`), form fields, inputs, and business flows. Must dispose `TextEditingController`, `ScrollController`, and `FocusNode` in `onClose()`.
- **`screens/`**: Full screens extending `StatelessWidget` or `GetView<T>`. Must not make direct network or Firestore calls.
- **`widgets/`**: Reusable parts of that specific feature (e.g. `food_item_card.dart` inside `home/widgets/`).
- **`Obx` Rule**: Wrap ONLY the small widget reading `.obs`, never wrap an entire Scaffold when only a badge or counter changes.

### 3.8 `utils/` (Design Tokens, Helpers & Shared UI)
- **`constants/`**: Single source of truth for colors (`Ucolors`), typography (`Utextstyles`), asset paths (`Uimages`, `Uicons`), and environment keys.
- **`validators/`**: Form input validators for email, phone number, password strength, and delivery address.
- **`storage/`**: Typed wrapper around `Hive` boxes (`HiveStorage.saveToken()`, `HiveStorage.getCart()`). Widgets never call `Hive.box()` directly.
- **`widgets/`**: Cross-feature reusable UI components: `AppButton`, `CustomTextField`, `FoodCardShimmer`, `EmptyStateWidget`.

---

## 4. Decision Table: Where Does New Code Go?

| I need to add... | Target File Path |
|---|---|
| A new full screen (e.g. Order Tracking) | `lib/app/features/order/screens/order_tracking_screen.dart` + Route in `routes/app_routes.dart` |
| UI widget used ONLY by one screen | `lib/app/features/<feature>/screens/<screen_name>/widgets/` |
| UI widget reused across multiple screens in one feature | `lib/app/features/<feature>/widgets/` (e.g. `food_item_card.dart`) |
| UI widget reused across multiple features | `lib/app/utils/widgets/<category>/` (e.g. `app_button.dart`) |
| Screen state, UI logic, or form management | `lib/app/features/<feature>/controllers/<name>_controller.dart` |
| Controller injection for a screen | `lib/app/bindings/<domain>/<name>_binding.dart` |
| A Firestore collection read/write (e.g. orders) | `lib/app/data/repositories/<domain>/<name>_repository.dart` |
| A REST API endpoint client | `lib/app/data/services/<provider>/<name>_service.dart` |
| A data entity with JSON / Firestore serialization | `lib/app/data/models/<domain>/<name>_model.dart` |
| A color, gradient, or theme token | `lib/app/utils/constants/colors/Ucolors.dart` |
| A typography style or font definition | `lib/app/utils/constants/textstyles/Utextstyles.dart` |
| An image, illustration, or icon asset path | `lib/app/utils/images/Uimages.dart` or `Uicons.dart` |
| A secret key, API URL, or environment variable | `.env` file + getter in `lib/app/utils/constants/app_config.dart` |
| Payment gateway or Push notification code | `lib/app/services/<payment_or_firebase>/` |
| Local cache or offline data persistence | `lib/app/utils/storage/hive_storage.dart` |
| Form validation rule (e.g. phone number) | `lib/app/utils/validators/form_validators.dart` |

---

## 5. Implementation Code Patterns

### 5.1 Controller Pattern
```dart
class HomeController extends GetxController {
  final FoodRepository _foodRepository;

  HomeController({FoodRepository? foodRepository})
      : _foodRepository = foodRepository ?? Get.find<FoodRepository>();

  final RxBool isLoading = false.obs;
  final RxList<FoodItem> popularItems = <FoodItem>[].obs;
  final RxInt selectedNavIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    try {
      isLoading.value = true;
      final items = await _foodRepository.getPopularItems();
      popularItems.assignAll(items);
    } catch (e) {
      SnackbarHelper.showError(message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void changeNavIndex(int index) {
    selectedNavIndex.value = index;
  }
}
```

### 5.2 Binding Pattern
```dart
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodRepository>(() => FoodRepository());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
```

### 5.3 Route Registration in `my_app.dart`
```dart
GetPage(
  name: AppRoutes.home,
  page: () => const HomeScreen(),
  binding: HomeBinding(),
)
```

### 5.4 Smallest-Subtree `Obx` Pattern
```dart
// DO NOT wrap the entire Scaffold in Obx.
// ONLY wrap the exact subtree observing an observable:
Row(
  children: [
    const Text('Cart Total:'),
    Obx(() => Text(
      controller.formattedTotal.value,
      style: Utextstyles.buttonText,
    )),
  ],
)
```

### 5.5 Repository with Firestore & Hive Caching
```dart
class FoodRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final HiveStorage _storage = Get.find<HiveStorage>();

  Future<List<FoodItem>> getPopularItems() async {
    // 1. Try local cache
    final cached = _storage.getCachedPopularFood();
    if (cached.isNotEmpty) return cached;

    // 2. Fallback to Firestore
    final snapshot = await _firestore.collection('popular_foods').get();
    final items = snapshot.docs.map((doc) => FoodItem.fromFirestore(doc)).toList();

    // 3. Save to cache
    await _storage.cachePopularFood(items);
    return items;
  }
}
```

---

## 6. Naming Conventions

- **Files & Folders:** strictly lowercase `snake_case`. (e.g. `food_item_card.dart`, `order_tracking_screen.dart`).
- **Standard Suffixes:**
  - Screens: `_screen.dart` (e.g. `home_screen.dart`)
  - Controllers: `_controller.dart` (e.g. `home_controller.dart`)
  - Bindings: `_binding.dart` (e.g. `home_binding.dart`)
  - Models: `_model.dart` (e.g. `food_item_model.dart`)
  - Repositories: `_repository.dart` (e.g. `food_repository.dart`)
  - Services: `_service.dart` (e.g. `payment_service.dart`)
  - Widgets: `_widget.dart` or `_card.dart`
- **Classes:** `PascalCase` matching file name (e.g. `food_item_model.dart` -> `FoodItemModel`).
- **Design Token Classes:** `Ucolors`, `Utextstyles`, `Uimages`, `Uicons` (kept consistent with current design system).

---

## 7. Responsive UI Rules

- **Zero Hardcoded Screen Heights:** Never use rigid screen heights like `height: 860` or `top: 600`. Use proportional sizing (`MediaQuery.of(context).size.height * percentage`) with safe bounds (`.clamp(min, max)`).
- **Zero Fixed Text Container Widths:** Avoid `SizedBox(width: 350)` on texts that wrap. Use `Padding(horizontal: 24)` so text flows seamlessly on narrow (320px) and wide (450px) phones alike.
- **Scrollable Single Viewports:** For scrollable feeds (like `HomeScreen`), keep header, banners, and categories inside one unified `SingleChildScrollView`. Place the navigation bar in `Scaffold.bottomNavigationBar` wrapped with `SafeArea`.
- **Horizontal Carousels:** Use `SingleChildScrollView(scrollDirection: Axis.horizontal)` with `BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())` and explicit item dimensions for smooth swiping.

---

## 8. Feature Completion Checklist

Before calling any feature complete, verify every item:
- [ ] Every new file is in its canonical folder under `lib/app/`; no top-level ad-hoc folders created.
- [ ] Screens and widgets contain **zero** direct Firestore, HTTP, or Hive calls.
- [ ] Controllers handle business logic and expose `.obs` properties.
- [ ] `Obx` is wrapped strictly around the smallest subtree that consumes the `.obs` property.
- [ ] Route is registered in `routes/app_routes.dart` with a dedicated `Binding`.
- [ ] Dependencies are registered in `Binding` using `Get.lazyPut`.
- [ ] Colors and text styles use `Ucolors` and `Utextstyles`.
- [ ] Responsive sizing: verified that screen does not overflow on short phones (e.g. 640px height) or narrow phones (320px width).
- [ ] `flutter analyze` passes with zero errors or warnings.

