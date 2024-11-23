'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';

export default function Email() {
  const [email, setEmail] = useState('');
  const router = useRouter();

  const handleNext = () => {
    if (!email) return;
    const verificationCode = Math.random().toString(36).substring(2, 7).toUpperCase();
    console.log(`Código enviado para ${email}: ${verificationCode}`);

    localStorage.setItem('email', email);
    localStorage.setItem('verificationCode', verificationCode);
    document.cookie = `email=${email}; path=/; max-age=3600`;

    router.push('/login/verify-code');
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-black text-white">
      <h1 className="text-xl mb-4">What&apos;s your email address?</h1>
      <input
        type="email"
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        placeholder="pix_dolar@email.com"
        className="bg-gray-800 text-white rounded p-3 w-80"
      />
      <button
        className="bg-gray-500 text-white px-6 py-3 rounded-full mt-4"
        disabled={!email}
        onClick={handleNext}
      >
        Next
      </button>
    </div>
  );
}
