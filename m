Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793711586;
	b=AB0CyOhcDtl52JL8BskAie+0UHII/cxh4gMFDJMZhRR+72aFC81fPDRxmxCiIOO7+xnS
	 MhP5hIuXR73G65A/2yOOhFbpJq7GcNQJ06yf7sG0uVVHxiOBTe60/SwGR1odOR3VHbBTm
	 pKJPDDUoboFa91OF4loncAhOv2gz0YYHLHuRl6v+6IlJNwomIGZZXq/wavmg8ByqKyZ3V
	 wXalgrUIX4a44C+keS35rHdUkRIp18WcQOaz1yKkmxHEDJSIQSY7nGtZyJ+xx81LGbZfU
	 NMYWTclEE4Dx/p0XDiVlge26O1unKcmBD3XN93cISItvfzxJGfiI/3exO1y+UjaXh+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=2icZ8zL6TGgUUS3K4DQzo0gf6WlRsL/AWMLzp7VQAlY=;
	b=Zt94Z3MJnMMct/4H8g9KMdT58gx2beG/qbJABt4mzQXMV7wSHvLFdZCvdmswJ5b/s7q8
	 GZgwdxEko6JpMWJyvf0a6UXBAbrZwMysUBcFaf67+GCQQwqZ3Ngxj4vcUoUGMcNK2DHSv
	 2mqBQ5OvJL5naWrdd2cQCcwTdfaY9g2zFG2ym7YQvmmteKwcayUkoN+NQqVF7PMuv7X1g
	 KlfAjF4Z8QlOBlSzn4C4e5UDRWQTyMVOwHkHEBquldPGbQnl3XE99drb6dlPg5uO0iIHf
	 GMxSY8Y5iZZIBO++SRSzZGxIG1Zyk7X2CiOgrr+cgWdSRD6MrRabL2tua86FtLTFhBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=W+TZGI5v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C1C606A32C
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 13:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C1C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=W+TZGI5v
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5366ae57896so49809241cf.3
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 05:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793711584; cv=none;
        d=google.com; s=arc-20260327;
        b=daQceaZjUXWvYZ//sWsPJ6TpOXTIbdivbjPkCMr+qdFgKXwyzH1dz1mxZYm3TU0bSQ
         tOMmrHofVCdSRwC3eFZcaa962WmmP2q8PQNri2jICgYFJgYz/GhjZZKhplPXwvqZaHoi
         DA3yZUQWxKABu0S7smNMz4LZeUexDq8m25sl1x88j2gSL+0r/jCHi83eC6uyu02h/TTe
         ob/RTFAu114NQMLr0ptizoob784LQ4jtZqQIH1LyZyuyC1cuTLJr47BzjeR2K2nE8aZr
         BXtoQQfhmH3LeM+hHS7azyUAYCi4+rvF5lUqbjfBvzA09rwXldbCqUyad9Hl2oGdlZGw
         +MdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2icZ8zL6TGgUUS3K4DQzo0gf6WlRsL/AWMLzp7VQAlY=;
        fh=EMwoIPxQhbJESTWXSjb+pfAw7BofnWbZULvadBdTgbU=;
        b=bb0edPTY5DhMZA09VRyu9R4CLtNL/WIZak6SXfm+Wpcf3JfzBIK6Yck7g47gfgS5dC
         e4kZqYugBvtRDQ/atrvyValC5BhWQn56C/oasLqoJEi/q+sNCkAqOvMremdH8ib/cJGv
         Pb1Iq70vt/XwYbSBZ2OtMvkRC+M1/cbLeNX6UxUAEj1QLre/BdSlyi5qAn4F+ErhKEBY
         hqy/pm7ZnAKGo4y4BnBUwsMjT5cWkC4UHHrY1QVZU9ujLlWzfer613fWEgcA8p774X3g
         kiMuFGf3R5ams3jQngxp/ZNsvyoDQr414bTiLzpVbyUFLBBHlJ5nzxhz66DbxnycXN9q
         O85Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793711584; x=1794316384; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2icZ8zL6TGgUUS3K4DQzo0gf6WlRsL/AWMLzp7VQAlY=;
        b=W+TZGI5vLZXS0ByWo7DtIogkI6pO7pSJS/mY2Op4FSwOnPnLqmEGO+y6kOFNySoVff
         6hzsskAUEV6VDlUWfR9bYxw8QZM8cCzHsT6sxhQLK3GtsHrT27uc9P8PNgWo3nRz9Rli
         HIWb83bZK0sNcMTKdLCrQPGxcHWj1Pu2RhR4sUN5Euqvc4Vd7p5l2lyAaqch0aCoonU0
         L1eDkE4A2mvK3YBkVnKVeHMNo2LYu6yeSydKtS2NuDXkOlQ6vxusVvHbVq2S50rmMYJc
         GP27XI1ctLPE51XTb9JsiHKBcofQ3pZ1yk6wDAB+gWti3tIfEFGO5kH2zkgNeehKBaq9
         Ssyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711584; x=1794316384;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2icZ8zL6TGgUUS3K4DQzo0gf6WlRsL/AWMLzp7VQAlY=;
        b=J4jpspAkUVIPSvOO2oqjX2xYi9qYMEicfGKtXku/mGbwZaS+AX5nZLZSLlEh2wAg1u
         3gUi0dR4l7gkl0Fv90cxEcvNpR7ZNc/Z/w9Gt+eha45yZKkj24azhg6y2KhSojqUQgSg
         2ZbcLmd+/lqZaWWT8c9d/TWZY1SPtx6V36jfP0TQ2br7UiNQjZjnP1sqAhEs57zw3PJh
         PslHXQ1NH8dQYQsRr6LseD4BBfXyxlxGtQx9WcGjF3xdlYC9CcbNkuuESTVqKIkeZtQR
         33QJxyFM6KrzNJGh+bxjubI1MUzhLILIUe51XDpZIZCvJ61w/xV8Vm1TA94PFyFX0Bjo
         A+qA==
X-Gm-Message-State: APuU4Z++z5SBKdOZYXCrHzllvmbQ1Jbn/kzpxQEb2cddit5aL4kSzfaC
	rOdvZg3rRJeUsNzf2yAUy39svZXq68VxKW+fXjeuB2qDIq6vgyf7maGJKa/lVSsl+6PMC2ai0mS
	0B7vkrZxpBDGIynHR7ZUkEiZMK0v5Bmf+iWJuMarctg==
X-Gm-Gg: AYBFou3mqP3T6RpNgq09J9HUGibWk3vfAP0TDIp0We/1KKSreOUvJiNpgae7g/lKhwg
	fyoCBUOO5oZSWv8QIXDhgEtDrLNoVJ4qUq1DP9LS8r7kBEAK36o6A4KGSvmWzrUnqJxUejABzfe
	symtlOHZrGmc2uwOzSBZCcOcdqVVDQ46xS/XiIS6BdhqzlhYO3G3fRZJYR1WK2RiZBat0QjT7wY
	46fd65+SAhKXWi1FmkDCEVKCVV/W/NI7NwbooIssmkVox+flnHSnaaOnxy+8M/yX0AOKlf9fUHq
	HzWZBFMTjIvlnzcKIZyJmc3v+34ro+b+Wf4czLGEJyb3IjoruLJaexQNDnLvkkJm8epP0opJFYA
	lEl5+B3skXxBESO25P6iMQ91j1i6SUssd4pEMqh8YcQ+IcPPb1PNAi7d+wnFCxRrkRWCcDvBIJO
	1z588s2d5B+jCPRiU1bERYVWigRsd2pPnRSsCGyKxHplV3KbqfLh6gDw==
X-Received: by 2002:a05:622a:5a07:b0:536:6902:db00 with SMTP id
 d75a77b69052e-542b85e857bmr221971131cf.68.1793711584049; Tue, 03 Nov 2026
 05:13:04 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
 <20261028112154.855185-2-antoine.pichot@gmail.com> <CAPY8ntArdj338V8bcSxrmwKQecy-pAcCXMbkWy=qLckX=hawNQ@mail.gmail.com>
 <20261030142624.2235132-1-antoine.pichot@gmail.com>
In-Reply-To: <20261030142624.2235132-1-antoine.pichot@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 3 Nov 2026 13:12:46 +0000
X-Gm-Features: AclHuK_U5ble2WiVXLRC50tmd_2p41MtkynfG8ykA1QxyOsNrA5P6PF3v1U1_cE
Message-ID: <CAPY8ntCtf5ksaZdbuRYxTt5xaKvRcMHH2H_Z3fZxBG_c1m-2tg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] media: i2c: ov7251: Use in-range PLL1 dividers for
 the 319.2 MHz link
To: Antoine Pichot <antoine.pichot@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, hansg@kernel.org, andriy.shevchenko@linux.intel.com, 
	dan.scally@ideasonboard.com, djrscally@gmail.com, dmanresa@gmail.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Antoine

On Fri, 30 Oct 2026 at 14:26, Antoine Pichot <antoine.pichot@gmail.com> wrote:
>
> Hi Dave,
>
> On Thu, Oct 29, 2026 at 07:06:31PM +0000, Dave Stevenson wrote:
> > I have a 24MHz module and had tested with it, which you'd acknowledged
> > in the previous sentence.
>
> You are right, sorry. v3 replaces that sentence: the 24 MHz tables are
> left to a separate change, with your measurement cited.
>
> > I've pushed where I am to
> > https://github.com/6by9/linux/tree/rpi-7.3.y-ov7251. Patch "media:
> > ov7251: Add support for a 400MHz link freq" fixes up all the 24MHz PLL
> > settings. I've also done the conversion to use the V4L2 CCI library.
>
> Thanks. For v3 I am taking your "Move the common registers into the
> global init table" as patch 7, under your authorship, in place of my
> strobe-register patch: the strobe registers now sit in
> ov7251_global_init_setting, which answers your question on 5/7 of v1.

All good with me.

> The move has two side effects on the bus, both in the commit message:
>
> - The common registers are written at power-on instead of at every
>   stream start, so a restart within the runtime PM autosuspend delay
>   skips them. The datasheet allows it (table 2-8: software standby
>   keeps the register values).
> - Register 0x3820 holds 0x40 while the sensor streams, where it held
>   0x00 before. The flip control writes back the value probe cached,
>   and probe now caches it after the init table has written 0x40, not
>   right after the reset when it read 0x00. I poked the old value in
>   during a lit stream: brightness, picture, orientation and frame
>   rate did not change.
>
> Tested on the Book 2 against v2: the clock, timing, PLL, flip and
> strobe registers read back while streaming at 30, 60 and 90 fps are
> identical apart from 0x3820. On a sensor kept powered, a restart and
> mode switches from 30 to 90, to 60 and back to 30 fps give a correct
> first frame every time, at 90.45, 60.15 and 30.0 fps.

That all sounds good.
I hadn't noticed that the common registers were written from power on,
so thanks for checking it. It's generally when there are multiple
resolutions supported that using the reset at the start of the common
registers is of most use.

> The rest of your branch (400 MHz, CCI, HBLANK and MIN_HTS, the
> optional enable GPIO, the gain rename, the VBLANK minimum) I leave to
> you as you offered, to keep v3 to the fixes and the IR camera. I can
> test them on the Book 2 (19.2 MHz, 319.2 MHz link) when you post them.

That's fine with me. I'll leave doing any further work until your
patches land, as the CCI change is tiresome to handle conflicts with.

> Two things for that:
>
> - A data point for the VBLANK minimum. A sweep on the Book 2 in the
>   30 fps mode (exposure 400, gain 16, 20 frames per value) gives
>   normal frames down to 41, white frames from 40 to 26 and frames
>   rolled sideways from 25 to 16, both without CSI-2 errors, CRC
>   errors from 13 and a stalled receiver at 10. The same boundary as
>   on your Pi.

Great. I was expecting it to be down to timing within the pixel array
rather than the MIPI configuration, and too few blanking lines results
in things going awry. I'm happy to hear that it does the same for you.

> - At the tip of the branch (fde519da0503, "media: ov7251: Reduce
>   OV7251_TIMING_MIN_HTS"), unless I misread it, ov7251_set_vflip()
>   writes OV7251_TIMING_FORMAT2 (0x3821) rather than 0x3820, probe
>   stores the 0x3821 read in timing_format1 rather than
>   timing_format2, and the return value of devm_cci_regmap_init_i2c()
>   is not checked. In case it helps before you post.

Doh, too much copy/paste. Thanks for picking it up.
That error is actually in "media: ov7251: Convert to use V4L2 CCI
library". I've updated my local branch, but not repushed.

  Dave

> Thanks,
> Antoine
