Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFC63C1A
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 14:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752929; cv=pass; b=HoDo/fBdpb3306HuXaGuxROu6MGVxuz2IrDMH2rOBF5FCLRhYF3p7Iwue4sjNmcckG8nEQ6wMwnx1GsipqnGNa5GwT0saGAsWsG825M3YUmMoD8xhAIbxtXCW16aBvMJ0Q4z3EvMfGumupDha9NeIBxyvEtzmUMh1ZRyv4iWeY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752929; c=relaxed/simple;
	bh=YTFKBt/ffdJCdMS24mk4GScZlXcR3udjel8k84g5CUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BK54bsrWnysWJFFdxn79AWlxb9N9KQCaDBxczWiseqJMm85P7sENqfa6UnutKzYh50EHlror7oRc1vBDqGJupm3xt9JXizjGg3etQNAGOv6pYiTkJyBkxl6AVHy6HXgR0AHH6nAFK3WPC7wWMz6WGVXXbEOUvQd8wdydlMir5/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=VuzDH0Dw; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="VuzDH0Dw"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4650773fa99so722024fac.2
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 07:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787752925; cv=none;
        d=google.com; s=arc-20260327;
        b=E1haQ6QrY5za6wI3fmk8LoxPJ+9vx8QMbZD++oGfNKISsvYp6z5N4oxBg4aZkoRcYR
         ItsYcnb46X+wP2IgnFAUpNG1DYvSzrPaRpNdy+73vl5p5MFA2cgC79gnaMzcX6TDyykX
         bQ9rxHfLaUJwYPkqhhSoEq9lnxpdIlGIKJ3CgzFXn9TVHLAvxApu3j9TcuS1kj+VdCvX
         Razo6cAtxcrSIT1KdlUnRUKXfV0Bd1OnvOsKHYDxb7kzR/RfjDKYn0vwqW3bH+6/7JpW
         S9GmAGwaCdXFu/121pTNiuY6QKGXeKxN0+ZMrZk+dsi8HxheAVTyjYrLB/9grAOYqOFV
         +odg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oIbPEOkAg6PGzPgtgFQk6xMiuXDyPUp/mxCuxY+CaGs=;
        fh=9xuj9IOCsa1nRD0KcmBugsPuxmwH2aF/BTaAMMnaZyk=;
        b=UMWoTruRbAzIbou8dEWhTYu4Y0Oe4kgNSEsaRwUfK5fdcWo7nwtdaQUUumLj1OyfDf
         ToBzBVqA353x6P0ze1KHS2UksIwBwT/pb1hJjtSGC+3+xZKllEa8gfHpf1FRvPvSHTgS
         0lkJD9S0TdenbRjNfkvuGUwtaN/08j4QZZhMP+VIgOOoeK+/Cl7n7/6j+wNmTSIpx1C7
         zVlLGmzs6PbbjIrZiI52t+uFBgqP6il65ZErHOt6uVcnZnT19QGciYSWk51+3p6dlYav
         fPNzJ5/TGtmWm6SuO+goyggYts5y2/KsQNgPqatSlpUevr/NTH2cMAog69jl549Y51c/
         izSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1787752925; x=1788357725; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIbPEOkAg6PGzPgtgFQk6xMiuXDyPUp/mxCuxY+CaGs=;
        b=VuzDH0Dwhoa6aMZXrckc+Y88fwj055WnjHJlW1PD89C9Hb/aiDyipYULryzej6F5ta
         YQ1GhkGeUG+5R3gBOhuZxAtHUsI6JhSo2hEyX7kaIYOLQug1m8C3C5Tfoten3xNbZ/MI
         XFAhObBUoBcCa66l7Bw4mZXM1LkmoHZSB1wCP9uzZftFfuXqroyO33eRav3M6jZ8DD57
         UEBxcTZFCtwerBUM2vcjqZdi3Rflbh8SorFEyKf8Vx99UoX9zVQuM5Vpkcv4aMXP8IpD
         g948hRd965gjUCnOHJMOcJXBqHeFTV1a0snJ9S2iFCasP90xbFgGh09ZTL9lCt8MWmZp
         /mRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752925; x=1788357725;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oIbPEOkAg6PGzPgtgFQk6xMiuXDyPUp/mxCuxY+CaGs=;
        b=rFDjga3SLZeXPahW2sh1CR+2zer+k3pskDaILxkRcpWZY7lNyjKAizS6QMIrl4LrIm
         l//x1UM0e4OmKUKIa9qdfWhKgdqC9mxRSN85OLY4FSQCsqkiK80JTZpVkGxtHxcsyp7j
         CBx7TxDzOL0y+12JCnTGVHTu6nRBUel1L2n3EP82wLZ+abxLh5IpGhw5QybW9QNK1EL+
         Bg04ITVbjrcuLmVFVoS0v6SmchM6SWCTb1OiHPz+gjKf2hjO5T4XBWsufcjktpwMNcYG
         GiICjLMpDN3mJMjJOHhG+Hvi7+vy1lR4+mcqQASce7ECWYWyIWMKGtYz2a2hNsR+8Cdl
         GRDQ==
X-Gm-Message-State: AFuF++mJGfzEvJMukUDecPAtIa9Une5IIMIU0inYtRFTTgIjB7vtt2kz
	uYVg7DYI6Uoc+zGUMlhI9jx/JTOjxtooRzwMTJ+MglmE2PTXNikkyAZpckX4QbsrNzBCHIK1ecZ
	iZusRb1stRAMODW9Cn0CXR4VSpceOVAt0w3c4RIKgguTGO/BtyNYthY5Ptw==
X-Gm-Gg: AR+sD13oow5Cu5pLRidE+2v2drUHXHGf64H4xiKD2baKSB87ewAwwdbIwCzon7cxpns
	4x1BT3WU9etNLWFdWsgVPRGKG4B/i44XJMfdECJpIVzRbfHrjey7GaNMn+17zTOMDkwwuGvQQ1y
	X28idYQDHPQCLW3T783Lu6xFRwPPgWzjvqGNvXYFrtW33Q3kk62Ng6m1hYu9XnnA8ZkL7S9k+9h
	ohlnHcwQeISlCE6+BiJ8dEErOWdJUyXqUzQPRj3l2kQAMXdJqMoU1awVj3f0emsWaUsULF+Ag0k
	ij7cbsGQqLTNKoWn6NHmgFHt/N44oH8NQOQJiNWarlVwuxQYe8ABNthWn4rmG/BULKnWYcJKWoE
	oQLngKZ+XarW9XD8zJ/qyfikreEW4Zgdm1+kPKRpcc2iZ4QMB2rEie0Ogch8hW+wDnrilAikI
X-Received: by 2002:a05:6870:1492:b0:43d:2e43:9e4e with SMTP id
 586e51a60fabf-4659a599239mr6939104fac.17.1787752925093; Wed, 26 Aug 2026
 07:02:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ME6PR01MB10716F138AFAF015ED70D3AFAF4AE2@ME6PR01MB10716.ausprd01.prod.outlook.com>
In-Reply-To: <ME6PR01MB10716F138AFAF015ED70D3AFAF4AE2@ME6PR01MB10716.ausprd01.prod.outlook.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 26 Aug 2026 15:01:47 +0100
X-Gm-Features: AcwNN1UnxGHtmHqQPxhvCz8vps5lIjsHzYvlWkYH3f-llSV24rRx0yGhqFG87UQ
Message-ID: <CAPY8ntBaSHjztuSLTOtv9KYvEbmcbinSMJ78ZDg+0sZg-1fz3Q@mail.gmail.com>
Subject: Re: OV9282 driver may not set correct value for VBLANK and HBLANK
To: eee <D_0000000000@hotmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Wed, 26 Aug 2026 at 10:54, eee <D_0000000000@hotmail.com> wrote:
>
> * Spam *
> Hello
>
>      I am trying to get an  OV9281 sensor running on a rockchip RK3576
> single board shipped with a vendor-customized 6.1 kernel. Sensor can
> only run at 1280x800@30FPS, not 1280x800@120FPS as product brief said.

I've just connected an OV9281 to a Raspberry Pi 5. I'm using our
downstream 7.2 kernel branch, but that only has 2 additional patches
over mainline for reading Vision Components modules, and to control
FSIN.

When configuring for continuous CSI clock lane, libcamera reports
0 : ov9281 [1280x800 10-bit MONO] (/base/soc/i2c0mux/i2c@1/ov9281@60)
    Modes: 'R8' : 640x400 [325.52 fps - (0, 0)/1280x800 crop]
                  1280x720 [180.51 fps - (0, 0)/1280x720 crop]
                  1280x800 [150.97 fps - (0, 0)/1280x800 crop]
           'R10_CSI2P' : 640x400 [260.42 fps - (0, 0)/1280x800 crop]
                         1280x720 [144.40 fps - (0, 0)/1280x720 crop]
                         1280x800 [120.76 fps - (0, 0)/1280x800 crop]

With a non-continuous clock each line is takes slightly longer, so the
max frame rate drops.
0 : ov9281 [1280x800 10-bit MONO] (/base/soc/i2c0mux/i2c@1/ov9281@60)
    Modes: 'R8' : 640x400 [309.79 fps - (0, 0)/1280x800 crop]
                  1280x720 [171.79 fps - (0, 0)/1280x720 crop]
                  1280x800 [143.66 fps - (0, 0)/1280x800 crop]
           'R10_CSI2P' : 640x400 [247.83 fps - (0, 0)/1280x800 crop]
                         1280x720 [137.42 fps - (0, 0)/1280x720 crop]
                         1280x800 [114.93 fps - (0, 0)/1280x800 crop]

Asking for 120fps at 1280x800 10bit is giving me 119.98fps, so that's
within the tolerance I'd expect.
8 bit readout is slightly slower than expected at 115fps. It seems to
be about 96% of the requested rate, but nowhere near the 25% you're
reporting.

> I downloaded a OV9281 datasheet (definitely not compatible with GPL
> license) and checked register tables.

I also don't have a datasheet direct from Omnivision, but
http://www.sinotimes-tech.com/product/20220217221034589.pdf is the
latest version I have found.

> I found that driver may not set
> correct value on VBLANK and HBLANK. Since OV9281 and OV9282 use the same
> driver in mainline kernel and both kernel set the same value, mainline
> kernel may have the same issue.
>
>     There is no relationship between VBLANK/HBLANK and VTS/HTS. LPFR
> (line per frame) in OV9282 driver is not VTS in OV9281 datasheet.

Pardon?
HTS = (width + HBLANK) / 2
VTS = height + VBLANK
LPFR is a term used on many other sensors, but is technically
incorrect for this one which uses VTS. They are synonymous.

> The
> only requirement is VTS x HTS * FPS == SYS_CLK. For default settings VTS
> is 0x038E HTS is 0x02D8 SYS_CLK is 80MHz and FPS is 120. Maximum image
> transfer rate can be reached.  For those settings resolution can be
> 1280x800 which is greater than VTS and HTS. OV9282 driver set VTS to
> VBLANK + HEIGHT. I think driver may set wrong HTS and VTS.

The PLL configuration used by the driver is identical to that listed
in table 2-10 of that datasheet.
Exactly how those resulting clock rates actually converted to a pixel
rate has always been a little opaque.

Using your defaults:
HTS = 0x2d8 = 728. The driver has done a /2, so that is 1456 pixels.
VTS = 0x38e = 910 lines
Pixel rate of 160MPix/s for 10bit readout.
160*10^6 / ((728 * 2) * 910) = 120.7fps.

Having just asked for 10bit 1280x800 from libcamera, HBLANK is 176
(the min), and VBLANK is 115.
(1280+176) * (800+115) * 120 = 159868800, or a very minor rounding
error on 160MPix/s.

All the numbers fall out exactly as expected, so for 10 bit readout
I'm totally happy.
8 bit support may warrant some further testing, but isn't totally wrong.
(Actually I see the problem. In the hardware the pixel rate for 8 bit
is scaled by the change of PLL2 multiplier from 0x50 to 0x60 = x1.2.
The pixel rate control is scaled from /10 to /8 or x1.25. 1.2/1.25 =
0.96, so my 96% of speed would be spot on. The use of link frequency
in computing pixel rate is totally bogus as they are on independent
PLLs)

>      I patched vendor-customized kernel and my OV9281 sensor can
> reached 1280x800@120FPS and work normally. Mainline kernel
> and vendor-customized kernel use same value, mainline kernel could have
> the same issue. Unfortunately I may not be able to provide a patch for
> mainline due to my work, but I think I can provide my patch for
> rockchip-customized kernel. As OV9281 and OV9282 drivers are almost the
> same, I think it does not violate rockchip's license.

If you're creating a patch on any kernel, then send a link and it can
be evaluated.
Almost all kernel code is licenced with GPLv2, in which case it can be
published. This mainline driver is licenced as GPLv2, and therefore
all derivatives are also GPLv2 and should come with a statement of
where the source can be obtained.

 Dave
