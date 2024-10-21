!const ORGANISATION_NAME "Sistema de Investimento"
!const PAYMENT_PROVIDER_NAME "Payment Gateway (SaaS Pix)"
!const BLOCKCHAIN_PROVIDER "Blockchain Provider (Alchemy)"

workspace "${ORGANISATION_NAME}" "Sistema de investimentos integrado com Pix e DeFi" {
    !include model.dsl
    !include views.dsl
}
