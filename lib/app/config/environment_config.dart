class EnvironmentConfig {
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: "https://bubbserver.com/api/",
  );

  static const versionApi = String.fromEnvironment(
    'VERSION_API',
    defaultValue: "v1",
  );
}
