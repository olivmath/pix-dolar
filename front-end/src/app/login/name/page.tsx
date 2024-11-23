'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';

export default function Name() {
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const router = useRouter();

  const handleNext = () => {
    if (!firstName || !lastName) {
      alert('Por favor, insira seu nome completo.');
      return;
    }
    localStorage.setItem('name', `${firstName} ${lastName}`);
    document.cookie = `name=${firstName} ${lastName}; path=/; max-age=3600`;
    router.push('/login/phone');
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-black text-white">
      <h1 className="text-xl mb-4">What&apos;s your name?</h1>
      <input
        type="text"
        value={firstName}
        onChange={(e) => setFirstName(e.target.value)}
        placeholder="First Name"
        className="bg-gray-800 text-white rounded p-3 w-80 mb-4"
      />
      <input
        type="text"
        value={lastName}
        onChange={(e) => setLastName(e.target.value)}
        placeholder="Last Name"
        className="bg-gray-800 text-white rounded p-3 w-80"
      />
      <button
        className="bg-gray-500 text-white px-6 py-3 rounded-full mt-4"
        disabled={!firstName || !lastName}
        onClick={handleNext}
      >
        Next
      </button>
    </div>
  );
}
