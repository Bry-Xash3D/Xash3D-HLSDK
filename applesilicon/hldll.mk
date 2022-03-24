#
# HL game library Makefile for x86 Linux
#
# Feb 2001 by Leon Hartwig (hartwig@valvesoftware.com)
#

HLDLL_SRC_DIR=$(SOURCE_DIR)/dlls

HLDLL_OBJ_DIR=$(BUILD_OBJ_DIR)/hldll
PM_OBJ_DIR=$(HLDLL_OBJ_DIR)/pm_shared
GAME_SHARED_OBJ_DIR=$(HLDLL_OBJ_DIR)/game_shared
PUBLIC_OBJ_DIR=$(HLDLL_OBJ_DIR)/public
COMMON_OBJ_DIR=$(HLDLL_OBJ_DIR)/common

#CFLAGS=$(BASE_CFLAGS) $(ARCH_CFLAGS) $(SHLIBCFLAGS) -DCLIENT_WEAPONS
CFLAGS=$(BASE_CFLAGS)  $(CFG_CFLAGS)  -DCLIENT_WEAPONS
#-O3 -ffast-math -fno-strength-reduce

HLDLL_INCLUDEDIRS=-I$(HLDLL_SRC_DIR) -I$(ENGINE_SRC_DIR) -I$(COMMON_SRC_DIR) -I$(PM_SRC_DIR) -I$(GAME_SHARED_SRC_DIR) -I$(PUBLIC_SRC_DIR)
PM_INCLUDEDIRS=-I$(HLDLL_SRC_DIR) -I$(COMMON_SRC_DIR)  -I$(PUBLIC_SRC_DIR)
GAME_SHARED_INCLUDEDIRS=-I$(HLDLL_SRC_DIR) -I$(ENGINE_SRC_DIR) -I$(COMMON_SRC_DIR) -I$(PM_SRC_DIR) -I$(PUBLIC_SRC_DIR)
COMMON_INCLUDEDIRS=-I$(HLDLL_SRC_DIR) -I$(ENGINE_SRC_DIR) -I$(COMMON_SRC_DIR) -I$(PM_SRC_DIR) -I$(PUBLIC_SRC_DIR)

LDFLAGS= $(CPP_LIB) -lm

DO_HLDLL_CC=$(CPLUS) $(HLDLL_INCLUDEDIRS) $(CFLAGS) -o $@ -c $<
DO_PUBLIC_CC=$(CPLUS) $(HLDLL_INCLUDEDIRS) $(CFLAGS) -o $@ -c $<
DO_PM_CC=$(CPLUS) $(PM_INCLUDEDIRS) $(CFLAGS) -o $@ -c $<
DO_GAME_SHARED_CC=$(CPLUS) $(GAME_SHARED_INCLUDEDIRS) $(CFLAGS) -o $@ -c $<
DO_COMMON_CC=$(CPLUS) $(COMMON_INCLUDEDIRS) $(CFLAGS) -o $@ -c $<

#####################################################################

HLDLL_OBJS = \
	$(HLDLL_OBJ_DIR)/aflock.o \
	$(HLDLL_OBJ_DIR)/agrunt.o \
	$(HLDLL_OBJ_DIR)/airtank.o \
	$(HLDLL_OBJ_DIR)/animating.o \
	$(HLDLL_OBJ_DIR)/animation.o \
	$(HLDLL_OBJ_DIR)/apache.o \
	$(HLDLL_OBJ_DIR)/barnacle.o \
	$(HLDLL_OBJ_DIR)/barney.o \
	$(HLDLL_OBJ_DIR)/bigmomma.o \
	$(HLDLL_OBJ_DIR)/bloater.o \
	$(HLDLL_OBJ_DIR)/bmodels.o \
	$(HLDLL_OBJ_DIR)/bullsquid.o \
	$(HLDLL_OBJ_DIR)/buttons.o \
	$(HLDLL_OBJ_DIR)/cbase.o \
	$(HLDLL_OBJ_DIR)/client.o \
	$(HLDLL_OBJ_DIR)/combat.o \
	$(HLDLL_OBJ_DIR)/controller.o \
	$(HLDLL_OBJ_DIR)/crossbow.o \
	$(HLDLL_OBJ_DIR)/crowbar.o \
	$(HLDLL_OBJ_DIR)/defaultai.o \
	$(HLDLL_OBJ_DIR)/doors.o \
	$(HLDLL_OBJ_DIR)/effects.o \
	$(HLDLL_OBJ_DIR)/egon.o \
	$(HLDLL_OBJ_DIR)/explode.o \
	$(HLDLL_OBJ_DIR)/flyingmonster.o \
	$(HLDLL_OBJ_DIR)/func_break.o \
	$(HLDLL_OBJ_DIR)/func_tank.o \
	$(HLDLL_OBJ_DIR)/game.o \
	$(HLDLL_OBJ_DIR)/gamerules.o \
	$(HLDLL_OBJ_DIR)/gargantua.o \
	$(HLDLL_OBJ_DIR)/gauss.o \
	$(HLDLL_OBJ_DIR)/genericmonster.o \
	$(HLDLL_OBJ_DIR)/ggrenade.o \
	$(HLDLL_OBJ_DIR)/glock.o \
	$(HLDLL_OBJ_DIR)/gman.o \
	$(HLDLL_OBJ_DIR)/h_ai.o \
	$(HLDLL_OBJ_DIR)/h_battery.o \
	$(HLDLL_OBJ_DIR)/h_cine.o \
	$(HLDLL_OBJ_DIR)/h_cycler.o \
	$(HLDLL_OBJ_DIR)/h_export.o \
	$(HLDLL_OBJ_DIR)/handgrenade.o \
	$(HLDLL_OBJ_DIR)/hassassin.o \
	$(HLDLL_OBJ_DIR)/headcrab.o \
	$(HLDLL_OBJ_DIR)/healthkit.o \
	$(HLDLL_OBJ_DIR)/hgrunt.o \
	$(HLDLL_OBJ_DIR)/hornet.o \
	$(HLDLL_OBJ_DIR)/hornetgun.o \
	$(HLDLL_OBJ_DIR)/houndeye.o \
	$(HLDLL_OBJ_DIR)/ichthyosaur.o \
	$(HLDLL_OBJ_DIR)/islave.o \
	$(HLDLL_OBJ_DIR)/items.o \
	$(HLDLL_OBJ_DIR)/leech.o \
	$(HLDLL_OBJ_DIR)/lights.o \
	$(HLDLL_OBJ_DIR)/maprules.o \
	$(HLDLL_OBJ_DIR)/monstermaker.o \
	$(HLDLL_OBJ_DIR)/monsters.o \
	$(HLDLL_OBJ_DIR)/monsterstate.o \
	$(HLDLL_OBJ_DIR)/mortar.o \
	$(HLDLL_OBJ_DIR)/mp5.o \
	$(HLDLL_OBJ_DIR)/nihilanth.o \
	$(HLDLL_OBJ_DIR)/nodes.o \
	$(HLDLL_OBJ_DIR)/observer.o \
	$(HLDLL_OBJ_DIR)/osprey.o \
	$(HLDLL_OBJ_DIR)/pathcorner.o \
	$(HLDLL_OBJ_DIR)/plane.o \
	$(HLDLL_OBJ_DIR)/plats.o \
	$(HLDLL_OBJ_DIR)/player.o \
	$(HLDLL_OBJ_DIR)/python.o \
	$(HLDLL_OBJ_DIR)/rat.o \
	$(HLDLL_OBJ_DIR)/roach.o \
	$(HLDLL_OBJ_DIR)/rpg.o \
	$(HLDLL_OBJ_DIR)/satchel.o \
	$(HLDLL_OBJ_DIR)/schedule.o \
	$(HLDLL_OBJ_DIR)/scientist.o \
	$(HLDLL_OBJ_DIR)/scripted.o \
	$(HLDLL_OBJ_DIR)/shotgun.o \
	$(HLDLL_OBJ_DIR)/skill.o \
	$(HLDLL_OBJ_DIR)/sound.o \
	$(HLDLL_OBJ_DIR)/soundent.o \
	$(HLDLL_OBJ_DIR)/spectator.o \
	$(HLDLL_OBJ_DIR)/squadmonster.o \
	$(HLDLL_OBJ_DIR)/squeakgrenade.o \
	$(HLDLL_OBJ_DIR)/subs.o \
	$(HLDLL_OBJ_DIR)/talkmonster.o \
	$(HLDLL_OBJ_DIR)/teamplay_gamerules.o \
	$(HLDLL_OBJ_DIR)/multiplay_gamerules.o \
	$(HLDLL_OBJ_DIR)/singleplay_gamerules.o \
	$(HLDLL_OBJ_DIR)/tempmonster.o \
	$(HLDLL_OBJ_DIR)/tentacle.o \
	$(HLDLL_OBJ_DIR)/triggers.o \
	$(HLDLL_OBJ_DIR)/tripmine.o \
	$(HLDLL_OBJ_DIR)/turret.o \
	$(HLDLL_OBJ_DIR)/UserMessages.o \
	$(HLDLL_OBJ_DIR)/util.o \
	$(HLDLL_OBJ_DIR)/weapons.o \
	$(HLDLL_OBJ_DIR)/weapons_shared.o \
	$(HLDLL_OBJ_DIR)/world.o \
	$(HLDLL_OBJ_DIR)/xen.o \
	$(HLDLL_OBJ_DIR)/zombie.o

PM_OBJS = \
	$(PM_OBJ_DIR)/pm_shared.o \
	$(PM_OBJ_DIR)/pm_math.o \
	$(PM_OBJ_DIR)/pm_debug.o

GAME_SHARED_OBJS = \
	$(GAME_SHARED_OBJ_DIR)/filesystem_utils.o \
	$(GAME_SHARED_OBJ_DIR)/voice_gamemgr.o

PUBLIC_OBJS = \
	$(PUBLIC_OBJ_DIR)/interface.o \
	
COMMON_OBJS = \
	$(COMMON_OBJ_DIR)/mathlib.o

all: dirs hl.$(SHLIBEXT)

dirs:
	-mkdir $(BUILD_OBJ_DIR)
	-mkdir $(HLDLL_OBJ_DIR)
	-mkdir $(PM_OBJ_DIR)
	-mkdir $(GAME_SHARED_OBJ_DIR)
	-mkdir $(PUBLIC_OBJ_DIR)
	-mkdir $(COMMON_OBJ_DIR)

hl.$(SHLIBEXT): $(HLDLL_OBJS) $(PM_OBJS) $(GAME_SHARED_OBJS) $(PUBLIC_OBJS) $(COMMON_OBJS)
	$(CPLUS) $(LDFLAGS) $(CPP_LIB) $(SHLIBLDFLAGS) -o $(BUILD_DIR)/$@ $(HLDLL_OBJS) $(PM_OBJS) $(GAME_SHARED_OBJS) $(PUBLIC_OBJS) $(COMMON_OBJS)

$(HLDLL_OBJ_DIR)/%.o : $(HLDLL_SRC_DIR)/%.cpp
	$(DO_HLDLL_CC)

$(PM_OBJ_DIR)/%.o : $(PM_SRC_DIR)/%.cpp
	$(DO_PM_CC)

$(GAME_SHARED_OBJ_DIR)/%.o : $(GAME_SHARED_SRC_DIR)/%.cpp
	$(DO_GAME_SHARED_CC)

$(PUBLIC_OBJ_DIR)/%.o : $(PUBLIC_SRC_DIR)/%.cpp
	$(DO_PUBLIC_CC)
	
$(COMMON_OBJ_DIR)/%.o : $(COMMON_SRC_DIR)/%.cpp
	$(DO_COMMON_CC)

clean:
	-rm -rf $(COMMON_OBJ_DIR)
	-rm -rf $(GAME_SHARED_OBJ_DIR)
	-rm -rf $(PM_OBJ_DIR)
	-rm -rf $(HLDLL_OBJ_DIR)
	-rm -f hl_$(ARCH).$(SHLIBEXT)
