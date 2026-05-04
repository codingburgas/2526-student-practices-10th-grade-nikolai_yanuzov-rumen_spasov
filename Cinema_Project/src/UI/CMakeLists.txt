qt_add_library(Cinema_UI STATIC
    Main.qml
    Main_menu.qml
    Button1.qml
    Scrim.qml
)

target_compile_definitions(Cinema_UI PRIVATE
    QT_QUICK_CONTROLS_STYLE="Basic"
)

target_link_libraries(Cinema_UI
    PUBLIC Qt6::Quick
    PUBLIC Qt6::Core
)
