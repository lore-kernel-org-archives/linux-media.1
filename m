Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216113;
	b=KiXxLO72HwJxAY/i7OZtIBKMiAtYHXBb9RZzxLt+e26glb+S/tViq8pxz4yxOKFW31S9
	 GfXhNlXNipycQPBPDAj/HnsxluXX/CnPzdG8hmFfYwz9xpSMunYOEhgqDQacTkwHWcp8z
	 YfUYtnhpE2Y6ZTAKUgdtIWD7eCG5eNIrHGkFmhbS6HHH3UpHFRk6uwsqnbMWmUyMsK6TO
	 91WMwWRN1GGr03gi4pArVQH5buU4Om7LUWXJWHMcEu25xQGtYg+se7JMBWALVYbNj821e
	 P/x548Xh1749AUeUmKsotsUEJuqySbL4jS7BCQhYgrlR5o0yFVuWz/lxEp5I2B+0yuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216113;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=vhRGA5stCNe5n0EWpCuQMaKiuxZMQFmZwfvJS2nbnJs=;
	b=Tm1wTjHJg2gPXSdp/i69Rly621nVMMopKeTqIUxRNokPRAhfLEDYeqpVlhnB/C8tB+2o
	 DLaqWJNpqAMbtkCkxPMbEJMirkLieN1E3iIO+QMvhk8Vx5VtZa9GjpuPt4VTuIoRIHDF/
	 i6oqx2Vow38uo2qfsCOHgkuv7SURqNOZgBoicfu1IWDMvW/TJPbDvUAItpfYuBzfAW/i4
	 UGptuwlFcyHJxjgIz8+5pxXrRTt5NK4uGqmHT5LIbJ/WBrA5djopQQP/tyIuW8l7sVdK5
	 kkfnWz6v8uEr1rZ3JSRHqmqaZwOE8iWA6e8by6blvscyI/n0fWuebaTybLcWJBMzVfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="Ku/us/nu";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E05606A691;
	Fri, 20 Nov 2026 23:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2E05606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Ku/us/nu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795216105;
	bh=vhRGA5stCNe5n0EWpCuQMaKiuxZMQFmZwfvJS2nbnJs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Ku/us/nudTVXa1sGIDwmBnCyhJyIoDqC4IqMpZYBnsH2YKz7i1ub6EJ56VVQgHVrl
	 0e/bcAlozEsdha+oA5ioGWJSmKVtCutMBs7wjIUZvns9QtrIyl8CNewH6M6Pus6CRQ
	 8mdOuNZSnMV7Gq6x3HrE2CdQjODP2/Z/2bVjgh2yeemw02C3CrW7Hn4upUr1jfvbfF
	 7tLgaeNvQUWY5bb9SKy1sRX9AEL2/AxIxXD7nI2aU69EWPnhNch3xJH7oonhuzVJhy
	 MUtVG90XUwxdbfL57SVZYUU8tuTmkyGlMbfeCzs178gL6JvPoIQ6JSSkjSMfTrqmwt
	 IdJPAMXe0mldg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 737EB17E031D;
	Sat, 21 Nov 2026 00:08:23 +0100 (CET)
Message-ID: <fd7d38bfd2e6b3ba56422c0f14ccf46f6f1bea6d.camel@collabora.com>
Subject: Re: [PATCH v3] media: rkvdec: Handle interrupts without a current
 context
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Alex Kazinsky <a.kazinsky@ideco.ru>, Detlev Casanova
	 <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	lvc-project@linuxtesting.org
Date: Fri, 20 Nov 2026 18:08:22 -0500
In-Reply-To: <20261113102456.4155237-1-a.kazinsky@ideco.ru>
References: <20261113102456.4155237-1-a.kazinsky@ideco.ru>
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
	protocol="application/pgp-signature"; boundary="=-voWmVM1frdbreVTmWmdK"
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

--=-voWmVM1frdbreVTmWmdK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 13 novembre 2026 =C3=A0 14:24 +0400, Alex Kazinsky a =C3=A9crit=
=C2=A0:
> The watchdog can finish the current job before the threaded IRQ handler
> retrieves its context. In that case, v4l2_m2m_get_curr_priv() returns NUL=
L,
> but the variant IRQ handlers unconditionally dereference ctx->dev.
>=20
> Pass only the device pointer to the variant IRQ handlers, so they can
> acknowledge interrupts without accessing the current context. Retrieve
> the context inside rkvdec_job_finish() instead. In the IRQ path, this
> happens only after successfully cancelling the watchdog, while the job
> is still active.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: f9c7b7deeffd ("media: rkvdec: Support per-variant interrupt handle=
r")
> Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-voWmVM1frdbreVTmWmdK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawDS5gAKCRDZQZRRKWBy
9N/xAP93QEhfxMoixZ27CiEovcLw6efRsiOmrPrLVvLdjDXqVwD/Y19TZSzDEVqi
qmeVvZAq3Glew2P4GvsejKJZnuBWiQI=
=hXHK
-----END PGP SIGNATURE-----

--=-voWmVM1frdbreVTmWmdK--
