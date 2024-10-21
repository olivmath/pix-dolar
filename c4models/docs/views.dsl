views {
        # Diagrama de contexto do sistema
        systemContext system "Contexto_do_Sistema_de_Investimento" {
            include *
            autolayout lr
        }

        # Diagrama de contêineres
        container system "Conteineres_do_Sistema_de_Investimento" {
            include *
            autolayout lr
        }

            styles {
            element "Person" {
                shape person
            }
            element "Software System" {
                background #2D882D
            }
            element "Container" {
                background #55aa55
            }
            element "Database" {
                shape cylinder
            }
        }
    }