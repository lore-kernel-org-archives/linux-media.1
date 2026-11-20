Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215931;
	b=Fp7YzK+cJ8QLJYcB//A3bIJtonptG37JEd9CjV/OC1okDVOiVAH8ZXGuc6aoCb0Ge6CT
	 25X4144ZYiMDrNrLwlAEKbDsLl2H5mev2g7+8mY8j+0G9Q6j76v0FtNMP640eb5gONa06
	 lct+JuBjKWsMsJYO2kW/xGQgJBH0RyqCTLsdcHri+UunyHH7/FXkwzomAkjH+T7Uvokq6
	 12kKFgjJGLwpr43h9qa8ODRXXcnXvoRf362mnv0QZlDT6330umLBa5v/pz4jp4so+RlkG
	 VE/0KUJ2626QqGCDwUN+8ROguQ57mwwK1apPo2AkNYPW79s7KYFUJ6gCndva/5L60pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=eJ5BpJRw2McaWgy6GPAJWhZZHCtWtK9atUe2DqC0wZY=;
	b=rykdM3udm4lFYxjmr+MsySKl1RQXR+d9rADZhONRcqBB8oHi3KSd9DMd7pJS3gkU/YiX
	 iuHp4JFVeB+qIJFTyiFEPC2u5F88BXuu+COBHbnURqXjqG3baJuaDUwok4AKwWrX9MWes
	 xVJ0WIZvGS8clufJJrYC1twrJctnZzFfa3O6pVmqYmre0DKvuT7fTgMMk1cwUiySKUI36
	 pus3AD8aCH8/Bg1/tmW8sGZiCOVHnsm1ziuZwLVxKaCMEma8KmVMovONQikRV8gC0/+2i
	 HbndtkhYmSt7/ojClkgo4qbVtPCR0ViDyfNAkRAPaTatGs9YR3rPuevSoAq1vx3cWTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ptkSyi7n;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0208606A331
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0208606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ptkSyi7n
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55d360ca878so12355011cf.2
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 15:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795215924; x=1795820724; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJ5BpJRw2McaWgy6GPAJWhZZHCtWtK9atUe2DqC0wZY=;
        b=ptkSyi7nsLbE59qnwPx2tZbawmCy5vyYjicmivEDp8PBaIsjFzc/aXkVPwDoC84brK
         5iAIg6+7PU+zCiqTKAuD1ThgFNX6hR00fMtN26ljWvTvNuzvDhqcavYHk7G1ScFHAokU
         4aSlHaWKpkZEpYp3ulcTRFBvJ6YsozZtcfeqT8uQnXhDhZaZPt1qDJFUXOCfD88yUW0U
         fusubl3CR1mPjNPmp5XLcUYPbvU7QBlhISD2/0scq4p2rrqRX658hIGlVN+Ta2iLNbFr
         W/2HykMDbXKChtURt8SMboIWPpr5viytTysYzU7r20WORy3BHTzKin6P3b3LM5zwAz/J
         I9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215924; x=1795820724;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJ5BpJRw2McaWgy6GPAJWhZZHCtWtK9atUe2DqC0wZY=;
        b=dQ+7M67KADCaU34A+YlCX/LUY04p9L0VJBT57RJYCFXjucSlTveeaQFfHt/hHyPldw
         V+LQE4orQwTr9SFyKIciPkWym4dX/8ViaU+dVcRpTtyzdp4qnHYL0P+94qtGO6sGNl1z
         fKN9D9ebCdDM38Dz2Z9KgvgYXXseQXt63TsqRXvTChrwOxrQM+8/PsGNqFaGv/Z44i17
         qUptVUAMq7WKW4l+9aFYoH3If2bQhBxOGGbbHifI7ctHX6nJhp0yQe54nEFGyWmRSnnx
         82Qwz0cKFzHoZZVF9r20ayP3UHhZYssxK4XpiXkWOsT1zvRDuOhOFGuKJF/8dcmgxj1D
         PgRg==
X-Forwarded-Encrypted: i=1; AL+hErHJ34qg38Z1hxLD1rYHShrmKU9is9jFgLWJ9UjKjZ8Zc2w18QDiGTla76EyNjvPzlj2HprCzVmV9vpY8Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z84E9SPOxk/oJVsM9lHYBlUdFL1dWlF3TomWAbirkmRYyQk6+qL
	y+Z5229l6Yf7Bps5qnDbv9eMI2p3A/R3ca6p9/0/ob4yntZrLLHF8i7p7Nqx5Kd926tFaRlJkfI
	oKOpw
X-Gm-Gg: AYBFou3gU3JQF65eHB8VzO8FRjLh722SkeI735Nz49SSUBIfRy837/uZZET5bY6vTfY
	BM1Uj0g5SpigoUb4/e+1Sd1oEapZ319G1PSrmr7RfaXGQ6uBpeLaF2naS320VDdBQjDBuauYfDF
	sN7kAjnzzbCI+NrB4Zv0oeNfUtI04GwpeVFELB4nQK0hioaF9pLXXMxc2ISB8WegxNdQ/4yUk2L
	Ns5BHHR3aVdQPElpvmmLuO8z/IK38uiM2/kJTKZ1eh/pgBVH6VLlryKbPeMOUZNl2s/dQwhsOi1
	xtjV3fX5oIZqFagceJQA4W6VLZk01e1ytjbKBd7pewct3U5ykuhpHYfcOXEcs8kSDzskWz4DcUK
	L5RwSyYPu4f90tYe1PwXFb7Ev5h3rHfHaZM7XfKfskhMj31shvJZjWTQWHEMPr8xuU0bVRY4fun
	uKytg5XmfaHAG2aiXHJUyejTzs9LTAa7LxfjTv0bQce0Opq/ZKmVzgCg+h9gEWLFCNXuNK8/PVp
	a48bEv82NJtasmTimM7uesULDoeW9c3maKlrI7ksXwXabMN7F+WXzQpKJk1UfPLqsCVTbXjLJzq
	a2UPzRRtcx+CnD5KYan6V+xY8MHtI85v3FOkSt0v5Lu84G/TVbLeYrA=
X-Received: by 2002:ac8:5cc9:0:b0:55d:36cb:d2f6 with SMTP id d75a77b69052e-55d76994ab8mr78951971cf.8.1795215923589;
        Fri, 20 Nov 2026 15:05:23 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882bf70sm35229321cf.11.2026.11.20.15.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:05:22 -0800 (PST)
Message-ID: <c328eb172979255e0998fd126db313651a471d7a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rkvdec: Use dma_map_resource() to map RCB SRAM
 buffers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Lukas Splavec <lukas.splavec@puresig.cz>, detlev.casanova@collabora.com,
 	ezequiel@vanguardiasur.com.ar, mchehab@kernel.org
Cc: heiko@sntech.de, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 18:05:20 -0500
In-Reply-To: <20261114094916.28744-1-lukas.splavec@puresig.cz>
References: <20261114094916.28744-1-lukas.splavec@puresig.cz>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-mVFMrjNK4prCvdK9IMd/"
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

--=-mVFMrjNK4prCvdK9IMd/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 14 novembre 2026 =C3=A0 09:49 +0000, Lukas Splavec a =C3=A9crit=
=C2=A0:
> rkvdec_allocate_rcb() uses the CPU virtual address of the SRAM buffer
> as the decoder's IOVA and writes it into the IOMMU page table directly
> with iommu_map(), bypassing the DMA API. Only the low 32 bits of that
> address are used, which falls inside the IOVA range managed by the
> allocator. The IOVA allocator does not know about this range and
> considers it free. Under load it hands out the same IOVA to another
> buffer, e.g. a capture buffer, whose mapping then fails:
>=20
>   [   66.930512] iova: 0x0000000082100000 already mapped to 0x00000000ff0=
01000 cannot remap to phys: 0x0000000168231000 prot: 0x3
>   [   66.930674] rkvdec fdc38100.video-codec: dma alloc of size 16588800 =
failed
>=20
> and decoding cannot start.
>=20
> Map the SRAM buffer with dma_map_resource() instead, so the IOVA is
> allocated by the IOVA allocator and the mapping is created by the DMA
> API, and release it with dma_unmap_resource(). Without an IOMMU,
> dma_map_resource() returns the physical address, so the separate
> no-IOMMU path is no longer needed.
>=20
> Fixes: e5640dbb991c ("media: rkvdec: Add RCB and SRAM support")
> Signed-off-by: Lukas Splavec <lukas.splavec@puresig.cz>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-mVFMrjNK4prCvdK9IMd/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawDSMAAKCRDZQZRRKWBy
9PMfAPwOi/tB/Jf87fecrO+PluXuT7royZvxIrCNZmOHBSuEegEAlBEB69ZnNtbu
KA2zhN0q8/7t1JDmNdzQt64epCy1WgE=
=cLZV
-----END PGP SIGNATURE-----

--=-mVFMrjNK4prCvdK9IMd/--
