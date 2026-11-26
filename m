Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795730493;
	b=S3hrgAv1pop6L6MToesyNFWp4yciJmoPq6nXBoFOmqXa8eR4NYHs457Kk6qltJ2Be8HX
	 VIaRASJxwP/EtJVS6W0+1MT4rdmOvAj2axcpm8chcx0PAhUM+K7tJOs5Igs1Nd6SyaMgz
	 h4SqmaHGZ2HHOHoZbIS6U6TV2PEZ3CXkMFe//me5+g4ZIihdauS1aRNi4gczhOGecDhVu
	 mDIhqWSXsqDSAngCQguiwAHxnWRs5kPkzJCO/14OZwnoYU53YHOC2qIDHdFtMHgWH5G0Y
	 EBiLQYjL98rs2+Z55yuBqSK6/Vp1BFZb0nO0rgTdgxknNBMnzbmyQpHwRiNuQfBggdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795730493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=M6Yio2grdDoSc1eb/CDZh/DWvIwV4gCZrf/AWye7rNM=;
	b=yXJ4IXbHBpKehh1AsK71DAAssol5QDvhVx+ISIIGW8Y6FlW7M6qsscqNnjEv/hgL4DX1
	 VY5R+4fIm7hct92yTY70GM0lCQSwMdWWyKw/fMJ57QrczXDKJX10dv3u9Bg8zTkE1uIch
	 LTMWfV+642NdUHo67eHjeR1U8zHCXGGqcADme4REyX+YK0H4KncQiLPNjhiHedSe1lQEr
	 Uza7s3jLQyhNoIYnQayq2u7bU89C/V0/VSVRdPzL3xgSzApSyEV1GKtqwx9SzFaCL9wk3
	 LDnT/GMv6Xbl0FtC0WKBqbpfqMjdzTGe9dDo70cEdgO9dCpthtlvR26XRURMz+8oB+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="pukkgSE/";
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC14B606A31E
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 22:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC14B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pukkgSE/
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8d1aec63541so382850b3a.3
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 14:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795730492; x=1796335292; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M6Yio2grdDoSc1eb/CDZh/DWvIwV4gCZrf/AWye7rNM=;
        b=pukkgSE/+2bmIoooITbUsz6jmext5uDnFulpzOvVDzo6OYL/toV1px2/2gmBtk+hqn
         Xyb7jmQ+oi0XiOHtITBOXWqi8hUspxMWP8y1eZj8wmcV0gEoFZQXxkf9CBj92eNiaZ+L
         HhPqXRN4eRr/kiTSArcFr5x/dYPif7LtlcGkX24J3sxZ4CZF+teUz/ONkfh3VcH36ykH
         NPLlPMJaiOv5/0AB40vMmDhi4Hgz4Fbjt0hyGo4q9cqhAE6u3WeKDLIBEfSTgfKEOOBE
         G+wG92vJ87N2ezN5faqVFldwgF5avYoT5IolUQu5aWqfhEoSmtwxuX2b2yiPvTNEs/7x
         2R2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795730492; x=1796335292;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6Yio2grdDoSc1eb/CDZh/DWvIwV4gCZrf/AWye7rNM=;
        b=HwJ5vxqr6Lt9jx7OimvewC2n+XLyDKAMX1BelZLK+6ZaKJMV+Z+mlueOrBMz0l+0N+
         CtnAT54OUGG7J0+GjKUCVjw+sNqLH2/5b7rKn5xj9hL2qBXwg/X5XSiT/aBJn0HUgNAI
         M0ZvI8ANDahsg8IwdFbCoXq7lqaiVP5f1LyZBOVZcyiDXtcNfYEzOqHcaIiRS6Nwf3Ts
         4i3RoAyfWRhTD15ahQXNFp+XN1jLXtqXbHuvh3f9uaOpACEA2jeM/Es6fWyqIY2arVDW
         CDhcGINpA63hbgmGgE7YmN23fAKdqzT+MRvt9xaJh64Gsm1ZmnKqCpXAHHyj5iTZtVZe
         bnVA==
X-Gm-Message-State: APuU4Z+arARyvU2bYpARCyzRbFlmDj684urI/2f6U+sYA3/kY26A6K0U
	cKZgRDgwKOxypq1d5ybI45yDa+0VRCTM1ea0jCGMp04ksvyhUQbYwlakab5v8jp5GJ4=
X-Gm-Gg: AZFdTZdCsEqo6DetTIxFGhqw1PYK4PpHy3ewuJovHbyRSIKQ5dk0VDnOp9fonXQa8Wt
	r1fieiNijSL1CUf87Ny39uzcKEooCFT3PujkBraTaMdwTurcNkvKmSPkQpE1mMgTDklEv/olZQ7
	FEUorFI3l7lBaH5zCJFgEdfgdLBJu7aCVGJqJyjwb6aSCUD/c2oyLZqTxvMj3PTAV+ezcvBPzOP
	DLTitWPORhX4mXjCXZAoQoLKfroWh2ivvjG3AdLAfan9e1ZTvkojohE4LZQq4LqEdzthZXinXib
	/D2h/oDN4Jkgckjhs2prfuFZJFIcEwG0xLCqftjsN00ZcaUMgryGaDZVV0T94KxemBNlYoWJf+w
	lr9HLRmPNXcgbfqmndB+WscgjkqLDZkwmUxuC1Hj0BmSOoSl5krJEyGmjHZXJkV4GBqtZOIKz/T
	wwNYoHSDODksyeQn1m3o5keicaXepTY1bMYnD5ml7QiV+gItw23Kq7lO24Y34Ts4dehiXebKIxI
	qECp6WNGaFPiK6PLFLIou9qWjHhVmJ5XcuENqWd8BlLJv7OayDUJP++fz6L120ETWR0dU1ZIdVn
	GsqduTiybYFa6Go+fAr5chiKdKxmbTCLo4Qw+Z8Ii4CxmqNxSL/9Zkyc
X-Received: by 2002:a05:6a00:14cc:b0:886:a52a:316f with SMTP id d2e1a72fcca58-8c8792b6925mr20638537b3a.4.1795730491886;
        Thu, 26 Nov 2026 14:01:31 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1d71dsm11509363b3a.53.2026.11.26.14.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:01:31 -0800 (PST)
Message-ID: <c6636294b5ba0961469c0762e78778ed0256c46e.camel@ndufresne.ca>
Subject: Re: [PATCH v3] media: rkvdec: vdpu383: configure the reference read
 cache
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: vlry.bkv@gmail.com, Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner	 <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 17:01:28 -0500
In-Reply-To: <20261030-rkvdec-vdpu383-cache-v3-1-ae188ccda977@gmail.com>
References: <20261030-rkvdec-vdpu383-cache-v3-1-ae188ccda977@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-2bEUTAQ/xCDECf1C479E"
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

--=-2bEUTAQ/xCDECf1C479E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 30 octobre 2026 =C3=A0 10:40 +0100, Valerii Bokov via B4 Relay =
a =C3=A9crit=C2=A0:
> From: Valerii Bokov <vlry.bkv@gmail.com>
>=20
> The VDPU383 has a reference read cache with its own register region,
> "cache" in the device tree, which the driver does not map. Its
> configuration and read limit are therefore left at their power-on
> values, and those differ between power-ups. On RK3576 this makes H.264
> decoding of a 2688x1520 stream take either 22.5 ms or 65.4 ms per
> frame, depending on the power-up, while the values the vendor driver
> programs bring it to 3.6 ms per frame.
>=20
> Map the "cache" region and configure it statically: enable cacheable
> read-allocate accesses with 64-byte lines and set the read limit
> (MAX_READS in the vendor driver) to 0x1c. The registers lose their
> configuration whenever the decoder is powered down, so they are
> programmed from runtime resume, which also covers the first use after
> probe. As the vendor driver does (rkvdec_vdpu38x_run() in
> mpp_rkvdec2.c), the cache is still cleared before every frame, because
> reference buffers are rewritten between frames.
>=20
> The region is optional: on a device tree that does not describe it, the
> driver probes as before and leaves the cache unconfigured. It is mapped
> for any variant whose device tree describes it and configured through a
> new per-variant config_cache() callback, which only VDPU383 implements
> for now, so other variants can add their own cache setup later.
>=20
> Decode time per frame for a 2688x1520 H.264 stream on RK3576, within
> one decoder power-up, with the registers set between runs:
>=20
>   MAX_READS  CACHE0_CFG  ms/frame
>   0x0        power-on        65.4  (slow power-up)
>   0x2        power-on        22.5  (fast power-up)
>   0x1c       power-on         7.2
>   0x2        0x13             8.6
>   0x1c       0x13             3.6
>=20
> The decoded output was bit-identical in all five cases. These numbers
> were taken by setting the registers from user space through /dev/mem.
>=20
> The read limit is a 5-bit field whose meaning is not documented; 0x1c is
> the vendor driver's default. With the cache configured, decode time per
> frame of the same stream against the read limit:
>=20
>   MAX_READS  1     2    4    8    12   16..28
>   ms/frame   12.8  9.2  6.3  4.6  4.1  4.0
>=20
> so the default sits where decoding stops getting faster.
>=20
> The registers were identified with the help of an AI coding assistant
> (Claude, model claude-opus-5-5), which diffed register dumps of fast
> and slow power-ups and matched the result against the vendor driver.
> It also drafted this patch and its changelog, which I reviewed. The
> measurements and tests were run on an RK3576 board.
>=20
> Link: https://lore.kernel.org/r/20260619111810.564384-1-laszlo.fiat@tuta.=
io
> Signed-off-by: Valerii Bokov <vlry.bkv@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> Testing on RK3576 (Smatek T10PE) with v2 of this patch applied, on top
> of 6.18.34 with Simon's priming patch (v3 only restructures how the
> region is mapped and configured, and renames a define):
> - The cache registers are programmed on every runtime resume: zeroed
>   by hand while powered, then suspended and resumed without decoding,
>   they read back 0x1c/0x13 (4/4).
> - 2688x1520 H.264: 4.0-4.2 ms/frame on a 257-frame clip across 8
>   separate power-ups, no fast/slow lottery left.
> - Output is bit-exact against FFmpeg's software decoder (per-frame md5,
>   all 257 frames) for that H.264 clip and for an HEVC Main clip with
>   B-frames encoded from it.
> - 10 minutes of a live 2688x1520 H.264 RTSP stream at the camera's
>   25 fps: 24.4 fps average (23-25 fps in every 30 s window), 14% of
>   one CPU core, no kernel or decoder errors.
>=20
> Open questions:
> - I have not checked whether the decoder's soft reset (after a timeout
>   or error) also resets the cache registers. If it does, they need to
>   be reprogrammed after a reset as well.
> - Simon's out-of-tree priming patch also modifies
>   rkvdec_runtime_resume(), so the two will conflict textually there.
>=20
> Possibly related, not part of this patch:
> - VDPU381 (RK3588) may have the same problem. The vendor driver
>   programs three caches there before every frame (CACHE0/1/2 in
>   rkvdec2_run(): cacheable, read-allocate and 64-byte lines, plus a
>   clear of each), and mainline programs none. I have no RK3588 board to
>   check whether its decode speed also varies between power-ups.
> ---
> Changes in v3:
> - Rename the read-limit value to VDPU383_CACHE_MAX_READS_DEFAULT, set it
>   apart from the register definitions and document it, with measured
>   decode times for values 1-28 (the field is 5 bits wide).
> - Map the "cache" region for any variant whose device tree describes it
>   and configure it through a per-variant config_cache() callback,
>   instead of checking for VDPU383 in probe.
> - Link to v2: https://lore.kernel.org/r/20261029-rkvdec-vdpu383-cache-v2-=
1-859bb44e03a0@gmail.com
>=20
> Changes in v2:
> - Configure the cache statically from runtime resume instead of before
>   every frame, as suggested in review. The values are constants, so
>   "restore" is a plain rewrite; there is nothing to save.
> - Keep clearing the cache before every frame, as the vendor driver
>   does. Happy to drop it if that is preferred, but I have only shown
>   bit-exactness with a single clear on one clip, which is not enough to
>   rely on.
> - Make the "cache" region optional. v1 returned an error from probe
>   when it was missing, which would make the decoder disappear on any
>   device tree that does not describe it.
> - Map the region only for the VDPU383 variant, since the configured
>   values are specific to it and are now applied from shared code.
> - Link to v1: https://lore.kernel.org/r/20261028-rkvdec-vdpu383-cache-v1-=
1-d3548d3b3586@gmail.com
> ---
>  .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  2 +
>  .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  2 +
>  .../platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h | 16 ++++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 47 ++++++++++++++++=
+++++-
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  4 ++
>  5 files changed, 70 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> index 5ec755733..efb1f6975 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> @@ -441,6 +441,8 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>  =09timeout_threshold =3D h264_ctx->regs.common.reg013_core_timeout_thres=
hold;
>  =09rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
> =20
> +=09rkvdec_vdpu383_clear_cache(rkvdec);
> +
>  =09/* Start decoding! */
>  =09writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHO=
LD);
>  =09writel(0, rkvdec->link + VDPU383_LINK_IP_ENABLE);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> index 3462d995d..6223b89e2 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> @@ -568,6 +568,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>  =09timeout_threshold =3D hevc_ctx->regs.common.reg013_core_timeout_thres=
hold;
>  =09rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
> =20
> +=09rkvdec_vdpu383_clear_cache(rkvdec);
> +
>  =09/* Start decoding! */
>  =09writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHO=
LD);
>  =09writel(VDPU383_IP_CRU_MODE, rkvdec->link + VDPU383_LINK_IP_ENABLE);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
> index 04eb23297..da46f8601 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
> @@ -42,6 +42,22 @@
>  #define VDPU383_STA_INT_SOFTRESET_RDY=09(BIT(10) | BIT(11))
>  #define VDPU383_STA_INT_ALL=09=090x3ff
> =20
> +/* Reference read cache, in the "cache" register region */
> +#define VDPU383_CACHE_CLR_CACHE0=090x10
> +#define VDPU383_CACHE_MAX_READS=09=090x18
> +#define VDPU383_CACHE_CACHE0_CFG=090x1c
> +#define VDPU383_CACHE_CFG_CACHEABLE=09BIT(0)
> +#define VDPU383_CACHE_CFG_READ_ALLOCATE=09BIT(1)
> +#define VDPU383_CACHE_CFG_LINE_64B=09BIT(4)
> +
> +/*
> + * Maximum outstanding reads, a 5-bit field. Its meaning is not document=
ed;
> + * 0x1c is the vendor driver's default. On RK3576, H.264 decoding stops
> + * getting faster from 16 upwards, and is several times slower at 0, whi=
ch
> + * is what the register holds after some power-ups.
> + */
> +#define VDPU383_CACHE_MAX_READS_DEFAULT=090x1c
> +
>  struct vdpu383_regs_common {
>  =09u32 reg008_dec_mode;
> =20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index fbcd0f175..65b84e34a 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1158,6 +1158,29 @@ void rkvdec_schedule_watchdog(struct rkvdec_dev *r=
kvdec, u32 timeout_threshold)
>  =09schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(watchd=
og_time));
>  }
> =20
> +/*
> + * The reference read cache and the read limit lose their configuration =
at
> + * every power-down and come up with values that vary between power-ups,
> + * several times slower than the vendor driver's. Program them whenever =
the
> + * decoder is powered up.
> + */
> +static void rkvdec_vdpu383_config_cache(struct rkvdec_dev *rkvdec)
> +{
> +=09writel(VDPU383_CACHE_CFG_CACHEABLE | VDPU383_CACHE_CFG_READ_ALLOCATE =
|
> +=09       VDPU383_CACHE_CFG_LINE_64B, rkvdec->cache + VDPU383_CACHE_CACH=
E0_CFG);
> +=09writel(VDPU383_CACHE_MAX_READS_DEFAULT, rkvdec->cache + VDPU383_CACHE=
_MAX_READS);
> +}
> +
> +/*
> + * Reference buffers are rewritten between frames, so the cache is clear=
ed
> + * before every frame, as the vendor driver does.
> + */
> +void rkvdec_vdpu383_clear_cache(struct rkvdec_dev *rkvdec)
> +{
> +=09if (rkvdec->cache)
> +=09=09writel(1, rkvdec->cache + VDPU383_CACHE_CLR_CACHE0);
> +}
> +
>  static void rkvdec_device_run(void *priv)
>  {
>  =09struct rkvdec_ctx *ctx =3D priv;
> @@ -1729,6 +1752,7 @@ static const struct rkvdec_variant_ops vdpu383_vari=
ant_ops =3D {
>  =09.irq_handler =3D vdpu383_irq_handler,
>  =09.colmv_size =3D vdpu383_colmv_size,
>  =09.flatten_matrices =3D vdpu383_flatten_matrices,
> +=09.config_cache =3D rkvdec_vdpu383_config_cache,
>  };
> =20
>  static const struct rkvdec_variant vdpu383_variant =3D {
> @@ -1807,6 +1831,19 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
>  =09=09rkvdec->link =3D devm_platform_ioremap_resource_byname(pdev, "link=
");
>  =09=09if (IS_ERR(rkvdec->link))
>  =09=09=09return PTR_ERR(rkvdec->link);
> +
> +=09=09/*
> +=09=09 * Optional: not every device tree describes the cache region. It
> +=09=09 * is configured by the variant's config_cache(), if it has one.
> +=09=09 */
> +=09=09if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "cache")) {
> +=09=09=09rkvdec->cache =3D devm_platform_ioremap_resource_byname(pdev, "=
cache");
> +=09=09=09if (IS_ERR(rkvdec->cache))
> +=09=09=09=09return PTR_ERR(rkvdec->cache);
> +=09=09} else if (rkvdec->variant->ops->config_cache) {
> +=09=09=09dev_info(&pdev->dev,
> +=09=09=09=09 "no \"cache\" region, reference read cache not configured\n=
");
> +=09=09}
>  =09}
> =20
>  =09ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> @@ -1875,8 +1912,16 @@ static void rkvdec_remove(struct platform_device *=
pdev)
>  static int rkvdec_runtime_resume(struct device *dev)
>  {
>  =09struct rkvdec_dev *rkvdec =3D dev_get_drvdata(dev);
> +=09int ret;
> =20
> -=09return clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
> +=09ret =3D clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09if (rkvdec->cache && rkvdec->variant->ops->config_cache)
> +=09=09rkvdec->variant->ops->config_cache(rkvdec);
> +
> +=09return 0;
>  }
> =20
>  static int rkvdec_runtime_suspend(struct device *dev)
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index a24be6638..c4b9a2211 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -30,6 +30,7 @@
>  #define RKVDEC_8K_PIXELS=09=09(7680 * 4320)
> =20
>  struct rkvdec_ctx;
> +struct rkvdec_dev;
>  struct rkvdec_rcb_config;
> =20
>  struct rkvdec_ctrl_desc {
> @@ -75,6 +76,7 @@ struct rkvdec_variant_ops {
>  =09irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
>  =09u32 (*colmv_size)(u16 width, u16 height);
>  =09void (*flatten_matrices)(u8 *output, const u8 *input, int matrices, i=
nt row_length);
> +=09void (*config_cache)(struct rkvdec_dev *rkvdec);
>  };
> =20
>  struct rkvdec_variant {
> @@ -136,6 +138,7 @@ struct rkvdec_dev {
>  =09struct clk *axi_clk;
>  =09void __iomem *regs;
>  =09void __iomem *link;
> +=09void __iomem *cache;
>  =09struct mutex vdev_lock; /* serializes ioctls */
>  =09struct delayed_work watchdog_work;
>  =09struct gen_pool *sram_pool;
> @@ -180,6 +183,7 @@ void rkvdec_run_preamble(struct rkvdec_ctx *ctx, stru=
ct rkvdec_run *run);
>  void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run=
);
>  void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len);
>  void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_thr=
eshold);
> +void rkvdec_vdpu383_clear_cache(struct rkvdec_dev *rkvdec);
> =20
>  void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
> =20
>=20
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> change-id: 20261028-rkvdec-vdpu383-cache-8fbbf8313da3
>=20
> Best regards,

--=-2bEUTAQ/xCDECf1C479E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawisOQAKCRDZQZRRKWBy
9MU2AQCcLosx59v9uR8zf9j3PjZ1SNyTTTQh2WJjS1r1bLuGXAD/Z3k4E2B7Pd+E
QPG5H7DfNpK0jruSUlhuDxNPwIRRvAc=
=0CkT
-----END PGP SIGNATURE-----

--=-2bEUTAQ/xCDECf1C479E--
