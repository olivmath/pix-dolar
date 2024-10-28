# Requirements

## Must Have (Obrigatórios)

- O sistema deve permitir que o cliente faça cadastro via Google.
- O cliente deve ser capaz de aceitar depósitos via QRcode Pix.
- O depósito deve ser automaticamente convertido para USDC e o saldo exibido em dólares na carteira do cliente.
- O cliente deve poder investir o saldo em USDC em protocolo DeFI (apenas um protocolo será implementada no MVP).
- O cliente deve ser capaz de retirar todo o saldo de USDC investido, retornando-o para sua carteira.
- O cliente deve poder sacar o saldo da carteira via Pix (em Reais)
- O cliente deve poder ver o preço da conversão de dólar para real e vice versa durante depósito e saque.
- O sistema deve aplicar automaticamente uma taxa sobre os lucros do cliente obtidos em DeFi:
  ** 1% para rendimentos de até 8%.
  ** 1.4% para rendimentos acima de 10%.

## Should Have (Desejáveis)

- O cliente deve poder ver um histórico de depósitos, investimentos, saques, preço de conversões e gráficos para maior transparência.

## Could Have (Opcional)

- O sistema pode enviar notificações automáticas por email sobre depósitos, investimentos e saques.

## Won't Have (Fora do escopo do MVP)

- Inteligência avançadas para otimização de investimentos ou recomendações em diferentes protocolos de DeFi.
- Suporte a múltiplas stablecoins além de USDC.
- Integração com várias plataformas DeFi simultaneamente (o MVP será focado em apenas uma).
