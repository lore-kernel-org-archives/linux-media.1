Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793221376;
	b=zf/4rSsS323NHvbVzzXkODPN9KoT5Z16fu1zB/SeWJ7nLCkAB50Ugchbw2o6odonY2LX
	 tnwaw1631TUiQ9ivw54f2t5kqEi8ggrRTo8GnEgUkzGH6t2r13kzaHIMQlVKOjep+kc/6
	 mw6UFmdQ6wcVbn0PuwU+/OdL7at8HgGf5TJ3dH9qp3F2/7Z5Q5vD4R6Ua4Jiog1fJoKG4
	 HYilS2Ifjx3DMg5ohw/44BGm1W9YDfsSweEtiZBoRtLBn8Qape6TSdDQ1iRzSRhiQ30OP
	 GoM8fm8eBVglNzHoe6BA1QlPAzWLT6fAyk0FrmS0ZxwboYhgymxgk5AkGa8yXYRZaLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=lcKDdY0PXyl1xPcW5E/fH1VRKcliX57O/IlRcrnPofo=;
	b=Sks1+ErBRJJR36tBKtb6qlzJfefVZOaZLf1N5rjVmEP2DOg55Ktw65snGYhkAfs4j8GQ
	 RPODFqzRsKpgq2TJiXBFOzQoMnYdOEKq0RA187grBBfC2L/bQELA/sMTuoA1o20i923eE
	 E41ZmQG+v1cbeV7oLS3sbVTO807YYaOShVTZ/T2Gl6sRIq4UCVM1RQa0BXBs7kLUmJuez
	 5ZkM9S8FlPa+H4C4Ec3E/ADYfObKVKYcAD5ZiYNJ18b32V3MZim2bU+pCmEsG+7g/7KOC
	 QXQz1yjhjKjzzjDtkfCMe/9sH+LwrNwhOUoK8jLcsdsnmi4gcNKfjEKRitA0fC/aYog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uCfLrAT3;
	arc=none smtp.remote-ip=74.125.230.201
Received: from mail-qk2-f9.google.com (mail-qk2-f9.google.com [74.125.230.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C379F606A31C
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 21:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C379F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uCfLrAT3
Received: by mail-qk2-f9.google.com with SMTP id af79cd13be357-930f7b1eb68so140089185a.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793221374; x=1793826174; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lcKDdY0PXyl1xPcW5E/fH1VRKcliX57O/IlRcrnPofo=;
        b=uCfLrAT3i0CwvS6Jqf3bNwyOHM7gk+Wa7JEtTLXiziJVEIMp3POw/eib4WwllKoo6M
         pYP7R5ZC0bRb9qg862jRpkbl7MZUBvTUpXHj4yqwsmFtvD/tb50Kl8VPzlP6aGygoepn
         3QocTpyxMHw+pVDmlsDUR28tEBV37TG6nOOIcnnmBwT3Sn0mEZK4FbRQU/gXEg2fDVsb
         dDFQBMofE8dyHjtQd0o0xghlYd0UQd0nGwdA6SorWBIgPmljd4iG5vckbtBztN1yDp49
         TuEUpvnQHFxlHRVT+BwjH7hymyhjLAvqvbc39tPAl3ytDe3MDWy9PccKitxq3dWsTAq6
         eUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793221374; x=1793826174;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcKDdY0PXyl1xPcW5E/fH1VRKcliX57O/IlRcrnPofo=;
        b=f4cmnuUIQym6kYrS0Swp8c36kqS3McdhX+sS/L2lbCeCu84k7Q1g33dLT6DVGA2SQR
         8YXZEHQvtruBfXb2knO+cZPCe8dDyrlS/XdDp2ddOvoRry7IqCfri6c30UEXEY5heSnL
         J+k2m6YU3Dn1OOiYpzmv80iDgYXXKmzvh3U5kZNRsUf2jyw3SSpqjSgj70xtjWA3RWBP
         8r7QzCZoNfugtjjz2hwBAm2NMU5hzDFOr4wf5+XZADFvGYTGaA22RDX2RuJMDTpqvg99
         HoDbc55Uf49eW8Wk45babrysoq57JKPSGZ2I/GJ4hCiFHCPHLlKJH11pK+pQXRaZsxAU
         QgIw==
X-Gm-Message-State: AFq9FYLDYBBGr78oKqEpBzqS8Ov2a4lpeb2o4+rWrhywOnp/SWzlZSf2
	nGeq+58P80YXKfyxkVsWibYATpMwHaft0ZnAI4V4QQy9YdNP/BEZzlJdc/XxBhS/3sY=
X-Gm-Gg: AYBFou1EuJHswfANJZcYwpfK7Hqvx+Y+5hiCNGb6gQhv0Gm6q6VCCfVVX+t+yRFnDYS
	R3PX2OBCYFMcRH7YAxvUd0b0OcmaK+Atxhe4t4SM0rx3JnSxgF1X7IDcpvb0GqkYcKr+EiQ/kxT
	VMghnl7YhbW8gZCZ0yTCmKvtf7Dytz9EyOv0l5Zt3i0BGCGxuv94ZeKUdNCe5k9+dz0b83R0dFh
	XdyHQL3taGOP3o3Fw6GbhSadwWwRPl4Y5Tvb2h6MLlWdR2I8TZYjXthkqKNBjP6xyNGNdaFtuWG
	8iS4mPwufTT0JVUZ/QyAHTMQGtpdODYH1QveQJCQuPZdEVV5aB7D64F6ZVHT59f8HoDVHWgIMPW
	nSE7KT7l1L8JjirkxarcuMUTvogg9Pi/J2OcchG18JtGd8iukknD9bnrvMnkyC9G7z4lz+YwfuG
	hWPKorVWAJyYsDa/tjWTADJfex8C+Qa4aYgrID71ZWK3MI684LibmgpCgqacpmJyXEyZiPWx094
	4dGqpfZSpfOp/Q71gcNVqLzLdgtT4mq6Dr4eBEcc9G2TK25HNTy2IGk+lyKZDIwt2p2OMlLMO05
	kw1RTMkrKMFhaYluHJbmI+knAmVZ1JizQ390eW61Naim70JsVF11TbA=
X-Received: by 2002:a05:620a:688f:b0:937:d6e8:59b0 with SMTP id af79cd13be357-944089438e7mr539240985a.10.1793221374326;
        Wed, 28 Oct 2026 14:02:54 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c54cbdsm141047106d6.26.2026.10.28.14.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:02:53 -0700 (PDT)
Message-ID: <0b3f80aa8522d1f1655c3696848456dba4edea22.camel@ndufresne.ca>
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal
 de-blocking edges y=4 and y=12
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: valery bokov <vlry.bkv@gmail.com>, linux-rockchip@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-media@vger.kernel.org, Simon Wright <simon@symple.nz>, Detlev
 Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Date: Wed, 28 Oct 2026 17:02:51 -0400
In-Reply-To: <CAN9BvpqAL_Hb2cR52EkYmkdm37ej2qKxFh2bj7F6Ei_bg-Sw0A@mail.gmail.com>
References: 
	<CAN9BvpqAL_Hb2cR52EkYmkdm37ej2qKxFh2bj7F6Ei_bg-Sw0A@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-ne9NdZ26iNQ9+DseWgfF"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-ne9NdZ26iNQ9+DseWgfF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 27 octobre 2026 =C3=A0 16:20 +0100, valery bokov a =C3=A9crit=C2=
=A0:
> Questions:
>=20
> - Does anyone know what 0x618 is? It=E2=80=99s outside the documented fun=
ction
> register range; I=E2=80=99d guess a cache, prefetch or bus-interface enab=
le.
> Does the BSP (mpp_rkvdec2 / rk3576 init) program it at power-up?
> - Your FIX.md notes mainline throughput is well below the BSP=E2=80=99s (=
=E2=80=9C4K
> is ~30 fps vs the BSP=E2=80=99s ~112 fps=E2=80=9D). Some of that gap may =
be this bit:
> on our board, runs that come up with it clear are ~3x slower.
>=20
> A fix would presumably set bit 1 of 0x618 in rkvdec_runtime_resume,
> next to the priming. That needs the register mapped, either by
> extending the =E2=80=9Cfunction=E2=80=9D reg range in the DT or with a se=
parate
> mapping. I haven=E2=80=99t written that patch; I=E2=80=99d rather first h=
ear whether
> the bit is known and whether other bits in that area need setting too.

As you probably guessed by now, neither myself or Detlev have tested suspen=
d
yet. I did some search, as I don't have detailed registers description for =
this
SoC, only the MPP code as reference.

You can certainly attempt some initial fix. The register block in question =
is
[0] Vdpu383RegLlp_t, and the register is called SWREG6_LINK_MODE_EN. That m=
akes
it quite surprising it did read the link table at all with such name, but t=
his
is what I found.

So I think we should map the LLP completely, even if its mostly for future
implementation. I was also checking the LLP driver downstream [1], and we s=
eem=C2=A0
to be missing a lot in fact. It seems like starting from RK3576, the LLP
capabilities have got much close to a command buffer.

regards,
Nicolas

[0] https://github.com/rockchip-linux/mpp/blob/develop/mpp/hal/rkdec/inc/vd=
pu383_com.h
[1] https://github.com/rockchip-linux/kernel/blob/develop-6.1/drivers/video=
/rockchip/mpp/mpp_rkvdec2_link.h

--=-ne9NdZ26iNQ9+DseWgfF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauJi+wAKCRDZQZRRKWBy
9OE5AP928iYgCtz2ebPDHhDrHaCfkRiPSTZkfbf2wqeQxJ0bYgD+NtlC6N5jiBGi
U9Pew2K/ZEYw8f+Ct1kOo0gWRI1Vpw0=
=1nkl
-----END PGP SIGNATURE-----

--=-ne9NdZ26iNQ9+DseWgfF--
