class RepoRes<T> {
  T? data;
  String? error;
  bool hasError;

  RepoRes({this.data, this.error, this.hasError = false});

  factory RepoRes.success(T data) {
    return RepoRes(data: data);
  }

  factory RepoRes.error(String error) {
    return RepoRes(error: error, hasError: true);
  }
}
