BUILD_DIR=build
COCO_BUILD_DIR=$(BUILD_DIR)/coco
DRAGON_BUILD_DIR=$(BUILD_DIR)/dragon
MC10_BUILD_DIR=$(BUILD_DIR)/mc-10
MC10_COMPILED_DIR=$(BUILD_DIR)/mc-10c

COMMON_DIR=Common
DRAGON_DIR=Dragon
TANDY_DIR=Tandy
COCO_DIR=$(TANDY_DIR)/CoCo
MC10_DIR=$(TANDY_DIR)/MC-10

SHELL = /bin/bash

COCO_SOURCES=$(wildcard $(COMMON_DIR)/*/*.bas) $(wildcard $(COCO_DIR)/*/*/*.bas)
DRAGON_SOURCES=$(wildcard $(COMMON_DIR)/*/*.bas) $(wildcard $(DRAGON_DIR)/*/*/*.bas)
MC10_SOURCES=$(wildcard $(COMMON_DIR)/*/*.bas) $(wildcard $(MC10_DIR)/*/*/*.bas)
MC10C_SOURCES=$(wildcard $(MC10_DIR)/Originals/FlipBits/*.bas)

define basify
$(shell for each in $1; do
	echo -n $$(basename $${each}) "";
	done)
endef

define c10ify
$(call prefixify,$(call basify,$1),$2)
endef

define capify
$(shell echo '$1' | tr '[:lower:]' '[:upper:]')
endef

define dskify
$(shell for each in $1; do
	export parent=$$(basename $$(dirname $${each}));
	echo -n $${parent}.dsk "";
	done)
endef

define eightify
$(shell for each in $1; do
	export parent=$$(basename $$(dirname $${each}));
	export parent_parent=$$(dirname $$(dirname $${each}));
	export basfile=$$(basename -s .bas $${each});
	echo -n $${parent_parent}/$${parent:0:8}/$${basfile:0:8}.bas "";
	done)
endef

define prefixify
$(shell for each in $1; do
	echo -n $(2)$${each} "";
	done)
endef

COCO_TARGETS=$(call prefixify,$(call dskify,$(COCO_SOURCES)),$(COCO_BUILD_DIR)/)
DRAGON_TARGETS=$(call prefixify,$(call dskify,$(DRAGON_SOURCES)),$(DRAGON_BUILD_DIR)/)
MC10_TARGETS_BAS=$(call c10ify,$(MC10_SOURCES),$(MC10_BUILD_DIR)/)
MC10_TARGETS=$(MC10_TARGETS_BAS:.bas=.c10)
MC10C_TARGETS_BAS=$(call c10ify,$(MC10C_SOURCES),$(MC10_COMPILED_DIR)/)
MC10C_TARGETS=$(MC10C_TARGETS_BAS:.bas=.c10)

.PHONY: clean coco dragon mc10 mc10c

all: coco dragon mc10 mc10c

clean:
	rm -rf $(BUILD_DIR)


coco: $(COCO_BUILD_DIR) $(COCO_TARGETS)
	@echo $@ is built

$(COCO_BUILD_DIR):
	mkdir -p $@

$(COCO_BUILD_DIR)/%.dsk: $(COMMON_DIR)/% $(COMMON_DIR)/%/*.bas
	decb dskini $@
	@all_files=($^) && \
	bas_files=$${all_files[@]:1} && \
	for each in $${bas_files}; do \
		file8=$$(basename $${each} | tr '[:lower:]' '[:upper:]') && \
		decb copy -0 -t $${each} $@,$${file8};\
	done

$(COCO_BUILD_DIR)/%.dsk: $(COCO_DIR)/*/% $(COCO_DIR)/*/%/*.bas
	decb dskini $@
	@all_files=($^) && \
	bas_files=$${all_files[@]:1} && \
	for each in $${bas_files}; do \
		file8=$$(basename $${each} | tr '[:lower:]' '[:upper:]') && \
		decb copy -0 -t $${each} $@,$${file8};\
	done


dragon: $(DRAGON_BUILD_DIR) $(DRAGON_TARGETS)
	@echo $@ is built

$(DRAGON_BUILD_DIR):
	mkdir -p $@

$(DRAGON_BUILD_DIR)/%.dsk: $(COMMON_DIR)/% $(COMMON_DIR)/%/*.bas
	decb dskini $@
	@all_files=($^) && \
	bas_files=$${all_files[@]:1} && \
	for each in $${bas_files}; do \
		file8=$$(basename $${each} | tr '[:lower:]' '[:upper:]') && \
		decb copy -0 -t $${each} $@,$${file8};\
	done

$(DRAGON_BUILD_DIR)/%.dsk: $(DRAGON_DIR)/*/% $(DRAGON_DIR)/*/%/*.bas
	decb dskini $@
	@all_files=($^) && \
	bas_files=$${all_files[@]:1} && \
	for each in $${bas_files}; do \
		file8=$$(basename $${each} | tr '[:lower:]' '[:upper:]') && \
		decb copy -0 -t $${each} $@,$${file8};\
	done


mc10: $(MC10_BUILD_DIR) $(MC10_TARGETS)
	@echo $@ is built

$(MC10_BUILD_DIR):
	mkdir -p $@

$(MC10_BUILD_DIR)/%.c10: $(COMMON_DIR)/*/%.bas
	bastoc10 $^ $@

$(MC10_BUILD_DIR)/%.c10: $(MC10_DIR)/*/*/%.bas
	bastoc10 $^ $@


mc10c: $(MC10_COMPILED_DIR) $(MC10C_TARGETS)
	@echo $@ is built

$(MC10_COMPILED_DIR):
	mkdir -p $@

$(MC10_COMPILED_DIR)/%.c10: $(COMMON_DIR)/*/%.bas
	@basfile=$^ && \
	mcbasic $${basfile} && \
	mv $${basfile%.bas}.c10 $@

$(MC10_COMPILED_DIR)/%.c10: $(MC10_DIR)/*/*/%.bas
	@basfile=$^ && \
	mcbasic $${basfile} && \
	mv $${basfile%.bas}.c10 $@
