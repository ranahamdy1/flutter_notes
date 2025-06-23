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
