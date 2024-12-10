WebSocket 
هو بروتوكول اتصالات يُستخدم لتوفير قناة اتصال ثنائية الاتجاه (تفاعلية) بين العميل (مثل متصفح ويب أو تطبيق موبايل) والخادم (Server). بخلاف بروتوكول HTTP التقليدي الذي يعمل بنظام الطلب-الاستجابة (Request-Response)، يسمح WebSocket للعميل والخادم بتبادل البيانات في الوقت الفعلي بدون الحاجة إلى إعادة إرسال الطلبات.


مثال عملي بسيط ##
1. فتح الاتصال:
   يقوم العميل بالاتصال بالخادم:

final channel = IOWebSocketChannel.connect('ws://example.com/socket');

2. إرسال رسالة:
   يتم إرسال رسالة نصية إلى الخادم:

channel.sink.add('Hello, Server!');

3. استقبال الرسائل:
   يعرض العميل الرسائل المستقبلة:

channel.stream.listen((message) {
print('Message from server: $message');
});

4. إغلاق الاتصال:
   يغلق العميل الاتصال:

channel.sink.close();

//in pubspec.yaml: 
//add web_socket_channel: