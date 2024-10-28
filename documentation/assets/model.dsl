model {
    user = person "Customer" "End user performing deposits and investments."

    system = softwareSystem "${ORGANISATION_NAME}" "System that enables Pix deposits and DeFi investments" {
        frontend = container "Frontend" "User interface for deposits and investments, enabling interaction with all core features." {
            technology "React/Next.js"
            tags "Frontend"
        }

        backend = container "Backend" "API responsible for business logic, external provider integration, and database communication." {
            technology "TypeScript/Next.js"
            tags "Backend"

            restAPI = component "REST API" "Manages HTTP connections, enabling the frontend to interact with backend services." {
                technology "Next.js API"
            }

            loginModule = component "Login Module" "Validates if the user exists and triggers login through Google Auth, creating user accounts if new." {
                technology "Custom TypeScript Module"
            }

            databaseAdapter = component "Database Adapter" "Handles data interaction with PostgreSQL, supporting queries and updates." {
                technology "SQL Database Client"
            }

            userCRUD = component "User CRUD" "Manages user-related data, including KYC verification and general user information." {
                technology "Custom TypeScript Module"
            }

            paymentGatewayAdapter = component "Payment Gateway Adapter" "Manages Pix QR code generation, Pix-to-USDC conversions, and withdrawals." {
                technology "Custom TypeScript Adapter/Brasil Bitcoin"
            }

            web3Module = component "Web3 Module" "Manages deposits and withdrawals to DeFi platforms through Alchemy." {
                technology "Web3 TypeScript SDK"
            }

            indexerModule = component "Indexer Module" "Retrieves blockchain data through The Graph and structures it for storage and access." {
                technology "The Graph API"
            }

            googleOathModule = component "Google Oath Module" "Handles user authentication with Google OAuth, ensuring secure logins and JWT issuance." {
                technology "Google OAuth"
            }

            webhookModule = component "Webhook Module" "Processes incoming webhooks from the payment gateway, updating user data upon events." {
                technology "Custom TypeScript Adapter/Brasil Bitcoin"
            }
        }

        database = container "Database" "Stores customer data, transaction history, and other critical financial records." {
            technology "PostgreSQL"
            tags "Database"
        }

        paymentGateway = container "${PAYMENT_PROVIDER_NAME}" "Processes Pix deposits and converts them to USDC, supporting payment actions." {
            technology "Brasil Bitcoin"
            tags "Saas"

            generatePIXDeposit = component "Deposit QRcode PIX" "Generates a Pix QR code for customer deposits, initiating the deposit process."
            generateUSDCDeposit = component "Deposit USDC Address" "Generates a USDC Address for withdraw from DeFi protocol, initiating the deposit process."
            swap = component "SWAP PIX/USDC" "Handles conversion between Pix and USDC, facilitating currency exchanges."
            withdrawPIX = component "Withdraw PIX" "Facilitates Pix withdrawals, enabling users to transfer funds to external accounts."
            withdrawWeb3 = component "Withdraw Web3" "Performs Web3-based withdrawals, transferring funds to the company's wallet in USDC."
        }

        indexerProvider = container "${INDEXER_PROVIDER_NAME}" "Reads and indexes blockchain transactions, providing historical data for user accounts." {
            technology "The Graph"
            tags "Saas"
        }

        blockchain = container "${BLOCKCHAIN_PROVIDER}" "Blockchain platform supporting DeFi investments and smart contract interactions." {
            technology "Alchemy"
            tags "Saas"

            usdcToken = component "USDC Token" "Manages USDC token interactions on the blockchain, enabling transfers for user transactions."
            defiDepositFunction = component "Deposit Function" "Executes deposits into DeFi pools, allowing users to invest USDC."
            defiWithdrawFunction = component "Withdraw Function" "Handles withdrawals from DeFi pools, enabling users to retrieve invested funds."
        }

        googleOauthProvider = container "${AUTH_PROVIDER_NAME}" "Handles user authentication using Google OAuth, issuing secure JWTs for logins." {
            tags "Saas"
            technology "OAuth 2.0"

            login = component "Login" "Initiates Google OAuth to authenticate users and issue JWT tokens for secure sessions."
            logout = component "Logout" "Invalidates JWT tokens upon user logout, maintaining session security."
        }

        hsmProvider = container "${HSM_PROVIDER_NAME}" "Manages cryptographic keys and secure operations, including wallet creation and transaction signing." {
            tags "Saas"
            technology "DINAMO"

            newWallet = component "New Wallet" "Generates secure cryptographic keys for user wallets, enabling DeFi transactions."
            eth_sign = component "Sign Tx" "Signs Ethereum transactions, facilitating secure fund transfers on the blockchain."
        }

        // User Interactions
        frontend -> backend "Communicates via HTTP API, enabling the frontend to send user requests to the backend for processing."
        backend -> database "Reads and writes data to store KYC/KYT user information, transaction histories, and balances securely."
        backend -> paymentGateway "Integrates for deposits, conversions, and withdrawals, allowing seamless Pix and USDC management."
        backend -> blockchain "Integrates for DeFi deposits and withdrawals, enabling interaction with decentralized finance protocols."
        backend -> indexerProvider "Fetches blockchain history data, providing structured transaction history to users."
        backend -> googleOauthProvider "Handles authentication through Google Auth, securing user login and session management."
        googleOauthProvider -> frontend "Redirects authentication responses back to the frontend post-login."
        backend -> hsmProvider "Accesses secure key storage for multisig and other cryptographic functions."

        # Internal Interactions
        // login flow
        frontend -> restAPI "Sends frontend HTTP requests to the REST API for handling specific user operations."
        restAPI -> loginModule "Routes login requests for authentication validation and generation."
        loginModule -> googleOathModule "Redirects login requests to Google OAuth for secure user authentication."
        googleOathModule -> googleOauthProvider "Authenticates user via Google Auth for a seamless login experience."

        // operations flow
        loginModule -> paymentGatewayAdapter "Initiates payment actions for user account deposits and withdrawals."
        paymentGatewayAdapter -> paymentGateway "Handles external requests to manage Pix transactions and conversions."
        paymentGateway -> webhookModule 
        webhookModule -> userCRUD "Updates user account data based on events received from the payment gateway."
        userCRUD -> databaseAdapter "Interfaces with the Database Adapter to retrieve and update user-specific data."
        databaseAdapter -> database "Executes SQL commands to retrieve, insert, or update records within the PostgreSQL database."

        // index ops
        userCRUD -> indexerModule "Provides user reference data for cross-referencing blockchain transactions."
        indexerModule -> indexerProvider "Queries the Indexer Provider to fetch blockchain transaction history."

        // defi ops
        webhookModule -> web3Module "Triggers Web3 actions based on payment events for deposits and withdrawals."
        web3Module -> hsmProvider "Requests secure cryptographic operations like signing and key management from HSM."
        loginModule -> web3Module "Coordinates with the Web3 Module to execute DeFi deposits and withdrawals on behalf of the user."
        loginModule -> userCRUD "Retrieves or updates user account information during the login and KYC processes."

        // Blockchain Interactions
        web3Module -> usdcToken "Interacts with the USDC token for approval and transfer to DeFi Protocols."
        web3Module -> defiDepositFunction "Executes a DeFi deposit, adding user funds to a DeFi pool."
        web3Module -> defiWithdrawFunction "Initiates a DeFi withdrawal, transferring funds back to the company's secure HSM wallet."

        // Google Interactions
        googleOathModule -> login "Uses Google OAuth 2.0 to authenticate the user and issue a secure JWT token."
        login -> frontend "Returns the JWT token to the frontend for secure session handling."
        googleOathModule -> logout "Handles session termination by invalidating the JWT token."

        // HSM Interactions
        web3Module -> newWallet "Generates a secure wallet address and cryptographic key using HSM."
        web3Module -> eth_sign "Signs blockchain transactions with the private key stored in HSM for added security."

        // Payment Gateway Interactions
        paymentGatewayAdapter -> generatePIXDeposit "Requests the generation of a Pix QR code for user deposits."
        paymentGatewayAdapter -> generateUSDCDeposit "Requests the generation of USDC address for DeFi withdraw."
        paymentGatewayAdapter -> swap "Initiates a Pix-to-USDC swap for currency conversion within the platform."
        paymentGatewayAdapter -> withdrawPIX "Processes Pix withdrawals, sending funds to a user's external account."
        paymentGatewayAdapter -> withdrawWeb3 "Manages Web3 withdrawals, sending funds to the company's secure HSM wallet."
    }

    user -> system "Uses"
}
