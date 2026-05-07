add_executable(App
AppController.cpp
AppController.hpp
main.cpp
../../resources.qrc
)

target_link_libraries(App
    PRIVATE Cinema_UI
    PRIVATE Qt6::QuickControls2
    PRIVATE Auth_System
)

install(TARGETS App
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)