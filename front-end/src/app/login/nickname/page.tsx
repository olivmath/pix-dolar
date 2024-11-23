'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';

export default function Nickname() {
  const [nickname, setNickname] = useState('');
  const router = useRouter();

  const handleNext = () => {
    if (!nickname) {
      alert('Por favor, insira um nickname.');
      return;
    }
    localStorage.setItem('nickname', nickname);
    document.cookie = `nickname=${nickname}; path=/; max-age=3600`;
    router.push('/login/name');
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-black text-white">
      <h1 className="text-xl mb-4">Nickname</h1>
      <input
        type="text"
        value={nickname}
        onChange={(e) => setNickname(e.target.value)}
        placeholder="nickname"
        className="bg-gray-800 text-white rounded p-3 w-80"
      />
      <button
        className="bg-gray-500 text-white px-6 py-3 rounded-full mt-4"
        disabled={!nickname}
        onClick={handleNext}
      >
        Next
      </button>
    </div>
  );
}
