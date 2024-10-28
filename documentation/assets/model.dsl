model {
    user = person "Customer" "End user performing deposits and investments."

    system = softwareSystem "${ORGANISATION_NAME}" "System that enables Pix deposits and DeFi investments" {
        frontend = container "Frontend" "User interface for deposits and investments." {
            technology "React/Next.js"
            tags "Frontend"
        }

        backend = container "Backend" "API responsible for business logic, external provider integration, and the database." {
            technology "TypeScript/Next.js"
            tags "Backend"

            restAPI = component "REST API" "Manages HTTP connections." {
                technology "Next.js API"
            }

            loginModule = component "Login Module" "Validates if the user exists and triggers login through Google Auth." {
                technology "Custom TypeScript Module"
            }

            databaseAdapter = component "Database Adapter" "Handles connection and queries to the PostgreSQL database." {
                technology "SQL Database Client"
            }

            userCRUD = component "User CRUD" "Manages user data including KYC and other information." {
                technology "Custom TypeScript Module"
            }

            paymentGatewayAdapter = component "Payment Gateway Adapter" "Generates Pix QR Codes, converts Pix to USDC, and manages withdrawals to company wallets." {
                technology "Custom TypeScript Adapter/Brasil Bitcoin"
            }

            web3Module = component "Web3 Module" "Handles deposits and withdrawals from DeFi platforms via the Alchemy blockchain gateway." {
                technology "Web3 TypeScript SDK"
            }

            indexerModule = component "Indexer Module" "Fetches blockchain history (via The Graph) and integrates structured data into the user database." {
                technology "The Graph API"
            }

            googleOathModule = component "Google Oath Module" "Make login using Google Account" {
                technology "Google Oath"
            }

            webhookModule = component "Webhook Module" "Handles the webhook from the Payment Gateway" {
                technology "Custom TypeScript Adapter/Brasil Bitcoin"
            }
        }

        database = container "Database" "Stores customer data and financial transactions." {
            technology "PostgreSQL"
            tags "Database"
        }

        paymentGateway = container "${PAYMENT_PROVIDER_NAME}" "Processes Pix deposits and converts them to USDC." {
            technology "Brasil Bitcoin"
            tags "Saas"
            generateDeposit = component "Deposit QRcode PIX" "Generate a QRcode for client make deposit"
            swap = component "SWAP PIX/USDC" "Convert PIX to USDC or vice versa"
            withdrawPIX = component "Withdraw PIX" "Withdraw to client PIX"
            withdrawWeb3 = component "Withdraw Web3" "Withdraw to HSM wallet"
               
        }

        indexerProvider = container "${INDEXER_PROVIDER_NAME}" "Reads and indexes blockchain data transactions." {
            technology "The Graph"
            tags "Saas"
        }

        blockchain = container "${BLOCKCHAIN_PROVIDER}" "Blockchain platform managing smart contracts for investments." {
            technology "Alchemy"
            tags "Saas"

            usdcToken = component "USDC Token" "Manages USDC token transfers" {
                technology "Web3"
            }
            defiDepositFunction = component "Deposit Function" "Deposits amount (USDC) into DeFi Pool." {
                technology "Web3"
            }
            defiWithdrawFunction = component "Withdraw Function" "Withdraws balance from DeFi Pool (USDC)." {
                technology "Web3"
            }
        }

        googleOauthProvider = container "${AUTH_PROVIDER_NAME}" "External service for user authentication via Google." {
            tags "Saas"
            technology "OAuth 2.0"

            login = component "Login" "Uses Google OAuth 2.0 to get JWT token"
            logout = component "Logout" "Disable JWT token"
        }

        hsmProvider = container "${HSM_PROVIDER_NAME}" "Manages secure storage of keys for multisig and other critical operations." {
            tags "Saas"
            technology "DINAMO"

            newWallet = component "New Wallet" "Generates a random private key and public key"
            eth_sign = component "Sign Tx" "Expect a tx to sign and return signature"
        }

        // User Interactions
        frontend -> backend "Communicates via HTTP API"
        backend -> database "Reads and writes data"
        backend -> paymentGateway "Integrates for deposits, conversions, and withdrawals"
        backend -> blockchain "Integrates for DeFi deposits and withdrawals"
        backend -> indexerProvider "Fetches blockchain history data"
        backend -> googleOauthProvider "Handles authentication through Google Auth"
        googleOauthProvider -> frontend
        backend -> hsmProvider "Accesses secure key storage"

        // Internal Interactions
        frontend -> restAPI
        restAPI -> loginModule
        indexerModule -> indexerProvider
        userCRUD -> databaseAdapter
        userCRUD -> indexerModule
        databaseAdapter -> database
        loginModule -> paymentGatewayAdapter
        paymentGatewayAdapter -> paymentGateway
        loginModule -> web3Module
        loginModule -> userCRUD
        web3Module -> hsmProvider
        loginModule -> googleOathModule
        googleOathModule -> googleOauthProvider "Authenticates user via Google Auth"
        webhookModule -> userCRUD
        webhookModule -> web3Module


        // Blockchain Interactions
        web3Module -> usdcToken
        web3Module -> defiDepositFunction
        web3Module -> defiWithdrawFunction

        // Google Interactions
        googleOathModule -> login
        login -> frontend
        googleOathModule -> logout

        // HSM Interactions
        web3Module -> newWallet
        web3Module -> eth_sign

        // Payment Gateway Interactions
        paymentGatewayAdapter -> generateDeposit
        paymentGatewayAdapter -> swap
        paymentGatewayAdapter -> withdrawPIX
        paymentGatewayAdapter -> withdrawWeb3
    }

    user -> system "Uses"
}
