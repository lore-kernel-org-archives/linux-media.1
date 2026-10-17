Received: from mail-24428.protonmail.ch (mail-24428.protonmail.ch [109.224.244.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C8D3B995E
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 09:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792229551; cv=none; b=mN72PuhXrIIX1BWk2xVIOKgNM6CD5zRjEDixTLR1rMkd6B2jWeg4+eA5NZ3epPJwuhftSXxUrOVMcdArwkxDQsRas8tOX5yL4qwgnHym8SvEy1wkTvSJ/OzG9hTyzcMLidFtQdLYHR2C3lNumL1rfLry0vzVUwtdju8woYRTJaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792229551; c=relaxed/simple;
	bh=wEHr0QQ8k9J2CVdLOagB09uo9LP3jKsRnUoHDCrPTB0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MmNzXkEpgjStSNCzBlUaBhRHrYG+vsFq3W82LwbWpraKSO+mcqaPhtj+OaA1E8NYD0OnsmE/JwnvyLePWwrzklvzXnaGUG2uS7R+rJ1SjBuAKFrKrLwq5BCnMw7beIqjcgJZ5tBPkmYKmcQt0c/0nPdbNm3Tvj2gIHOcMB0pqG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=rwg/dYrI; arc=none smtp.client-ip=109.224.244.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="rwg/dYrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1792229542; x=1792488742;
	bh=z0Jgvh7o7JPUW3OGF6sSOmZ/lBXeW0HzwX85FxNdiBs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rwg/dYrI5arvl972jrzSJdczk0e5nTCWYCeEhRx5bu6mBLTKGFhNY0dWfnlFESrnW
	 G6LsuLjojwbwcEcW7SC8ygxKeRGZ9wb/v6HbI10rCU5gLBU4GFXHFoWGgMi7xu74a8
	 XLlfQRX2w76Jn8zdZXWFTT+5eU1kFyv8FWTuTu88QpMQt3f7cDRfljf3BaZeZIe21o
	 C0JbS0DcEDylftT104NFQSUiPvz0Ts1nN0N0q/3QUGQh4vw8th4OtbjUKqaf9cfDub
	 b7rpELfOcm3ispysua3ATVfuBObGWoOmBgPKwD5ZbA2yQyDaXdJpy+vPSmCN9Qr0LS
	 EWnXdS1WVTyQw==
Date: Sat, 17 Oct 2026 09:32:19 +0000
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Antti Laakso <antti.laakso@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH 12/12] media: ipu6: Enable IPU4P PCI device
Message-ID: <QPoV-5YNWthOWixfYac1JnlW5qJubsaQrPnV4Iw1Bt4q2Rn0WYVmf3DfcREkMDCbI17n2cIDX1y-3EnAuHiK6d0TvCuXbFalHQlE3v8sPvY=@proton.me>
In-Reply-To: <as4xpwnJgk_E6QWQ@ashevche-desk.local>
References: <O9-1Zx4ykYAqVbmmKdXWlV8znkPlWAssbXfVk-y48EcfJr2jUXDnwGULXfz8OtsKEOKcw-kG_0cr9A0H-7c4e17mnb-CycgRuTmN9eg82B4=@proton.me> <as4xpwnJgk_E6QWQ@ashevche-desk.local>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: b08acd0ee9bb0da952820955437277bb29ae80b8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andriy,

On Tuesday, October 13th, 2026 at 3:27 PM, andriy.shevchenko@linux.intel.co=
m <andriy.shevchenko@linux.intel.com> wrote:

> On Sun, Oct 11, 2026 at 02:44:09PM +0000, Ruslan Bay wrote:
> > Register IPU4P in the PCI ID table after its required MMU, buttress,
> > firmware, ISYS, and CSI PHY support is present.
>=20
> ...
>=20
> >  =09{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_MTL) },
> >  =09{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7) },
> >  =09{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5) },
> > +=09{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU4P) },
>=20
> Please, order by the device ID name.
>=20

Thanks, will do.

> >  =09{ }
> >  };
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20
>=20
> 
