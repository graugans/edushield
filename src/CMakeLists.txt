cmake_minimum_required(VERSION 3.16)
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/../../cmake/stm32_gcc.cmake)

project(stm32-blinky-ll C ASM)
set(CMAKE_INCLUDE_CURRENT_DIR TRUE)

find_package(CMSIS COMPONENTS STM32F1 REQUIRED)
find_package(HAL COMPONENTS STM32F1 LL_RCC LL_GPIO REQUIRED)

# STM32VL-Discovery
add_executable(stm32-blinky-f1 blinky.c)
target_link_libraries(stm32-blinky-f1
    HAL::STM32::F1::LL_RCC
    HAL::STM32::F1::LL_GPIO
    CMSIS::STM32::F103RB
    STM32::NoSys
)
stm32_print_size_of_target(stm32-blinky-f1)
