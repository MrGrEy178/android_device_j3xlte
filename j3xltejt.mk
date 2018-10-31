#DEVICE_PACKAGE_OVERLAYS += device/samsung/j3xlte/overlay

LOCAL_PATH := device/samsung/j3xlte

TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

# Хакатон для билда. Откуда взял, не помню. но собираю с этой штукой.
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

# Важное замечание. Перечесление идёт через слэш \ , ставиться он через пробел после перечисленного, и дублируется до предпоследнего элемента. т.е. в последней строчке, на её конце не должно быть слэша(см. просто структуру предоставленную мной)
#Помните распаковывали стоковый бут, там нам ещё могут понадобиться файлы init.ro.board.platform=.rc, init.ro.build.product.rc и ueventd.ro.board.platform=.rc. Обратите внимание что могут быть ещё и файлы типа init.ro.build.product_base.rc, ну всмысле могут быть всякие приставки.
# Не забывайте модули из папки /lib/modules/*.ko. Без них бут(ядро) не будет грузится.
# Я вообще всю папку рамдиска со стока скопировал в дерево. Копировал у себя файлы fstab.sc8830, init.grandprimeve3g.rc, init.grandprimeve3g_base.rc, init.sc8830.rc, init.sc8830.usb.rc, init.sc8830_ss.rc, init.wifi.rc, recovery.fstab, ueventd.sc8830.rc, и модули *.ko
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/ramdisk/*:root/*

# Packages
# Audio. Идём на стоке в папку /system/lib/hw/смотрим файлы *.default.so
PRODUCT_PACKAGES += \
audio.a2dp.default \
audio.primary.default \
audio.r_submix.default \
audio.usb.default \
audio_policy.default \
libaudio-resampler #у меня на стоке есть такая либа, вот и собираю


# Camera. Думаю всем понятно зачем это
PRODUCT_PACKAGES += \
Gallery2

# Charger. Маленькая штучка в корне бута(boot.img) лежит, связана я так понимаю с зарядкой. charger_res_images это картинки для офлайн зарядки, показываются(ну вы поняли). Второе указываем тока если они у вас есть, в папке девайса или вендора(у меня в вендоре есть)
PRODUCT_PACKAGES += \
charger \
charger_res_images

# Filesystem. Можно и удалить этот блок.
PRODUCT_PACKAGES += \
setup_fs

# GPS. тут думаю ясно что касается работы gps
PRODUCT_PACKAGES += \
gps.default

# USB. смотрим на стоке /system/framework/com.android.future.usb.accessory.jar. Оставлять я думаю эту штуку надо, с usb же связано.
PRODUCT_PACKAGES += \
com.android.future.usb.accessory

# telephony. Просто оставляем.
PRODUCT_PACKAGES += \
CMSettingsProvider

# Other. Это у меня было доблестно написано Самсунгом, в исходниках которые он выдал(для платформы).
PRODUCT_PACKAGES += \
libkeyutils \
libexifa \
libjpega \
ebtables \
brctl \
strongswan \
KeyUtils \
e2fsprog

# Wifi. Думаю тут всё ясно.
PRODUCT_PACKAGES += \
dhcpcd.conf \
p2p_supplicant_marlin_inc.conf \
libnetcmdiface 

# Properties
# Default properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
persist.sys.usb.config=mtp,adb

# Graphic properties
PRODUCT_PROPERTY_OVERRIDES += \
ro.product.hardware=SS_SHARKLS


# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs before they have a chance to cause problems. Скопипастил откуда то.
PRODUCT_PROPERTY_OVERRIDES += \
ro.setupwizard.enterprise_mode=1 \
ro.kernel.android.checkjni=0 \
wifi.interface=wlan0 \
wifi.supplicant_scan_interval=150 \
mobiledata.interfaces=rmnet0 \
boot.fps=7

# SPRD-SCI default build.prop properties overrides
PRODUCT_PROPERTY_OVERRIDES := \
keyguard.no_require_sim=true \
ro.product.chipset=sc8830 \
ro.com.android.dataroaming=false \
persist.msms.phone_count=2 \
persist.sys.sprd.modemreset=1


PRODUCT_AAPT_CONFIG := normal xhdpi #Указываем normal(если телефон), или tablet(для планшета). hdpi я взял с Aida64\Отображение\Плотность пикселов\В скобочках
PRODUCT_AAPT_PREF_CONFIG := xhdpi #Просто указывайте что в скобочках выше узнали
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=4 #привязка времени сборки к моему региону(Екатеринбург) строчка в build.prop ro.build.date=
PRODUCT_LOCALES := en_US ru_RU #Языки с которыми собирается прошивка. Все доступные языки смотрим в build/target/product/locales_full.mk (можно его заинклудить(как ниже), можно выбрать рядом стоящие locales_*.mk. На вкус и цвет

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk) #почему не было строк связанных с далвиком? потому что они все прописаны в *.mk файлах в папке frameworks/native/build. Смотрим на стоке что, и ищем нужное содержимое в файлах, и вписываем название файла вместо моего.