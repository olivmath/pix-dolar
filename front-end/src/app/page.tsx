import type { Metadata } from 'next';
import Link from 'next/link';

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
    <div className="flex flex-col items-center justify-center min-h-screen bg-black text-white">
      <h1 className="text-5xl font-bold mb-12">Strike</h1>
      <Link href="/login/email">
        <button className="bg-white text-black px-6 py-3 rounded-full text-lg">
          Get Started
        </button>
      </Link>
    </div>
  );
}
