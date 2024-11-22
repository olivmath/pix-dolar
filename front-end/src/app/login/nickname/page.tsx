'use client';

import Link from 'next/link';
import { useState } from 'react';

export default function Nickname() {
  const [nickname, setNickname] = useState('');


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
      <Link href="/login/name">
      <button
        className="bg-gray-500 text-white px-6 py-3 rounded-full mt-4"
        disabled={!nickname}
      >
        Next
      </button>
      </Link>
    </div>
  );
}
