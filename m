Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793322566;
	b=RpPaRcSFtSRjsZBz7hhfmuDt7z/UVOFhlavPzW9hew4QRuP/oZgBl8Dxv+/J0FdHAABT
	 56QYMAQ/o/BD0QJrlIbKYSMH+HbmS+6X1RvnAgkH23PVg7V57UOBw39S9m0PKPZzcx0Gl
	 y8KrnwlavgT/8ZhTahrsmUIqeSFVM+pbmD3T1KPntPOc1bgpfulmbLHkcDnRidiqfmxfE
	 M0dzDCtZCwkzy980DZLksVuTBtvS1k+dTV5Zs+L/HCo3aPhv6vUxdn+lwABNo9VndfEzS
	 fgsB0O1crFVK7SxReA0lRPrE+Y7tD+RhyDt0LKb3qXfjkXu2TI9h3idqOA9KmWmFMWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=Kko4zjOXBRybFPzuRuUxh6d2fqu3VVvE60ZOuuaPtno=;
	b=oewGZqo4Sp4y0oQqKvVQptXZbuqc1OwPOrmzrcjlbGrc53pfZpaIWFwNsU5fEEGuYTxd
	 6O/J7e0ndlS0f61BB4AVX30j4FxvPOrF0PS9jG0ig/cSDUxkPP7dHcKhaBXGp6r3aOEOk
	 6pL6Yq8eg0yiucxMNGtngeT/KLhlCINaUZtslzILEWaZF1vUvA51ubpi2sFfYCpUEogXo
	 nSD+N3xOYWGFtKSk/OhHiLpixZSg81h+ATXlqcFZdmsnTLLGYxp1yjAqzPe+X52CcUU4r
	 DxOukRW/yW8bYBll0XwlguoDnNM/4ep4Q8hzyQce1T+H6Cs7XE6CVARL5s9HEm7Uv7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nSdFpO25;
	arc=none smtp.remote-ip=74.125.230.195
Received: from mail-qk2-f3.google.com (mail-qk2-f3.google.com [74.125.230.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C1E606A31C
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 01:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C1E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nSdFpO25
Received: by mail-qk2-f3.google.com with SMTP id af79cd13be357-93cbefbc26aso8150685a.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 18:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793322564; x=1793927364; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kko4zjOXBRybFPzuRuUxh6d2fqu3VVvE60ZOuuaPtno=;
        b=nSdFpO25KqPMrh0iT4EODIV4z5G016pYPTGR+EDqGNtlcuIfYNhqlIq5+ErDRdemZv
         WRHbF9hjwnflghjSMQ/xAh5dtjm6Fg8+GrZDiZRqLcoexvty0T7k8s+dhYBW8QlSc8UK
         Ra+dPVUA5zqBfFn0pluunnhrMKDSLNunFgVvAemu3cOGhedbT/5PlyCuQiXlFmMEDc37
         rV0565sp1lpOcBLmU1wJBSu3qg+B7QJ+w7xaHh+GLU+Y8iEjhsPl+qM/YNIAnPX1ILWt
         CdvJHuP5pdkgmbOi7yZuASaKxNMBO3xq6kYo50JtDhBYjGznP5obWeNvyypieeVFGgNO
         lsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793322564; x=1793927364;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kko4zjOXBRybFPzuRuUxh6d2fqu3VVvE60ZOuuaPtno=;
        b=XfIHzDsTOHvSoZHxuCNWfntpi4LbLvjolPia81/b57lGA07r7IRHbtTrimtYnM6d2y
         kBXjR8TW4Dw+La/km5zcwsf79lKr3eag3OZq2rPmmE4ss6ml9cll4dLCC80NXzB8cH89
         MfQ+eE6xDt4ZMPTfCS45Y4OYul9BRdVGGlw/9sNyf6/3T0BibiwDLFFPjgENb134fVm9
         i/9k5nNI37d9U80V+6mdHmjGGY5uXAQ7VIDel3sZR0GiuQrAPW0Wx1jWEAiYwnvvMg8h
         ATYyz2wMO3Df72QDXaTncFQqk4Ruypf+ahhNfKfIU/uoD3dvH0o0yklb+kwkTIB7S1D2
         zbDQ==
X-Gm-Message-State: AFq9FYLTC+I8b6+A9NY4sZAw9O1NLdgin9mSgBbeMQsGFlibCPqiRtaq
	uUvY+NQLjuYDjWESMMHBKBowWVo+hbuG+YiGcMwjwR3rJsTw+lOAN0Tf1QImqs+5q2M=
X-Gm-Gg: AYBFou1nIyXna6NHrqqdbV6z+Xv1sF0jQWaTTWbhs6gZy2bh2ovpYc844VFyXHlPCK4
	7YENmmmqqya7QsxeNu1cnZe6kpko7cocsKBL6t9Xr9/ABfMS00QqwvPADdWrG4ZqH1K2Kno2tSL
	eZ/8kEVcQsMdohE3AAtmebYdEGuTZ58vmTiQopouf61GYbSElN63cZxuID6DioEYLpr52xNcs/Y
	HQcH5KS+RvwlG5KrQx5ZIEp3K2/mAAd4OhBVsNI+Vshhw8j8uRoHZ7Jt2PjjwGStgfr9cGubBzM
	BfwbBkOIaToWYOgwl4dhb2dliDnP515PYcMAhUCDMIu5gSX5k5ZFTahWAQvrHB7nKWFbpCcTo3q
	oISpZtKvlG0ZUyrSet1vf6Pdq0g7FQvujvVoqiS5/ox/gbWS+bkEeCDoa/CIODckezsSya0a7vj
	QnYSTMdzGyA3LoC2nVy1DQaOW6KgA5QeR2MJqZGE5bwFIRVBKBVbRhIH/xKl15/mS26fkdAA7MI
	+6s/no5ItdwkN7RBPchmauvXb5QtB9uo/eYCdj4xNkur4V3KtdCcaCVdZPCRAc3qSqD3m+d63vs
	KuzdnI2MYFAHe7an9PruRa9tWKRLjtBvRF3vWvx+Ufeo9Z2ELYtb5Wg=
X-Received: by 2002:a05:620a:618d:b0:93f:5ac:14a0 with SMTP id af79cd13be357-9442171a0cfmr155775385a.67.1793322564021;
        Thu, 29 Oct 2026 18:09:24 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425a63770sm9406185a.24.2026.10.29.18.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:09:23 -0700 (PDT)
Message-ID: <0662c55edd8623628717a17de93be3e79343d017.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: rkvdec: vdpu383: configure the reference read
 cache
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: vlry.bkv@gmail.com, Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner	 <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 29 Oct 2026 21:09:21 -0400
In-Reply-To: <20261029-rkvdec-vdpu383-cache-v2-1-859bb44e03a0@gmail.com>
References: <20261029-rkvdec-vdpu383-cache-v2-1-859bb44e03a0@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-chB0utv8MYz8DSoKGRbr"
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


--=-chB0utv8MYz8DSoKGRbr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 29 octobre 2026 =C3=A0 17:03 +0100, Valerii Bokov via B4 Relay a =
=C3=A9crit=C2=A0:
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
> driver probes as before and leaves the cache unconfigured.
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
> The registers were identified with the help of an AI coding assistant
> (Claude, model claude-opus-5-5), which diffed register dumps of fast
> and slow power-ups and matched the result against the vendor driver.
> It also drafted this patch and its changelog, which I reviewed. The
> measurements and tests were run on an RK3576 board.
>=20
> Link: https://lore.kernel.org/r/20260619111810.564384-1-laszlo.fiat@tuta.=
io
> Signed-off-by: Valerii Bokov <vlry.bkv@gmail.com>
> ---
> Testing on RK3576 (Smatek T10PE) with this patch applied, on top of
> 6.18.34 with Simon's priming patch:
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
>  .../platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h |  9 +++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 46 ++++++++++++++++=
+++++-
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  2 +
>  5 files changed, 60 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> index 5ec755733..efb1f6975 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> @@ -441,6 +441,8 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>  	timeout_threshold =3D h264_ctx->regs.common.reg013_core_timeout_thresho=
ld;
>  	rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
> =20
> +	rkvdec_vdpu383_clear_cache(rkvdec);
> +
>  	/* Start decoding! */
>  	writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD=
);
>  	writel(0, rkvdec->link + VDPU383_LINK_IP_ENABLE);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> index 3462d995d..6223b89e2 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> @@ -568,6 +568,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>  	timeout_threshold =3D hevc_ctx->regs.common.reg013_core_timeout_thresho=
ld;
>  	rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
> =20
> +	rkvdec_vdpu383_clear_cache(rkvdec);
> +
>  	/* Start decoding! */
>  	writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD=
);
>  	writel(VDPU383_IP_CRU_MODE, rkvdec->link + VDPU383_LINK_IP_ENABLE);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
> index 04eb23297..f64d56a22 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
> @@ -42,6 +42,15 @@
>  #define VDPU383_STA_INT_SOFTRESET_RDY	(BIT(10) | BIT(11))
>  #define VDPU383_STA_INT_ALL		0x3ff
> =20
> +/* Reference read cache, in the "cache" register region */
> +#define VDPU383_CACHE_CLR_CACHE0	0x10
> +#define VDPU383_CACHE_MAX_READS		0x18
> +#define VDPU383_CACHE_CACHE0_CFG	0x1c
> +#define VDPU383_CACHE_CFG_CACHEABLE	BIT(0)
> +#define VDPU383_CACHE_CFG_READ_ALLOCATE	BIT(1)
> +#define VDPU383_CACHE_CFG_LINE_64B	BIT(4)
> +#define VDPU383_CACHE_MAX_READS_VAL	0x1c

nit: I tried to find better meaning and why 28 is better, but didn't. If yo=
u do,
perhaps document? They also call this "max outstanding reads". We could add=
 a
blank line to make it clear is just a default value we picked, we could eve=
n
call this _DEFAULT ? Just ideas.

https://github.com/rockchip-linux/kernel/commit/b6a726b6cace3d7e6cfac109766=
b14bed1e39d5e#diff-0f3228bbff65fb9bd56a2b9ed33cc9ee55565caed231da6076939ce3=
97064835

> +
>  struct vdpu383_regs_common {
>  	u32 reg008_dec_mode;
> =20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index fbcd0f175..405df54cc 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1158,6 +1158,29 @@ void rkvdec_schedule_watchdog(struct rkvdec_dev *r=
kvdec, u32 timeout_threshold)
>  	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(watchdog=
_time));
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
> +	writel(VDPU383_CACHE_CFG_CACHEABLE | VDPU383_CACHE_CFG_READ_ALLOCATE |
> +	       VDPU383_CACHE_CFG_LINE_64B, rkvdec->cache + VDPU383_CACHE_CACHE0=
_CFG);
> +	writel(VDPU383_CACHE_MAX_READS_VAL, rkvdec->cache + VDPU383_CACHE_MAX_R=
EADS);
> +}
> +
> +/*
> + * Reference buffers are rewritten between frames, so the cache is clear=
ed
> + * before every frame, as the vendor driver does.
> + */
> +void rkvdec_vdpu383_clear_cache(struct rkvdec_dev *rkvdec)
> +{
> +	if (rkvdec->cache)
> +		writel(1, rkvdec->cache + VDPU383_CACHE_CLR_CACHE0);
> +}
> +
>  static void rkvdec_device_run(void *priv)
>  {
>  	struct rkvdec_ctx *ctx =3D priv;
> @@ -1807,6 +1830,19 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
>  		rkvdec->link =3D devm_platform_ioremap_resource_byname(pdev, "link");
>  		if (IS_ERR(rkvdec->link))
>  			return PTR_ERR(rkvdec->link);
> +
> +		/* VDPU383 reference read cache; device trees may not describe it */
> +		if (rkvdec->variant =3D=3D &vdpu383_variant) {
> +			if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "cache")) {
> +				rkvdec->cache =3D
> +					devm_platform_ioremap_resource_byname(pdev, "cache");
> +				if (IS_ERR(rkvdec->cache))
> +					return PTR_ERR(rkvdec->cache);
> +			} else {
> +				dev_info(&pdev->dev,
> +					 "no \"cache\" region, reference read cache not configured\n");
> +			}
> +		}

I'm wondering if this can be simplified, skipping manual vdpu383 hit, and j=
ust
go fet the cache. Though, I see that RK3566/68 might also have a cache, wit=
h 3
slots ?

>  	}
> =20
>  	ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> @@ -1875,8 +1911,16 @@ static void rkvdec_remove(struct platform_device *=
pdev)
>  static int rkvdec_runtime_resume(struct device *dev)
>  {
>  	struct rkvdec_dev *rkvdec =3D dev_get_drvdata(dev);
> +	int ret;
> =20
> -	return clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
> +	ret =3D clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
> +	if (ret)
> +		return ret;
> +
> +	if (rkvdec->cache)
> +		rkvdec_vdpu383_config_cache(rkvdec);
> +
> +	return 0;
>  }
> =20
>  static int rkvdec_runtime_suspend(struct device *dev)
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index a24be6638..ab13b880a 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -136,6 +136,7 @@ struct rkvdec_dev {
>  	struct clk *axi_clk;
>  	void __iomem *regs;
>  	void __iomem *link;
> +	void __iomem *cache;
>  	struct mutex vdev_lock; /* serializes ioctls */
>  	struct delayed_work watchdog_work;
>  	struct gen_pool *sram_pool;
> @@ -180,6 +181,7 @@ void rkvdec_run_preamble(struct rkvdec_ctx *ctx, stru=
ct rkvdec_run *run);
>  void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run=
);
>  void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len);
>  void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_thr=
eshold);
> +void rkvdec_vdpu383_clear_cache(struct rkvdec_dev *rkvdec);

Overall, looks good to me.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =20
>  void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
> =20
>=20
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> change-id: 20261028-rkvdec-vdpu383-cache-8fbbf8313da3
>=20
> Best regards,

--=-chB0utv8MYz8DSoKGRbr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauPuQQAKCRDZQZRRKWBy
9GQqAQDHLM5SlCbk/wJ0SRV0odUpbr3Lg/xoKBqKoUJVueFzQAEAiY+dzhDBjmpM
bTzbyWcvpoUlskrmDn0slsq1fJ0cpgI=
=Qz1r
-----END PGP SIGNATURE-----

--=-chB0utv8MYz8DSoKGRbr--
