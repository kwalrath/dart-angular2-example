library examples.src.hello_world.index_common_dart;

import 'package:angular2/angular2.dart'
    show bootstrap, Component, Decorator, TemplateConfig, NgElement;

@Component(
    selector: 'hello-app',
    componentServices: const [GreetingService],
    template: const TemplateConfig(
        inline: '''<div class=\"greeting\">{{greeting}} <span red>world</span>!</div>
             <button class=\"changeButton\" (click)=\"changeGreeting()\">change greeting</button>''',
    directives: const [RedDec]))
class HelloCmp {
  String greeting;
  HelloCmp(GreetingService service) {
    this.greeting = service.greeting;
  }
  changeGreeting() {
    this.greeting = 'howdy';
  }
}
@Decorator(selector: '[red]')
class RedDec {
  RedDec(NgElement el) {
    el.domElement.style.color = 'red';
  }
}
class GreetingService {
  String greeting;
  GreetingService() {
    this.greeting = 'hello';
  }
}
main() {
  bootstrap(HelloCmp);
}
