# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.21

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

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

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "G:\IDE\Clion\CLion 2021.3.2\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "G:\IDE\Clion\CLion 2021.3.2\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "G:\code\C or C++\sfm-project"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "G:\code\C or C++\sfm-project\cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles\sfm_project.dir\depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles\sfm_project.dir\compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles\sfm_project.dir\progress.make

# Include the compile flags for this target's objects.
include CMakeFiles\sfm_project.dir\flags.make

CMakeFiles\sfm_project.dir\main.cc.obj: CMakeFiles\sfm_project.dir\flags.make
CMakeFiles\sfm_project.dir\main.cc.obj: ..\main.cc
CMakeFiles\sfm_project.dir\main.cc.obj: CMakeFiles\sfm_project.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="G:\code\C or C++\sfm-project\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/sfm_project.dir/main.cc.obj"
	$(CMAKE_COMMAND) -E cmake_cl_compile_depends --dep-file=CMakeFiles\sfm_project.dir\main.cc.obj.d --working-dir="G:\code\C or C++\sfm-project\cmake-build-debug" --filter-prefix="注意: 包含文件:  " -- G:\2019\VC\Tools\MSVC\14.29.30133\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /showIncludes /FoCMakeFiles\sfm_project.dir\main.cc.obj /FdCMakeFiles\sfm_project.dir\ /FS -c "G:\code\C or C++\sfm-project\main.cc"
<<

CMakeFiles\sfm_project.dir\main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sfm_project.dir/main.cc.i"
	G:\2019\VC\Tools\MSVC\14.29.30133\bin\Hostx86\x86\cl.exe > CMakeFiles\sfm_project.dir\main.cc.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "G:\code\C or C++\sfm-project\main.cc"
<<

CMakeFiles\sfm_project.dir\main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sfm_project.dir/main.cc.s"
	G:\2019\VC\Tools\MSVC\14.29.30133\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\sfm_project.dir\main.cc.s /c "G:\code\C or C++\sfm-project\main.cc"
<<

CMakeFiles\sfm_project.dir\feature_points\detect_points.cc.obj: CMakeFiles\sfm_project.dir\flags.make
CMakeFiles\sfm_project.dir\feature_points\detect_points.cc.obj: ..\feature_points\detect_points.cc
CMakeFiles\sfm_project.dir\feature_points\detect_points.cc.obj: CMakeFiles\sfm_project.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="G:\code\C or C++\sfm-project\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.obj"
	$(CMAKE_COMMAND) -E cmake_cl_compile_depends --dep-file=CMakeFiles\sfm_project.dir\feature_points\detect_points.cc.obj.d --working-dir="G:\code\C or C++\sfm-project\cmake-build-debug" --filter-prefix="注意: 包含文件:  " -- G:\2019\VC\Tools\MSVC\14.29.30133\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /showIncludes /FoCMakeFiles\sfm_project.dir\feature_points\detect_points.cc.obj /FdCMakeFiles\sfm_project.dir\ /FS -c "G:\code\C or C++\sfm-project\feature_points\detect_points.cc"
<<

CMakeFiles\sfm_project.dir\feature_points\detect_points.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.i"
	G:\2019\VC\Tools\MSVC\14.29.30133\bin\Hostx86\x86\cl.exe > CMakeFiles\sfm_project.dir\feature_points\detect_points.cc.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "G:\code\C or C++\sfm-project\feature_points\detect_points.cc"
<<

CMakeFiles\sfm_project.dir\feature_points\detect_points.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sfm_project.dir/feature_points/detect_points.cc.s"
	G:\2019\VC\Tools\MSVC\14.29.30133\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\sfm_project.dir\feature_points\detect_points.cc.s /c "G:\code\C or C++\sfm-project\feature_points\detect_points.cc"
<<

# Object files for target sfm_project
sfm_project_OBJECTS = \
"CMakeFiles\sfm_project.dir\main.cc.obj" \
"CMakeFiles\sfm_project.dir\feature_points\detect_points.cc.obj"

# External object files for target sfm_project
sfm_project_EXTERNAL_OBJECTS =

sfm_project.exe: CMakeFiles\sfm_project.dir\main.cc.obj
sfm_project.exe: CMakeFiles\sfm_project.dir\feature_points\detect_points.cc.obj
sfm_project.exe: CMakeFiles\sfm_project.dir\build.make
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_highguid.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_mld.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_objdetectd.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_photod.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_stitchingd.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_videod.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_videoiod.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\ceres-debug.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_imgcodecsd.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_calib3dd.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_dnnd.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_features2dd.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_flannd.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_imgprocd.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_cored.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\glog.lib
sfm_project.exe: E:\src\vcpkg\installed\x86-windows\debug\lib\gflags_debug.lib
sfm_project.exe: CMakeFiles\sfm_project.dir\objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="G:\code\C or C++\sfm-project\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable sfm_project.exe"
	"G:\IDE\Clion\CLion 2021.3.2\bin\cmake\win\bin\cmake.exe" -E vs_link_exe --intdir=CMakeFiles\sfm_project.dir --rc=C:\PROGRA~2\WI3CF2~1\10\bin\100190~1.0\x86\rc.exe --mt=C:\PROGRA~2\WI3CF2~1\10\bin\100190~1.0\x86\mt.exe --manifests -- G:\2019\VC\Tools\MSVC\14.29.30133\bin\Hostx86\x86\link.exe /nologo @CMakeFiles\sfm_project.dir\objects1.rsp @<<
 /out:sfm_project.exe /implib:sfm_project.lib /pdb:"G:\code\C or C++\sfm-project\cmake-build-debug\sfm_project.pdb" /version:0.0 /machine:X86 /debug /INCREMENTAL /subsystem:console  E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_highguid.lib E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_mld.lib E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_objdetectd.lib E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_photod.lib E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_stitchingd.lib E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_videod.lib E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_videoiod.lib E:\src\vcpkg\installed\x86-windows\debug\lib\ceres-debug.lib E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_imgcodecsd.lib E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_calib3dd.lib E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_dnnd.lib E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_features2dd.lib E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_flannd.lib E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_imgprocd.lib E:\src\vcpkg\installed\x86-windows\debug\lib\opencv_cored.lib E:\src\vcpkg\installed\x86-windows\debug\lib\glog.lib E:\src\vcpkg\installed\x86-windows\debug\lib\gflags_debug.lib shlwapi.lib kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib 
<<
	C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -noprofile -executionpolicy Bypass -file E:/src/vcpkg/scripts/buildsystems/msbuild/applocal.ps1 -targetBinary "G:/code/C or C++/sfm-project/cmake-build-debug/sfm_project.exe" -installedDir E:/src/vcpkg/installed/x86-windows/debug/bin -OutVariable out

# Rule to build all files generated by this target.
CMakeFiles\sfm_project.dir\build: sfm_project.exe
.PHONY : CMakeFiles\sfm_project.dir\build

CMakeFiles\sfm_project.dir\clean:
	$(CMAKE_COMMAND) -P CMakeFiles\sfm_project.dir\cmake_clean.cmake
.PHONY : CMakeFiles\sfm_project.dir\clean

CMakeFiles\sfm_project.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" "G:\code\C or C++\sfm-project" "G:\code\C or C++\sfm-project" "G:\code\C or C++\sfm-project\cmake-build-debug" "G:\code\C or C++\sfm-project\cmake-build-debug" "G:\code\C or C++\sfm-project\cmake-build-debug\CMakeFiles\sfm_project.dir\DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles\sfm_project.dir\depend

