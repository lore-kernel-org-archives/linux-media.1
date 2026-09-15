Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53353DAAD0
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 07:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457372; cv=none; b=RIf953n4tGeUeFVaIS0j/coBwvtQ/R5x0IC98Wx+06IjzG42tVFQHt7uOkilYa4jvAlFuhLxGulO6hrNyiyNkhQZ6HtR18RwQHUybIL4YTPWJBH0lzWUHcs7d8LTu55B3URtxGDR+eZDNsyrLKJOVRp1Bf5vUVuYkJYdmc9jv+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457372; c=relaxed/simple;
	bh=NwAi5xRLd8PpAJcevjukUcBiW3VQT055fbt3A2zVNPw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DlHTpwbpNA8byMOxBsk/iCmUg+pSIRx6Cgzf8uQ9GRD70T2h7PkVtPEn2cEVKFaEJ5Vgm7vzAE3p63Vx8iHcZbKPt9wemceJ55RRsjztEqxo+O0+Qe90RT6NgnNAFFfeMKlIAVS/u4e5uVR8ZhiwLtcsW23RiZ8mU3Mg8q/9+Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=oiDRGSJB; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="oiDRGSJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789457368; x=1789716568;
	bh=kO4CHoGZTQSeISb0QEww2S7JFG3rSZS6pN5XDO3r/iU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oiDRGSJBzHdt7vuUcYt9V9KyJBhW1G0giu2z2vkIuEjmwEhGHZ4za5Wz6EmVJnwrF
	 SXVI1Bwj2zNmSXnZpVjQ0uPQiMgpqDf0M+3wsAZfDMplm0AKqt2+6CqSrOOD2VvYTA
	 PeY4y5DtdWcYve22HAAkivh5AQlEoyWh0EgupfkXk16VO1dzUiK3YmLSnNrAECP/I0
	 0v3tuwVL+ngfQXplqmxbTnlJVmhk5n46cP6NbhVRgbCh+b4JFfxTKUZG1zcb9uaHvI
	 tbrA0DeDcCYuiZc53qkqrPIsmosy/gIDuiPYu71RxCy8at5xqZh4yjskOsNdLrPH/g
	 2q/BqG/535Cjg==
Date: Tue, 15 Sep 2026 07:29:25 +0000
To: Fernando Rimoli <fernandorimoli11@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: ipu-bridge: add the OV13858 rear sensor
Message-ID: <20260915072917.85476-1-lsa.uz@pm.me>
In-Reply-To: <20260914203745.6049-1-fernandorimoli11@gmail.com>
References: <20260913100932.92087-1-lsa.uz@pm.me> <20260913142034.5632-1-lsa.uz@pm.me> <20260914203745.6049-1-fernandorimoli11@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 206f6c3a3e64ef428793cd8324504192326bcbda
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you for the tag, and for replacing your own entry with mine so that m=
y
line was the only difference. That is more care than a Tested-by usually
costs.

Your question is a better one than it looks, because our two failures produ=
ce
the same string:

  ov13858 i2c-OVTID858:00: failed to find sensor: -5
  ov13858 i2c-OVTID858:00: probe with driver ov13858 failed with error -5

Same -EIO, and necessarily so: ov13858_identify_module() has one caller and
one dev_err, so every cause that makes the chip-id read fail prints exactly
that. On this machine that line has already had two causes. In July it was
int3472 not knowing GPIO type 0x08, so none of the regulators existed; sinc=
e
that was fixed upstream it has been the driver not asking for the ones that
do. Yours would be a third. So I checked rather than answering from memory.

They are independent, and neither subsumes the other.

Mine is that the sensor is never powered. The driver's assumption holds whe=
re
the rails are ACPI power resources. Here an INT3472 companion registers the=
m
as regulators, a clock and a reset GPIO for the sensor driver to consume, a=
nd
ov13858 consumes none of them. The patch requests dovdd, avdd and dvdd and
the reset GPIO, and sequences them with the clock in the runtime PM
callbacks. It retries nothing.

What rules your mechanism out for mine is that there was no neighbour. The
before-and-after was measured on a media/next build, and no media/next buil=
d
carries a vd55g0 module - that driver is still in review - so SMO55F0 was
unbound while the read was failing. There was nothing on the bus to corrupt
the transfer, it failed anyway, and adding the supplies fixed it. The build=
 I
am on today is the same in that respect:

  /sys/bus/i2c/devices, adapter i2c-1
    i2c-OVTID858:00   driver=3Dov13858
    i2c-SMO55F0:00    driver=3Dnone

which is your topology exactly - the rear sensor sharing a controller with
the infrared one - with the neighbour silent because nothing claims its HID=
.

Retrying a read on an unpowered part returns -EIO five times, and powering =
a
part that is already powered does not stop a neighbour corrupting a transfe=
r.
So both, and your commit message can say so without it reading as a duplica=
te
of mine.

Since more than one build is involved above, which is which:

  media/next f9536a806, no vd55g0 module in the tree
    stock ov13858    failed to find sensor: -5 at boot
    with my patch    supply dovdd not found, using dummy regulator, binds
  a 7.3.0-rc1 built from media/next, same absence of vd55g0
    the bus listing above; SMO55F0 unbound
  Ubuntu 7.0.0-30-generic, my patch backported, out-of-tree vd55g0 installe=
d
    SMO55F0 bound to vd55g0, and the rear sensor binds

All on one Surface Pro 11 for Business (Intel), firmware 17.105.143.

The last of those is the useful one for you: I have a kernel here where you=
r
neighbour is live on the same controller, and one where it is absent. If yo=
u
would like the retry tested against either when you post it, say so.

Thank you also for the link-frequency observation, which I checked and whic=
h
holds in the source: ov13858 calls v4l2_fwnode_device_parse() and neither
v4l2_fwnode_endpoint_parse() nor the _alloc_ variant anywhere, so the array
the bridge publishes is indeed never read. I had ordered the two as measure=
d
rather than ascending and wondered whether that would be queried. It cannot
be.

Sergey

