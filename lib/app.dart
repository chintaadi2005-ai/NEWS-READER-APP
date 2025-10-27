import 'package:flutter/material.dart';
import 'models/article.dart';
import 'data/mock_articles.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/article_detail_screen.dart';
import 'screens/bookmarks_screen.dart';
import 'screens/search_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'widgets/bottom_nav.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String currentScreen = 'splash';
  String activeTab = 'home';
  List<Article> articles = List<Article>.from(mockArticles);
  Article? selectedArticle;

  void _setScreen(String screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  void _handleSignupClick() {
    _setScreen('signup');
  }

  void _handleSignupComplete() {
    _setScreen('home');
  }

  void _setActiveTab(String tab) {
    setState(() {
      activeTab = tab;
      currentScreen = tab;
    });
  }

  void _handleSplashComplete() {
    _setScreen('login');
  }

  void _handleLogin() {
    _setScreen('home');
  }

  void _handleLogout() {
    setState(() {
      currentScreen = 'login';
      activeTab = 'home';
      selectedArticle = null;
    });
  }

  void _handleArticleClick(Article article) {
    setState(() {
      selectedArticle = article;
      currentScreen = 'article';
    });
  }

  void _handleBookmarkToggle(String id) {
    setState(() {
      articles = articles
          .map(
              (a) => a.id == id ? a.copyWith(isBookmarked: !a.isBookmarked) : a)
          .toList();
    });
  }

  void _handleCategorySelect(String categoryId) {
    // for demo, simply go to home and keep activeTab
    _setActiveTab('home');
  }

  List<Article> get bookmarkedArticles =>
      articles.where((a) => a.isBookmarked).toList();

  bool get showBottomNav => ![
        'splash',
        'login',
        'signup',
        'article',
        'settings',
        'search'
      ].contains(currentScreen);

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (currentScreen) {
      case 'splash':
        body = SplashScreen(onComplete: _handleSplashComplete);
        break;
      case 'login':
        body = LoginScreen(
            onLogin: _handleLogin, onSignupClick: _handleSignupClick);
        break;
      case 'signup':
        body = SignupScreen(onSignupComplete: _handleSignupComplete);
        break;
      case 'home':
        body = HomeScreen(
          articles: articles,
          onArticleClick: _handleArticleClick,
          onBookmarkToggle: _handleBookmarkToggle,
          onSearchClick: () => _setScreen('search'),
        );
        break;
      case 'categories':
        body = CategoriesScreen(onCategorySelect: _handleCategorySelect);
        break;
      case 'bookmarks':
        body = BookmarksScreen(
          bookmarkedArticles: bookmarkedArticles,
          onArticleClick: _handleArticleClick,
          onBookmarkToggle: _handleBookmarkToggle,
        );
        break;
      case 'notifications':
        body = const NotificationsScreen();
        break;
      case 'profile':
        body = ProfileScreen(
          onSettingsClick: () => _setScreen('settings'),
          onBookmarksClick: () => _setActiveTab('bookmarks'),
          onLogout: _handleLogout,
        );
        break;
      case 'search':
        body = SearchScreen(
          articles: articles,
          onArticleClick: _handleArticleClick,
          onBack: () => _setScreen(activeTab),
        );
        break;
      case 'settings':
        body = SettingsScreen(onBack: () => _setScreen('profile'));
        break;
      case 'article':
        body = ArticleDetailScreen(
          article: selectedArticle!,
          onBack: () => _setScreen(activeTab),
          onBookmarkToggle: () => _handleBookmarkToggle(selectedArticle!.id),
        );
        break;
      default:
        body = const Center(child: Text('Unknown screen'));
    }

    return Scaffold(
      body: SafeArea(child: body),
      bottomNavigationBar: showBottomNav
          ? BottomNav(activeTab: activeTab, onTabChange: _setActiveTab)
          : null,
    );
  }
}
