Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096804;
	b=l1ZLIa6wpqy1IfK/zVppIft0y0qQZGoK8ogHLoC3Nc2T/8ci9b/xBYRqD0CUrcyawz80
	 vsSMpNcNbVtwbt0NFn7FU8zKGoIuZALZS7xluiJdQxhVCfpIdB0B3kUTrzxgkx8YENotC
	 2Y9R+0qHny4RqR4b017Xgf59Mln7x1cGxsGUn4hJbXm3jExEO90fxpMEEFIapk20qEEHE
	 N6Jt5awruVbShnSKFcwbAkYZcvoh0vj+Mukkl0Evp3RPkEntjKOTUl8arDd3B0wPOIHPe
	 +oyJy+bFsnrh9f36yqDuDf8hNzJaS3tzdAmUV2bQ9NvQ4l4PlPL4rfbHY/rmFikleMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096804;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kf/5mGeviQ9IqvCDXNAwVOBtGQf0/RjNBw7LcnbKbJc=;
	b=0EuYyFkhpYX94L0oGsvwAvDtifhADmxHkBskEkYgeUF1oZcItHlufhrXJRwllIPAF7Dy
	 XwBHSCGYoMfzrICIFX0nA5inZyaPHLNObxlX6Do8QlFJ+srqcxDDdMsqLQ0LtbX0cNu0b
	 omi6nagd7/gPsZdsFtw+t+Du/tXUvPage+VwnS1V2PFT1T1NtMK/9K2h0cLB6L51H2r/h
	 eSn5Uc0W9WkRPdrH77xNqK3EcBl6Y/XB8EQ6Uqlima+IO64jho2/L7ibCyuFdiES96cs2
	 REIaG3b3ODy6oFAnkZDuh+9shD9gehYfKF5Ivi+SCDQ/JaaIEvdsX2m14Ks7/rmb99Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC78606A31D
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 10:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CC78606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so21682565e9.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 03:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096803; x=1793701603;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kf/5mGeviQ9IqvCDXNAwVOBtGQf0/RjNBw7LcnbKbJc=;
        b=DZ5PPdyOjRujDw9RLH1RrbX0iwQs2pIarnhrIkzUDdJ4VS2OJ39CVOGwcirWZIfFNM
         O5oAPz7nNtNqSE0EomxrrMu+ask1Bcs7SOZRPIj3cA0GfgP81H/n07NbC3TEyxxhrHFE
         TcssIe+yQz8EYuE29HoC+3LmitphAf8hqDZN9ID5V7VLflM1RlUjXmflHJElP6CGCNsM
         tGohGjijt5PIgKAujJGPJQH4TBKGSZTDYLRpq7De1WRLbC0W1HHuH5ngxuYFbYDgRf0d
         U7VOg9mtmSI49rSwULI904QxVyVOTuwMnzL6+6nkrXD2i677vmXlxGWawoSHWe+Cxi/X
         WxmA==
X-Forwarded-Encrypted: i=1; AKwUvBw/l8PG/pw203+FtrsjwlZTQaCChaTOEI2oTglx05wPNNyxZin9vrAW7EwICfkqa+c1e3xlv/FxGzbAvA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvjP9f5cUNghMiYaY4Odpf80YGSHx4Ymqu2qK8zFCKNOf9q1D5
	wKwVP1ivI6TWsadtNkvdcLSUnXQ9sqtfuyctOw3xkUTBI9DmMp55mw0=
X-Gm-Gg: AYBFou3qIIJRpI7gDeS2SBKBNBeJit81NXH8s8yuBCTC8fiEX3TnhGfOOKU41TUy415
	2nutrtiXAL4In0c/Zr5Eg54w4It0aGVowKLOFYvu3QnAfohHZGFyYi+pBM2CdsbSPx/udaAeOG7
	X7ZpuW7AemaYk7U5D+stKltb/o1HnUQMYPIkhC+8keckw4yvOdjpB3EVmnz6r2LsUnFY2Ja5SiC
	lNGZ0vlGFHIoMYFx906yhhFi7rtKObKIcJjPo+zmG68pkzUUmqQO1oTmQpkmr2deSVddNJmLhkE
	TxiVqWYG6TkGHoyiP3XLXXwnkGxF86kHJNQwS3MqqzETJfoLLwMjNwkssEv3dnmzr0d5pS6zIo/
	NnmNeirZo9GboobrSiMUT8iH6WIsbuzon9IW7uggvqjD3xcAABrk2FiDS3j7O4d9zbZmbXk4Zur
	AaNO9pwGE9ddu3cFw1QxLugDiEaDHrDouVRgr3l/efXyV+IkGpGkrWmycxj01MmRXqAowCISnQq
	skra31F/IHGssALQOUvfEWpa76EbaxKwORloIhALafHDhPDOf1/nDGOMitSw8yfOBA1hOfLQFQr
	otC6J8/wnmKchxnyTMEheWtXELD6uOao9IrSxk8=
X-Received: by 2002:a05:600c:3e86:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4a35aca5f94mr176916205e9.23.1793096802498;
        Tue, 27 Oct 2026 03:26:42 -0700 (PDT)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f3e00asm444137735e9.0.2026.10.27.03.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:26:42 -0700 (PDT)
Message-ID: <6ae07c62.e52dcaf0.293af3.e647@mx.google.com>
Date: Tue, 27 Oct 2026 03:26:42 -0700 (PDT)
From: D. Manresa <dmanresa@gmail.com>
To: antoine.pichot@gmail.com, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, djrscally@gmail.com,
 dan.scally@ideasonboard.com, hansg@kernel.org,
 andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] media: i2c: ov7251: fixes and infrared strobe for
 Surface Book 2
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Antoine,

I ran the series on a Surface Pro 7+ (IPU6 Tiger Lake, 8086:9a19), the
front-facing OV7251 at i2c 3-0060, on a 6.19-based kernel. Patches 2 to 6
all do what they say here, so:

Tested-by: D. Manresa <dmanresa@gmail.com> # Surface Pro 7+, IPU6 (8086:9a19)=
; patches 2-6 only

I have deliberately scoped that tag. 1/7 is a regression on this machine
and I have replied separately on that patch; please do not read the tag as
covering it. 7/7 is keyed on DMI_PRODUCT_SKU "Surface_Book_1832" and this
machine reports "Surface_Pro_7+_1960", so I did not build or test it.

What each one did here:

2/7: reproduced the bug and the fix. Unpatched, --set-subdev-fps is
accepted and reads back, but the VTS register stays at 1724 and the sensor
keeps delivering 30 fps. With the patch:

    requested   vblank   VTS reg   measured
    90 fps      92       572       90.45 fps
    60 fps      380      860       60.16 fps
    30 fps      1244     1724      30.01 fps

3/7: v4l2-compliance on the subdev goes from

    fail: subscribe event for control 'User Controls' failed
    Total: 44, Succeeded: 43, Failed: 1

to 44 of 44 with no failures.

4/7: camera_orientation reads Front and camera_sensor_rotation 0, both
read-only, consistent with the _PLD here.

5/7: no functional change observed. With the new control off, the
registers read exactly what the mode tables used to write: 0x3005 =3D 0x00,
0x3b81 =3D 0xa5, span 26.

6/7: works, and the register behaviour matches your description exactly.
The control appears as strobe_output_enable and defaults to 0. Read back
over i2c mid-stream:

    off:  0x3005 =3D 0x00   0x3b81 =3D 0xa5   span 26
    on:   0x3005 =3D 0x08   0x3b81 =3D 0xaa   span clamp(exposure, 52,
                                               min(45% of VTS, 776))

Both clamp limits are exact over a 12-point exposure sweep from 1 to 1704
at VTS 1724, and the duty rule holds as VTS varies: 1724 -> 776, 1280 ->
576, 880 -> 396, 680 -> 306, 572 -> 258. That last one reproduces the 258
at 90 fps from your cover letter.

For the illuminator itself I did not trust anything but the sensor: one
568-frame capture, strobe toggled 0/1/0/1/0 inside the single stream,
exposure 776, VTS 1724, gain 16, same scene, zero CSI-2 errors, per-frame
mean of the Y10 data:

    strobe 0:  n=3D252  mean 517.58  std 0.25   |even-odd| 0.00-0.01
    strobe 1:  n=3D169  mean 546.27  std 28.81  |even-odd| 57.61
               lit frames 575.4   unlit frames 517.6

With the strobe off there is no per-frame structure at all; with it on the
frames split into two populations 57.6 counts apart, alternating, and the
unlit frames inside an ON segment match the strobe-off level to within 0.3
counts. That is the illuminator firing on alternate frames and nothing
else. The effect is only +5.5% overall because the scene had a lot of
ambient daylight IR; every number above is a within-capture comparison, as
absolute levels drifted between separate captures.

Two notes that might save someone else time.

6/7 does not build on a tree without V4L2_CID_FLASH_STROBE_OE:

  ov7251.c:1688:44: error: 'V4L2_CID_FLASH_STROBE_OE' undeclared

That CID is not added by this series -- it comes from 5be4154f6255
("media: v4l: ctrls: add a control for enabling strobe output"), which
landed after v6.19. Since 6/7 uses v4l2_ctrl_new_std() it needs the
v4l2-ctrls-defs.c entries too, not just the uapi define, or the control is
never created. Worth a word in the cover letter for anyone testing on a
stable tree.

And on this hardware the series supersedes the out-of-tree Surface
driver's ir_led module parameter, which drives the same two registers.
Measured on the shipped module while streaming, that parameter lights
every frame with the mode table's 26-line pulse, about 0.7% duty at its
production VTS of 3448, and never updates the span. 6/7 is strictly better
behaved. They cannot coexist, since 5/7 removes those writes from the mode
tables, so ir_led would have to go when this lands. That is our problem,
not yours.

What I did not test: 7/7, the 60 and 90 fps modes photometrically,
v4l2-compliance streaming, and whether the pulse follows the exposure in
time -- I verified the programmed span, not the pulse position. The
photometric capture was taken with 1/7 reverted, since with it the link
here is too unstable to capture reliably; the register-level strobe
behaviour was re-verified identically with 1 to 6 exactly as posted.

I also had to rebase onto v6.19 to build at all, because mainline's
ov7251.c uses pad-op signatures this kernel does not have; the unpatched
file fails the same way, so that is unrelated to your series. Patches 1 to
6 applied to v6.19 with line offsets of at most one and no fuzz.

D. Manresa

(Written with AI assistance, directed and reviewed by me.)
