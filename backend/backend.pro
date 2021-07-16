QT -= gui
QT += serialport network

TEMPLATE = lib
CONFIG += staticlib

CONFIG += c++11

include(../qflipper_common.pri)

SOURCES += \
    deviceregistry.cpp \
    firmwaredownloader.cpp \
    flipperupdates.cpp \
    flipperzero/factoryinfo.cpp \
    flipperzero/firmwareoperations.cpp \
    flipperzero/flipperzero.cpp \
    flipperzero/remotecontroller.cpp \
    qflipperbackend.cpp \
    remotefilefetcher.cpp \
    updateregistry.cpp

HEADERS += \
    abstractfirmwareoperation.h \
    deviceregistry.h \
    firmwaredownloader.h \
    flipperupdates.h \
    flipperzero/factoryinfo.h \
    flipperzero/firmwareoperations.h \
    flipperzero/flipperzero.h \
    flipperzero/remotecontroller.h \
    qflipperbackend.h \
    remotefilefetcher.h \
    serialhelper.h \
    updateregistry.h

unix|win32 {
    LIBS += -L$$OUT_PWD/../dfu/ -ldfu
}

win32:!win32-g++ {
    PRE_TARGETDEPS += $$OUT_PWD/../dfu/dfu.lib
} else:unix|win32-g++ {
    PRE_TARGETDEPS += $$OUT_PWD/../dfu/libdfu.a
}

INCLUDEPATH += $$PWD/../dfu
DEPENDPATH += $$PWD/../dfu
