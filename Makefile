# MIT Copyright (c) 2021 TopchetoEU

rwildcard=$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d))
gxx = gcc

############# SETTINGS ############
bin-dir = bin
src-dir = src
inc-dir = include
output = bin/main
###################################

sources = $(call rwildcard,$(src-dir),*.c)
binaries = $(patsubst $(src-dir)/%.c,$(bin-dir)/%.o,$(sources))

ifeq sources ''
$(error No innput files)
endif

build: clear $(binaries) $(output)
build-win: clear-win $(binaries) $(output).exe

debug-build: flags=-g
debug-build-win: flags=-g
debug-build: build
debug-build-win: build-win

clear:
	rmdir -r $(bin-dir)
	mkdir -p $(bin-dir)
clear-win:
	if exist "$(bin-dir)" rmdir /s/q "$(bin-dir)"
	if not exist "$(bin-dir)" mkdir "$(bin-dir)"

bin/%.o: src/%.c
	$(gxx) -Wall -Wno-main -Wno-trigraphs -c $(flags) $^ -o $@ "-I$(inc-dir)"

$(output):
	$(gxx) -g $(binaries) -o $@
$(output)%:
	$(gxx) -g $(binaries) -o $@