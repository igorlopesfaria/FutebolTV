enum Routes {
  splash('/splash'),
  welcome('/welcome'),
  match('/match');

  const Routes(this.path);

  final String path;

  @override
  String toString() => name;
}