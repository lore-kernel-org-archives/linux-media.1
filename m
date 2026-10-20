Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792476516;
	b=wNi9065Hs2/FbP80Dg6QMlN9zI4TUtJqL1MzMWX//CTPE34blm2eAlXFmVoy8Q3MlOI5
	 USR4vfo10DpQwU+1+xKyuRwgXFqu2/df4aGbk9qR22mVUjg/Fe3oPR0VxBwTz0Fg5O3Ib
	 +yhmpm03dT7o84vVTvmHid/FLzEUuudlf8I4CbaSIEH9kdAOPWlsygnZAj+GacxP2l79M
	 3tfuzwNzzlwPFTmnqN2YRCwo6mqpD5rUy4TM8MWI3LJzheOp4LaKDUmZdBHLcD8JwyIPa
	 5+5J820hZzNrO5snSHMnv/04+g6DohhwYE6ltsNgRolGqluMpywdv+bzjwNv6jNXkCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XoYOnbE8zEhaUTNNg5EvX6Px2rVWLGPe8RxRxFiK/ys=;
	b=X1NGA+Gf7/AXt+3HpfjMJur4AHCMUmizQM77XUvku1SOOFKNrJVxFqNxEClUBUtBD4nz
	 9SaWDb+2qNdWBg7exeSvXqaBao1sgEh1O9yRph4t3wDaDtBZ/OdOdNv9tp92Dz5nzKeTC
	 veggQfVOOeeAZ7aBq/eYD9omRFjLjp6VfpRLPaVWbowHIsFPuAYYJlG/AlTB3VlhDevhQ
	 FN3oa7UUIB2/s2P+TWmAnWe8g5AnJGntGCHbSkDxTskp9ex/HbsSWLrKnQ7OpjvhMfec9
	 GiHIrwVNkCczSVqn3v51UVY3MaibYsTJGFkiXPMDX/B52xkyhJyULwCq14aXf5oaapw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YnxSBBWH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F24606A319
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F24606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YnxSBBWH
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c169ae1cb26so53554566b.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792476514; cv=none;
        d=google.com; s=arc-20260327;
        b=LbkgijtAmpAhQtpJRNElUvidL4Cr/znQaHRslQ25UAH4tMkUZYhDYWUaTrgI5bNUcX
         i1GzkSFcn0W1/o29nxpAj/8oHxHZgwxgbkwO97bmwd4nDtymtYpjHsRvL/XpGS7P8FLF
         Zc/kYWb+h+syuM77Xagdb7rZO6pH5gkEMlB7jQtBbqu6nO7dokzDUrXuqVMj6DCZSry/
         Be/Pv/DlB5DPcpkNWp13coDfxrMzT3tMgKYRDpdt/sQGq07HdcieXL8vqGgtwrpUP+Ew
         1j9yU+DEA2TmgrhmB6VpbRqmXRlXhlvWbHCkvznCnH7FqszyZCCyW0ovrHi2fMislaEI
         6KCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XoYOnbE8zEhaUTNNg5EvX6Px2rVWLGPe8RxRxFiK/ys=;
        fh=+I7p10uz3oz5Msq8wblKEsuKm7CEt6lAM7A2p30fQOw=;
        b=AM7fLRQV+kuraBfS/zBaBatI7Evwmt5RBmNL/dRNUGC50IFvSafamkpz9UJuFm0D/K
         bFcMhQSxh2DCcTW2ZGZJfNIVwqId8Incm6BTzZ8DuOXAkG86e6cNYC8yILE3rtjfxRNU
         HnUTTQzIUvPuqazhsu/jOYR+UM0nuo08qroKaXcWac/uDtjsIaHp2mdn/OAlBleVfwLi
         vlXvebV7tdWYxwaQoFBypltGG7Dsn799Rs/euqDefVygn+9wcw5pPI7WDSXsk1IbLdWC
         cNIa3To2VNDTghBXjRMpRvzqbJMTR0K/vH3sTNp/S7G/URSrIIzHEVkbbEiIdsTxkxu6
         apyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792476514; x=1793081314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XoYOnbE8zEhaUTNNg5EvX6Px2rVWLGPe8RxRxFiK/ys=;
        b=YnxSBBWHVrkaUeSSDayl0uhIwRfnwEv+Puu+OwRyKnn8VRyygbSL4sIuZiFN4NLBEk
         g55xRjcFEDjfy+t7dQr9jS4AaAMIFyaMOiLAUkfsnnIZj6btEw+xrdnFer8boq8PiO1m
         IddtGJ/pXbmLF2Mf7Mn/e0MlAFgIchaOqt8Iave94DnR0BCHXrX4tIcnkgWCZiBKkgq2
         MlRri2NP9UDHQ1RWolaAbFRQKxKmlIFV3KmTfJOoWdVKpNGmKUevd1m0Lxm3SKplhtVz
         bBQzKsQLGy+KedwWvlcEp5x/0shubRY23DEOtC9Kdzc8DJd+dgzF0m/IzyHpm20jRqhH
         P0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476514; x=1793081314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoYOnbE8zEhaUTNNg5EvX6Px2rVWLGPe8RxRxFiK/ys=;
        b=RlE8ymxqkr96M5HLHuJLN/6y/e3YGK5gJ9eipj4K+phpMku1NWuEP2BKDk7q5iSTtK
         30oI2fxQo0hLoeTK1jG19v7cykpi2FqloLde+LdHCC/G9cvpzhqvtTjHnH+F9l59Q/t4
         SEH2HxONpEa/iGEB/fkLihgO0cV8Kt5pOu5/8aF0VAxGg06OZszdzn86jS8hqze57qv9
         1QVRw3/4dwjHVDA3LKUBTeDaQK3Ij4wfmupOrnsquoRN1t/YAglHWev9FHnLWKysCtwd
         tEfqMniXppFJwWtRhr7GthGX2ILwCM4Gx5PuGdadmmRzoYZJ2x7CM85GctIVXSNn6KyB
         1sDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCTXvfHSI25O9XH0CVzZxN5utZjtsSza02G2LviRUyjadaua0YnpE8iDi5BaKXtOXCS2MjCZMsVq2KwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIy/5puT6BgYI0NJMi6ZKCVxpKl0vn/PQ2ELqLUd010QYgKZP/r
	SG/h+wZJXnXWrow2JRJlYXovcLAE//h6Kz+R4JXOI3oHBnZXbjDxkQ2kRRXNzqtEya+PfSVMnUU
	AbZTs/9PrcZOpA0d3+k59GNgggeXvP0k=
X-Gm-Gg: AYBFou1rQ851j9QxraSqFcjmOhS9VDoF+4uTdCDTd1d+yUJAKY0POxGjQpQs/87NTIk
	ocw2SiIc/UnULkD2gxnGrqEHqUE0R6KeEkgeybNZ45ZEIudX64ymQvqe03giL7fddmZKwCWOC7m
	sK9pAcIzFsTmnCanpz+mHNBeVaUHbE07ctR2w3DoPuQXocIhjHeKdhQ4Cpn6Ayi9fJYa4CHsJ9V
	6f1hBWnh0tVWgE8cnAOoGOHCRgjjazcGJhqreKKBW1ocvrjL11+F6ImUDgMbmuOkOknHq0TagPa
	9L0TcesH/FU4N5ljnBqjA4yDslyN79QKG9tiirUuME/3tN9Gb5AC/tLliqfTyTe5MkVGLCDmNO0
	A/IXhLbFOXhC07Yc+ogpMB5O8QEHOtdbofnR7hPKYcNnILSpJIMoMR2cvf7XHSaaCWDNM+oLWOI
	kTDwombFIoaqdtcZkaQSKzsMxLh+mFMC07z7tCboutZBFQ1dIV7Mw=
X-Received: by 2002:a17:906:478c:b0:c2d:b9b4:f4de with SMTP id
 a640c23a62f3a-c4604ed9efemr80609966b.18.1792476514274; Mon, 19 Oct 2026
 23:08:34 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com>
In-Reply-To: <20261020015001.15672-1-patrakov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 20 Oct 2026 09:07:57 +0300
X-Gm-Features: AclHuK9mxBlfzqPJhisR4c9pDdEzb9nRSUMVCy6rRwKN_GMG2p1UiXDepmzcr-k
Message-ID: <CAHp75VdwhC_T+7NNroyqQH_qhLW3Uzi97VmLVg2_WT_4Mu7ZCg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: ipu-bridge: Add sensor configuration for
 OV5675 (OVTI5678)
To: Alexander Patrakov <patrakov@gmail.com>
Cc: johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, andy@kernel.org, 
	antti.laakso@linux.intel.com, dan.scally@ideasonboard.com, 
	diamondback@cohunt.app, ilpo.jarvinen@linux.intel.com, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 4:50=E2=80=AFAM Alexander Patrakov <patrakov@gmail.=
com> wrote:
>
> The front camera of the Dell Latitude 7320 Detachable is an OV5675
> described in ACPI as OVTI5678. Without an entry here ipu-bridge creates
> no software node for it, so no fwnode endpoint exists and the sensor
> cannot be connected to the IPU6 even once a driver binds it:
>
>   intel-ipu6 0000:00:05.0: Found supported sensor OVTI8856:00
>   intel-ipu6 0000:00:05.0: Connected 1 cameras
>
> 450 MHz is OV5675_LINK_FREQ_450MHZ, the only link frequency ov5675.c
> supports, and matches the two data lanes the machine's SSDB reports.
>
> With this entry both cameras are found and the front sensor appears in
> the media graph:
>
>   intel-ipu6 0000:00:05.0: Found supported sensor OVTI5678:00
>   intel-ipu6 0000:00:05.0: Found supported sensor OVTI8856:00
>   intel-ipu6 0000:00:05.0: Connected 2 cameras

> [Rebased onto next-20261016 and adjusted the comment]

This should usually go just before your SoB line.

> Signed-off-by: Sahan Nissanka <adee.sahan@gmail.com>
> Signed-off-by: Alexander Patrakov <patrakov@gmail.com>

> Link: https://lore.kernel.org/linux-media/20260809042540.15849-4-adee.sah=
an@gmail.com/

What is this Link for? There is no reference to it in the text of the
commit message.


> -       /* Omnivision OV5675 */
> +       /* Omnivision OV5675 and its RGB-IR variant OV5678 */
>         IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
> +       IPU_SENSOR_CONFIG("OVTI5678", 1, 450000000),

Please, split the comment, id est leave original one and add a new one like
       /* Omnivision OV5678 (variant of OV5678 with RGB-IR) */

Note, there was discussion at LPC 2026 about RGB-IR support. My
understanding is that the kernel lacks it right now, but media people
(Hans, Laurent) may correct me if I'm wrong.

--=20
With Best Regards,
Andy Shevchenko
