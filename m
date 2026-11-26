Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713445;
	b=i/VOkCCTz7IcuOMNx/yZy743HA+AuKwX1FETEFI8FVKVszBkCgU5Nf/W4XuNwow+Jb1Q
	 2HZThoHihQuSpHDmaMPG2hEWAgq7bWnr+80OU94G3Z6wjo4XkWUEgA6OOJ5L244KIlXHg
	 WXxrvWraSV5Dd+V80IJM6ueQBkNYDk7TnMTIyxpEO8AuivYUUjeOUtqDf6YYWF0lc83Bw
	 TU4fPPi9QXDbcTfptOxOoWbtPI2WOIgRQL6B3pYg5l4Wmyj05wiig7HGQQp/vrNf6tMmC
	 xg3mDA0pa9yu4JlOT2X7pydTKmeEwFhYPIajY3wEFL33scKBLuD5l06oHwRD6EivMzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
	b=isx3zwWK2nU9QWCuQOOKZQQ9krzp3AnAKsjgkE23+3a2NrYV9bIjEC/IgdELAWJluoMz
	 8Axva7v299N8bL2eE9q14SI4LTWsHmkSwtcXRRcDbTAv2mbPhXjS+xB0i3fviaqxqOIDb
	 ebkRoLr6/fpOh0KeXtkMbIuH48QxQWHbypAQbnP25nXSyXtMBNAi1d72psxmwjqKeB4it
	 KxNT0s7sPuOjTt0qgvip2cPt4477uilf3fcV/fF1AQ/FEoswelpx9ZgPa4twl3YYt2GCu
	 nlmmr5MqY5Iv3fcIGL4CWY9xLbbj+xeldEDPYpditzer40FGJPaWuP5AR5+NMUCjBcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wrn4bv9i;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A0B606A326
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 17:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A0B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wrn4bv9i
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490f38e9688so5066764f8f.0
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 09:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713443; x=1796318243; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
        b=wrn4bv9i2F7ZbfsSqvLyZK6M43Y/6Zr+ZtT98bumoX1W8gq3NagIWl18dtnUg25j+Y
         KldCdvPomCfgjMpEf6etltlFwDr5eLg7UIdd55al5Z6NtRn1RK8MIcUtla//xrrbpgdD
         GZSdKgjgkT97w/AfxKl/wsKGobZq27BZPJUmSk98ybh62MpxAo3Bm5Xd1UDJn0aOreg0
         GV3ZO4kmlpO5qqHmgkXDeuR4L4C+RJxTrUrvDxBfaSOGOqzzXtdZ45hyLzgOYJUJQZuT
         qYQXg7w/QFbG8eA4da8Bk2ArsLHGe1+fHsDxEdZC4v3ksrOe36G+FeZAkUQA66Y0l/Y1
         p+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713443; x=1796318243;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
        b=uH1G0FhcmmPtxlZtlhqtfYOZ1LLfn/pktarMcmOCQKOvrJIlhw3Id32lS7jU0Oh29n
         IINQ+B3Fmix7Z6gqi4ph2EuMpwJ0+GH3Gtc+eNi+G2un5GFYSxfC+96rASRg4JdzEv3u
         2HdoBluVBaWURGagny/DffZKaGU2wAaSxmV0BUof6yhdhW9v5cNJ/NaPjlNtdxSdj6VZ
         8eK1dG2brTuZb27nX08LDXS7fQRRAdwtWao1QM301WGOPIqKfX/epQsoctvrt5xqHEYf
         RMSyGMq/Ne9ul7V5MYQW1BEH7zL7277WyjnvmU80c3OrcowK/krScQy5irBZU9xKuxO3
         M8IA==
X-Forwarded-Encrypted: i=1; AL+hErHozqZwW3jdv+k/MXC46FLiO7MEuHFVIDxgToMo+M/heD03Vz3gYKewIWuXNDoNx14wlc5cIDlOmx5q7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8yzBELoiudSbP4uWI1kqRSDMcPqvW9UdLbQm18I3M4kwYzallC
	dtmAXVHnQnLnpkZ6AFbnyd2Agio74iA3cfXp7SEEcdD+ZPI/Foyyo61+
X-Gm-Gg: AZFdTZdQz1gbLlCG33B1Wtlx2FfG/wHyjWPtc3XCeLJ8Q/iVtYFAIdXET+x7F9IJPic
	JoCMrvDv36k94MQyVIeW1A98jqbDCDvXndryrH+mL/Ic0EUs3NUVWeHOXBeF6ymi+T6j/V/v/y3
	kJ2db7MCj74M2fjlOPQHIE83fn9vBP2osQokD6u5I2OkLIGH4j/VqL1/oPBV2ii8nxAkQk9UlOG
	DQkOFBGX5W1fu1kPUTSNF4J6iIK4jdwqTZcRUOJyWXhfgQAyQLmnMEw+MojzjQYqEZiomosJfpO
	XQfxXIVTp6Okne9PWSC9vn+HRbmrWgA10SzmTkYJhN/P0U2WJHcUK3WO/DhoncrkOxkvZtctejW
	heMTI6rZsQhsIRF5llp+3Qs2i3Ay/4yh8Gb2cckWNbj8PTkaboJ0RdP8ZyYtk5wXK1BqLRU/483
	dg41P59XG/HMNzhOEgJ+kJR+5f8MMU7v2QhhxNQ+D72HRocP++gOexRMlM71jhIFwIq/PSQ9xCi
	lCee9UU24ypJ5XSQT6IRuCP+B5B57mU6lNlrsssaOAui6+6fYGnRnTbZ8jNSxXQcakf7b24kFR+
	4pTBkeYtbLgjHH1BmQDX89E6hvG+kzI9y6xACBYq1te02kCshtlaorcTIkJpvB49cD9ZhDyrqfD
	+WnNpoTEYg89kZpDasEmnysTq7FUE4Enul3TcEhNvRX4FKRHdkAUA/Qjco1U7qC6M4nD4Un5jjF
	LPEPUAvCx2phej9wni9Di6Ys79AvVgUwHNShnA3LhFr6CsV9UAcglcDxr4//a9O1qfVLvo3GMU3
	PFWUfLbTUVcCC1Hytcp9PwSSeuDE7G6vPhdHmqe9194Ruv/+2+3hkqYF9DwUWUt5oDjdhQO5qhk
	X889yG4F
X-Received: by 2002:a05:6000:4028:b0:4b7:6dcb:e909 with SMTP id ffacd0b85a97d-4b76dcbeaa9mr18536789f8f.8.1795713442699;
        Thu, 26 Nov 2026 09:17:22 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm39409423f8f.26.2026.11.26.09.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:17:22 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 aiyengar1990@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH] media: cedrus: vp8: do not disable the engine when a context
 stops
Date: Thu, 26 Nov 2026 18:17:20 +0100
Message-ID: <G0WUYb9qQ46JcwzsVuhrfA@gmail.com>
In-Reply-To: <20261112-cedrus-vp8-stop-v1-1-27d5ca038578@gmail.com>
References: <20261112-cedrus-vp8-stop-v1-1-27d5ca038578@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 12. november 2026 ob 17:08:44 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> All the contexts of the device share the one video engine, and the m2m
> framework keeps running the jobs of the other contexts while one of them
> stops streaming: stop_streaming() runs under the device mutex, which
> device_run() does not take. Writing VE_MODE_DISABLED from the VP8 stop
> callback can therefore switch the engine off under a picture that
> another context is decoding, which then never completes and fails on
> the watchdog.
>=20
> Every job selects the engine mode it needs in its setup callback, and
> runtime suspend resets the engine, so there is nothing to disable when
> a context stops. Drop the call, and the helper, which has no other user.
>=20
> Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

This is correct, I have similar patch on stack. However, helper to disable
engine is useful, but in different place. No worries, I can reintroduce it
once I came around to post fixes for concurrently decoding issues.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Tested on an Orange Pi Zero2 (H616) with the same change on a 7.3.3
> kernel that carries further, out-of-tree H616 cedrus patches (VE behind
> the sun50i IOMMU). The old behaviour was brought back on the same boot
> by a temporary test switch for comparison. The test is a 4K H.264 decode
> through FFmpeg v4l2-request while a second process opens VP8 contexts
> and starts/stops their OUTPUT queue in a loop. With the old VP8 stop the
> watchdog fired 12 times ("frame processing timed out!", after two IOMMU
> page faults at address 0), only 289 of 300 frames came out and the md5
> changed. With this patch all 300 frames match the reference md5 and
> dmesg stays clean.
>=20
> On media-committers next, the base of this patch, it is build-tested
> only (arm64, W=3D1, no warnings); it has not been run on that tree.
>=20
> This patch is independent of Jernej's pending series "staging: media:
> cedrus: assorted fixes and VP8 4K support" (v2) and also applies on top
> of it.
>=20
> This patch was developed with Claude (Anthropic) as a coding assistant,
> which found the bug and wrote the code and the commit message. I
> reviewed it and tested it as described above, and take responsibility
> for it (Documentation/process/generated-content.rst).
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c  | 5 -----
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.h  | 1 -
>  drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 --
>  3 files changed, 8 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
> index 444fb53878d1..a22a8402fc60 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -71,11 +71,6 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
>  	return 0;
>  }
> =20
> -void cedrus_engine_disable(struct cedrus_dev *dev)
> -{
> -	cedrus_write(dev, VE_MODE, VE_MODE_DISABLED);
> -}
> -
>  void cedrus_dst_format_set(struct cedrus_dev *dev,
>  			   struct v4l2_pix_format *fmt)
>  {
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.h
> index 6f1e701b1ea8..4edf729c556d 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> @@ -17,7 +17,6 @@
>  #define _CEDRUS_HW_H_
> =20
>  int cedrus_engine_enable(struct cedrus_ctx *ctx);
> -void cedrus_engine_disable(struct cedrus_dev *dev);
> =20
>  void cedrus_dst_format_set(struct cedrus_dev *dev,
>  			   struct v4l2_pix_format *fmt);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_vp8.c
> index 969677a3bbf9..4438c7e1bbda 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> @@ -856,8 +856,6 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
>  {
>  	struct cedrus_dev *dev =3D ctx->dev;
> =20
> -	cedrus_engine_disable(dev);
> -
>  	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
>  			  ctx->codec.vp8.entropy_probs_buf,
>  			  ctx->codec.vp8.entropy_probs_buf_dma);
>=20
> ---
> base-commit: 3fc9303dba01676c2090768126e5327e341b7761
> change-id: 20261112-cedrus-vp8-stop-cb2d66d855ff
>=20
> Best regards,
> -- =20
> Arun Iyengar <aiyengar1990@gmail.com>
>=20
>=20
>=20




