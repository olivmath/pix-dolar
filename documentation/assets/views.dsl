views {
    # System context diagram
    systemContext system "Investment_System_Context" {
        include *
        autolayout lr
    }

    # Container diagram
    container system "Investment_System_Containers" {
        include *
        autolayout lr
    }

    # Backend components view
    component backend "Backend_Components_View" {
        include *
        autoLayout lr
    }

    # Styling for the elements in the diagrams
    styles {
        element "Person" {
            shape person
            background #08427b
            color #ffffff
        }
        element "Container" {
            background #438dd5
            color #ffffff
        }
        element "Component" {
            background #85bbf0
            color #000000
        }
        element "Database" {
            shape cylinder
        }
    }
}
