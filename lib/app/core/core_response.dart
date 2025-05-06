class CoreResponse<T> {
  int? code;
  String? msg;
  T? data;

  CoreResponse({
    this.code,
    this.msg,
    this.data,
  });
}
