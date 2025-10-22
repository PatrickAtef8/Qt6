cmake_minimum_required(VERSION 3.10)
project(qt-gpio-app)

# Enable cross-compilation if needed
if(CMAKE_CROSSCOMPILING)
    set(CMAKE_SYSTEM_NAME Linux)
    set(CMAKE_SYSTEM_PROCESSOR aarch64)
endif()

# Set up Qt6 to be found from the Buildroot toolchain
set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} /home/patrick/EmbeddedLinuxKitchen/buildroot/output/host/usr/lib/cmake/Qt6)

# Enable AutoMoc for Qt Meta-Object Compiler
set(CMAKE_AUTOMOC ON)

# Find Qt6 packages
find_package(Qt6 REQUIRED COMPONENTS Core Gui Quick Qml)

# Set source files
set(SOURCES
    src/controller.cpp
    src/main.cpp
)

set(HEADERS
    src/controller.h
)

# Define the executable
add_executable(qt-gpio-app ${SOURCES} ${HEADERS})

# Link the Qt6 libraries
target_link_libraries(qt-gpio-app Qt6::Core Qt6::Gui Qt6::Quick Qt6::Qml)

# Install the executable to /usr/bin
install(TARGETS qt-gpio-app DESTINATION /usr/bin)

# Install QML file to /usr/share/qt-gpio-app/
install(FILES main.qml DESTINATION /usr/share/qt-gpio-app/)

