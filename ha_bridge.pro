!include(config.pri) : error(Unable to include config.pri)
isEmpty(SPA_PRI_DIR) : error(The variable SPA_PRI_DIR must be set)
!include($${SPA_PRI_DIR}/acis.pri) : error(Unable to include $${SPA_PRI_DIR}/acis.pri)
!include($${SPA_PRI_DIR}/hoops.pri) : error(Unable to include $${SPA_PRI_DIR}/hoops.pri)

TEMPLATE=lib
OBJDIR=.obj
D=
win32:debug:D=D
DESTDIR=$${ARCH}$${D}/code/lib
DLLDESTDIR=$${ARCH}$${D}/code/bin

TARGET=SpaHABridge$${D}

win32 {
  DEFINES *= ANSI _WINDOWS_SOURCE NT _CRT_SECURE_NO_DEPRECATE __SpaHBridge __ha_bridge $${ARCH} INCLUDE_HOOPS_STANDALONE
  DEFINES -= UNICODE
  QMAKE_CXXFLAGS_RELEASE-=-Zc:strictStrings
}

src = \
  dcl_hoops.cpp \
  eha_brid.cpp \
  entity_converter.cpp \
  entity_converter_asm.cpp \
  ha_bridge.cpp \
  ha_bridge_asm.cpp \
  ha_map.cpp \
  ha_map_asm.cpp \
  ha_rend_context.cpp \
  ha_rend_options.cpp \
  ha_util.cpp \
  direct_render_mesh_manger.cpp \
  ientityconverter.cpp
       


for(file, src) {
  SOURCES += $${A3DT}/src/ha_bridge/$${file}
}


