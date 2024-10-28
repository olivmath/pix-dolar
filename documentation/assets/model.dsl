model {
    user = person "Customer" "End user performing deposits and investments."

    system = softwareSystem "${ORGANISATION_NAME}" "System that enables Pix deposits and DeFi investments" {
        frontend = container "Frontend" "User interface for deposits and investments." {
            technology "React/Vue.js"
            tags "Frontend"
        }
        
        backend = container "Backend" "API responsible for business logic, external provider integration, and the database." {
            technology "Rust/tide"
            tags "Backend"

                restAPI = component "REST API" "Manages HTTP connections." {
                    technology "Rust/Tide"
                }
                
                loginModule = component "Login Module" "Validates if the user exists and triggers the login service (OTP via email/SMS)." {
                    technology "Custom Rust Module"
                }

                databaseAdapter = component "Database Adapter" "Handles connection and queries to the PostgreSQL database." {
                    technology "SQLx"
                }
                
                userCRUD = component "User CRUD" "Manages user data including KYC and other information." {
                    technology "Custom Rust Module"
                }

                notificationAdapter = component "Notification Adapter" "Interfaces with external notification services (Email/SMS)." {
                    technology "Custom Rust Adapter"
                }
                
                passkeyModule = component "Passkey Module" "Generates OTP codes for user login." {
                    technology "Custom Rust Module"
                }

                paymentGatewayAdapter = component "Payment Gateway Adapter" "Generates Pix QR Codes, converts Pix to USDC, and manages withdrawals to company wallets." {
                    technology "Custom Rust Adapter/Brasil Bitcoin"
                }

                web3Module = component "Web3 Module" "Handles deposits and withdrawals from DeFi platforms via the Alchemy blockchain gateway." {
                    technology "Web3 Rust SDK"
                }

                indexerModule = component "Indexer Module" "Fetches blockchain history (via The Graph) and integrates structured data into the user database." {
                    technology "The Graph API"
                }

                vaultModule = component "Vault Module" "Manages user keys, creates OTPs, and handles the company's multisig key management." {
                    technology "Custom Rust Module"
                }
        }

        database = container "Database" "Stores customer data and financial transactions." {
            technology "PostgreSQL"
            tags "Database"
        }

        # Email System
        notificationSystem = container "${NOTIFICATION_PROVIDER_NAME}" "send notification (email/SMS) to user" {
            tags "Saas"
        }
        # Pix Payment System
        paymentGateway = container "${PAYMENT_PROVIDER_NAME}" "Pix deposits and conversion to USDC." {
            technology "Brasil Bitcoin"
            tags "Saas"
        }
        # Indexer System
        indexerProvider = container "${INDEXER_PROVIDER_NAME}" "Read and Index blockcahin data transactions." {
            technology "The Graph"
            tags "Saas"
        }
        # Blockchain Provider (Alchemy)
        blockchain = container "${BLOCKCHAIN_PROVIDER}" "Blockchain platform managing smart contracts for investments." {
            technology "Alchemy"
            tags "Saas"

            usdcToken = component "USDC Token" "Manage USDC Token" {
                technology "Web3"
            }
            defiDepositFunction = component "Deposit Function" "Deposit amount (USDC) in DeFi Pool" {
                technology "Web3"
            }
            defiWithdrawFunction = component "Withdraw Function" "Withdraw the balance from DeFi Pool (USDC)" {
                technology "Web3"
            }
        }

        # user to system
        frontend -> backend "Communicates via HTTP API"
        backend -> database "Reads and writes data"
        backend -> paymentGateway "Integrates to process deposits, conversions, and withdrawals"
        backend -> blockchain "Integrates for DeFi deposits and withdrawals"
        backend -> notificationSystem "Integrates for send notifications (email/SMS)"
        backend -> indexerProvider


        # system to container
        frontend -> restAPI
        restAPI -> loginModule
        restAPI -> indexerModule
        indexerModule -> indexerProvider
        restAPI -> userCRUD
        userCRUD -> database
        databaseAdapter -> database
        userCRUD -> databaseAdapter
        loginModule -> paymentGatewayAdapter
        loginModule -> web3Module
        loginModule -> databaseAdapter
        loginModule -> passkeyModule
        passkeyModule -> vaultModule
        passkeyModule -> notificationAdapter
        notificationAdapter -> notificationSystem
        paymentGatewayAdapter -> paymentGateway
        notificationSystem -> frontend

        # container to component
        web3Module -> usdcToken
        web3Module -> defiDepositFunction
        web3Module -> defiWithdrawFunction
    }
    user -> system "Uses"
}
