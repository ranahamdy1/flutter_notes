> ## 📌Real-Time Communication
### 1- WebRTC (Web Real-Time Communication):
- يستخدم في التطبيقات التي تتطلب التواصل الفوري عبر الفيديو والصوت
- تستخدم بروتوكول UDP 
### 2- WebSocket
- هو حل للاتصال بين العميل والخادم، ويُستخدم عادة في تطبيقات الرسائل الفورية أو الإشعارات
- تستخدم بروتوكول TCP
### 3 - pusher
- هو خدمة سحابية تسهل استخدام WebSocket بواجهة بسيطة
- تستخدم بروتوكول WebSocket


> ## 📌UDP and TCP Protocol
### 1- UDP(User Datagram Protocol): أسرع في نقل البيانات، ولكنه قد يفقد بعض الحزم دون تأكيد
### 2- TCP(Transmission Control Protocol): يوفر نقل بيانات موثوق ومتتابع، لكنه أبطأ (EX: WebSocket)


> ## 📌Pagination
- التقسيم إلى صفحات هو أسلوب يستخدم لتحميل وعرض البيانات على دفعات بدلاً من تحميلها دفعة واحدة، مما يحسن الأداء ويقلل استهلاك الموارد مثل الذاكرة وعرض النطاق الترددي للإنترنت( هي تقنية قوية لتحسين أداء التطبيقات التي تتعامل مع كميات كبيرة من البيانات).
-  ### يستخدم ل :
- 1- تحسين الأداء: تحميل البيانات على دفعات يقلل من استهلاك الذاكرة.
- 2- توفير البيانات بسرعة: بدلاً من انتظار تحميل جميع البيانات، يمكن عرض البيانات الأولية سريعًا ثم جلب المزيد لاحقًا.
- 3- توفير استهلاك الإنترنت: تقليل كمية البيانات المنقولة في كل مرة.
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
- تخيلي إن عندك شباك بيطل على صف طويل من البيوت، وبتحبي تبصي كل مرة على 3 بيوت جنب بعض. بدل ما تروحي كل مرة ترجعي أول الشارع وتعدي 3 بيوت من الأول، ليه ما تفتحي الشباك وتزحزحيه بيت بيت وكل مره بتشيلي بيت وتضيفي بيت
```
// نحسب أول 3 أرقام مرة واحدة: 5+3+4 = 12 بعد كده بدل ما نبدأ من جديد، نطرح الرقم اللي خرج (5) ونضيف الرقم اللي دخل (4) >> 12-5+4 = 11

List<int> numbers = [5, 3, 4, 2, 5, 6];
```
