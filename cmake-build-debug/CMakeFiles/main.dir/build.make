# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/alanliu/Documents/GitHub/edgepart

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/main.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/main.dir/flags.make

CMakeFiles/main.dir/src/main.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/main.dir/src/main.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/main.cpp.o -c /Users/alanliu/Documents/GitHub/edgepart/src/main.cpp

CMakeFiles/main.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/main.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/alanliu/Documents/GitHub/edgepart/src/main.cpp > CMakeFiles/main.dir/src/main.cpp.i

CMakeFiles/main.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/main.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/alanliu/Documents/GitHub/edgepart/src/main.cpp -o CMakeFiles/main.dir/src/main.cpp.s

CMakeFiles/main.dir/src/util.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/util.cpp.o: ../src/util.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/main.dir/src/util.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/util.cpp.o -c /Users/alanliu/Documents/GitHub/edgepart/src/util.cpp

CMakeFiles/main.dir/src/util.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/util.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/alanliu/Documents/GitHub/edgepart/src/util.cpp > CMakeFiles/main.dir/src/util.cpp.i

CMakeFiles/main.dir/src/util.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/util.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/alanliu/Documents/GitHub/edgepart/src/util.cpp -o CMakeFiles/main.dir/src/util.cpp.s

CMakeFiles/main.dir/src/sort.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/sort.cpp.o: ../src/sort.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/main.dir/src/sort.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/sort.cpp.o -c /Users/alanliu/Documents/GitHub/edgepart/src/sort.cpp

CMakeFiles/main.dir/src/sort.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/sort.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/alanliu/Documents/GitHub/edgepart/src/sort.cpp > CMakeFiles/main.dir/src/sort.cpp.i

CMakeFiles/main.dir/src/sort.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/sort.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/alanliu/Documents/GitHub/edgepart/src/sort.cpp -o CMakeFiles/main.dir/src/sort.cpp.s

CMakeFiles/main.dir/src/graph.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/graph.cpp.o: ../src/graph.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/main.dir/src/graph.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/graph.cpp.o -c /Users/alanliu/Documents/GitHub/edgepart/src/graph.cpp

CMakeFiles/main.dir/src/graph.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/graph.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/alanliu/Documents/GitHub/edgepart/src/graph.cpp > CMakeFiles/main.dir/src/graph.cpp.i

CMakeFiles/main.dir/src/graph.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/graph.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/alanliu/Documents/GitHub/edgepart/src/graph.cpp -o CMakeFiles/main.dir/src/graph.cpp.s

CMakeFiles/main.dir/src/ne_partitioner.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/ne_partitioner.cpp.o: ../src/ne_partitioner.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/main.dir/src/ne_partitioner.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/ne_partitioner.cpp.o -c /Users/alanliu/Documents/GitHub/edgepart/src/ne_partitioner.cpp

CMakeFiles/main.dir/src/ne_partitioner.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/ne_partitioner.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/alanliu/Documents/GitHub/edgepart/src/ne_partitioner.cpp > CMakeFiles/main.dir/src/ne_partitioner.cpp.i

CMakeFiles/main.dir/src/ne_partitioner.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/ne_partitioner.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/alanliu/Documents/GitHub/edgepart/src/ne_partitioner.cpp -o CMakeFiles/main.dir/src/ne_partitioner.cpp.s

CMakeFiles/main.dir/src/sne_partitioner.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/sne_partitioner.cpp.o: ../src/sne_partitioner.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/main.dir/src/sne_partitioner.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/sne_partitioner.cpp.o -c /Users/alanliu/Documents/GitHub/edgepart/src/sne_partitioner.cpp

CMakeFiles/main.dir/src/sne_partitioner.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/sne_partitioner.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/alanliu/Documents/GitHub/edgepart/src/sne_partitioner.cpp > CMakeFiles/main.dir/src/sne_partitioner.cpp.i

CMakeFiles/main.dir/src/sne_partitioner.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/sne_partitioner.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/alanliu/Documents/GitHub/edgepart/src/sne_partitioner.cpp -o CMakeFiles/main.dir/src/sne_partitioner.cpp.s

CMakeFiles/main.dir/src/random_partitioner.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/random_partitioner.cpp.o: ../src/random_partitioner.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/main.dir/src/random_partitioner.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/random_partitioner.cpp.o -c /Users/alanliu/Documents/GitHub/edgepart/src/random_partitioner.cpp

CMakeFiles/main.dir/src/random_partitioner.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/random_partitioner.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/alanliu/Documents/GitHub/edgepart/src/random_partitioner.cpp > CMakeFiles/main.dir/src/random_partitioner.cpp.i

CMakeFiles/main.dir/src/random_partitioner.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/random_partitioner.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/alanliu/Documents/GitHub/edgepart/src/random_partitioner.cpp -o CMakeFiles/main.dir/src/random_partitioner.cpp.s

CMakeFiles/main.dir/src/hsfc_partitioner.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/hsfc_partitioner.cpp.o: ../src/hsfc_partitioner.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/main.dir/src/hsfc_partitioner.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/hsfc_partitioner.cpp.o -c /Users/alanliu/Documents/GitHub/edgepart/src/hsfc_partitioner.cpp

CMakeFiles/main.dir/src/hsfc_partitioner.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/hsfc_partitioner.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/alanliu/Documents/GitHub/edgepart/src/hsfc_partitioner.cpp > CMakeFiles/main.dir/src/hsfc_partitioner.cpp.i

CMakeFiles/main.dir/src/hsfc_partitioner.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/hsfc_partitioner.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/alanliu/Documents/GitHub/edgepart/src/hsfc_partitioner.cpp -o CMakeFiles/main.dir/src/hsfc_partitioner.cpp.s

CMakeFiles/main.dir/src/dbh_partitioner.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/dbh_partitioner.cpp.o: ../src/dbh_partitioner.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/main.dir/src/dbh_partitioner.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/dbh_partitioner.cpp.o -c /Users/alanliu/Documents/GitHub/edgepart/src/dbh_partitioner.cpp

CMakeFiles/main.dir/src/dbh_partitioner.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/dbh_partitioner.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/alanliu/Documents/GitHub/edgepart/src/dbh_partitioner.cpp > CMakeFiles/main.dir/src/dbh_partitioner.cpp.i

CMakeFiles/main.dir/src/dbh_partitioner.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/dbh_partitioner.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/alanliu/Documents/GitHub/edgepart/src/dbh_partitioner.cpp -o CMakeFiles/main.dir/src/dbh_partitioner.cpp.s

CMakeFiles/main.dir/src/conversions.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/conversions.cpp.o: ../src/conversions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/main.dir/src/conversions.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/conversions.cpp.o -c /Users/alanliu/Documents/GitHub/edgepart/src/conversions.cpp

CMakeFiles/main.dir/src/conversions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/conversions.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/alanliu/Documents/GitHub/edgepart/src/conversions.cpp > CMakeFiles/main.dir/src/conversions.cpp.i

CMakeFiles/main.dir/src/conversions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/conversions.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/alanliu/Documents/GitHub/edgepart/src/conversions.cpp -o CMakeFiles/main.dir/src/conversions.cpp.s

CMakeFiles/main.dir/src/shuffler.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/shuffler.cpp.o: ../src/shuffler.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/main.dir/src/shuffler.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/shuffler.cpp.o -c /Users/alanliu/Documents/GitHub/edgepart/src/shuffler.cpp

CMakeFiles/main.dir/src/shuffler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/shuffler.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/alanliu/Documents/GitHub/edgepart/src/shuffler.cpp > CMakeFiles/main.dir/src/shuffler.cpp.i

CMakeFiles/main.dir/src/shuffler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/shuffler.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/alanliu/Documents/GitHub/edgepart/src/shuffler.cpp -o CMakeFiles/main.dir/src/shuffler.cpp.s

# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/src/main.cpp.o" \
"CMakeFiles/main.dir/src/util.cpp.o" \
"CMakeFiles/main.dir/src/sort.cpp.o" \
"CMakeFiles/main.dir/src/graph.cpp.o" \
"CMakeFiles/main.dir/src/ne_partitioner.cpp.o" \
"CMakeFiles/main.dir/src/sne_partitioner.cpp.o" \
"CMakeFiles/main.dir/src/random_partitioner.cpp.o" \
"CMakeFiles/main.dir/src/hsfc_partitioner.cpp.o" \
"CMakeFiles/main.dir/src/dbh_partitioner.cpp.o" \
"CMakeFiles/main.dir/src/conversions.cpp.o" \
"CMakeFiles/main.dir/src/shuffler.cpp.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

main: CMakeFiles/main.dir/src/main.cpp.o
main: CMakeFiles/main.dir/src/util.cpp.o
main: CMakeFiles/main.dir/src/sort.cpp.o
main: CMakeFiles/main.dir/src/graph.cpp.o
main: CMakeFiles/main.dir/src/ne_partitioner.cpp.o
main: CMakeFiles/main.dir/src/sne_partitioner.cpp.o
main: CMakeFiles/main.dir/src/random_partitioner.cpp.o
main: CMakeFiles/main.dir/src/hsfc_partitioner.cpp.o
main: CMakeFiles/main.dir/src/dbh_partitioner.cpp.o
main: CMakeFiles/main.dir/src/conversions.cpp.o
main: CMakeFiles/main.dir/src/shuffler.cpp.o
main: CMakeFiles/main.dir/build.make
main: /usr/local/lib/libgflags_nothreads.a
main: threadpool11/libthreadpool11.a
main: CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Linking CXX executable main"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/main.dir/build: main
.PHONY : CMakeFiles/main.dir/build

CMakeFiles/main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : CMakeFiles/main.dir/clean

CMakeFiles/main.dir/depend:
	cd /Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/alanliu/Documents/GitHub/edgepart /Users/alanliu/Documents/GitHub/edgepart /Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug /Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug /Users/alanliu/Documents/GitHub/edgepart/cmake-build-debug/CMakeFiles/main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/main.dir/depend

