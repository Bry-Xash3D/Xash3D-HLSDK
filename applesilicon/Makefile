
#
# Half-life Makefile for Apple Silicon (macOS 12.0+ on aarch64)
#
#

PKG_INSTALL := brew install
PKG_TOOLS   := gcc@11 sdl2

ifeq "$(CFG)" ""
	CFG=release
endif

SOURCE_DIR=..
BUILD_DIR=$(CFG)

ENGINE_SRC_DIR=$(SOURCE_DIR)/engine
COMMON_SRC_DIR=$(SOURCE_DIR)/common
PM_SRC_DIR=$(SOURCE_DIR)/pm_shared
GAME_SHARED_SRC_DIR=$(SOURCE_DIR)/game_shared
PUBLIC_SRC_DIR=$(SOURCE_DIR)/public

BUILD_OBJ_DIR=$(BUILD_DIR)/obj

ELF-GC-DYNSTR=./elf-gc-dynstr
CPLUS=g++-11
CPP_LIB:=-lstdc++ -ldl -lpthread $(shell sdl2-config --libs)
CLINK=$(CPLUS)

CFG_CFLAGS := 
ifeq "$(CFG)" "release"
	CFG_CFLAGS += -O3 
else
	CFG_CFLAGS += -gdwarf-2 -g2 
endif

BASE_CFLAGS := -w -std=c++17 -fpermissive -fno-strict-aliasing -DNO_VGUI -DNO_VOICE -DNDEBUG -DPOSIX -D_POSIX -DLINUX -D_LINUX -DGNUC -DNO_MALLOC_OVERRIDE -fno-exceptions -fexpensive-optimizations -Werror=return-type
BASE_CFLAGS += $(shell sdl2-config --cflags)

SHLIBEXT=dylib
SHLIBCFLAGS=
ifeq "$(CFG)" "release"
	SHLIBLDFLAGS="-shared"
else
	SHLIBLDFLAGS="-shared -gdwarf-2 -g2"
endif

AR=ar
LIBEXT=a
MAKE+= -j8

HL_DLL  := hldll.mk
HL_CDLL := hl_cdll.mk

MAKE_HL_LIB=$(MAKE) -f $(HL_DLL)
MAKE_HL_CDLL=$(MAKE) -f $(HL_CDLL)

#############################################################################
# SETUP AND BUILD
#############################################################################

all: build_dir targets

TARGETS=

TARGETS+= \
 	hl \
	hl_cdll \

build_dir:
	-mkdir $(BUILD_DIR);
	cd $(BUILD_DIR)

targets: $(TARGETS)


hl_cdll: build_dir
	$(MAKE_HL_CDLL) CPLUS=$(CPLUS) CPP_LIB="$(CPP_LIB)" BUILD_DIR=$(BUILD_DIR) BUILD_OBJ_DIR=$(BUILD_OBJ_DIR) SOURCE_DIR=$(SOURCE_DIR) ENGINE_SRC_DIR=$(ENGINE_SRC_DIR) COMMON_SRC_DIR=$(COMMON_SRC_DIR) BASE_CFLAGS="$(BASE_CFLAGS)" PUBLIC_SRC_DIR=$(PUBLIC_SRC_DIR) ARCH_CFLAGS="$(ARCH_CFLAGS_I686)" GAME_SHARED_SRC_DIR=$(GAME_SHARED_SRC_DIR) CLINK=$(CLINK) PM_SRC_DIR=$(PM_SRC_DIR) SHLIBEXT=$(SHLIBEXT) SHLIBCFLAGS=$(SHLIBCFLAGS) SHLIBLDFLAGS=$(SHLIBLDFLAGS) CFG=$(CFG) CFG_CFLAGS="$(CFG_CFLAGS)"

hl: build_dir
	$(MAKE_HL_LIB) CPLUS=$(CPLUS) CPP_LIB="$(CPP_LIB)" BUILD_DIR=$(BUILD_DIR) BUILD_OBJ_DIR=$(BUILD_OBJ_DIR) SOURCE_DIR=$(SOURCE_DIR) ENGINE_SRC_DIR=$(ENGINE_SRC_DIR) COMMON_SRC_DIR=$(COMMON_SRC_DIR) PM_SRC_DIR=$(PM_SRC_DIR) GAME_SHARED_SRC_DIR=$(GAME_SHARED_SRC_DIR) BASE_CFLAGS="$(BASE_CFLAGS)" SHLIBEXT=$(SHLIBEXT) SHLIBCFLAGS=$(SHLIBCFLAGS) SHLIBLDFLAGS=$(SHLIBLDFLAGS) PUBLIC_SRC_DIR=$(PUBLIC_SRC_DIR) CFG=$(CFG) CFG_CFLAGS="$(CFG_CFLAGS)" 

brew_install_tools:
	$(PKG_INSTALL) $(PKG_TOOLS)

clean:
	-rm -rf $(BUILD_OBJ_DIR)
