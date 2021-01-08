
CMAKE_CC_CXX     := -DCMAKE_C_COMPILER=$(shell which gcc) -DCMAKE_CXX_COMPILER=$(shell which g++)
CMAKE            := cmake $(CMAKE_CC_CXX)
CMAKE_BUILD      :=

CUB_1_11         := cub1.11
NVCOMP_1_1       := nvcomp1.1
NVCOMP_1_2       := nvcomp1.2
#### TODO find proper cub-compat for CUDA 9.2 support
NVCOMP_1_1_DEP   := -DCUB_DIR=$(PWD)/$(CUB_1_11)
NVCOMP_1_1_CMAKE := $(CMAKE) $(NVCOMP_1_1_DEP)
NVCOMP_1_2_CMAKE := $(CMAKE) 

patch_nvcomp1.1:
	patch $(NVCOMP_1_1)/src/CMakeLists.txt .patch/patch.nvcomp-1.1
patch_nvcomp1.2:
	patch $(NVCOMP_1_2)/src/CMakeLists.txt .patch/patch.nvcomp-1.2

#### 1. Per docker image of CUDA {9.2,10.0,10.1,10.2}, cmake is versioned 3.10. 
####    `cmake [options] -S <path-to-source> -B <path-to-build>` pattern does not work.
#### 2. On starting docker, run `apt update && apt install -y cmake`
#### 3. TODO nvcomp may not be working for 9.2
build-nvcomp1.1-cuda9.2:
	@echo "not working for CUDA 9.2"
	# $(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	# mkdir $(CMAKE_BUILD) && cd $(CMAKE_BUILD) && $(NVCOMP_1_1_CMAKE) .. && make -j
build-nvcomp1.1-cuda10.0:
	$(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	mkdir $(CMAKE_BUILD) && cd $(CMAKE_BUILD) && $(NVCOMP_1_1_CMAKE) .. && make -j
build-nvcomp1.1-cuda10.1:
	$(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	mkdir $(CMAKE_BUILD) && cd $(CMAKE_BUILD) && $(NVCOMP_1_1_CMAKE) .. && make -j
build-nvcomp1.1-cuda10.2:
	$(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	mkdir $(CMAKE_BUILD) && cd $(CMAKE_BUILD) && $(NVCOMP_1_1_CMAKE) .. && make -j
#### 1. Per docker image of CUDA {11.0,11.1,11.2}
####    `cmake [options] -S <path-to-source> -B <path-to-build>` works.
#### 2. On starting docker, run `apt update && apt install -y cmake`
#### 3. CUDA 11 does not mandatorily need specifying `cub` manually; yet it does not	
####    break compilation; commands are revamped and compatible with the first version.
build-nvcomp1.1-cuda11.0:
	$(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	$(NVCOMP_1_1_CMAKE) -S $(NVCOMP_1_1) -B $(CMAKE_BUILD) && make -j -C $(CMAKE_BUILD)
build-nvcomp1.1-cuda11.1:
	$(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	$(NVCOMP_1_1_CMAKE) -S $(NVCOMP_1_1) -B $(CMAKE_BUILD) && make -j -C $(CMAKE_BUILD)
build-nvcomp1.1-cuda11.2:
	$(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_1)/$@))
	$(NVCOMP_1_1_CMAKE) -S $(NVCOMP_1_1) -B $(CMAKE_BUILD) && make -j -C $(CMAKE_BUILD)


#### Starting nvcomp-1.2, cmake 3.18+ is required.
#### TODO this is a trial on local machine, with cmake installed otherwise via Spack
#### Standalone cub-1.11.0 is not (necessarily) working for CUDA 11 SDK (it is included).
build-nvcomp1.2-cuda11.2:
	$(eval CMAKE_BUILD := $(shell echo $(NVCOMP_1_2)/$@))
	$(NVCOMP_1_2_CMAKE) -S $(NVCOMP_1_2) -B $(CMAKE_BUILD) && make -j -C $(CMAKE_BUILD)