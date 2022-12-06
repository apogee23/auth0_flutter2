class JS {
  final String? name;
  const JS([this.name]);
}

allowInterop<F extends Function>(F f) {
  throw UnimplementedError();
}

class _Anonymous {
  const _Anonymous();
}

// ignore: library_private_types_in_public_api
const _Anonymous anonymous = _Anonymous();
