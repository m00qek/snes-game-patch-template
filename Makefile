############################### CUSTOM VARIABLES ###############################

# the name of the game being patched
GAME = TheLastSuper

################################################################################
EXECUTE=./scripts/execute-on m00qek/snes-game-patcher:alpine

DEV_VERSION = DEV-0.0.0
VERSION = $(DEV_VERSION)
ORIGINAL_ROM = $(GAME).sfc

prepare:
	@rm -rf ./build
	@mkdir -p ./build/resources
	@cp ./resources/* ./build/resources/ -r

	@$(EXECUTE) ./scripts/download-game-backup \
		"$(ORIGINAL_ROM)" \
		--output ./build/resources/$(GAME).sfc \
		--token "$(DROPBOX_TOKEN)"

rom:
	@echo 'Assembling modified game...'

	@rm -rf ./build/release
	@mkdir -p ./build/release
	@cp ./build/resources/$(GAME).sfc ./build/release/$(GAME).sfc

	@$(EXECUTE) asar \
		--define resources_directory='../build/resources/' \
		./src/main.asm \
		./build/release/$(GAME).sfc

	@echo 'Done!'

patch: rom
	@echo 'Creating patch with differences between original and modified game...'

	@$(EXECUTE) flips \
		--create \
		--bps-delta \
		./build/resources/$(GAME).sfc \
		./build/release/$(GAME).sfc \
		./build/release/$(GAME)-patch.bps

watch:
	@echo 'Assembling custom game when any file on "src/" changes...'
	@echo

	@$(EXECUTE) bash -c \
		'find src/ | entr make EXECUTE="" ORIGINAL_ROM="$(ORIGINAL_ROM)" make rom'

tag-and-release:
ifeq ($(VERSION),$(DEV_VERSION))
	$(error "You must specify a version using VERSION=v0.0.0")
else
	@git tag $(VERSION)
	@git push origin $(VERSION)
endif
