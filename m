Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72A33B14B5
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 15:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462882; cv=none; b=HiJpps0tMWarXAvVf3GkrG/7hMa+4jjI0+RmErV8AaMWHm1wiFtsDEpNpmB0bF9Ju7++1Y11hooLNnK2FoO/TH1Aw8YbLVrvZofxlHR1DYfh4apFv9G56aVg/BcMUuV1oDt6YkNMFrEIPKGkn+VM4nL8Zh7FmceJpTtVAU2PxZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462882; c=relaxed/simple;
	bh=eO3ubqF9WjY1lOszkR7WEa4Z7HcZYoQx1zCu5yIsYfg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XRCIVc0PGef3cLG1X2NRaXGsZMqT8nbuS9MqNCe3AgChafCGS/shrBj6qFl4flYx4J2FbwCos3jdeQ4Ilf5/3hBMBOdBLgJh+arus3HgmZAGY+/9Nin47nXw0ek8nrodxqXIPxqj6yizTD8G/PVZPpIO6LghHx+YMRNhnnBQZho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=hB+zl23U; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="hB+zl23U"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c169ae1cb26so222068366b.1
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 08:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1786462879; x=1787067679; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eO3ubqF9WjY1lOszkR7WEa4Z7HcZYoQx1zCu5yIsYfg=;
        b=hB+zl23UlWulmi8TzW/cn7+sZEN/syPRQ1FsJOtx1blAcP4qk2+0tQxLvNqlLgwVPu
         OpxoE6CQJ0GYLJLJsXD3HYFemesBCw8WbyB80t9jxmUDOF8FtXxrkCcOItP7txuJc8Gi
         ebS2rLBi9aG3/Tmb69JZcM5aXMnkB7Bk2G27dBrDhzk2KHiFkJ0Aev2Ut6AqtxGKjiGg
         Cz9HYr+ImKRFj26qe+9FgqlfrYMwQyjK81k4BmYt8CV/cpmNVIVPS6/x9yKTXBbpVmur
         uB32b0nqLLOUOvbPzGbntBxgfrP5E0Lb3ffrOWCj9mzTGqQUGOGBkMTWnCpDxbiVRtdE
         pHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462879; x=1787067679;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eO3ubqF9WjY1lOszkR7WEa4Z7HcZYoQx1zCu5yIsYfg=;
        b=eckJde0daaztW4IVxjVw19ovU9RBmYw+b8Qj7zNV/tDik1rKYpb04l48G2UbgobWw6
         CYB8pI7AeCIbkTXZ4BzpCPmja3dC2CqmaFqqHNiM2kxZalUooP72W6X7IaipgHuDIPVJ
         xErSZhJI3aPmnBu6d3l+nnMC85qq/UN/wobW5JNqCFZ5NY4b3m++i4cTaY2QnyCmKF/v
         fv3n2RAxBGh6MgZbAs/0W1IEyLAKI9rV7B5C5ND9E9lsvQa0L3cupcNTEItL278664ra
         cHM2kwUCuimRRCa2vagec95/pSZOSPopLjzU11DKaVzmk1WorSA0DWsX3hlcLcr8nBhK
         a9UQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAaHwcKbHVoHVe6eZzajWP2mh7qKWk1a5kjowKS9WOXT71sSE17OXWUSkw20JPTbmaChxbnixeKcKQfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJj1aOcqtYS0dyIwDy7yDuXsyRN7KNm40MQJL+Q48X17dnL8fG
	u6KQgp9L84MvizfGCVTqvSJAslab2+fX8cIDTBsXjRrn3/M7//YDDN+LxP5GRlSKv0Y=
X-Gm-Gg: AR+sD11JjQ5tsFA633L4Yi0NO7VLTpD7HnLI3iM/CjG9EGHK2eDt/GzknKGsVwyShNJ
	E3KISvIVDBTyIHzwTRiS1e+P6Sk+7+CDh0gPGlCtVA6ejkX9va0jpwa/470vimo6cGRbe6cR8U9
	p1kVzD/rE7Q2wxeRcAMAEVUfIOYES279oV54gsdBgmB6vZ3edecXN0xK7oLFdNHzAtnbQWJaK4y
	thJIXNDiA8w51+PWI+PrEj3p+s757dWRmFWmZx9IyAGPZ/6h+eMMKWI7qaFVBhiycAhilSkOyQE
	ItZln/GtPinKisOc62DRuhYxDbiZBcTtuzGqF6erev2hIDzK9G//iDOFszmP+VblNA5zYht1qx5
	/EAz/YdLYG8OlvTHvpc5ZYBVwbebNMZV1v5VinC/nXMKqNfDuYb5XrsgRx22LW6jlgVrWHr6NGM
	nYbU6HZN3gqtspF+OBfo4DEtMUuy4QK1AsDWr8DrV42n4cLaApUXt84eSPAuFe/ELyFBJeufCAz
	8Vb
X-Received: by 2002:a17:907:9487:b0:c15:f55d:f0d8 with SMTP id a640c23a62f3a-c20ed8b0ff9mr32940466b.4.1786462878752;
        Tue, 11 Aug 2026 08:41:18 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e221::5ac? ([2606:6d00:15:e221::5ac])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20e40cc68fsm70270266b.11.2026.08.11.08.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:41:17 -0700 (PDT)
Message-ID: <969712afa101bd2f11fcaf14cf8f101f805c0037.camel@ndufresne.ca>
Subject: Re: [PATCH] media: vicodec: fix out-of-bounds write on capture
 buffer
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Dafna Hirschfeld <dafna3@gmail.com>, Mauro Carvalho
 Chehab <mchehab+samsung@kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>,  "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, Yuhao Jiang <danisjiang@gmail.com>, 
 "stable@vger.kernel.org"	 <stable@vger.kernel.org>
Date: Tue, 11 Aug 2026 11:41:14 -0400
In-Reply-To: <5DCE028E-E3A6-46DA-9CF2-DEACBBAD5B2F@outlook.com>
References: 
	<SYBPR01MB7881A4E2AC434488ABFA775CAF152@SYBPR01MB7881.ausprd01.prod.outlook.com>
	 <79f19fa34a875dc4b6944ec8df498d9862b5d3f6.camel@ndufresne.ca>
	 <5DCE028E-E3A6-46DA-9CF2-DEACBBAD5B2F@outlook.com>
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
	protocol="application/pgp-signature"; boundary="=-PmJCtLb8GlF1aUcqj/3J"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-PmJCtLb8GlF1aUcqj/3J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 03 ao=C3=BBt 2026 =C3=A0 12:44 +0000, Junrui Luo a =C3=A9crit=C2=
=A0:
> On Wed, Jul 15, 2026 at 08:21:50PM -0400, Nicolas Dufresne wrote:
> > The analyses is just incorrect. At this point, the driver is entering D=
RC,
> > meaning the queue will be drain and will stop until streamoff/on cycle =
happen.=C2=A0=20
> > If there is a out-of-bound bug, it would be that that q_data->sizeimage=
 is not
> > match to be smaller or equal to the vb2 buffer size at streamon time, n=
ot during
> > processing.
> >=20
> > NAK
> >=20
> > Nicolas
>=20
> Thanks for looking. Right, `source_changed` gates the draining during the
> streamoff/on cycle.
>=20
> However, `source_changed` is only set in job_ready(). The first source ch=
ange
> goes through vicodec_buf_queue(), which sets `first_source_change_sent` b=
ut not
> `source_changed`, so it does not drain. A non-conforming application coul=
d
> commit CAPTURE resources before calling STREAMON(OUTPUT).
>=20
> On v7.0-rc3, KASAN:
> [=C2=A0=C2=A0=C2=A0 3.777164] BUG: KASAN: slab-out-of-bounds in device_ru=
n+0x969/0x1850
> [=C2=A0=C2=A0=C2=A0 3.779180] Write of size 2560 at addr ffff888008de1000=
 by task trigger/69
>=20
> It can be triggered by S_FMT(CAPTURE, GREY 1280x720), CREATE_BUFS(CAPTURE=
) [plane
> over-allocated], STREAMON(CAPTURE). Then QBUF(OUTPUT) with an FWHT
> header for the same 1280x720 but NV24 (3 components, full chroma). That
> grows q_dst->sizeimage to 2764800 without changing coded_width/height, so
> STREAMON(OUTPUT) runs device_run() and copy_cap_to_ref() memcpy()s the
> NV24 chroma plane past the GREY-sized ref_frame.buf.
>=20
> As for the fix, where would you prefer the guard? I'll send a v2 accordin=
gly.

The sizeimage, if used by device_run() should only be updated once the drai=
n has
completed. In DRC, there should be no fault caused by the above. Once drive=
r
process the NV24 header, it should emit the SRC_CH event and start the drai=
ning
process (while draining, the capture format should not change). Application
should keep DQ(capture) until it sees the LAST flag. And then its the right=
 time
to G_FMT(capture) (optionally enumerate) and reallocate the capture queue. =
That
imply cycling the capture through streamoff/on, which should validate the s=
ize
image against the frame header format.

Nicolas

-=20

>=20
> Thanks,
> Junrui Luo

--=-PmJCtLb8GlF1aUcqj/3J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCantCmgAKCRDZQZRRKWBy
9FEgAP4l9Dx88FHLTWdHbwBWWmUof6T4JAlAIy/D340xdOa3BwEAkKGKXvJ4kK9X
MK14VPtEbjLsGDFLQTSE6+0rsoPIBAY=
=IGjc
-----END PGP SIGNATURE-----

--=-PmJCtLb8GlF1aUcqj/3J--
