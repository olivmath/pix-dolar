!const ORGANISATION_NAME "Investment System"
!const PAYMENT_PROVIDER_NAME "Payment Gateway (SaaS Pix)"
!const BLOCKCHAIN_PROVIDER "Blockchain Provider (Alchemy)"
!const NOTIFICATION_PROVIDER_NAME "Notification Provider Email/SMS"
!const INDEXER_PROVIDER_NAME "Indexer Provider"

workspace "${ORGANISATION_NAME}" "Investment system integrated with Pix and DeFi" {
    !include model.dsl
    !include views.dsl
}
