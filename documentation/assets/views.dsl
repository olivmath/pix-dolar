views {
    # System context diagram
    systemContext system "Investment_System_Context" {
        include *
    }

    # Container diagram
    container system "Investment_System_Containers" {
        include *
    }

    # Backend components view
    component backend "Backend_Components_View" {
        include *
    }

    # Blochain components view
    component blockchain "Blockchain_Provider_Components_View" {
        include *
    }

    # Styling for the elements in the diagrams
    # shape <Box|RoundedBox|Circle|Ellipse|Hexagon|Cylinder|Pipe|Person|Robot|Folder|WebBrowser|MobileDevicePortrait|MobileDeviceLandscape|Component>

    styles {
        element "Person" {
            shape Person
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

        element "Saas" {
            shape Hexagon
        }
        element "Frontend" {
            shape MobileDevicePortrait
        }
        element "Backend" {
            shape RoundedBox
        }
        element "Database" {
            shape Cylinder
        }
    }
}
