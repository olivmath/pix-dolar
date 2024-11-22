'use client';

import Link from 'next/link';

export default function Dashboard() {

  return (
    <div className="flex flex-col items-center justify-center min-h-screen gap-4">
      <h1 className="text-2xl font-bold">Welcome to the Dashboard</h1>
      <Link href="/dashboard/investments">
      <button className="bg-white text-black px-6 py-3 rounded-full text-lg">
      Go to Investments
        </button>
      </Link>
      <Link href="/">
      <button
        className="bg-gray-500 text-white px-6 py-3 rounded-full mt-4"
      >
        log out
      </button>
      </Link>
    </div>
  );
}
