model {
        user = person "Cliente" "Usuário final que realiza depósitos e investimentos."

        system = softwareSystem "${ORGANISATION_NAME}" "Sistema que permite depósitos em Pix e investimentos em DeFi" {
            frontend = container "Frontend" "Interface de usuário para depósitos e investimentos." {
                technology "React/Vue.js"
            }
            
            backend = container "Backend" "API responsável por lógica de negócios, integração com provedores externos e o banco de dados." {
                technology "Rust/Tide"
            }

            database = container "Banco de Dados" "Armazena dados do cliente e transações financeiras." {
                technology "PostgreSQL"
                tags "Database"
            }

            # Sistema de pagamento via Pix
            paymentGateway = container "${PAYMENT_PROVIDER_NAME}" "Sistema responsável pelos depósitos via Pix e conversão para USDC." {
                tags "SaaSPix"
            }
            # Provedor de Blockchain (Alchemy)
            blockchain = container "${BLOCKCHAIN_PROVIDER}" "Plataforma de blockchain que gerencia os contratos inteligentes para investimentos." {
                technology "Alchemy"
                tags "BlockchainProvider"
            }

            user -> frontend "Interage via browser"
            frontend -> backend "Comunica-se via API HTTP"
            backend -> database "Lê e grava dados"
            backend -> paymentGateway "Integra-se para processar depósitos, conversões e saques"
            backend -> blockchain "Integra-se para realizar depósitos e retiradas em DeFi"
        }


        user -> system "Uses"
    }