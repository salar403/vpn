# اموزش استفاده

#منابع مورد نیاز

سرور خارج از ایران
اکانت ابر اروان یا کلادفلر
دامینی که روی اکانت اروان یا کلادفلر شما ست شده باشه

#سرور خارج از ایران

رنج زیادی از ارائه دهنده ها برای این مورد وجود دارن میتونین از ارائه دهنده های ایرانی یا خارجی ای که کریپتو قبول کنن استفاده کنین مثل host-stage که پرداخت با سیستم التکوین های کوین گیت رو قبول میکنه
در نظر داشته باشید در شرایط فعلی برخی هاستینگ ها سرور قابل ارائه ندارن یا چیزی که میدن محدود شده پس اگه امکانش رو دارین یا از خارج بگیرین یا از کیفیت سرور هایی که ارائه دهنده ها دارن میدن اول مطمئن بشین...

کانفیگ سرور برای استفاده شخصی یا محدود مثه ۱۰ ۲۰ نفر مهم نیست یه vps تک هسته رم ۵۱۲ هم کار رو راه میندازه 
سیستم عامل سرور رو روی ubuntu 20 بزارین
اگه ۲۰ نداشتن پایینتر هم باشه مشکل نداره ولی ترجیحا روی اوبونتو بیاین بالا چون پروسه نصب داکر برای هر سیستم عامل فرق میکنه و اینجا من اوبونتو کار کردم:)

اگه ارائه دهنده ازتون hostname خواست یچیزی مثه ایدی تلگرام وارد کنین
اگرم اجبارا ns name  میخواستن تست کنین ببینین با دوتا ns مثل
ns1.example.com
ns2.example.com بیخیال میشن یا نه اگه نشدن شما بیخیال اون ارائه دهنده بشین...


بعد اینکه پروسه خرید تموم شد و سرور رو دریافت کردین یعنی یه ای پی و یه پسورد گرفتین ترمینال باز کنین **اونایی که لینوکس هستن** بقیه باید طریقه ssh  از ویندوز یا ... رو یه سرچ بزنن بعد بقیه مراحل رو دنبال کنن

یوزر پیشفرض سرور معمولا root هست مگر ارائه دهنده چیز دیگری تعیین کنه که بعیده
پس با دستور زیر به سرورتون وصل بشین
ssh root@server_ip
بعد این ازتون پسورد رو میخواد که پسوردیکه از ارائه دهنده گرفتین رو بزنین

سرور اینجا براتون بالا میاد به ترتیب دستورای زیر رو بزنین
```
apt update
```
اندکی صبر

```
apt upgrade -y
```

اندکی صبر مجدد

```
apt install docker docker-compose docker.io htop git -y
```

##  این مرحله کاملا اختیاریه واگه زیاد با لینوکس اشنایی ندارین ردش کنین تا ادامه
بعد تکمیل پروسه بالا همچیز امادست ولی برای امنیت بیشتر کار یه یوزر جدید میسازیم و بهش دسترسی sudo میدیم 
اگه خیلی امنیت براتون مهم نیست میتونین رد کنین ولی انجامش مفیده

adduser username
بجای یوزرنیم یوزریکه میخواینو بزارین مثلا test  
بعدش ازتون پسورد میخواد و یه پسورد بدین enter بزنین و توی تکرار دوباره همون پسوردو بزنین همه سوالایی که بعدش میپرسه رو با enter رد کنین تا به y/n برسید یه y بزنین تایید کنین

usermod -aG sudo username
این دستورو بزنین بجای یوزرنیم یوزری که بالا دادینو بزارین که یوزرتون به لیست sudoer ها اضافه بشه

حالا میتونین لاگین به یوزر پیشفرض رو با دستور زیر ببندین
passwd root -l
یبار  ctrl + D بزنین که از سرور خارج بشین
حالا میتونین با همون دستور ssh اول با یوزر جدید وارد سرورتون بشین
ssh username@server_ip
وارد که شدین اول دستور زیرو بزنین
sudo -s که دسترسی همون یوزر روت اول رو داشته باشین


## ادامه
حالا باید این ریپازیتوری رو روی سرور اصطلاحا clone کنین
دستور زیرو تو سرور بزنین

```
git clone https://github.com/salar403/vpn.git
```

بعد تکمیلش یه پوشه به نام vpn روی سرور دارین
با دستور  cd vpn واردش بشین
الان فقط کافیه دستور زیرو بزنین

```
docker-compose up -d
```
بعد 
```
docker ps
```
بزنین. باید  حدودا همچین چیزی ببینین


CONTAINER ID   IMAGE                                                      COMMAND                  CREATED          STATUS          PORTS                                           NAMES
0ead0473351b   v2ray_v2ray                                              "/usr/bin/v2ray -con…"   26 minutes ago   Up 10 seconds   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp       v2ray

یبارم محض اطمینان 

```
docker logs v2ray -f
```
بزنین
این دستور باید لاگ های وی پی ان رو بهتون نشون بده تو این مرحله وی پی ان بالاست باید برید سمت ست کردن دامین

اول از همه باید یه دامین بگیرین که کاملا اختیاریه چجور دامینی باشه.ir .com .net .org .ml ...
سعی کنین اگه دامنه ایران نیست از ارائه دهنده خوب بگیرین چون سرعت کارو خیلی تحت تاثیر قرار میده
اگه خواستین دامنه ایران بخرین باید برین سایت ایرنیک
nic.ir اونجا ثبت نام و احراز هویت کنین دامنه ثبت کنین به نام خودتون
بعد اینکه یه دامین دستتون اومد برید سمت cdn تون حالا فرقی نمیکنه کلادفلر یا اروان
حواستون باشه تو قطعی اینترنت کلادفلر هم کموبیش بستست پس ترجیه اروانه البته جفتشو اموزش میدم

## اروان
برین سایت ابر اروان 
https://www.arvancloud.com/fa
تو این سایت ثبت نام کنین
بعد تکمیل ثبت نامتون وارد پنل کاربریشون بشین سمت راست صفحه یسری گزینه دارن روی CDN بزنین
گزینه افزودن دامنه جدید داره 
اونو که میزنین ازتون یه دامین میخواد دامین رو توی سرچ باکسش بزنین
حواستون باشه ممکنه از لحظه ای که دامینتون خریده میشه تا لحظه ای که تو شبکه اینترنت شناسایی بشه یکم طول بکشه بخصوص برای دامنه های ایران که بعضا چند ساعت طول میکشن
دامین رو که دادید قبول قوانین و ادامه رو میزنید
یکم طول میکشه بعد وارد صفحه تعرفه میشه شما 0 تومان رو بزنین با ذکر ایرانی سوخت نمیده
پایین ادامه رو میزنینو تو صفحه بعدش هم باز ازون پایین ادامه رو میزنین
صفحه ای براتون میاد که توش دوتا ادرس اصطلاحا ns  داره 
به ترتیب کپیشون کنین برید پنل ارائه دهنده ای که ازشون دامین خریدید 
تو پنل همشون یه تنظیمات ns name یا ns records داره
اونجا رکورد اول و دوم رو به ترتیب چیزی که اروان بهتون داده بزنین 
مثلا 
ns1: j.ns.arvancdn.com
ns2: f.ns.arvancdn.net
خیلی دقت کنین تو این پروسه چون تغییر ns های دامنه پروسه نسبتا زمانبریه بخصوص دامین ایرانی که چند ساعت طول میکشه
همچیزو چککنین بعد سیو کنین حالا باید چند ساعت منتظر بمونین که ns name  های دامینتون به اروان تغییر کنن
اگه دامین ایرانیه تو تنظیمات ایرنیک باید برین قسمت ویرایش ردیف های کارگزاری نام و میزبانی دامنه
اون دوتا ادرس اروان رو توی ستون نام کارگزار قرار بدین تو سطر ۱ و ۲

# بعد ست شدن دامین
بعد چند ساعت دامینتون تو پنل اروان از وضعیت در انتظار تغییر NS به فعال تغییر میکنه

بزنین روی ادرسش انتخابش کنین توی قسمت  رکورد های dns وارد بشید سمت راست صفحه
گزینه رکورد جدید رو بزنین تو قسمت عنوان یچیز دلخواه بنویسید مثلا  test
ترجیحا حروف انگلیسی خالی باشه چون قراره اسم سابدامینتون باشه مثه 
mypx
که درمیاد mypx.domain.com مثلا
توی قسمت نشانی ip ای پی سروری که بالا کانفیگ کردین رو بزارین
پروتکل ارتباط با سرور اصلی رو روی http قرار بدین
حتما اون بالا تیک استفاده از سرویس ابری باید فعال باشه
اینو که ذخیره کردین برید تو سربرگ شبکه توزیع محتوا 
تو قسمت تنظیمات https هرچیزی که دیدین تیکش فعاله غیر فعال کنین اون پایین هم ستا حالت داره بزارین رو وسطی
HTTP
ارتباط بازدیدکنندگان رمزگذاری نمی‌شود.

الان همچی باید اماده باشه برا اتصالتون 
اپ v2ray رو نصب کنین برای اندروید اینه:
https://play.google.com/store/apps/details?id=com.v2ray.ang

بازش کنین 

```
vmess://eyJhZGQiOiJzdWJkb21haW4uZG9tYWluLmNvbSIsImFpZCI6IjAiLCJob3N0IjoiIiwiaWQiOiJkMTQ5NmNlYS1lYTVhLTRiMWEtYTU1NS02MjkzMzUyMjQ5NzgiLCJuZXQiOiJ3cyIsInBhdGgiOiIvcHJpY2UiLCJwb3J0IjoiODA4MCIsInBzIjoiaXJhblx1MDAyN3MgZnJlZWRvbSIsInNjeSI6ImF1dG8iLCJzbmkiOiIiLCJ0bHMiOiIiLCJ0eXBlIjoiIiwidiI6IjIifQ==
```

اینو کپی کنین بعد داخل اپ بالا راست روی مثبت  بزنین گزینه دوم از بالا رو انتخاب کنین

import config from clipboard

یه کانفیگ براتون ایجاد میشه دکمه ادیتشو بزنین علامت یه خودکاره
subdomain رو با اون اسمی که تو پنل اروان سر ست کردن dns گذاشتین عوض کنین
domain.com  هم با ادرس دامینتون عوض کنین فرضا freenet.ir
بقیه کانفیگ رو فعلا دست نزنین تیک بالای صفحرو بزنین و حالا دکمه پایین سمت راست صفحه رو بزنین سبز بشه
میزنه connected,tap to check connection
روی همین عبارت بزنین یکم رو حالت تستینگ میمونه اگه ساکسز شد تبریک میگم ازاد شدین:))

نیازی نیست ssh با سرور باز بمونه ببندینش 



# نکته
یسری چیزارو میتونین تغییر بدین و اگه میخواین بسته شدنش سختتر بشه حتما رعایت کنین
یکی اینکه من بطور پیشفرض پورت رو روی 80 گذاشتم شما میتونین ادیتش کنین بزارین روی یه پورت دیگه مثلا 4545

برای تغییرش یکی فایل config.json رو باید ادیت کنین که توش همون بالا خط هفتم پورته
یکی فایل docker-compose.yaml
اونجام خط ۱۱ باید سمت راست و چپ دونقطه پورتتونو بزارین 

یه چیز دیگه که قابل تغییره path  وبسوکتتونه
داخل فایل کانفیگخط ۲۶ یه عبارت path  وجود داره که اینجا گذاشتمش روی price
شما میتونین بزارین رو هرچیزی خواستین مثلا /market
درنظر داشته باشین داخل کانفیگ موبایل هم اون پایین path رو اگه تغییر دادین باید عوض کنین

# یوزر بندی

این پلتفرم هر یوزر رو با دوتا چیز میشناسه یکی id یکی alterId
که ایدی استرینگ uuid رندومه
و alterId هم یه عدده که از صفر شروع میشه تا بینهایت
من توی این کانفیگی که گذاشتم برای نمونه دوتا یوزر براتون ساختم داخل فایل config.json میتونین ببینین
از خط ۱۱ تا ۲۰ اون فایل دوتا جیسون هست که به ترتیب یوزر اول و دومه به این فرمت
```json
{
    "id": "d1496cea-ea5a-4b1a-a555-629335224978",
    "level": 1,
    "alterId": 0
},
{
    "id": "265553fe-8398-4722-917e-2f9ef3ff7970",
    "level": 1,
    "alterId": 1
}
```


شما هر چنتا یوزر که خواستید میتونین به همون صورت اضافه کنین مثه این مثال:

```json
{
    "id": "d1496cea-ea5a-4b1a-a555-629335224978",
    "level": 1,
    "alterId": 0
},
{
    "id": "265553fe-8398-4722-917e-2f9ef3ff7970",
    "level": 1,
    "alterId": 1
},
{
    "id": "d1496cea-ea5a-4b1a-a555-629335224979",
    "level": 1,
    "alterId": 2
},
{
    "id": "265553fe-8398-4722-917e-2f9ef3ff7980",
    "level": 1,
    "alterId": 3
},
{
    "id": "d1496cea-ea5a-4b1a-a555-629335224215",
    "level": 1,
    "alterId": 4
},
{
    "id": "265553fe-8398-4722-917e-2f9ef3ff7112",
    "level": 1,
    "alterId": 5
}
```

دقت کنین alterid ها به ترتیب برن جلو...

هرجا سوالی گیرو گوری چیزی بود میتونین تلگرامم پیام بدین  

```
@salar403
```
اموزش کلادفلر رو هم یکم دیگه مینویسم میزارم همینجا به انضمام اموزش وصل شدن از کلاینت لینوکس
هر جا بنظرتون میتونه بهبود پیدا کنه pull-request بدین دمتون هم گرم
در اخر اگه کارتون راه افتاد خواستید یه ستاره کوچیکی هم به من بدین:)

## موفق باشید
