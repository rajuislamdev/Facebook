class Environment {
  static const String dev = 'development';
  static const String prod = 'production';

  static const EnvironmentType currentEnvironment = EnvironmentType.dev;

  static String get apiUrl {
    switch (currentEnvironment) {
      case EnvironmentType.dev:
        return '';
      case EnvironmentType.prod:
        return '';
    }
  }
}

enum EnvironmentType { dev, prod }
