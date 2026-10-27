Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793114422;
	b=SJV9mIIXycNN3w7BIW7CnG5M0og99p7+LeJkH4q5HntkI1cmjwwwr8QvkSFBoP+fLWpr
	 31qmmP1USGUSQxhUBefDL6JwMSCySmZjrr0FvM4R/GBK2r5THgd5c0ZuXx+qbvYVmsbkA
	 Y/g+9ljqQB5f/CzJFb/knaQqXPWbqht9Dxghd4xqAzk1n/DBFlsov6HWlkjoFro7W3Tca
	 QS3Br2ox06jhkIIZ1DPD6XZauPTHgj+VYuKyb7y/gGFJWShVmlX/aWYpfgzpGUF08EAKf
	 bEVUNXmNX1bx3Ojs8TZ3CgFmaAqFl9H00O5TryaAd4UVREAyxorjpDYGUcJcsTpsICQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Qv6gNPL+7OArAfIgFNXbA5f6QRBx0hrB7lSppVy66X4=;
	b=H4X3jtKEi4PSv2F4eOkd1UbOhRBAzWFtyVQDN95mTbsXmjokUAHb1dxA7zqAXhflHdT+
	 yuNLOCx8aqP+xLMtxotQBr/w4ZDDxAlDjsMm1H1rXjC4W+6s4c7kh9cwOiaziQURA9OMu
	 AcK4Q3XA0y2KApbgmCTB2YWipe/pJQ155okUW6Za6FZtCtHWQ5D0u2OMO6A48dkq5gg70
	 uM2Lt5l3+zWjNm1CSpJOJe5R0V6D/QtjX6bkg3PTO1nd6C8Zm4/doIbPx7r9zsYrP2yPi
	 hBPcX097neF3V5HlpzeEXY5IW2+ePkfwNBIcncf2+x+/MLdLtZ8LkDy44s8e04RKfng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UeZ9sZQT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C56606A32E
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 15:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9C56606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UeZ9sZQT
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0dba37a7fso36501217b3.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 08:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793114421; cv=none;
        d=google.com; s=arc-20260327;
        b=Tpc/kWX/hGaxdV76V0XDYsrsyFazpiMrhDzl1sALeCaczIb182vZlyqajbKfWrmVRW
         GDf+UYAUk64SNpXbj7XFO3Fp2u39LV6369sbm2LoIATJunQ5eEzM5Epezbc2ne81jqur
         602aHM19MXK9BLPfk6KJWZ5SUr+RmFfn8Iv5FR2NBIt3TDNVoTMBjC1wBU/4zO0f6X5R
         V3wNEYRGcIauviqdXJNGRPc7Y4FRLplej1p5eM46KEmTE5Sq6HR2hAKRK5zSQTwmTW73
         AtDPsldfNetTr9p0remagcF6llvr/EW6GZHsTSF0Dtmv+Za8KEgvi3Yk4WK6qSF0zy4K
         nBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Qv6gNPL+7OArAfIgFNXbA5f6QRBx0hrB7lSppVy66X4=;
        fh=+l7UwA2mI2qqg/CiEWSf4gfwP6z31Vtm+Q8s2sTglPw=;
        b=EB1283MJmM2IRPh9r1RCyWsG+Wy7/Oo0gT4xlnAnQwmTrTE+EbnToKRCueY1zgVD28
         jtVCoojU+gKqWdY9H+Fl3LfharSWQjekNIT/FHO2u+rjBVLCC0LuG7E0fGEzHZCPTJwK
         rIUyw71BNWTj78zt7dZWEfd4cj7daROnaRquGbq/aubAZ2lGnqz2dmEVxVbmo0/sXZHB
         Ey0ogE7N6y2phmpUuFvBTIhhE6rmMwta0hCHL6KqY+w4aolEdcvPCWlEXBpAboDivzAG
         UKFGlsMaQTgFu5FA0dOvtHOqYXewju/rpzGWitT4F+BUQj+VosRVCPd36gXDh/pb5I9U
         9URg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114421; x=1793719221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qv6gNPL+7OArAfIgFNXbA5f6QRBx0hrB7lSppVy66X4=;
        b=UeZ9sZQTF5ehZq4eA54yxX9FBHPiJiDjx9k8Yn9UitztMHLh/fGNmNeSqg7VoMmPFy
         mVYJ4MszltDWf5K9EptvOhzfTo/LixQUHiYoNWspG4NxcjAQL0ynAonLhh7B/LSgPrJ5
         3nq4N+YJPoUH1MO5omf7wTYWb2TE8Qx7pmu3K5UMn08H5OBEDn+PavXnlWs+5ijR3DSw
         T9zO55CFONB6fnZpSD72TqAOkYK149g8owFjEaKvGeI6t5qoYb0zUBD8uIo/8USm15k3
         nL81knjx1WCeuGgim/pnjQEiUdIxMc+S74BAw05Xo5NC0MIwQTC/huPRL/lZfZ9Dq/dM
         zUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114421; x=1793719221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qv6gNPL+7OArAfIgFNXbA5f6QRBx0hrB7lSppVy66X4=;
        b=vTsNIr2SlTnupXp3U+O53CwppuQpBwgVcGLna/LJC8m+D07bP+LqbMCc5scn0RhZ/9
         h8WUf6CplCliSFcArARmLkkWOc/4GpHMbUxEuwFc0rMHNz/pBfw4oVFated56AtCIFER
         wzdE+y/Dswar6+/wUYl08AarFLcVs3GpPz7s4Ih3pEPF/F4huqKcoZHM12x4gImUEYFK
         51rz1tfVkvpAb5R68Vviw7NQQbLmlBFvVmD9sc+XZVit3wJHpGg4VvwMONEbvteZY/Em
         orrujdrquAYrq1RwBZslKevUZlrzsqEa7T/5IP6hsVuFn9TkpkLBPOT8fn3GUaLEEANJ
         MDIA==
X-Gm-Message-State: AFq9FYKr1ExN8GEBXiCKdw556aRY4QSV28Cygy5xhKYqAcXjYoiXJUdi
	WnO5sFI0Vpv7CvKbsCUH+L3veMxVvbn1lZNJBaN5cJ2G993hsuyoODwxbMXsMFd1gP6hTFGkcF0
	YNGms4c6I8yjpmmSdTVEXUcNBWNwJ3uM=
X-Gm-Gg: AYBFou16sGxJ1Do57L6z+3bn3cFqhpQvAUnFDmZHKre2RJbBB0wp9Xe+xWobln6V2MK
	8kknmU1AMWM0JE9k/oGY5p5vppwcIKvkIFOA+NceTG3Dr8Ag7vj/JYSbYQtRnw+fCC1R4XrLNAp
	liTIhhKStjfyKVerfwIcv4x90OLUUk7WtMXUD4suy3kO0W5j7vXorud2JivXiD96sRa5tge5nGK
	lZJF+dhP16+Ido1LYRyl9C7e5Hdw8LQZI0xTuhLPuWsGzWR8X4NBOuA5Xw2ME0qdW1FN815b0Ji
	PcrkDHe5qdZsG6f/pJvejq3Yw/bLyQFLCkFCQBYdIjk6jL/HlgUHIRFJ6tV6Ci7DVPC5MThdNPm
	tEWOngW7MGML2PAe7xFCap4jXFi+uvIQ96XCcGg==
X-Received: by 2002:a05:690c:ec4:b0:8b1:ce5:be42 with SMTP id
 00721157ae682-8b166bb1ba8mr67068377b3.28.1793114420578; Tue, 27 Oct 2026
 08:20:20 -0700 (PDT)
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
Date: Tue, 27 Oct 2026 16:20:03 +0100
X-Gm-Features: AclHuK-MdX_Hzt4OwqOiaJ-I61AC9gcNh6UiQj_02nZKr5_6rMD8PX9hJQ27IUA
Message-ID: <CAN9BvpqAL_Hb2cR52EkYmkdm37ej2qKxFh2bj7F6Ei_bg-Sw0A@mail.gmail.com>
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
To: linux-rockchip@lists.infradead.org
Cc: linux-media@vger.kernel.org, Simon Wright <simon@symple.nz>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon, all,

Thanks for the priming patch: it removed the deblock corruption on our
board. While benchmarking it I found a second power-up issue on the
same IP. It affects decode speed rather than correctness, and it looks
like the same kind of uninitialised state.

Setup:

Board: Smatek T10PE tablet, RK3576S
Kernel: 6.18.34 (Yocto), with your patch =E2=80=9Cmedia: rkvdec: prime VDPU=
383
deblock state on RK3576 power-up=E2=80=9D applied; dmesg shows =E2=80=9CRK3=
576 H.264
deblock-priming workaround enabled=E2=80=9D
Userspace: GStreamer 1.28.2, v4l2slh264dec
Test: a 30 s H.264 recording (2688x1520, High profile, 654 frames), decoded=
 with
filesrc ! h264parse ! v4l2slh264dec ! appsink sync=3Dfalse drop=3Dtrue
max-buffers=3D1 wait-on-eos=3Dfalse

Symptom:
Decode speed is bimodal. Each run is either ~22 ms/frame (~45 fps) or
~65.4 ms/frame (15.3 fps), never in between. Roughly 60% of runs are
slow. Within each mode the timing is very stable. A 640x360 stream
shows the same effect (~1.6 ms vs ~4.2 ms per frame). The slow mode is
not caused by:

- clocks: clk_rkvdec_core is 594 MHz in both modes
- extra hardware jobs: exactly one decoder IRQ per frame in both modes
- the CPU: 1-3% in both modes; unaffected by CPU affinity (A53 vs
A72), memory load, compaction, or the pause between runs
- userspace setup: GStreamer=E2=80=99s caps, buffer counts and allocation a=
re
identical in both modes

The mode is decided at each decoder power-up:
The device runtime-suspends 100 ms after it goes idle
(autosuspend_delay_ms=3D100), so every run normally starts with a fresh
power-up. With power/control=3Don, every run within one power-up gets
the same mode (20 of 20 runs across 5 power-ups). Each new power-up
rolls the mode again.

The register:
I dumped 0x27b00000-0x27b007ff through /dev/mem (32-bit reads) in two
fast and two slow power-ups, both right after power-up and after
decoding. Exactly one word is the same within each mode and different
between them:

0x27b00618   fast: 0x00000002   slow: 0x00000000

It already differs right after power-up, before any frame is queued.
Its neighbours 0x61c, 0x620 and 0x628 also come up with varying values
that don=E2=80=99t correlate with speed. So the whole 0x600+ area appears t=
o
be left as whatever the hardware powers up with. The driver only
claims 0x000-0x0ff (=E2=80=9Clink=E2=80=9D) and 0x100-0x5ff (=E2=80=9Cfunct=
ion=E2=80=9D) in
/proc/iomem, so nothing in mainline (or in the priming patch) can
write it.

Causal test:
Within a single pinned power-up:

- slow power-up (0x618 =3D 0x0): write 0x2, read back 0x2, and decoding
becomes fast at once (78 -> 252 frames in 6 s; repeated: 78 -> 257)
- fast power-up (0x618 =3D 0x2): write 0x0, and decoding becomes slow at
once (257 -> 78)
No kernel errors, and decoding stayed correct. The value resets at the
next power-up.

Questions:

- Does anyone know what 0x618 is? It=E2=80=99s outside the documented funct=
ion
register range; I=E2=80=99d guess a cache, prefetch or bus-interface enable=
.
Does the BSP (mpp_rkvdec2 / rk3576 init) program it at power-up?
- Your FIX.md notes mainline throughput is well below the BSP=E2=80=99s (=
=E2=80=9C4K
is ~30 fps vs the BSP=E2=80=99s ~112 fps=E2=80=9D). Some of that gap may be=
 this bit:
on our board, runs that come up with it clear are ~3x slower.

A fix would presumably set bit 1 of 0x618 in rkvdec_runtime_resume,
next to the priming. That needs the register mapped, either by
extending the =E2=80=9Cfunction=E2=80=9D reg range in the DT or with a sepa=
rate
mapping. I haven=E2=80=99t written that patch; I=E2=80=99d rather first hea=
r whether
the bit is known and whether other bits in that area need setting too.

Best regards,
Valerii Bokov
