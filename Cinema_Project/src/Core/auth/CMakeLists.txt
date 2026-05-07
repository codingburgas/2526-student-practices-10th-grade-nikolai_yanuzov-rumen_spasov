add_library(Auth_System
    login.cpp
    login.hpp
    register.cpp
    register.hpp
)

target_link_libraries(Auth_System
    PRIVATE Qt::Core
    PRIVATE Qt::Quick

)