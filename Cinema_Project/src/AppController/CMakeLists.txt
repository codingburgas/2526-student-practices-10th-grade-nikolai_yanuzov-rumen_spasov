add_executable(App
AppController.cpp
AppController.hpp
main.cpp
)

target_link_libraries(App
    PRIVATE Qt6::Core
    PRIVATE Qt6::Quick

)

install(TARGETS App
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)