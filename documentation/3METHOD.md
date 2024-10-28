# Method

- O sistema utilizará SaaS terceirizado para simplificar o MVP.
- O foco da arquitetura é integrar esses serviços externos e garantir que o fluxo de depósitos, investimentos e saques funcione de forma eficiente e segura.

## Fluxo de Cadastro e Login

1. O cliente faz login via Google
2. KYC necessário apenas para depósito

## Fluxo de Depósitos

1. O cliente solicita a geração de um QR Code Pix para realizar o depósito.
2. O sistema gerar o QR Code Pix via Saas.
3. O cliente realiza o pagamento via Pix.
4. O provedor SaaS valida o pagamento e via webhook notifica o sistema.
5. O Webhook converte o valor de reais para USDC automaticamente e atualiza o saldo em dólares na carteira do cliente.

## Fluxo de Investimento

1. O cliente escolhe investir o saldo em USDC.
2. O sistema transfere o saldo em USDC via assinaturas do HSM para o protocolo DeFi
3. O sistema atualiza o saldo e os resultados na carteira do cliente.

## Fluxo de Retirada e Saque

1. O cliente retira todo o saldo de USDC do protocolo DeFi
2. O sistema transfere de volta o saldo para a carteira do cliente.
3. Após a retirada, o cliente pode solicitar o saque do saldo.
4. O sistema converter o saldo de USDC para reais e transfere via Pix para o cliente usando Saas.
5. O cliente recebe o valor convertido em reais na chave Pix cadastrada.
