
CMAKE_CC_CXX      := -DCMAKE_C_COMPILER=$(shell which gcc) -DCMAKE_CXX_COMPILER=$(shell which g++)
CMAKE             := cmake $(CMAKE_CC_CXX)
CMAKE_BUILD_PATH  :=

NVCOMP_DIR        := nvcomp
NVCOMP_CMAKE_DEP  := -DCUB_DIR=$(PWD)/cub
NVCOMP_CMAKE_HEAD := $(CMAKE) $(NVCOMP_CMAKE_DEP) -S $(NVCOMP_DIR)

patch_nvcomp1.1:
	patch nvcomp/src/CMakeLists.txt .patch/patch.nvcomp-1.1
build-nvcomp1.1-cuda9.2:
	$(eval CMAKE_BUILD_PATH := $(shell echo $(NVCOMP_DIR)/$@))
	$(NVCOMP_CMAKE_HEAD) -B $(CMAKE_BUILD_PATH) && make -j -C $(CMAKE_BUILD_PATH)
	@echo "$(NVCOMP_CMAKE_HEAD) -B $(CMAKE_BUILD_PATH) && make -j -C $(CMAKE_BUILD_PATH)"
build-nvcomp1.1-cuda10.0:
	$(eval CMAKE_BUILD_PATH := $(shell echo $(NVCOMP_DIR)/$@))
	$(NVCOMP_CMAKE_HEAD) -B $(CMAKE_BUILD_PATH) && make -j -C $(CMAKE_BUILD_PATH)
build-nvcomp1.1-cuda10.1:
	$(eval CMAKE_BUILD_PATH := $(shell echo $(NVCOMP_DIR)/$@))
	$(NVCOMP_CMAKE_HEAD) -B $(CMAKE_BUILD_PATH) && make -j -C $(CMAKE_BUILD_PATH)
build-nvcomp1.1-cuda10.2:
	$(eval CMAKE_BUILD_PATH := $(shell echo $(NVCOMP_DIR)/$@))
	$(NVCOMP_CMAKE_HEAD) -B $(CMAKE_BUILD_PATH) && make -j -C $(CMAKE_BUILD_PATH)
build-nvcomp1.1-cuda11.0:
	$(eval CMAKE_BUILD_PATH := $(shell echo $(NVCOMP_DIR)/$@))
	$(NVCOMP_CMAKE_HEAD) -B $(CMAKE_BUILD_PATH) && make -j -C $(CMAKE_BUILD_PATH)
build-nvcomp1.1-cuda11.1:
	$(eval CMAKE_BUILD_PATH := $(shell echo $(NVCOMP_DIR)/$@))
	$(NVCOMP_CMAKE_HEAD) -B $(CMAKE_BUILD_PATH) && make -j -C $(CMAKE_BUILD_PATH)
build-nvcomp1.1-cuda11.2:
	$(eval CMAKE_BUILD_PATH := $(shell echo $(NVCOMP_DIR)/$@))
	$(NVCOMP_CMAKE_HEAD) -B $(CMAKE_BUILD_PATH) && make -j -C $(CMAKE_BUILD_PATH)