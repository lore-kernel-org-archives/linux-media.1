Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793117267;
	b=hRgnNgNV+HIVuNtG1/Un5AX+wBqxRwhFE7mUMWxrYhVQP2dHhyoClzokqbdXhVOtLdSQ
	 gqAYcRgmRrPjZVylo0SfvpJXOxTNFra07Aqyy+BZFW7WD7L3ayNvjrOsjMXPj6wotcwh1
	 N1CaoKiHYT70mhRSP2Tu1d53I7KgQ9110Ovj3uCsqlKUcBx3wPxyosVs9bAfe1py7grgC
	 hIb2+90dV09rRc4YsjNgnK9zSP55zw7w5mddhfIk2OpMen/Hryw8gO2nJPPeeMQKp7Ont
	 kHhPKPMwlR0YjyvJVxKOsYYfaL/aup/EcmpYCp0EEXGznprx7uPNh/tN+nkXnnu+qDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=8jPyN8UBAoTt1syShGwjJH8u4vc12+sDCIMGCA9qSRM=;
	b=erDHKoS0L3rmxTUzXnhLfkn5fzgI+H7tCTmGvLrPTjNrV2HG8jqfHLH+34S8m0FMTYeN
	 ws8iaIquuJ5bRODRPVYEXElOnrbp2BrcutjIiA6ZXQnZoQNK4db0X/hMYD4tAThh86gbB
	 BlcrX7lZ1JEz4uAwQVn6h85S3zub/oy8RgZGZllc2y9DzV9/CxSfw+SdnBKMWfpK6cINY
	 Gb1sNXZtwECF7wdkzlMw9Uw8abQi1NDDtJNy4Uh1vWOSUlqD3nhEc+a5dnzBm4KdRcVY+
	 REAS+FNJkcUHVdtmRd6R4EGG5TPd/gk34eSERZcVXJDIARSWVkXJNECDaJcnfCqAn8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jfzLECHW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A968A606A31A
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 16:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A968A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jfzLECHW
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ab432273c5so36605337b3.3
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793117266; cv=none;
        d=google.com; s=arc-20260327;
        b=RktxAXEFRYLgZcqDyXWWplXQ8lrpwsvYzW/8lQ2cScNiPcCWRJpHGSKhkw5Gz/2C4Z
         aDMTZ6zX7XXHtRCWTU0rIgxz3zkzZ8YRFqrGa7RLWDpom67HAzdJs3IJdhu1E9wjjYqP
         rjo4D7yi6D0+epc1iyOpZzj6uvP1C8pIaCohkp3E3ygzdabk7WJoMLTQrgMKYhylPK2P
         xIP38YFwcNjALySMOUzcXY5r2OG2hFOhfwku0lUic4PzmJaNd+p7JJItPBny47xxK8yv
         YF1l7AjsusBCv3ikK2uSVT1i7Xq3U0tcXL/bEAeciAHRRjxchPr+1ukeKOEut9vmqrMj
         JW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=8jPyN8UBAoTt1syShGwjJH8u4vc12+sDCIMGCA9qSRM=;
        fh=+l7UwA2mI2qqg/CiEWSf4gfwP6z31Vtm+Q8s2sTglPw=;
        b=Qz0B5RSO333Gm+YVXwp76bVbhb9KEpmVugKYbHT9CU9WVcwhRvJlG1bPjzY7g+RXOd
         6ACQ4VOu+qBb/kZirTeW41NazwcEc1k9reK4upfjS9KXfUJOJoiX51Qp6IAih4lrKa6P
         TB77ACmKol+ZcygauGQBHE4aC+zvch2LwR3Dir1Z2YP849nbiZhJZrV/xyITFAApgRnH
         uujsm4XDAhmjEMXTQOuzwmTwwp1+aRXtUdLwyBkT+wsBNp0NrlFFmHTHEiJZM2fyRDV9
         3lnw/IgdTPvoaE3zdvas3MeHUjMZiK/lUX9oK+vMR8x8r7EOfH54prXYcFp0qgbi1u3Z
         gndQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117266; x=1793722066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8jPyN8UBAoTt1syShGwjJH8u4vc12+sDCIMGCA9qSRM=;
        b=jfzLECHWtgikqAV3sYKqCY3EVo9ZnNUcHFWDBBDr9Jkx8XeME6ub/D706zos00tQGf
         2GTK1JzUhb/5O4GgRY4NQ9o21M346ZyR98WN+3E4VB1qIT+doQPmWPh6g57hVW7q8TMC
         jQwM6pB2W/vXxKv1KjS9ss4d2mCrO0iVOmE2rPeUTCCY3qyRAdxz/nTRE6No4KFFidRw
         MyX5aSi9U4bnDnrzOHSYTj4iB3hR9pJlO25aOYlUKpkEgzd5zht/yM3eRbFf2S0DrrX9
         Q2QWzVbtwI2GSW/dMEsBvzyJf8sN4x7K+MxhJCB8x8Fnq7gL6RTLwmtt2VW2OAyQtvUD
         s5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117266; x=1793722066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8jPyN8UBAoTt1syShGwjJH8u4vc12+sDCIMGCA9qSRM=;
        b=O9U0SW94TgGdMpHZ9x7Jp1WGBgNkdUfFE3qhAm3hXnN7H3aLpThLg/jBquOUyEamxJ
         Y9NJ7yjmxe4MO5Tm6ms6zHaGI2bt/QATNsk7rzGCO5Y/1Nxn8uNXbT0P4tx7ew2meVHM
         b5gTgErsIwpO2NMOFSDIa+olBtAZ6PEmd7DEAWfeuHnDdke0cY6RcuuyBUEAwawyfOft
         nGiUAeb+BV8kvEo3m9BZr+Q86wkg1hETcj64dLTbQiZwm8/REbdPHWi2SDhtxI52vkpF
         kuHIDq2vzI5nhnBYQZTq3nG+KqJEoy6LdW2gRjzaGjSyUfSGg7DTXuISFp/3ExojPvqT
         NKvQ==
X-Gm-Message-State: AFq9FYKe9Vc3YSFR1Z5+LUnHhWKcOvzzB9TyOXkDA7lKv03B7q0HtBAz
	mZ/MqV97Pmxu0Dfee3pM4BszgWAUManWI1mbsSofSWkHD+nnwZ6s5iNwLzbSsF+jLJCUnHhXWdk
	3W4wX8RGIrmritgRoVEUh6H+bhsmFrCs=
X-Gm-Gg: AYBFou1mYcELqIrJ8ByJ182MF/gvsECUo6JjB0SVcbKqCirW7O4RdkU5gjKcrrAsMYP
	Ab+pPcVAiTg3ZPpHPeEg9t0wNsEJhZPupkgEN+LTsZPKpGRJcD7Yza41iI4oKbhxZheSi+iWy+r
	o/ry4mhdNBAsA1BMi02PlGpSS52x+/5A+ErEHBTSHEYBWS/4D6hKofqkJyuPBrdom357CFBdidt
	hUNosUsxYYRAp4W9pMmywezr8rR+LvNgefpYh/RfP9RYWMyFeDEaXH4CGqs3vztRQHV8Hvk9eak
	GEdzWkVBNdGTEA3UY8AmnZYykuw7P69p8nSQKH7f0P11qCs5PP3o4p0uiXhZ6e8+bt9eY+qe8cA
	dIcY0sgaLPVlinp/zefCO5RkcoxWkucnQtgVMSA==
X-Received: by 2002:a05:690c:e01c:10b0:8b0:d978:db70 with SMTP id
 00721157ae682-8b166cb369fmr65516297b3.49.1793117265671; Tue, 27 Oct 2026
 09:07:45 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: valery bokov <vlry.bkv@gmail.com>
Date: Tue, 27 Oct 2026 17:07:28 +0100
X-Gm-Features: AclHuK8HxBVgGSDH8O5FMY3o9Fnlzoy22rwsKT8VAnGzxxIcOYW2MTlNtInOlI8
Message-ID: <CAN9BvprvMN+PX3nsktab6UDCn=Hy0mbh4WG6FUf6VFX1cuw9aw@mail.gmail.com>
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
To: linux-rockchip@lists.infradead.org
Cc: linux-media@vger.kernel.org, Simon Wright <simon@symple.nz>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

A follow-up to my previous mail about 0x27b00618: I now know what it
is, and there is a much larger speed-up behind it.

What the register is:
The Rockchip BSP (rockchip-linux kernel develop-6.1,
drivers/video/rockchip/mpp/mpp_rkvdec2.c) maps the RK3576 decoder=E2=80=99s
=E2=80=9Cregs=E2=80=9D bank at 0x27b00100 with size 0x600. Before every dec=
ode,
rkvdec_vdpu38x_run() programs three =E2=80=9Ccache reference=E2=80=9D regis=
ters,
offsets relative to that base:

RKVDEC_REG_CLR_CACHE0_BASE   +0x510 (0x27b00610) =3D 1
RKVDEC_REG_MAX_READS         +0x518 (0x27b00618) =3D 0x1c
RKVDEC_REG_CACHE0_SIZE_BASE  +0x51c (0x27b0061c) =3D CACHEABLE_ACCESS |
                                                   READ_ALLOCATE |
                                                   LINE_SIZE_64_BYTES
                                                 =3D 0x13

So 0x618 is MAX_READS. Mainline maps only 0x100-0x5ff of this bank and
writes none of the three, so they keep their power-up values. On our
board 0x618 comes up as 0x0 or 0x2 (the slow/fast lottery from my last
mail), and 0x61c as 0x1 or 0x111. The READ_ALLOCATE bit was clear in
all eight dumps.

Measurements:
Same setup as before (Smatek T10PE / RK3576S, 6.18.34 with Simon=E2=80=99s
priming patch, GStreamer 1.28.2 v4l2slh264dec). The full 654-frame
2688x1520 High-profile clip was decoded with sync=3Dfalse, all within
one power-up held with power/control=3Don, changing the registers
between runs. Each setting was run twice with identical results:

0x610  0x618  0x61c    ms/frame   fps
-           0x0      -               65.4        15   (slow power-up,
earlier runs)
0x0      0x2      0x111       22.5         44   (fast power-up)
0x0      0x1c    0x111       7.2           139
0x0      0x2      0x13        8.6           117
0x0      0x1c    0x13        3.6            ~278  (BSP values)

0x610 reads back 0 after the write, so it appears to be self-clearing.
The fps figures include gst-launch start-up, so the fastest rows are
slight underestimates.

With the BSP values the decoder is about 18x faster than a slow
power-up and about 6x faster than a fast one. MAX_READS and the
read-allocate cache each contribute, and the effects combine. This may
account for a good part of the mainline-vs-BSP gap noted in Simon=E2=80=99s
FIX.md (4K ~30 fps vs ~112 fps).

Correctness:
For each register setting I hashed every decoded picture
(v4l2slh264dec ! videoconvert ! NV12 ! fdsink | md5sum, so buffer
padding cannot affect the hash). All five settings gave the same md5
over the whole clip, and no kernel errors were logged. Two caveats:

I cleared the cache once, while the BSP clears it before every frame.
The clip still decoded identically, but I would not rely on that for
other streams.
The md5 shows the settings agree with each other; I did not compare
against a software decoder in this run.

Suggested fix (not written yet):

Extend the VDPU383 =E2=80=9Cfunction=E2=80=9D reg range in the RK3576 DT to=
 0x600, as
the BSP does; or map 0x27b00610-0x27b0061f separately.
Program the three registers like rkvdec_vdpu38x_run() does: before
every decode run (not only at runtime resume), with CLR_CACHE0 =3D 1,
MAX_READS =3D 0x1c, and CACHE0_SIZE_BASE =3D 0x13.

I=E2=80=99d appreciate a view from the maintainers on the preferred way to =
map
the range. I=E2=80=99m happy to test patches on this board.

Best regards,
Valerii Bokov
