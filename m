Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749579;
	b=q4i4rH5kXJxGSYYXr4LWMjiTBxeLOiyIPuMttq9lC+UXiIQbmIgfQOeu1+uc0iGOL5UN
	 t0Y6OJcc0h8mQTBLYqzpKg0wODzPKV4cuZFSL2H4XvCKl3acfAo/Njjkvgd369rLYC1ZT
	 e0CFWGMHRVJn0bGiyBYshOdl750aDMo8eiTCUVa4YzrL2jl1ne1PWAVMySv+wtX89+P6x
	 hogrr23QjRpJVhblQMJDNnXBobftmuoZUb7IIDjsiDzgn/v3JOJUS3ym+BUq8c0AiISF1
	 o19WH9leKcxNPvwDlPzjc6rl+gIKLUw8aI2+nhZxP80qbh6Jxo9N3To6wdheP5uTmvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749579;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+pw9qHHy4Ug0xhjrIFIq679Vh2W6ujC02tRuEPg/rcg=;
	b=AkuyrF3lPUjjKtBMiLSNJx/cTLCD5ITRbvrz4sIJyCFvHc3dzRQ3p/T6YT9zS/G1kS/S
	 Q19xKDDiXLy41VItkBi2cu0IVWOCESoqRHqWw4wATS1YMLYaCWhOEeCVU8uLT9B39kTpj
	 wlUewiWVLixEqD0Xh0oTJvIO18r48229cdeYYYZVcjI7TTjWrPpRJ3HPlX8/WEO4rA3y+
	 ZS8afYqo9JkYWYWYMsry7zEGa4aCChMbRVAEuc13CqclsM8m0SZfZXOp5YPe2hG07QK9M
	 426Pn03WgMa81RgWX5k4fgoYNEu/rX+BF3c/M1EWT0UlT+jinO5OrnV3WHgEbzSoZZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=fdyui422;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE825606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 03:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=fdyui422
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9C81F00893;
	Fri, 27 Nov 2026 03:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795749579;
	bh=+pw9qHHy4Ug0xhjrIFIq679Vh2W6ujC02tRuEPg/rcg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fdyui422iOzsiBDQEWUjos7UfzkIMjkah2t/o8H4HYsLEzy9Z2S3FgzM8AcykZL/c
	 755T3XVjMOyvEyo1roLa5QcGSt4KBwhFstwRf+crFbE2qmZEOSuwCDDj5TlRjy1KPC
	 1mClJzJRtebyKBGGc0jA9XfHM5Yvtb9gNcabium4=
Date: Thu, 26 Nov 2026 19:19:38 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH] drivers/media/v4l2-core/v4l2-vp9.c: reduce inlining
Message-Id: <20261126191938.66e5ac35940425c1863e0b0c@linux-foundation.org>
In-Reply-To: <d1bcc1bbd36b83e83eb1c857f23a4407dbcb6f77.camel@ndufresne.ca>
References: <382debd29a1a4e649039f61dfad4d34b.1@linux-foundation.org>
	<d1bcc1bbd36b83e83eb1c857f23a4407dbcb6f77.camel@ndufresne.ca>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Nov 2026 22:07:55 -0500 Nicolas Dufresne <nicolas@ndufresne.ca> =
wrote:

>=20
> Le mardi 24 novembre 2026 =E0 22:08 -0800, Andrew Morton a =E9crit=A0:
> > From: Andrew Morton <akpm@linux-foundation.org>
> > Subject: drivers/media/v4l2-core/v4l2-vp9.c: reduce inlining
>=20
> Should be: media: vp9: reduce inlining
>=20
> The media CI gives you the information of what wasn't right.

eh.  Please treat my trollpatch as a bug report ;)

>=20
> Ok, so this is pretty random overall, someone will have to actually write=
 a
> proper patch.

I said "semi-randomly" :)

Yeah, please do.

Sigh, kernel causes so much self-harm with excessive inlining.  Think
of all the cache misses which result from 10k of additional .text and
~1k of excess stack.

Those misses are so much more expensive than saving a few call/ret
instructions.  We should ban inlining by default unless benchmarking is
provided to demonstrate it benefits!



