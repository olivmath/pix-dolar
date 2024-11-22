'use client';

import { useState } from 'react';
import Link from 'next/link';

export default function Email() {
  const [email, setEmail] = useState('');

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
      <Link href="/login/verify-code">
        <button
          className="bg-gray-500 text-white px-6 py-3 rounded-full mt-4"
          disabled={!email}
        >
          Next
        </button>
      </Link>
    </div>
  );
}
