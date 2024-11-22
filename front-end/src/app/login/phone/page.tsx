'use client';

import Link from 'next/link';
import { useState } from 'react';
import PhoneInput from 'react-phone-input-2';
import 'react-phone-input-2/lib/style.css';

export default function Phone() {
  const [phone, setPhone] = useState('');

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-black text-white">
      <h1 className="text-xl mb-4">What&apos;s your phone number?</h1>
      <div className='flex items-center justify-center'>
        <PhoneInput
          country={'us'}
          value={phone}
          onChange={(phone: string) => setPhone(phone)} // Adicionada tipagem
          inputStyle={{
            width: '320px',
            height: '40px',
            borderRadius: '8px',
            backgroundColor: '#1F1F1F',
            color: 'white',
          }}
        />
      </div>
      <Link href="/dashboard/home">
        <button
          className="bg-gray-500 text-white px-6 py-3 rounded-full mt-4"
          disabled={!phone}
        >
          Next
        </button>
      </Link>
    </div>
  );
}
