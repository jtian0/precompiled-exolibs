
CMAKE_CC_CXX      := -DCMAKE_C_COMPILER=$(shell which gcc) -DCMAKE_CXX_COMPILER=$(shell which g++)
CMAKE             := cmake $(CMAKE_CC_CXX)
CMAKE_BUILD       :=

NVCOMP_1_1        := nvcomp1.1
NVCOMP_CMAKE_DEP  := -DCUB_DIR=$(PWD)/cub
NVCOMP_CMAKE_HEAD := $(CMAKE) $(NVCOMP_CMAKE_DEP)

patch_nvcomp1.1:
	patch nvcomp/src/CMakeLists.txt .patch/patch.nvcomp-1.1

#### 1. Per docker image of CUDA {9.2,10.0,10.1,10.2}, cmake is versioned 3.10. 
####    `cmake [options] -S <path-to-source> -B <path-to-build>` pattern does not work.
#### 2. On starting docker, run `apt update && apt install -y cmake`
#### 3. TODO nvcomp may not be working for 9.2
build-nvcomp1.1-cuda9.2:
	@echo "not working for CUDA 9.2"
	# $(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	# mkdir $(CMAKE_BUILD) && cd $(CMAKE_BUILD) && $(NVCOMP_CMAKE_HEAD) .. && make -j
build-nvcomp1.1-cuda10.0:
	$(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	mkdir $(CMAKE_BUILD) && cd $(CMAKE_BUILD) && $(NVCOMP_CMAKE_HEAD) .. && make -j
build-nvcomp1.1-cuda10.1:
	$(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	mkdir $(CMAKE_BUILD) && cd $(CMAKE_BUILD) && $(NVCOMP_CMAKE_HEAD) .. && make -j
build-nvcomp1.1-cuda10.2:
	$(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	mkdir $(CMAKE_BUILD) && cd $(CMAKE_BUILD) && $(NVCOMP_CMAKE_HEAD) .. && make -j
#### 1. Per docker image of CUDA {11.0,11.1,11.2}
####    `cmake [options] -S <path-to-source> -B <path-to-build>` works.
#### 2. On starting docker, run `apt update && apt install -y cmake`
#### 3. TODO CUDA 11 does not necessarily need `cub`
build-nvcomp1.1-cuda11.0:
	$(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	$(NVCOMP_CMAKE_HEAD) -S $(NVCOMP_1_1) -B $(CMAKE_BUILD) && make -j -C $(CMAKE_BUILD)
build-nvcomp1.1-cuda11.1:
	$(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	$(NVCOMP_CMAKE_HEAD) -S $(NVCOMP_1_1) -B $(CMAKE_BUILD) && make -j -C $(CMAKE_BUILD)
build-nvcomp1.1-cuda11.2:
	$(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	$(NVCOMP_CMAKE_HEAD) -S $(NVCOMP_1_1) -B $(CMAKE_BUILD) && make -j -C $(CMAKE_BUILD)