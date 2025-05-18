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
