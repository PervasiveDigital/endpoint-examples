cmake_minimum_required(VERSION 3.20.0)

#project(mathlib VERSION 1.0.0 DESCRIPTION "A sample shared lib")
project(mathlib)

add_library(mathlib SHARED
    mathfns.c
)
