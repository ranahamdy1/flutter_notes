> ## 📌Anonymous Class
- هو نوع خاص من Inner Class.
- ليس له اسم.
- يتم تعريفه وإنشاء كائن منه في نفس الوقت.
- غالبًا يُستخدم لتنفيذ interface أو كلاس مجرد
  
EX:

```
interface Greeting {
    void sayHello();
}

public class Main {
    public static void main(String[] args) {
        Greeting greeting = new Greeting() {
            @Override
            public void sayHello() {
                System.out.println("Hello from anonymous class!");
            }
        };

        greeting.sayHello();
    }
}
```
- 🔁 لو حبينا نكتب نفس الكود بكلاس "عادي" له اسم، كان هيكون كده:
```
class GreetingImpl implements Greeting {
    @Override
    public void sayHello() {
        System.out.println("Hello from named class!");
    }
}

public class Main {
    public static void main(String[] args) {
        Greeting greeting = new GreetingImpl();
        greeting.sayHello();
    }
}
```
> ## 📌Sliding Window
- تخيل إن عندك شباك بيطل على صف طويل من البيوت، وبتحب تبص كل مرة على 3 بيوت جنب بعض. بدل ما تروح كل مرة ترجع أول الشارع وتعدي 3 بيوت من الأول، ليه ما تفتح الشباك وتحركه بيت بيت وكل مره بتشيل بيت وتضيف بيت
```
List<int> numbers = [5, 3, 4, 2, 5, 6];
// نحسب أول 3 أرقام مرة واحدة: 5+3+4 = 12 بعد كده بدل ما نبدأ من جديد، نطرح الرقم اللي خرج (5) ونضيف الرقم اللي دخل (2) >> 12-5+2 = 9
```
> ## 📌Class $ Struct
### Struct
- كلمة struct اختصار لـ structure، وهي طريقة لتعريف نوع بيانات مخصص خاص بك، يحتوي على مجموعة من المتغيرات
- تنظيم بيانات بسيطة (Data structure)
- غالبًا نستخدمها للبيانات فقط
- لو هتعامل مع بيانات بسيطة بدون منطق أو سلوك
- مش موجوده في dart
```
struct Friend {
    string name;
    int salary;
};
```
### Class
- تصميم كائنات ذات وظائف وسلوك (OOP)
- نستخدمها لتعريف كائنات كاملة
- لو بتصمم كائنات كاملة فيها دوال وسلوك	
### EX:
```
#include <iostream>
using namespace std;

struct PersonStruct {
    string name;
    int age;
};

class PersonClass {
    string name;
    int age;

public:
    void setData(string n, int a) {
        name = n;
        age = a;
    }

    void print() {
        cout << name << " - " << age << endl;
    }
};

int main() {
    // struct: كل شيء public بشكل افتراضي
    PersonStruct p1;
    p1.name = "Ali";
    p1.age = 25;
    cout << p1.name << " - " << p1.age << endl;

    // class: كل شيء private افتراضيًا، فلازم نستخدم دوال set/get
    PersonClass p2;
    p2.setData("Sara", 30);
    p2.print();

    return 0;
}
```
> ## 📌Callable class
- يعني أنك تستطيع استدعاء كائن من كلاس كما لو كان دالة.
- هو كلاس فيه ميثود خاصة اسمها call()، ولما تنادي على كائن من الكلاس ده زي كأنه دالة، هيتنفذ call() تلقائيًا.
```
class Greeter {
  String call(String name) {
    return 'Hello, $name!';
  }
}

void main() {
  Greeter greeter = Greeter();

  // استدعاء الكائن كأنه دالة
  print(greeter('Ahmed')); // Hello, Ahmed!
}

```
> ## 📌dartz package (Either Type)
- تُستخدم لتمثيل النتيجة التي يمكن أن تكون نجاحًا (Right) أو فشلًا (Left).
- تُستخدم بشكل كبير في المشاريع التي تتبع نمط الـ clean architecture أو التي تحتاج للتعامل مع الأخطاء بشكل آمن بدون استخدام try-catch.
- بديل آمن لاستخدام الاستثناءات (exceptions).
```dart
class LoginFailure {
  final String message;
  LoginFailure(this.message);
}

class User {
  final String name;
  User(this.name);
}

Future<Either<LoginFailure, User>> login(String username, String password) async {
  if (username == 'admin' && password == '123') {
    return Right(User('Admin'));
  } else {
    return Left(LoginFailure('Wrong credentials'));
  }
}

void main(){
final result = await login("admin", "wrong");
result.fold(
  (failure) => print('Login Failed: ${failure.message}'),
  (user) => print('Welcome ${user.name}'),
);
}
```
> ## 📌equatable package
- هي مكتبة تُستخدم لتسهيل المقارنة بين الكائنات (objects)، بدون الحاجة لكتابة == و hashCode يدويًا.
- في Dart، إذا عندك class مثل:
```
class Person {
  final String name;
  final int age;

  Person(this.name, this.age);
}
void main(){
final p1 = Person("Ali", 25);
final p2 = Person("Ali", 25);

print(p1 == p2); // false!
}
```
- ده بيرجع false لأن Dart بتقارن بين المراجع (reference) مش بين القيم.
- الحل 👇 مثال باستخدام equatable :
```
import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String name;
  final int age;

  const Person(this.name, this.age);

  @override
  List<Object?> get props => [name, age];
}

void main(){
final p1 = Person("Ali", 25);
final p2 = Person("Ali", 25);

print(p1 == p2); // true ✅
}
```
- ✨ ليه بنستخدمها في Bloc كتير؟ لو عندك Cubit أو Bloc، والموديل اللي بتمثله الحالة State فيه قيم، لازم يكون قابل للمقارنة علشان Bloc يعرف إذا الحالة تغيرت أو لأ.
> ## 📌Bloc (cubit)
- 1- Bloc Provider : بيوفر الكيوبت
- 2- Bloc Builder : بتظهر التغيير ال حصل في ال ui
- 3- Bloc Listener : بيسمع وينفذ حسب ال سمعه
- 4- Bloc Consumer : ( Bloc Builder + Bloc Listener)

> ## 📌Service Locator
- هو نمط تصميم (Design Pattern) يُستخدم لإدارة الـ Dependencies (الاعتمادات) في التطبيقات
- ببساطة هو "صندوق" بتسجل فيه كل الكلاسات اللي ممكن تحتاجها، ولما تحتاج كلاس منهم في أي مكان في المشروع، تطلبه من الصندوق ده بدل ما تعمله بنفسك.
> ## 📌getit package
- هي Service Locator في Flutter — يعني طريقة لتسجيل واسترجاع الكائنات (classes) في أي مكان من التطبيق بدون الحاجة لتمريرها يدويًا (dependency injection manual passing).
- بدل ما تعمل كدا:
```
final api = ApiService();
final repo = Repository(api);
final cubit = MyCubit(repo);
```
- تسجل كل class مرة واحدة في GetIt، وبعدين تقدر تستدعيه في أي مكان كدا 👇:
```
final cubit = sl<MyCubit>();
```
- أنواع التسجيل:
```dart
1- Lazy Singleton: ينشئ الكائن مرة واحدة عند أول استدعاء فقط.
sl.registerLazySingleton(() => ApiService());
```
```dart
2- Singleton: ينشئ الكائن فورًا وقت التسجيل.
sl.registerSingleton(ApiService());
```
```dart
3- Factory: ينشئ كائن جديد كل مرة.
sl.registerFactory(() => MyCubit(sl()));
```
> ## 📌When forking a package and modifying it for personal use in the project:
- EX:
```
  urwaypayment:
    git:
      url: https://github.com/ranahamdy1/Flutter_Plugin
      ref: master
```
- put it in pubspec.yaml
- urwaypayment ← اسم المكتبة اللي هتستخدمه داخل الكود.
- url ← رابط الـ GitHub repo اللي فيه نسخة الباكدج اللي عدلت عليها.
- ref ← اسم الفرع اللي فيه التعديلات (ممكن يكون main, master, أو أي فرع تاني).

> ## 📌 Flutter package and Flutter plugin
###  Flutter Package
- هو كود Dart فقط، يعني بيشتغل على أي منصة مدعومة من Flutter من غير ما يحتاج Native code.
- التعامل مع الوقت، البيانات، النصوص...
### Flutter plugin
- هو package بيحتوي على كود Dart + Native code .
- عشان تستخدم APIs من النظام نفسه (مثل الكاميرا، GPS، البلوتوث...)
