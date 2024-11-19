import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: {
    default: 'Pix Dolar - Investment System',
    template: '%s | Pix Dolar',
  },
  description:
    'Investment System with Blockchain Integration.',
  keywords: ['Investment', 'Blockchain', 'Pix', 'Deposit', 'Withdrawal'],
  openGraph: {
    title: 'Pix Dolar - Investment System',
    description:
      'Innovative platform to manage investments with blockchain integration.',
    // url: 'https://dominio.com',
    siteName: 'Pix Dollar',
    images: [
      {
        url: '/og-image.png', // Save this image in the `public/` folder
        width: 1200,
        height: 630,
        alt: 'Pix Dolar Open Graph Image',
      },
    ],
    locale: 'en_US',
    type: 'website',
  },
  icons: {
    icon: '/icon-192x192.png',
    apple: '/icon-512x512.png',
  },
  alternates: {
   // canonical: 'https://dominio.com',
    languages: {
      // 'en-US': 'https://dominio.com/en-US',
     // 'pt-BR': 'https://dominio.com/pt-BR',
    },
  },
};

export default function Home() {
  return (
    <div className="grid grid-rows-[20px_1fr_20px] items-center justify-items-center min-h-screen p-8 pb-20 gap-16 sm:p-20 font-[family-name:var(--font-geist-sans)]">
      <main className="flex flex-col gap-8 row-start-2 items-center sm:items-start">
        <h1 className="text-3xl font-bold">Hello World!</h1>
        <p>
        Investment System with Blockchain Integration.
        </p>
      </main>
      <footer className="row-start-3 flex gap-6 flex-wrap items-center justify-center">
        <p>© 2024 Pix Dollar. All rights reserved.</p>
      </footer>
    </div>
  );
}
