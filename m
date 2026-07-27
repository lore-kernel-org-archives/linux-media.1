Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3617D3E44EC
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157987; cv=none; b=AUOdg6bVXtVsNi8g39vYaVCWLvKkxjZrYjQje7mXNtMarixLiSPLcKZa5YmiRQBQxztWtnIH6aiRFfXwxx/4lpjBDgQm4xyx2SH5bpUsmIs490ZUXgZUDplUvxpEU3JGZvwzgLmbj0tOjkKGSpl3My5HnI7PrCsmw2qc4QbblU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157987; c=relaxed/simple;
	bh=aV5WdreVR6I26UKWRBgBaMffrMExdILN68TCpQ60VhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qfnZ0aAo6EBpwjgrvM6DWyn/7oipF6tPk55iuf9HoH41hb34Bwm62aF0UmSOnk4MgigxCyWDb4HRR2GqQLUAFAuUsY02tiaBgfVyrJjytfdKHMAk59axHZCzOxGtJIuqjdYIjI+/GkJDJu5gT5l7UVZbephnSCD3b16Wa2JlXoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=M9l8edg8; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="M9l8edg8"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c16ac21acso16936351cf.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1785157984; x=1785762784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wFrETDbrvRN9Wa8LJ1OZcbYqKFyzqoz5Xhq7OzIvr0c=;
        b=M9l8edg8cvLEvAiHSRP1aPM5axbYs++I0Yzgr2HVdghZ7Wkwqxulp+v+5P2f3cIyaJ
         aF2Y+n+B+S7SamR20fLMvLaDYJRvT3hFHhlg5HjBOgn9JCoIqHj5mbfgD3dCpuJSpF+D
         TUzUQD1PKQGhtWE9JeC0xTmLyxXzjMQ3UXdqDCl6YLHUgJ1Lp4BQs27fw/NaOhAlbtgc
         Z+Zckn4RVyrTatfPrdWCSiyGmfGxx2gFx/cW9HfQ6GlA1gzG2vr//44GhjY88geVq6GU
         +AINcgV968R2s3MMpSLFgmty6K2PSdJkVfIkhz1hJ9WdKG2JAqxWSH/a/xjCQZlXPZIH
         qdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785157984; x=1785762784;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wFrETDbrvRN9Wa8LJ1OZcbYqKFyzqoz5Xhq7OzIvr0c=;
        b=CTGcIXrm7rxV/l22KZZQwxuxbE3J1jT5M7J/EgOSbRVSHr+SK+lwso8AmVGqNKqnwm
         PvSMrJ2Xyhj079REIIl7Pt8m08GrZG/uWekptOid5ajqB2FS7b9fyXYBWnyNF5lzrqrK
         95YfJJYxhz06PMNNSFEySOqcbE0H9scL8zdFGxcimaWuAKXpb4dszhfBA7HE67vurw8w
         9D2GVgedY/isxH9mIgoz2sM06Zh/cNgxrzL7V1l9nAwGrj8bpT0dUKrmUay8uzvN/R0r
         G64BPi02hJNHU08Su8r69b3UuVFCzmMwfzD5xkaiPJhzfLmAeEMKKzCTIovR4zsCoyFU
         k+/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpYluXIfE6Ga6TfYMpUIDUKs4Fru27vOb9jcMdxIxae1aDiKhav24zqIeCpCd19HqPpmmxCjj9df2J9dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXfDSIdBC/uhZwer6NSU2QrzBOuzJXMFB8C4eh2Bi2xNX3eQ5i
	WGW1rWqZ9X1DRO6MDnkAVhoNonWJBIGgnQi1J9H0hy2ycZh8hsnq5TVU7x5B97pYZp12hwn7/uH
	5i5K32yM=
X-Gm-Gg: AR+sD138Iba5MFmdz82eI6C54OWSwCpRDTqH7UPRYFfw2dM0sIjw0ECxws6PWLhssaZ
	u4wrTmI7e/uTd00eC6q+uYMi8f2r6qKcnz3ZA83cjGn3tGw9VFgClnuN8PgZwdgLgpZKkTEQlMe
	kd2F179LLEdnrtvrwrRMTzyJqeWd7gYVwXlLD86rKhMBnWCLZi0dR/w9aSCAqiJZB9iVLDIEBev
	sfMrW/sf3Iy7fuxv8MLDJqbBaSeMxaRNfvwUeDN8DLYbibFWiJHDUC+m5eA/dHSE+52XCY6oQw9
	rjoEmcYhId1pUKdquOntYGr3/uXDEdeQF/RS6zSqiOQ6xbWyVvpNV8NCNMWy/AaDJcM6+JiJufT
	5Q6CErxirjHODpR9EykPXMgPZfrVBASF7rQ0lYbtFC2iXe7qQJ6nxxYYRQRIrN3H/AM6fu7GSwn
	m4JYBdCR8JocWZ6sJgznkRJBVyp213XgKd200TRTJPgxqFVjdwg4zApFrpXVMubKnjfdzu7ZmoS
	co=
X-Received: by 2002:ac8:5dc8:0:b0:51c:844f:28df with SMTP id d75a77b69052e-529a88773bfmr84708111cf.75.1785157983889;
        Mon, 27 Jul 2026 06:13:03 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::f163])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a27f6c28sm54640991cf.10.2026.07.27.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:13:03 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: rshouriesh@gmail.com,
	linux-media@vger.kernel.org
Cc: elgin.perumbilly@siliconsignals.io,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	bingbu.cao@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] media: Add Himax HM1092 mono NIR sensor driver
Date: Mon, 27 Jul 2026 09:12:52 -0400
Message-ID: <20260727131252.1580332-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com>
References: <20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Elgin, thank you for the pointer — I had not found this series and I am glad to
have it before anyone spent review time on mine.

Ramshouriesh, your series is further through review than mine — v5, a binding
with a Reviewed-by, and a driver already shaped the way the subsystem wants. I
have no interest in a turf fight over which of us writes drivers/media/i2c
support for this part, and I am not going to keep pushing mine in parallel.

I do want to be direct about the technical picture before anything is applied,
because I think my series is ahead of yours on the hardware itself and some of
the difference is load-bearing:

  * The active pixel array your driver reports to userspace does not match the
    vendor's published figure, and cannot be right.
  * Your LINK_FREQ does not reconcile with your own hts/vts at either frame
    rate Himax specifies for this part.
  * The exposure and gain register layout you describe as unknown, I have.

I have also validated differently, and I think the difference matters. Your
cover letter reports the on-chip test patterns arriving through the CSI-2
pipeline. What I have is the complete function this part exists for:

  * Live imaging, not test patterns: 8 captured frames with an 87.9 % byte
    difference between consecutive frames, i.e. scene content rather than a
    static or repeated buffer.

  * Working infrared face authentication — the Windows Hello equivalent — via
    Howdy, unlocking a real lock screen against an enrolled model. That is the
    whole application: it exercises the sensor, the illuminator, exposure, and
    the capture path together, under an unprivileged process, in the dark.

  * s2idle suspend and resume with the sensor bound; it survives and still
    streams afterwards.

  * A second machine, someone else's, confirmed independently this week: a
    different Dell laptop where the same sensor binds and streams at
    link_frequency 180480000 on CSI-2 port 1, I2C bus 15, capture node
    /dev/video8 — every one of those different from mine. Nine SOF events and
    frames out. That is two distinct boards and two distinct wiring
    configurations.

  * The register table cross-checked two independent ways — extracted from the
    vendor Windows binary, and decoded from USB/I2C captures of that driver
    programming the part. The two agree.

None of that makes my driver the one that should land. It does mean these three
items are worth resolving before yours does, and I would rather hand you the
answers than have the tree carry them.

## 1. LINK_FREQ does not match your own timing at either supported frame rate

Your driver declares:

  #define HM1092_LINK_FREQ_400MHZ   400000000ULL

and your mode declares .hts = 0x0650 (1616) and .vts = 0x02ee (750), which your
own register writes confirm (0x0342/0x0343 = 0x06,0x50 and 0x0340/0x0341 =
0x02,0xee). V4L2_CID_LINK_FREQ is the DDR clock, i.e. half the per-lane bit
rate, so for one lane at 10 bpp:

  30 fps:  1616 x 750 x 30 x 10 / 2 = 181,800,000
  60 fps:  1616 x 750 x 60 x 10 / 2 = 363,600,000

400,000,000 is 2.2x the first and 1.10x the second. Himax gives only those two
rates for this part — 30 FPS at full HD, 60 FPS in the 640x360 binned mode —
and I could not find a frame rate stated anywhere in your driver to say which
one you are in.

If you are running the binned mode at 60 fps then you are close, and 400 MHz
looks like a rounded or maximum figure rather than the actual link rate; the
derived pixel_rate would then be about 10 % high, which shows up in userspace as
frame durations and exposure times that are consistently off by that much. If
you are at 30 fps, it is out by 2.2x.

I ask because I lost three months to exactly this control. My driver published
360,960,000 — which is what the vendor's Windows mode descriptor states, and
which is the per-lane BIT rate, not the DDR clock. The IPU7 receiver programmed
its D-PHY for ~721 Mbps against a sensor transmitting ~361, the clock lane came
up, no data packet ever framed, and there was no error anywhere. It presents
exactly like dead silicon. Halving it to 180,480,000 made it stream.

One data point that may or may not apply to you: your init sequence programs the
PLL identically to mine — 0x0307 = 0x00, 0x0309 = 0x01, 0x0310 = 0x00 are
byte-for-byte what my table writes. On my board that PLL gives 19.2 MHz x 94 /
5 = 360.96 MHz bit rate, i.e. 180.48 MHz DDR. If your MCLK is also 19.2 MHz then
the part is putting the same rate on the wire regardless of which mode is
selected, and 400,000,000 does not correspond to it. Himax specify EXTCLK
anywhere from 6 to 27 MHz, so your board may well clock it differently — that
is the part I cannot check from here.

You report that the sensor streams and the on-chip test patterns arrive through
the full CSI-2 pipeline, and I do not doubt it. If your receiver takes its PHY
configuration from DT or from a separate PHY driver rather than from this
control, a wrong value here would stream fine on your board and still be wrong
for a receiver that honours it. Mine honours it, and the failure is silent and
total.

## 2. Exposure and gain — you say the register map is unknown, and I have it

From your cover letter:

  "this driver does not implement the V4L2_CID_ANALOGUE_GAIN and
   V4L2_CID_EXPOSURE controls that libcamera lists as mandatory for RAW
   sensors: the same lack of documentation means the gain and exposure
   register layout is not known"

I recovered it:

  0x0202 / 0x0203   exposure, 16-bit, high byte first
  0x0205            analogue gain, 8-bit
  0x020e / 0x020f   digital gain, 16-bit, high byte first
  0x0104            group hold: write 1, program the group, write 0

You already have 0x0104 and 0x0202/0x0203 in your init table — your sequence
sets 0x0203 to 0xbe (190) where mine sets 0xb4 (180), which is consistent with
these being the same exposure register at slightly different defaults.

I have exercised these on my hardware but not against your 560x360 mode, so
they need testing on your board before you take them. But the gap they close is
not cosmetic: your own cover letter identifies these as controls libcamera lists
as mandatory for RAW sensors, and a sensor driven at whatever fixed exposure the
init sequence happens to bake in cannot do face authentication in varying light,
which is the entire application for this part. I would rather that not be a
known hole in the merged driver.

Happy to send them as a patch on top of your series.

## 3. Geometry — the vendor's public page disagrees with your pixel array

Himax publish the part's parameters here:

  https://www.himax.com.tw/products/cmos-image-sensor/image-sensors/hm1092/

  Active Pixel Array   1280 x 720
  Readout Modes        Full (HD), Sub / Bin
  Frame Rate           30 FPS HD, 60 FPS 640 x 360
  Reference Clock      6 - 27 MHz
                       1-lane MIPI CSI-2, RAW8/10, monochrome

Your get_selection reports NATIVE 1198x726 and ACTIVE 1150x718. I do not think
either can be right: the active array is 1280x720, and the tables I extracted
from the Windows driver contain a 1296x736 mode, which is larger than the native
size your driver reports. A native size smaller than a mode the part can output
would confuse anything that uses these targets to reason about scaling or crop.

For what it is worth, my own 648x368 falls out of the same page: the binned mode
is 640x360, and 648x368 is that plus 8 columns and 8 rows of overscan. Your
560x360 is a narrower crop of the same binned window, which is entirely
plausible as a different vendor configuration — I am not suggesting your output
size is wrong, only the pixel-array geometry you report alongside it.

## What I would still like to send

My remaining patch adds a HIMX1092 entry to ipu-bridge so the software fwnode
graph can be built on ACPI x86 platforms. It touches
drivers/media/pci/intel/ipu-bridge.c only, does not depend on which sensor
driver is used, and is orthogonal to your series. I will rebase it on top of
yours.

I can also offer testing on two platforms very different from yours, both x86
with the sensor ACPI-enumerated as HIMX1092 behind a Synaptics SVP7500 bridge
feeding an Intel IPU7 — one lane, but on different CSI-2 ports, different I2C
buses and different bridge ACPI ids on the two machines. Once your driver runs
on them I will send a Tested-by from each, and report honestly if it does not.
The second machine is another user who has been debugging this with me in the
open and who is willing to test.

That is worth something specific to your series: it is currently validated on
one board, and your cover letter says as much. A driver that has been shown to
work on an ARM device-tree platform and two x86 ACPI ones, with the sensor
wired differently on each, is a much easier thing for a maintainer to take.

One note on provenance, since you describe your programming as recovered from
the Windows driver too: my register table was extracted from hm1092.sys
(version 81.26100.0.13, offset 0x26B34 in .rdata) and cross-checked against
USB/I2C bus captures of that driver programming the sensor. I state it plainly
because a maintainer should know that before taking a table.

To be plain about what I am proposing: take the three corrections, and I will
drop my sensor driver, send a Tested-by from a second architecture, and keep
only the ipu-bridge patch. That is a better outcome than two drivers, and a much
better one than a merged driver carrying a pixel array that does not exist and
no exposure control.

If you would rather not take them, say so and I will send my findings as
standalone patches against your driver once it lands, so the information is in
the tree either way. What I am not willing to do is stay quiet about them and
let someone else rediscover the link frequency the hard way — that one cost me
three months.

Thanks for doing this work. I would much rather help finish your driver than
land my own.

Jake Steinman
