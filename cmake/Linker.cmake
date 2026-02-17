macro(test_cpp_best_practives_configure_linker project_name)
  set(test_cpp_best_practives_USER_LINKER_OPTION
    "DEFAULT"
      CACHE STRING "Linker to be used")
    set(test_cpp_best_practives_USER_LINKER_OPTION_VALUES "DEFAULT" "SYSTEM" "LLD" "GOLD" "BFD" "MOLD" "SOLD" "APPLE_CLASSIC" "MSVC")
  set_property(CACHE test_cpp_best_practives_USER_LINKER_OPTION PROPERTY STRINGS ${test_cpp_best_practives_USER_LINKER_OPTION_VALUES})
  list(
    FIND
    test_cpp_best_practives_USER_LINKER_OPTION_VALUES
    ${test_cpp_best_practives_USER_LINKER_OPTION}
    test_cpp_best_practives_USER_LINKER_OPTION_INDEX)

  if(${test_cpp_best_practives_USER_LINKER_OPTION_INDEX} EQUAL -1)
    message(
      STATUS
        "Using custom linker: '${test_cpp_best_practives_USER_LINKER_OPTION}', explicitly supported entries are ${test_cpp_best_practives_USER_LINKER_OPTION_VALUES}")
  endif()

  set_target_properties(${project_name} PROPERTIES LINKER_TYPE "${test_cpp_best_practives_USER_LINKER_OPTION}")
endmacro()
