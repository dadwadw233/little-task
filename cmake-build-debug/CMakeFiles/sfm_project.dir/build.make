# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/yyh/clion/clion-2021.1/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/yyh/clion/clion-2021.1/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yyh/sfm-project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yyh/sfm-project/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/sfm_project.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sfm_project.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sfm_project.dir/flags.make

CMakeFiles/sfm_project.dir/main.cc.o: CMakeFiles/sfm_project.dir/flags.make
CMakeFiles/sfm_project.dir/main.cc.o: ../main.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yyh/sfm-project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/sfm_project.dir/main.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sfm_project.dir/main.cc.o -c /home/yyh/sfm-project/main.cc

CMakeFiles/sfm_project.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sfm_project.dir/main.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yyh/sfm-project/main.cc > CMakeFiles/sfm_project.dir/main.cc.i

CMakeFiles/sfm_project.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sfm_project.dir/main.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yyh/sfm-project/main.cc -o CMakeFiles/sfm_project.dir/main.cc.s

CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.o: CMakeFiles/sfm_project.dir/flags.make
CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.o: ../feature_points/detect_points.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yyh/sfm-project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.o -c /home/yyh/sfm-project/feature_points/detect_points.cc

CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yyh/sfm-project/feature_points/detect_points.cc > CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.i

CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yyh/sfm-project/feature_points/detect_points.cc -o CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.s

# Object files for target sfm_project
sfm_project_OBJECTS = \
"CMakeFiles/sfm_project.dir/main.cc.o" \
"CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.o"

# External object files for target sfm_project
sfm_project_EXTERNAL_OBJECTS =

sfm_project: CMakeFiles/sfm_project.dir/main.cc.o
sfm_project: CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.o
sfm_project: CMakeFiles/sfm_project.dir/build.make
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_shape.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_aruco.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_bgsegm.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_bioinspired.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_ccalib.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_datasets.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_dpm.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_face.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_freetype.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_fuzzy.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_hdf.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_line_descriptor.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_optflow.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_plot.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_reg.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_saliency.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_stereo.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_structured_light.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_surface_matching.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_text.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_ximgproc.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_xobjdetect.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_xphoto.so.3.2.0
sfm_project: /usr/local/lib/libceres.a
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_video.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_viz.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_phase_unwrapping.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_rgbd.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_videoio.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_imgcodecs.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libopencv_core.so.3.2.0
sfm_project: /usr/lib/x86_64-linux-gnu/libglog.so
sfm_project: /usr/lib/x86_64-linux-gnu/libgflags.so.2.2.1
sfm_project: /usr/lib/x86_64-linux-gnu/libspqr.so
sfm_project: /usr/lib/x86_64-linux-gnu/libtbb.so
sfm_project: /usr/lib/x86_64-linux-gnu/libcholmod.so
sfm_project: /usr/lib/x86_64-linux-gnu/libccolamd.so
sfm_project: /usr/lib/x86_64-linux-gnu/libcamd.so
sfm_project: /usr/lib/x86_64-linux-gnu/libcolamd.so
sfm_project: /usr/lib/x86_64-linux-gnu/libamd.so
sfm_project: /usr/lib/x86_64-linux-gnu/liblapack.so
sfm_project: /usr/lib/x86_64-linux-gnu/libf77blas.so
sfm_project: /usr/lib/x86_64-linux-gnu/libatlas.so
sfm_project: /usr/lib/x86_64-linux-gnu/libsuitesparseconfig.so
sfm_project: /usr/lib/x86_64-linux-gnu/librt.so
sfm_project: /usr/lib/x86_64-linux-gnu/libcxsparse.so
sfm_project: /usr/lib/x86_64-linux-gnu/liblapack.so
sfm_project: /usr/lib/x86_64-linux-gnu/libf77blas.so
sfm_project: /usr/lib/x86_64-linux-gnu/libatlas.so
sfm_project: /usr/lib/x86_64-linux-gnu/libsuitesparseconfig.so
sfm_project: /usr/lib/x86_64-linux-gnu/librt.so
sfm_project: /usr/lib/x86_64-linux-gnu/libcxsparse.so
sfm_project: CMakeFiles/sfm_project.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yyh/sfm-project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable sfm_project"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sfm_project.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sfm_project.dir/build: sfm_project

.PHONY : CMakeFiles/sfm_project.dir/build

CMakeFiles/sfm_project.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sfm_project.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sfm_project.dir/clean

CMakeFiles/sfm_project.dir/depend:
	cd /home/yyh/sfm-project/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yyh/sfm-project /home/yyh/sfm-project /home/yyh/sfm-project/cmake-build-debug /home/yyh/sfm-project/cmake-build-debug /home/yyh/sfm-project/cmake-build-debug/CMakeFiles/sfm_project.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sfm_project.dir/depend

