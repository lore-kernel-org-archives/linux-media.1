Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792460567;
	b=KAauZ0dAZswMO48GHNSRbY0rUshcFhFXlvaiwBUvHik1YDAASuRU2lOUWgNFS/26kABi
	 8w3f06pjnHjoW18tObSZOD3EcGDfIYzcvZfXOg6fAyKKO5w/AZz89Z+OCtrhpOWyIQ16Q
	 YwT3sGfy7lrEa8g3hqwsgkowzBhz6/L1XQoc0jUkNx85zV4xl4DWrAqRL/aBdTSZlkzle
	 x9psq4wvbO5roMRlGak0hUDxjtUfenVoLOFfvexcipkuzHMfm2JS8VxKWBOkQbuDRJzen
	 6iJcAXik1dFOJLoNf+68C8fzTAWCI7Ape6xt1WCUZ/KBhoC2WHUriPNIBqHHsrQupqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Rp8Ffr7i1kQdoqttTgj80eUef2QxAuNHO9ZKaqh7x74=;
	b=JAW9UO+mycA87oagvJq/Iuta6V8zLQ85cAOdqePl5JDTNJrzNiBWd3XT110OimGszHmG
	 WLPUFTX7GYjktxfnY9T2zKJocc2HnWczxVmpiKwK1z+oyTHsuIH6vPf+8yRTc47AUplVQ
	 +TZ+78r3xfurgwGgcKs92EHk4/5hRFGjRwyxnkVU+D9LGHottRFgzlaNcnwy2fK5etmqn
	 YiIfgdFZrWSRgXm7pOo4djhnuYr0ZERAdW84JAPBqdyxEsrwOZGhl9XVtxOG2JfsHfkWP
	 02+tyMoCRSA2QuRVkPhyq8oDsbhtJ17YvOepUlQLaq9BqLw9HzOocc0EQB/zkPtNB6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=omGHA01z;
	arc=fail smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8506606A31A
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 01:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8506606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=omGHA01z
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35ef6b49813so5124618eec.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 18:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792460566; cv=none;
        d=google.com; s=arc-20260327;
        b=EklFX7yhJpHyZQAmKp/MRi7dS4MkY9cwS3g4kE/R8btUxLD/25RORe66VOhKqrJb6J
         HluOOW7yxTL2uo4nf/seJ95Cb76jEFyLs2XEbHq2Ndz3+XtAS1smP+1hZ+DcwckXXGGD
         yvqLyqdsfCeLMb4U7Xglv4GSDGvLO/lgendTjWyiFuap4dPTz2O5kGiZe1AQc2I2p7hN
         FuMNlTM3SqdLtQGuCl0tYG+xmJez2Yh20HFFE19W6BxDOQAlmKIsC8rjwAcQDWnq+kgM
         BjASwIXDo/HnPXjWjAvWnIOmfxlySO1r1+TZ6v86ZhqpXBgCylTlZ5b9Jj4C1g7rQS3C
         FaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rp8Ffr7i1kQdoqttTgj80eUef2QxAuNHO9ZKaqh7x74=;
        fh=rAAV/3CnYCoRdpqtgUNk7aZvTXGhlTYl73nGhqaM1Xw=;
        b=pyplKpG8B/leAHvxdHNTZDX4Pfv6SGXq2qzzkOkyHtJzcEGASa9m0TMLZxOOaVio7s
         pGb/828MM3KfBDKlv0Emw0ppKUd4ztm0hhEMXT8oOWAAlIh1smcLbRCsiiICYIjs8Rvv
         fUVYXZBFL9ecw9JH8aVg703mdKOo6oCsUFhA9tGmbn+SUIMuPCoFhtCQleGl/OxOsCfm
         +m4Ws/EiGSOL7ke5xp9/99n0Kgbd+qwOMIRyywPADUObSFwY4v2T+o+s/DM7Po55YMJr
         ZpqjIHGzsNB8x2r1Lc74rKICWD1tJWVTttvm1/7OXtytx18h4ahwx86qZCQiMJTSHqXS
         9bAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460566; x=1793065366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rp8Ffr7i1kQdoqttTgj80eUef2QxAuNHO9ZKaqh7x74=;
        b=omGHA01zmyPq1CHM7hp2/yWfhaEtC1zIvrXr/bzStVHNjFKYIIG/GvZZT1wo7o14+6
         1L+VjmU0hTrHADB1UCD2yD+o9VorZm8Fjcq8BOKSsuc0mZtL8wj389Omu5qKyfzjsLQJ
         JpS6Vmt+fhy9E2Wv65b9rKEknL7NWkWY7SAhc4WpwrsQxlgMfcRLh7QxNWlVIDFmptdb
         Z6cGKvgjX8riTied9zP/BqVJTbhP6GTHYYtWJ1GL2libTRGh2zq70t/ZvBsap9DO7uAp
         DFMfPiSPjabPV2lHgSjIXw1lBlHcETOh7+JSN9nWqo3biBldacQj1DvDkljq1JotLpkj
         R7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460566; x=1793065366;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rp8Ffr7i1kQdoqttTgj80eUef2QxAuNHO9ZKaqh7x74=;
        b=zt8bTUtZ2GzOB9hdnRUlt9l2mUKiYK9XVZXcOdRkpOM9VUmjpNEZ5NR4mdL11GvEGq
         IiEvbJBZAfL8ezTc42ZRZevD+aKwAzc5fspTOBwQlc3udmouTar2vCokNvfuLKJ07ArF
         rFl9UBfWynxKxwm4LZyYbXRlY9o0Cv62DEl607YMyc1Nr/ULIy+KGHbcAp2DSG5sb2O+
         hPocoai3AeSDj6fLMR3IJnMtMURsruWVNicqp0vYsG45xrcRLVJ8Nx2J/i3TaO7iKu/m
         SsXGm3PW4u7GFMei9SNYbQLbCycGF1pmSiZ94ZQfKy3AeodPabaXs4ZxQ7kbpPPdGOoa
         ujSg==
X-Forwarded-Encrypted: i=1; AKwUvBz+YQ+LaReLhRhgaT/c7RI0bbeofqe2GjqXfzmIyjgcnBG88jAkir+3jLFdJVfETNLKtQ9X+vR8zHh/0w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLEPlvw8VR4N+oZrWg82yJjNISp/+O9U03VpDw8JQJJaMzTLHdj
	Tui5VxraX2ZPr4PZehokh5p0Munr5PxQX/y3u3Roa36gwkeueVCcfZaQYDQATpVyPIoDOSjGduo
	2BVJZRhJhoijl1ETKRAT0DS3Mgkwwpss=
X-Gm-Gg: AYBFou1Syhj9o/Figev2rZ00u6uYFf8ztwWNvjOTN5AURF+dCRNxWrraKJtKSI5X7+7
	u97W1jcYX67gN71IEAdufaQvsqYWW6dtD8E7mHvQZ0GgQKs5dEgFqyTwwVQsqru+tiC3sqTnxmQ
	/EDSev43QiK+2MN3P1DGjjuNAJhucvGQu3eYudKsb3Vuih/uw46r/QtFPdJSwEyWrODIC8QSti2
	puCP0oQrEJCDZy4DXwBE6fn59d4RXAHPBgW6N2I+bo9gwJrrs03gdTgQXHdDhmSBCaBo5EP25si
	IIvVRD7kyBKmmue/F60hepxpK8M21mazVwZQo08SY41icSVYJ1+rCh2VGGIotd8iqXgFJVttwPB
	BWx4MP3Op3hn6ZZlPi0XPuo/kYh3X0yS8ugHFASfYxA9jspR6SFcTEIeA8oC/+Ozus4FxOhIPsg
	==
X-Received: by 2002:a05:701b:4291:10b0:166:9e0d:3b56 with SMTP id
 a92af1059eb24-18513e7c690mr13539809c88.38.1792460565679; Mon, 19 Oct 2026
 18:42:45 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
From: Alexander Patrakov <patrakov@gmail.com>
Date: Tue, 20 Oct 2026 09:41:38 +0800
X-Gm-Features: AclHuK-hKUi6ptQ0VuUKNJ_EDPqfEHSaqDvIfagtlke9vieQerUGIlASU92TZLY
Message-ID: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
Subject: Re: [PATCH 0/5] platform/x86: int3472: Fix AVDD and add DOVDD + DVDD mappings
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, 
	Leif Skunberg <diamondback@cohunt.app>, Sahan Nissanka <adee.sahan@gmail.com>, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 10:17=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Hi All,
>
> Here is a patch-set to sort out the problems with the Linux INT3472 code
> mapping the 0x10 GPIO type which is meant for AVDD to DOVDD.
>
> This should allow the OV5678 front camera of the Lenovo Yoga Duet 7 13ITL=
6
> to properly get powered-on by Linux, without breaking any existing setups=
.
>
> See "[PATCH 5/5] platform/x86: int3472: Properly map the AVDD GPIO type t=
o
> a "avdd" regulator" for more details on this. The other patches are prett=
y
> trivial prep patches.
>
> Note this series is ordered so that if [PATCH 5/5] somehow does cause
> regressions it can be easily reverted without needing to revert any of
> the other changes (which should all be safe).

For the whole series:

Tested-by: Alexander Patrakov <patrakov@gmail.com>

I finally found time to test your patch series (on top of
next-20261016) together with three more patches that Claude made for
me, which I will post in response to this message. The camera "works"
to the degree limited by the incorrect format declaration.

AI was also able to generate a standalone tool that demosaics this
complex layout to a proper color image and feeds v4l2loopback, and
that's how I participate in online meetings.

--=20
Alexander Patrakov
