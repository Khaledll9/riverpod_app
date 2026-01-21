// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$worldHash() => r'4b1ef11e4b755efa90295980402467e543fd205d';

/// See also [world].
@ProviderFor(world)
final worldProvider = Provider<String>.internal(
  world,
  name: r'worldProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$worldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WorldRef = ProviderRef<String>;
String _$helloHash() => r'a8fefef5dce4b91b054fff134cad80206a28c65a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [hello].
@ProviderFor(hello)
const helloProvider = HelloFamily();

/// See also [hello].
class HelloFamily extends Family<String> {
  /// See also [hello].
  const HelloFamily();

  /// See also [hello].
  HelloProvider call({required String there}) {
    return HelloProvider(there: there);
  }

  @override
  HelloProvider getProviderOverride(covariant HelloProvider provider) {
    return call(there: provider.there);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'helloProvider';
}

/// See also [hello].
class HelloProvider extends AutoDisposeProvider<String> {
  /// See also [hello].
  HelloProvider({required String there})
    : this._internal(
        (ref) => hello(ref as HelloRef, there: there),
        from: helloProvider,
        name: r'helloProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$helloHash,
        dependencies: HelloFamily._dependencies,
        allTransitiveDependencies: HelloFamily._allTransitiveDependencies,
        there: there,
      );

  HelloProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.there,
  }) : super.internal();

  final String there;

  @override
  Override overrideWith(String Function(HelloRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: HelloProvider._internal(
        (ref) => create(ref as HelloRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        there: there,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _HelloProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HelloProvider && other.there == there;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, there.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HelloRef on AutoDisposeProviderRef<String> {
  /// The parameter `there` of this provider.
  String get there;
}

class _HelloProviderElement extends AutoDisposeProviderElement<String>
    with HelloRef {
  _HelloProviderElement(super.provider);

  @override
  String get there => (origin as HelloProvider).there;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
