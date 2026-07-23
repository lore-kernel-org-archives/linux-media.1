Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3163403FA;
	Thu, 23 Jul 2026 16:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823286; cv=none; b=GCWdntO3adJvQQmuM2Wu81YGP5nLKHwKOrE8jbwXZ/297XHYJ0ggyZSPwLTUZ1pm2Dv9gStjGHuIswCkK76YLKjUT4EvPGzSHcAKsuTKbSNd1blwBeDyEZoB5UQdvCl2UCwiNoZBx5z834yDJHW+KmLDn24vBM9QTDKhb8qMkVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823286; c=relaxed/simple;
	bh=hCVbUrdO72+2/XTtGQ9LHNVevDpF7W1nNXw/5+2SG+s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s7qnqBMZP+r5nS8lv43GVmXqaT5lsZeAd9nRHi10j8QIFCfglyqrnJpsMJOre/aDKwG6n/TZYf6Lmh/JF9EM0XR8avlRKF2twFybbE7dC9xFN3gymXUhhKD+4cdjnfANLK551qldvaHLPb/vOyzG+4nyL+4xRmX8zkMXGDNeuDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V/FRfrqw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V/FRfrqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784823268;
	bh=hCVbUrdO72+2/XTtGQ9LHNVevDpF7W1nNXw/5+2SG+s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=V/FRfrqwv99v90BjmaqoR58HkKxCnSkgL5+TmqserGROedRVHXEo01bTz5omnT820
	 dSfYDonOkXeNWMywBYXFhjLBy1Wkjw6L+b491galdIFM/zWkzzeUXKdaB8JTEZV2pL
	 KvelzdoLM1xNbIWmYkUqC0sM5YOCibEbbEh4S/xiT1fO2rMI3MalCPfRDTqlWbdPf9
	 FeJQQh7+Q9bJlolrdqJS0LRw6PYT3earjiECvCJ5EqLWhabsMWJb+0ku84aiirvqEf
	 0I2nmrZ8zDqNpy201Hn4kfZzArJyC2wzwcIpPALC88EN48MGjUXlyPKJ5r4541VZDv
	 TgdO2WIYJguew==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 852E017E09AA;
	Thu, 23 Jul 2026 18:14:26 +0200 (CEST)
Message-ID: <210b72e32d1bd757a36b2baf532dd9f7d46ca5dc.camel@collabora.com>
Subject: Re: [RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder for
 RK3576
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jiaxing Hu <gahing@gahingwoo.com>, detlev.casanova@collabora.com, paulk
	 <paulk@sys-base.io>
Cc: mchehab@kernel.org, heiko@sntech.de, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, ezequiel@vanguardiasur.com.ar,
 linux-media@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 12:14:24 -0400
In-Reply-To: <20260723004642.2075233-1-gahing@gahingwoo.com>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
	 <082e1141c38205222a91abf13b1a97d9a00e117a.camel@collabora.com>
	 <20260723004642.2075233-1-gahing@gahingwoo.com>
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
	protocol="application/pgp-signature"; boundary="=-k7OG+sVfO5YN88klwPen"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-k7OG+sVfO5YN88klwPen
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 23 juillet 2026 =C3=A0 12:46 +1200, Jiaxing Hu a =C3=A9crit=C2=A0:
> I'm not attached to the stateful interface -- I used it to get something
> running on real silicon, not out of conviction. Before I commit to
> reworking, I'd like to be sure I understand what "converge" means here,
> because I see two fairly different directions in the thread: Paul's V4L2
> stateless H.264 encoder (kernel-side reflist/rbsp/RC core), and the
> Vulkan-Video split you describe for Detlev (thin kernel module + Mesa
> userspace). Those differ a lot in kind and in effort. Which is the
> intended target for the Rockchip encoders, or is that still open? Is
> there a branch, early code or spec draft I should read beyond Paul's
> series?

This is a fair point, and something that will certainly bring some level of
confusion in the short term. My personal goal, and what Detlev is actively
working on, is to move all codecs drivers toward Vulkan Video, using the mo=
st
meaningful driver interface for the purpose. The drivers needs to stay safe
though, so it matters that the HW can protect memory access.

Detlev and I picked the RKVENC because there was no upstream driver for it,=
 so a
good place for a clean transition. It has an IOMMU and can ensure per proce=
ss
memory access protection. If a process miss-program the encoder and make it
corrupt on other encoding session it owns, its all right, its not different=
 then
writing a C program with multiple thread and corrupting another thread. But
corruption other process session, or the system is not acceptable, and some=
thing
Linux driver must protect against.

Paul does not have this hardware protection, so I think he needs a higher l=
evel
interface for the driver, and at the point, why not base it on existing ker=
nel
interface. Though, V4l2 is massively larger (probably around 100x) interfac=
e
then what we are drafting currently for RKVENC in a drm style driver.

The common part is the rate control. Typically, stateful encoder are firmwa=
re
based, and the rate control is in the firmware. We need an in kernel rate
control for performance reason. The programming latency is going to be too =
high
otherwise. The point of convergence, is that we can share helpers for that
purpose, and Paul's work is really clean, and already in the shape of helpe=
rs
not tied to v4l2.

> Either way the RK3576 hardware enablement and the reference-read fix are
> shared with RK3588, so I'd much rather contribute the VEPU510 side to a
> common base than maintain a parallel one -- I'd just like to know which
> base that is before rebuilding on it.

This is our experience with decoder too, its relatively easy to support bot=
h,
differences being minor. I will ping Detlev today and see if he can help he=
re. I
know in his case he was trying to avoid reconstructed frame compression, an=
d it
only started working when he enable that compression. Though, he had mmu fa=
ults
prior to that.

cheers,
Nicolas

--=-k7OG+sVfO5YN88klwPen
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCamI94AAKCRDZQZRRKWBy
9KsMAQCH7G0RS3a1tFXKb4SlKY0bUWf7PK/zcqYnZteXtdYzNwD+MfXtoIz0SKsL
LwqjvoUnRoSdy/JFQbJB445pUEbAoAA=
=ucod
-----END PGP SIGNATURE-----

--=-k7OG+sVfO5YN88klwPen--
