Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795816506;
	b=YAsaGu8uTEO7aCPT02UX3Oyj7Kfo8Jg8N2eTnTQvhRq48zA1sabhOm6n/FvEppC37qXz
	 rnrYUFSj8Qc9jtPB4IEs1DanbGVBdPbCgVKyprEPd2W3zxkPQQrL7CepI/SU5/ke8EVod
	 haMYEEkHS3b4eqa5RqYotzq16i7qfvdaGtVnom4v++xuaeQDuSJ+sqg4P8LOCVsWYXNMT
	 R3zjFcmCbpSt2wg1Sxnq8xyhQJhVKhWlyexNQ68iJMYOKTi0fRNVjgaL+5pTh3h2CT8BA
	 vAbF8Jgoc/ZdtRuQbm54Sxk4665ZRNi134bPCytRv61D/+zsA4rUjvA6b5X284ofQQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795816506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5KFXhFrUkKWYUY9c8iRPWTw4G5iLt5Wu3CiyUP9i3fM=;
	b=wpNyoTfJgwJ4uNRBkRXFRSklACrIjQd4d4lH/1UAP6COQapRBa3SCLlUCJWJPJvU97e0
	 G1wwGbbvVv8WhHTt4AhUf03Izczg++9OkR6FewVxFZHy0z8oEXEhFXi2P4pX5RhFv2CeY
	 3wh75YA+YBKOPhmNzph8sZOoS0vT30dweP6K25Ow1ROP2qO32/zcvAVIINzIAjKZD+/iy
	 fPqZ8kzgIv+296y6pspfSrDiDsTbI7uDQCcOtxpAlGLTCClIzo7hgPDB+/16HMsgOuFbz
	 Sj0je0jXcQhKXuE00iWZ8G15rbnQf/reGPUKJWa5lCQl/RsnwQnyX26Rv2qxLpW7YLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rq3FoQgg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6032606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 21:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6032606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rq3FoQgg
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ae85e3685cso60325631fa.2
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795816504; cv=none;
        d=google.com; s=arc-20260327;
        b=pgScJgRbFbkD3cbysznZWl0JTHFtcFaIZ0SlrXDOKyj27zfJWF6KBi4yBSk7ICkRJa
         SIyo5ASc3jSDl+b2j68bDrr8gUEpwga7zd+whH6MnfcImSLbpJ0QuVUd7IHpRt4ik4+a
         Ztbp02VjtVYGHjKvtQ1BgUnujgpIXFsXKY9WL7dHt0NO3wYHgswDIyqzYkLrEEQwYWp1
         oI0ohLpAZR/UwmEvimv0ZidOBrNvEM7bH/7k/7GmS88jqj/52i222xDhw9vk0amm4muN
         RTSUr3vvmin7NP8AVIjRLGUgB69Zm5ns4q9EYrGlWxR2JohiqXNIxtg2KN26eYAD200a
         e3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=5KFXhFrUkKWYUY9c8iRPWTw4G5iLt5Wu3CiyUP9i3fM=;
        fh=Jg4RwPXSZ1l1Qo7p30/IxS9g7GaTh1fRh+XrBsohLi0=;
        b=iAEVbndqROlfqaXyHvyd/VrVFs+X3OAfcTjIgORSRdWcmvty4+iU1zJIq7I9TntftF
         kWDsprbRXN3B38KuN1ZQ0QS9ScK/BRbwezHccpooOyTe7G/TMEYzqyBzrgwiOL/jDK5g
         BxWJSztTVnE9aKzhFubBFWsJRxE8ewksvt614ZdflLWNBnZIsm2mHKJtRs2p2cnagnQd
         s/1IaFE1TFtJXMppZ63ZDg+iHvoeQDsfSDjqApnhTe5G0GaoRevI6i8UkK8RGYfcond8
         VA/fxDZNKkczLXkGC2i6OabA5k+swByKNUDxeNRmlrunqIiXYL80u5VR3LMKbUbsdTPu
         7LAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795816504; x=1796421304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5KFXhFrUkKWYUY9c8iRPWTw4G5iLt5Wu3CiyUP9i3fM=;
        b=rq3FoQgg5mkk3D0E8y0TgE7EQv4PVMi2xMkqs4MsZ2SiHajeo3oemTYNkBaJGLYVFt
         uEe57WGU6APFztYmZkhp3EM4uuNq9f6kwQp2KMAClS1iRWZViDFZJLmhFK8boBc/46iI
         JvutWlIT/hnKG6ZzMce8kdAuACxNFkfah78eKGEh78etX9ps70bgkpZA9DnsRWXSsAhj
         paQtFW3WpWNe8RddLso2Z7K9tgqZ4/u+p1wex1aLdeOU0xJf5IXj96+KM+UAVsaAVx/V
         EVZ/87CFDqqDAWseXdmFxOlyclno+N0EI/DxCUlkSX9WjPzWsWEqNNeRls9U5SMWkp6u
         AY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795816504; x=1796421304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KFXhFrUkKWYUY9c8iRPWTw4G5iLt5Wu3CiyUP9i3fM=;
        b=S0FiCO+JwbJdwB3v4Tsb94dYg89lzjChpyPWbXz79nH886ozXk35WN88GdQTiVGy+a
         koOLkAzHqMJrh2obFwD2lg5hsA2W8+rwf/bLduc1w8MxgvbWT2LgjmJhda7pPU9Zge4Y
         J5a2Shm/IxaU7/LSZ9rNxdRiw2kHJRt89IxSbCrk69pM5qnSqnqJ5/AXDSluPs5h0kT8
         nI9V45ySntr7FPEVt/q6nYe1298VWE/YKUtn+jLaJwW65h8HiZQiVvYGyPB8aju0HUvS
         Tyi/iLGlw7YCwfD28tt4JVCh5G2tflb7vScvyAoaYyNwH/cfGDozbGdZr5vbGlsNu6Kv
         6L4A==
X-Forwarded-Encrypted: i=1; AL+hErGJEyDurqM0EWb83AWGl8AEG/ZYpbp/jLAzsrwQwTjJgb27Cs4/FUN4Rx07MDM2DCBCm+bMW5m2DPGAQw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8uvaDUXKe6iKD5P3WIhHF06V6LkTgAyEnozYZQdVOkf/Kw2dXw
	wiiO5UiRfHbXL+gnFAh6k1L4547H8z8yjcjg0Jd65yG7cbV6n0j0EiZsm1BVSlhAU8nv0o5tGyL
	EFlgreY0DHSbHexIamwdIP/dWg7JhPRs=
X-Gm-Gg: AZFdTZewvmhKwLpSXOEFXffEMLhbj/B37t8WcxPgCvGnTMhgYPb0nMNqaysekro2P1Z
	7NqEKQO6v7+TatJonzyj3RIf+HNOGxRQX9FJx8RR/jSzqGtBgmQLM2ab/dMaG1Hcc9MzGBAPd8n
	Zy/LVR+Mq9d5QLA9uA19NHIuC6BXhtqY2cbppWELmwWLPcHD/HsrsxyOcDbFgLKxMh2U9RkkwNc
	WTu6LtUtd0i01efS/mUTGd1lbrf063hFrXdsmMd3GYm2eoKgRqqqDkj0+qqpy6WbTHb4w6vF/K6
	83VyvEtGFFnE905uYsfDy5fj4bxfSL3vPv5J/HyuiLKJA8xFe5kW1bi0LYlSHLMZr/3ZhVkqGCh
	UFBOSmFdQt7pv+1Eoudm1+WQt3q17L4NVOIE=
X-Received: by 2002:a05:651c:211e:b0:3a6:636b:63c5 with SMTP id
 38308e7fff4ca-3ae7fa38eafmr80396081fa.16.1795816503538; Fri, 27 Nov 2026
 13:55:03 -0800 (PST)
Received: from 1087654160852 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Nov 2026 16:55:02 -0500
Received: from 1087654160852 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Nov 2026 16:53:51 -0500
In-Reply-To: <20261127211653.1675314-1-antoine.pichot@gmail.com>
References: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com> <20261127211653.1675314-1-antoine.pichot@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Robert IJtsma <robertijtsma@gmail.com>
Date: Fri, 27 Nov 2026 16:55:02 -0500
X-Gm-Features: Aa3M54r0v4V6UhWiGoC2eAm-dxa1zgGNQ51lfx17j2cp3gUYYJZCIvZp4Wageko
Message-ID: <CAPcTEm9kJwZw2_i06e_vp+hH_KMNO0nP4x57ZEuhebDJ84aC3g@mail.gmail.com>
Subject: Re: [PATCH 0/4] media: i2c: ov7251: runtime PM, non-continuous MIPI
 clock, and strobe OE
To: Antoine Pichot <antoine.pichot@gmail.com>, Robert Ijtsma <robertijtsma@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Todor Tomov <todor.too@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antoine,

On Sat, Nov 28, 2026 at 06:16:53AM +0900, Antoine Pichot wrote:
> Your patch 4 adds the same control as patch 8 of my ov7251 series, whose
> v3 went to this list on 13 Nov:
> https://lore.kernel.org/linux-media/20261113024059.1087031-1-antoine.pich=
ot@gmail.com/
>
> Mine drives the same STROBE pin, for the infrared emitter of the
> Surface Book 2 and Surface Pro 7 and 7+, and its
> V4L2_CID_FLASH_STROBE_OE is off by default too. The main differences:
>
> - The pulse follows the exposure, from 52 to 776 lines as the Windows
>   driver clamps it, and never more than 45% of the frame. A fixed
>   512-line pulse lights about 60% of each frame at 60 fps and 90% at
>   90 fps.
> - It lights alternate frames (pattern 0xaa), as Windows Hello does, so
>   the dark frames give the ambient light reference.
>
> Could you please try my series on the Surface Pro X? It has only been
> tested on Intel camera interfaces (IPU3, IPU4 and IPU6), so a Tested-by
> from your Qualcomm SC8180X would show that it does not depend on the
> platform. If the Pro X needs every frame lit, I can add a control for
> it. Patch 8 depends on patches 5 to 7.

Thanks for the pointer! I missed your v3 series on the list =E2=80=94 your
exposure-clamped strobe span and 45% duty-cycle cap are much cleaner
than a fixed 512-line pulse.

I just built and tested patches 1-8 of your v3 series on the Microsoft
Surface Pro X SQ2 (Qualcomm SC8180X, CAMSS CSIPHY3 -> CSID3 -> VFE3 RDI0,
OV7251 rev 7 / 1F at 0x60, 19.2 MHz xclk, 240 MHz link frequency,
with non-continuous MIPI clock gating enabled on 0x4800 for Qualcomm
CSIPHY):

- orientation (Front) and rotation (0) parse cleanly from Devicetree.
- With strobe_output_enable=3D0 at 30 fps (640x480 Y10, exposure=3D550,
  gain=3D32), dark baseline mean is ~16.8 / 1023 across all frames.
- With strobe_output_enable=3D1, alternate frames (0xaa) light cleanly
  from frame 0 with zero bleed into dark frames across all three modes,
  including back-to-back stream restarts and mode switches:
  - 30.00 fps: lit ~193.5, dark ~16.8
  - 60.14 fps: lit ~80.3,  dark ~16.5 (45% duty cap active)
  - 90.43 fps: lit ~58.6,  dark ~16.7 (45% duty cap active)
- Howdy's dark_threshold skips the unlit frames automatically, so no
  extra all-frames control is needed for Surface Pro X.

Feel free to add for patches 1-8:

Tested-by: Robert Ijtsma <robertijtsma@gmail.com> # Surface Pro X SQ2 (SC81=
80X)

> Your patches 2 to 4 conflict with mine, mostly because my patch 5
> converts ov7251_s_stream() and the driver's lock to the sub-device
> active state, so one of the two series will need a rebase. Your patch
> 1 applies on top of mine, but my patch 7 moves the common registers
> into the global init table, right after the software reset, so your
> wait would then come after those writes instead of before them.

Agreed =E2=80=94 I have dropped my patch 4 in favor of your patch 8 and reb=
ased
the remaining three patches on top of your v3 series for my v2:

1. Issue 0x0103 =3D 0x01 explicitly in ov7251_set_power_on() and wait
   5-10 ms before writing ov7251_global_init_setting[] (good catch!).
2. Use pm_runtime_mark_last_busy() + pm_runtime_put_autosuspend() in
   ov7251_s_ctrl() and ov7251_s_stream() so the 1000 ms autosuspend
   window is actually honored across stream restarts (which also lets
   your patch 7 keep the common registers alive in software standby
   between streams).
3. Support V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK on 0x4800 during power-on.

I will post that 3-patch v2 with Based-on pointing to your v3 series.

Best regards,
Robert
