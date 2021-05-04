import 'dart:io';

String fixture(String name) => File('test/core/util/$name').readAsStringSync();
