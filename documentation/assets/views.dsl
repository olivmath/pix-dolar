views {
    # System Context Diagram
    systemContext system "Investment_System_Context" {
        include *
    }

    # Container Diagram
    container system "Investment_System_Containers" {
        include *
    }

    # Backend Components View
    component backend "Backend_Components_View" {
        include *
    }

    # Blockchain Components View
    component blockchain "Blockchain_Provider_Components_View" {
        include *
    }
    # Payment Gateway Components View
    component paymentGateway "Payment_Gateway_Components_View" {
        include *
    }
    # HSM Components View
    component hsmProvider "HSM_Components_View" {
        include *
    }
    # Google Components View
    component googleOauthProvider "Google_OAuth_Components_View" {
        include *
    }

    # Styling for Diagram Elements
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
