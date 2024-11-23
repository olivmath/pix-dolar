'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';

export default function VerifyCode() {
  const [code, setCode] = useState(['', '', '', '', '']);
  const router = useRouter();
  const [savedCode, setSavedCode] = useState('');

  useEffect(() => {
    const storedCode = localStorage.getItem('verificationCode');
    setSavedCode(storedCode || '');
  }, []);

  const handleCodeChange = (value: string, index: number) => {
    const newCode = [...code];
    newCode[index] = value.toUpperCase();
    setCode(newCode);

    if (value && index < 4) {
      document.getElementById(`code-${index + 1}`)?.focus();
    }
  };

  const handleVerify = () => {
    const enteredCode = code.join('');
    if (enteredCode === savedCode) {
      console.log('Código validado com sucesso!');
      localStorage.setItem('verified', 'true');
      document.cookie = `verified=true; path=/`;
      const isFirstLogin = !localStorage.getItem('nickname');
      router.push(isFirstLogin ? '/login/nickname' : '/dashboard/home');
    } else {
      alert('Código inválido. Tente novamente.');
    }
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-black text-white">
      <h1 className="text-xl mb-4">Enter the confirmation code</h1>
      <div className="flex gap-2">
        {code.map((char, index) => (
          <input
            key={index}
            id={`code-${index}`}
            type="text"
            maxLength={1}
            value={char}
            onChange={(e) => handleCodeChange(e.target.value, index)}
            className="bg-gray-800 text-white text-center rounded w-10 h-10 text-xl"
          />
        ))}
      </div>
      <button
        className="bg-gray-500 text-white px-6 py-3 rounded-full mt-4"
        disabled={code.includes('')}
        onClick={handleVerify}
      >
        Verify
      </button>
    </div>
  );
}
