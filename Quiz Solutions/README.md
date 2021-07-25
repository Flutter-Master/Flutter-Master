# Quiz Solutions

You can always take the quiz on Instagram: [@flutter.master](https://www.instagram.com/flutter.master/)

****

### Quiz 1.0

1. **C. Column, SizedBox & Row:** You can create the given pattern just using Column, SizedBox & Row. You don't actually need stack because all the elements in the givern pattern are arranged aside to one-another.

2. **B. False:**  You can actually use Column to create vertical scrolling using SingleChildScrollView, but that is not recommended by Flutter docs. Columns should always be used with fixed position.

3. **D. Widget:**  This is where most of the people fall. You can use any Widget as the title of the AppBar, it should not be just Text.

4. **B. Inside:**  Expanded Widget should always be used within Row, Column & Flex. Otherwise it will throw an error regarding improper parent.

5. **A. Maximum Space:** Container without a child will always occupy maximum available space.

6. **D. height & width:**  To define the size of icon, you have *size* property and not height & width

****

### Quiz 2.0

1. **D.** Global Key is used to access the current state and the context of that particular widget.

2. **B.** The correct way to specify a color using Hexcode is Color\(**0xFF** *hexcode*). Example: Color(**0xFFFF6348**). Where the initial **FF** is the hexcode for opacity.

3. **A.** When we call ***setState()***, the widgets that have changed their state are rebuild. These widgets that have changed their state are often called dirty widgets.

4. **C. Accent Color:** By default *FloatingActionButton* uses accent color specified in ThemeData of the MaterialApp.

5. **A. Widget:** title property of a ***ListTile*** takes a widget and not a Text. That means, you can also add an Image in the title.

6. **D. Creates a dynamic list:** ListView.builder() creates a dynamic list. That means only the items that will be shown on the screen are created. This improves the performance of the app.

7. **B. Getting screen size** MediaQuery is used for getting the information about the current device on which the app is runnning.

8. **A. Performance Optimisation** It is a good practise to add ***const*** before widgets whenever possible. This will not rebuild those widgets again, improving the performance of the app.

9. Because the onPressed callback is *null*, the button is disabled and is showing the disabled color.

10. Uncle Joe should use ***SharedPreference*** to store the current state of the Theme locally.

****

### Quiz 3.0

1. **B. locality:** All of the other packages are used to store the data locally on user's device. ***Hive*** uses no-sql database, ***SharedPreferences*** uses key-value pair & ***SQFlite*** uses SQL database.

2. **A. True:** AppBar can take any widget as title, that includes Image as well.

3. **C.** ListView can create list only in vertical & horizontal direction.

4. **D. Built_value:** Built Value is not a State Management solution, instead it is a code generator.

5. **D. No-SQL:** Firestore is a No-SQL type of database, It stores the data in form of collections and documents.

6. **B. Float:** Float is not a valid DataType in dart.

7. **C. Position:** Transform.translate can change the position of a widget on the screen.

8. **D. Redux:** Redux works with Action, Store, Reducer & Middleware.

9. **C. CustomPainter:** There is no such thing as CustomShapper. The correct answer is, CustomPainter is used to draw (paint) shapes on the screen.

10. Mr. Jason can either store their API Key in a secret file or on the cloud. I mostly prefer the second option, so you can later make changes.

****

If you have any queries or just want to talk, you can always DM on Instagram.
