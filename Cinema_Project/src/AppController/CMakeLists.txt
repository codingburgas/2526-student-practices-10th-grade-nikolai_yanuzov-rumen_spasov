add_executable(App
AppController.cpp
AppController.hpp
main.cpp
../../resorces.qrc
)

target_link_libraries(App
    PRIVATE Cinema_UI
)

install(TARGETS App
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)