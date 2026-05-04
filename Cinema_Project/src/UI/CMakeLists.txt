qt_add_library(Cinema_UI STATIC
    Main.qml
    Main_menu.qml
)

target_link_libraries(Cinema_UI
    PUBLIC Qt6::Quick
    PUBLIC Qt6::Core
)
