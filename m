Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDF537649A;
	Tue, 21 Jul 2026 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641947; cv=none; b=BuCt3Ws7/RWKlFjXD3IQIbd2Hsioxe1rQKTQqfcH12rrH1Q2x+ev7e68BIANly1qjeSRSEH0HBg16LdvIOH8lbc3XiaowfnxUbeThwDgoS43tY9TtQ7AddAFArTY+JNdfb2xDLXQxc1sCpVjYq13urfKB1lp8lTpnJqrHfagQXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641947; c=relaxed/simple;
	bh=NKvncxxjNvP8s9qJUZ7ZaBggAfFkch++xpbcsCwtXAk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BUUNMJ+H/ECU6naU5fZXKTWlJiqZaZaXRK5zIv+Dcgy7em9TMKqAQPKzOIlQdKo1Nh06DbkY9oLuWkJ6w9fM+gMhNfniQ01wirlIliVSFRmEIY8YxZpKX1OBp/dPjiXa2j1BJvz9nN/2VCRI0EsqLdrVLa7ROIV1dWElyEs/io4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=L+/3uuQQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="L+/3uuQQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784641944;
	bh=NKvncxxjNvP8s9qJUZ7ZaBggAfFkch++xpbcsCwtXAk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=L+/3uuQQ8QfCezdIBcVinSmPPCz0yqpEpP/Yt3GEokyRDcgcBLRXh34/5dSeLic0s
	 tannY+pHKtCZOGwEkbkXxLfS9Xi6YEQUsvG7eOAckt/3bGLFeDpFpKDx0KXVTKwzk1
	 abRn0NctIDYBUz5bk7COunuGF4PtfUGwc0ARd1YHJhRFQdHl/rxZTBWClEdvwWr1cB
	 +uu6yYdcw8SdmTfVso+PsxU8WfiC8njIXgxHWQg9cJ2E3JtYXRynDnXrdZ7GuDXxwX
	 j6YN6rpXcR4z9aTX2Wsv4Y5K3YvaJyBbAcoeXYqBkH79fS4bFpPFN5jBo7Nbn9QxuZ
	 RtWYeqJEufYMQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 28B9517E0177;
	Tue, 21 Jul 2026 15:52:23 +0200 (CEST)
Message-ID: <da269781a5e4643745635b51c8ca95c22a7a5baf.camel@collabora.com>
Subject: Re: [PATCH v2] media: mtk-jpeg: drain hardware completion before
 freeing context
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Sven
 =?ISO-8859-1?Q?P=FCschel?=	 <s.pueschel@pengutronix.de>
Cc: Bin Liu <bin.liu@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,  Hans
 Verkuil <hverkuil+cisco@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Date: Tue, 21 Jul 2026 09:52:21 -0400
In-Reply-To: <CANUHTR-0-_zOegBf74bmAFqLgUUgjzqz5B7ydO9+Zyj=XSJ2CA@mail.gmail.com>
References: <20260718112448.3289122-1-lgs201920130244@gmail.com>
	 <f60f255b81db1db310276a1acdca412f6070a28b.camel@collabora.com>
	 <CANUHTR-0-_zOegBf74bmAFqLgUUgjzqz5B7ydO9+Zyj=XSJ2CA@mail.gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-M2rH9JyOzH9+/KPhomek"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-M2rH9JyOzH9+/KPhomek
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 21 juillet 2026 =C3=A0 17:15 +0800, Guangshuo Li a =C3=A9crit=C2=
=A0:
> Would you prefer a correctness-first change that moves job_finish() to
> the hardware completion paths, accepting that serialization, or is
> there an existing v4l2-m2m mechanism for representing several
> concurrent hardware jobs that I have missed?

This one predates me as a maintainer, so I'm a bit in catchup mode. I think=
 your
work shows how much problems/complexity this method introduce. I'm currentl=
y
tracking two proposal, an RKVDEC and an RGA2 proposal. I think the second m=
ethod
is worth looking into. The first one might have had the same issue as this =
one,
as it called job_finish() immediatly in device_run() (which is equivalent o=
f
doing it in a worker like MTK codecs do in general**.=20

https://lore.kernel.org/all/20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pe=
ngutronix.de/

And you'll find the patch:

[PATCH 05/17] media: v4l2-mem2mem: support running multiple jobs in paralle=
l

That adds parallel job in the mem2mem, so that you can have a single m2m co=
ntext
for multiple cores, handling multiple jobs, and the tear down is happening =
on
all cores. Now, I'm not forcing you to do that path, but I think its a bett=
er
solution long term, as open coding custom tear down is error prone. Let me =
know
your thought, of course I'd like if you could work with Sven on a common
solution.

Nicolas


** Most of MTK codecs worker are not needed, since the m2m framework alread=
y has
a worker and is re-entrent safe for triggering the next job. But MTK code u=
ses a
lot of condition wait, turning async operation into synchronous, and once m=
ulti-
core, it just break apart.

--=-M2rH9JyOzH9+/KPhomek
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCal95lQAKCRDZQZRRKWBy
9N7TAQCbjR0A6T7HbDRxSk17zQqfY5E7SUwkbbXmxf5iwXhsYgD/X514Y0Jl9eql
56dJ1F+qySkpOeItyxeg3Oz4q2gi6wk=
=2P1k
-----END PGP SIGNATURE-----

--=-M2rH9JyOzH9+/KPhomek--
