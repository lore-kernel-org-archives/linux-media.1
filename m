Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546915;
	b=SrhnL07vDSgpHyof48UFBoiuVTW4Y201eV495kckJpw96RLhHqrc4L+FZPGDjkeigtCA
	 XpW2i1k0z+itifTAbgBJ9KeaLoWNkGjLNpN0PsMNFbF/uQCUNxZPRjksFu5H7QBmgqFYs
	 8A+iRM8YCDUyYlkp1BJkwUVcekYaDnKoykhE0BVsmo8L4IEUcjfUVGzObMU1w0coWHX0W
	 6hbPN+GYmknz5nvYWZgmzWC1kHECKM4aIbbdT4ForK65CcPRzcG1FtX54oxPtchAY1Vm2
	 YQ5UxxUK+LEOdzz0BzBoeJChMNt3lSrGQaFI7VsvYBxJCkfRr4vesTvg7m7u/8Qz9WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546915;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=v/zeC8eyq6ykMNoigJa4vX8GQ35hbqzC3pORcHQ88dU=;
	b=CMsPcEO8VU3FJyy0aN47g0jcQIgE+1Oog1jFtoeII5T7m35wHLxBIYl/SnzdDB4HXjBd
	 yldPgYnD7BVdjY8KrusYaSxgmfv7hgc6gec9fENUPEviwUf2kruoIOr7NpkpBwqJjTX5F
	 /8Hjs1CRkGNpx+15rpjDwNRUjBnDfTsgHjxFSRhvBlryFX+sqFbSKMoa26U4pg/taci6+
	 3lHuteH7n1ixbfQRXVmlU1drXX6t2fMab2aAB7mjILXUoXw7rOxPleAdpdj3/2m27WrT9
	 QiTDFQaeFBiXnMVD8NjgF0rNT+M333BmVdSrdYSGUYGnVdNY1Aet/uPAHqoxpzUOFLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=IawfrXj0;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC850606A31E;
	Tue, 24 Nov 2026 19:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC850606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=IawfrXj0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795546913;
	bh=v/zeC8eyq6ykMNoigJa4vX8GQ35hbqzC3pORcHQ88dU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IawfrXj0A9bhAGD9kBd/giIzBNMaVyYpOJsSgqQZOkDhZt/+ALg3V0YuJAKCz5ez8
	 KoX34MuneLaGb21dy6ynWSgyzzrwtIaPEiLTv9VkA/GBwBgRYWdTaedSMhreERe0JJ
	 yMG6WMQBavwohYuPPyAXRUpvQvmXx0nTS6e/XkfFMsHKdSM6Kh4YumbfIkxzZyxLyT
	 twpNCRDmAYCPr4ln3qqWmotmTJZ4wqjnRYfQPzkCJz9QKzT7YjxQ4DOPXO/KxJ7Hm/
	 W3AdfljItE+HXhFimb73eycuAOQwccmUtao9ZiKwK+ldI8cD4kHVwJ/vTSuQx05L71
	 dkkNbwnG0K1/w==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89F4B17E0183;
	Tue, 24 Nov 2026 20:01:51 +0100 (CET)
Message-ID: <a12fc9eef54ee31cda73bc1912d44e508fb8c7b9.camel@collabora.com>
Subject: Re: [PATCH 3/7] media: rkvdec: hevc: bound the RPS reads by the
 control size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Alex Bee
 <knaerzche@gmail.com>, Hans Verkuil	 <hverkuil+cisco@kernel.org>, Jonas
 Karlman <jonas@kwiboo.se>, Sebastian Fricke	
 <sebastian.fricke@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 14:01:49 -0500
In-Reply-To: <awDWVpqEBcOGsCuu@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
	 <bb9c44d0f56221874b105394169e5c377ef21b42.1794645268.git.daniel@makrotopia.org>
	 <6ae6d1101d3f7095d11462579a5a3313153533e6.camel@collabora.com>
	 <awDWVpqEBcOGsCuu@makrotopia.org>
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
	protocol="application/pgp-signature"; boundary="=-Zq1j3KpLxB33TMTKA8Is"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-Zq1j3KpLxB33TMTKA8Is
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 23:23 +0000, Daniel Golle a =C3=A9crit=
=C2=A0:
> Rejecting when the control is set does not work, as the count and the
> array are separate controls which can be set in any order, also in
> different requests. The first point where both are known is when the
> request is applied in device_run.

Maybe we should have added validation in MEDIA_REQUEST_IOC_QUEUE ... Might =
not
be a totally missed opportunity, and would give an immediate result to user=
.
That being said, its does not invalidate your changes, so no action for thi=
s
specific comment.

Nicolas

--=-Zq1j3KpLxB33TMTKA8Is
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawXfHQAKCRDZQZRRKWBy
9PDaAP9JaEXDrgjNqXnAwmBBQaZfMuTkdkQqNBmHX1kOtDP4BwEAgt7hfvp8zlOm
PSX0WEH+LwnvYvPGc8YUY/1TlMsijAQ=
=6jr1
-----END PGP SIGNATURE-----

--=-Zq1j3KpLxB33TMTKA8Is--
