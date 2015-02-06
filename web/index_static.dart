library examples.src.hello_world.index_static_dart;

import './index_common.dart' as app;
import 'package:angular2/angular2.dart'
    show Component, Decorator, TemplateConfig, NgElement;
import 'package:angular2/change_detection.dart'
    show Lexer, Parser, ChangeDetection, ChangeDetector;
import 'package:angular2/src/core/life_cycle/life_cycle.dart' show LifeCycle;
import 'package:angular2/src/core/compiler/compiler.dart'
    show Compiler, CompilerCache;
import 'package:angular2/src/core/compiler/directive_metadata_reader.dart'
    show DirectiveMetadataReader;
import 'package:angular2/src/core/compiler/shadow_dom_strategy.dart'
    show ShadowDomStrategy, NativeShadowDomStrategy;
import 'package:angular2/src/core/compiler/template_loader.dart'
    show TemplateLoader;
import 'package:angular2/src/core/compiler/xhr/xhr.dart' show XHR;
import 'package:angular2/src/core/compiler/xhr/xhr_impl.dart' show XHRImpl;
import 'package:angular2/src/reflection/reflection.dart' show reflector;

setup() {
  reflector.registerType(app.HelloCmp, {
    "factory": (service) {
      return new app.HelloCmp(service);
    },
    "parameters": [[app.GreetingService]],
    "annotations": [
      new Component(
          selector: 'hello-app',
          componentServices: [app.GreetingService],
          template: new TemplateConfig(
              directives: [
        app.RedDec
      ],
          inline: '''<div class=\"greeting\">{{greeting}} <span red>world</span>!</div>
                 <button class=\"changeButton\" (click)=\"changeGreeting()\">change greeting</button>'''))
    ]
  });
  reflector.registerType(app.RedDec, {
    "factory": (el) {
      return new app.RedDec(el);
    },
    "parameters": [[NgElement]],
    "annotations": [new Decorator(selector: '[red]')]
  });
  reflector.registerType(app.GreetingService, {
    "factory": () {
      return new app.GreetingService();
    },
    "parameters": [],
    "annotations": []
  });
  reflector.registerType(Compiler, {
    "factory": (changeDetection, templateLoader, reader, parser, compilerCache,
        shadowDomStrategy) {
      return new Compiler(changeDetection, templateLoader, reader, parser,
          compilerCache, shadowDomStrategy);
    },
    "parameters": [
      [ChangeDetection],
      [TemplateLoader],
      [DirectiveMetadataReader],
      [Parser],
      [CompilerCache],
      [ShadowDomStrategy]
    ],
    "annotations": []
  });
  reflector.registerType(CompilerCache, {
    "factory": () {
      return new CompilerCache();
    },
    "parameters": [],
    "annotations": []
  });
  reflector.registerType(Parser, {
    "factory": (lexer) {
      return new Parser(lexer);
    },
    "parameters": [[Lexer]],
    "annotations": []
  });
  reflector.registerType(TemplateLoader, {
    "factory": (xhr) {
      return new TemplateLoader(xhr);
    },
    "parameters": [[XHR]],
    "annotations": []
  });
  reflector.registerType(XHR, {
    "factory": () {
      return new XHRImpl();
    },
    "parameters": [],
    "annotations": []
  });
  reflector.registerType(DirectiveMetadataReader, {
    "factory": () {
      return new DirectiveMetadataReader();
    },
    "parameters": [],
    "annotations": []
  });
  reflector.registerType(Lexer, {
    "factory": () {
      return new Lexer();
    },
    "parameters": [],
    "annotations": []
  });
  reflector.registerType(LifeCycle, {
    "factory": (cd) {
      return new LifeCycle(cd);
    },
    "parameters": [[ChangeDetector]],
    "annotations": []
  });
  reflector.registerType(ShadowDomStrategy, {
    "factory": () {
      return new NativeShadowDomStrategy();
    },
    "parameters": [],
    "annotations": []
  });
  reflector.registerGetters({
    "greeting": (a) {
      return a.greeting;
    }
  });
  reflector.registerSetters({
    "greeting": (a, v) {
      return a.greeting = v;
    }
  });
  reflector.registerMethods({
    "changeGreeting": (obj, args) {
      return obj.changeGreeting();
    }
  });
}
main() {
  setup();
  app.main();
}
