model {
    user = person "Customer" "End user performing deposits and investments."

    system = softwareSystem "${ORGANISATION_NAME}" "System that enables Pix deposits and DeFi investments" {
        frontend = container "Frontend" "User interface for deposits and investments." {
            technology "React/Vue.js"
        }
        
        backend = container "Backend" "API responsible for business logic, external provider integration, and the database." {
            authService = component "Authentication Service" "Manages login via email and generates access tokens."
            depositService = component "Deposit Service" "Integrates with the Pix provider to process deposits."
            blockchainService = component "Blockchain Service" "Manages integration with DeFi platforms and blockchain."
            notificationService = component "Notification Service" "Sends notifications to customers about financial operations."
        }

        database = container "Database" "Stores customer data and financial transactions." {
            technology "PostgreSQL"
            tags "Database"
        }

        # Pix Payment System
        paymentGateway = container "${PAYMENT_PROVIDER_NAME}" "System responsible for Pix deposits and conversion to USDC." {
            tags "SaaSPix"
        }
        # Blockchain Provider (Alchemy)
        blockchain = container "${BLOCKCHAIN_PROVIDER}" "Blockchain platform managing smart contracts for investments." {
            technology "Alchemy"
            tags "BlockchainProvider"
        }

        user -> frontend "Interacts via browser"
        frontend -> backend "Communicates via HTTP API"
        backend -> database "Reads and writes data"
        backend -> paymentGateway "Integrates to process deposits, conversions, and withdrawals"
        backend -> blockchain "Integrates for DeFi deposits and withdrawals"
    }
    user -> system "Uses"
}
