import { NextResponse } from 'next/server';
import type { NextRequest } from 'next/server';

export function middleware(request: NextRequest) {
  const url = request.nextUrl.clone();
  const path = url.pathname;

  const email = request.cookies.get('email')?.value;
  const verified = request.cookies.get('verified')?.value;
  const nickname = request.cookies.get('nickname')?.value;
  const name = request.cookies.get('name')?.value;
  const phone = request.cookies.get('phone')?.value;

  if (path === '/dashboard/' && (!email || !verified || !nickname || !name || !phone)) {
    url.pathname = '/login/email';
    return NextResponse.redirect(url);
  }

  if (path.startsWith('/login/verify-code') && !email) {
    url.pathname = '/login/email';
    return NextResponse.redirect(url);
  }

  if (path.startsWith('/login/nickname') && (!email || !verified)) {
    url.pathname = '/login/email';
    return NextResponse.redirect(url);
  }

  if (path.startsWith('/login/name') && !nickname) {
    url.pathname = '/login/email';
    return NextResponse.redirect(url);
  }

  if (path.startsWith('/login/phone') && !name) {
    url.pathname = '/login/email';
    return NextResponse.redirect(url);
  }

  return NextResponse.next();
}

export const config = {
  matcher: [
    '/dashboard/',
    '/login/verify-code',
    '/login/nickname',
    '/login/name',
    '/login/phone',
  ],
};
