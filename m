Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597053EC2E6
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 02:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785809861; cv=none; b=myfuJtSFJGBK9EJ4H/PSAJLnma7c+FLMCmUHxXCIvge0HfMF30tNrAVWT0/HHrVata/Q1cIc4EwpP3662LoWjUidvOyy6YKbo+hFarvkDrZG4O5AYyrh2DQR/1oqCJHLDcYDybwf8yl9x8+MdhUafHw+HuUMSu2CoF+VtbysAjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785809861; c=relaxed/simple;
	bh=REGRC6vT889Wy+K1SeNPjktPj1ZZ5GO1N9xKD6cbxWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MgvBauuXC4Os0jw/N2wgwC6/3ZSyrXFhEzkOFpNEDrd7ewbik5MjUMiYVvB6gDfqi1fwjxGube2DfS2awiAdpKL0CwQsfuWuMXN0Fl2J2JhUbmz2WfHHsrODQW7JdzUkHXTcV2QcXDa6+4pwtCzNKxxxiMetbbEDHCRgF8Sdo/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=SgzuKfoI; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="SgzuKfoI"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8f0d6853360so28130556d6.0
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 19:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1785809858; x=1786414658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCWwc4PbSmy58K/ROowYfWxjHjhep24ERLsC2n+IHG4=;
        b=SgzuKfoISTThvYy/W+hm0Q+sALazxbG7F0t1BoBKY+a/I8/Bi9r6U4vNMjzhNaD/Eb
         5tqJvC58XfSXbKLjC49upsw+ngN5AtjjeQX8OX18TvTWF46eZTTdcSFuZ0qDkrNHH+EK
         a/ZA4CpEVi26fIa3k8AkoTNUyvN0Xb/ny+LbziZ7iahQffCXoph1lj6M7fW9+iYNqwwo
         egQLYY1sf4o/YmXwwQZX6lGZ0BHmR4qqN9BTfwUKeLw+YJdqzz5W+1Ulof1Frdic586s
         TTkfnDxvsWJXOMxBWFk1BfIo2BF0gMZADCo18DflExSxXHAyC9v7VCvBo8krukdAMin7
         Zddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785809858; x=1786414658;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCWwc4PbSmy58K/ROowYfWxjHjhep24ERLsC2n+IHG4=;
        b=QSc1H1izUr2sk1++I9jwTbivzaEO/1u/JEM8ueKXt+ny7UsVacXs0KbZwTK+3XlQmH
         TbM/eyzWZyi1Cf61JAySvrEBL5croxKzvH2R1M901fhtzvx6JWfrp1e4WNqlsqzmqcOz
         ma6Hwhc+iwPyK07cqDBd8bo2tCF4wqFaNi2YDyXe3Lzypf8BVfxFXLMNEXsIwOT0X8CZ
         V7TDArQVYx+mO5Hs6vJWBGyW3SipIZnGEF6ooRvkCvLkKx+S3ZrX75fCruISQN8eCRt1
         k54pH3twFv/D84ZGnZWQtx7TY0KytQmtJvqW9mo2ocGu8Icj30lD9k9Wrb9Oq38dBznr
         vKUQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjjWjxcwnCckyKHF3Ey7BNi2BU0IYNOz42eZV39WUlqfFe3re7/2+nO0o8yaaje9EvYSHv7eVYH1/0bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwetUsWFByk9hYzZNwXmxjEJecsKKR5chFoSm4iALnqA/lvWb84
	3NsChxzNBCtXprWpQGNQF4dqXJ5oOykx/K2oPpxMAD8A3jf6oWtt0xGeNgVVM8p41waIOK+9MF6
	oIVj019g=
X-Gm-Gg: AR+sD13SpwRAwQBCUcHOGotX9iQLelI0B2WKkN4Dh93KJf9bN6YMS9R6yru5jUrQhFN
	R10aHPPzXvFjWTjBjZ6NeWYnV+wDdLrI2RQk8LGlfdJ0Snu7F98yTZaviPa3Of7bdLQ6LaFCH0g
	rsMN3wBmDeqDKitrejaIL97agWwc/dttsa3WAHPGjFxSCHQXzWTPsf06ck51O2OhVfa7614HPy3
	CxihwjUXSb7wODCqJ7RUYjyMcBws/yZwLNW01AhbcH23d+46qqvwxvEWLyo2/d7yjOca06T0dX7
	uo8GnZIPEQv9CFfN0mEJhwWH6KYiqA/RXB6CClmPmZfMvx8GOffvfZ1ciuJb/sHr+DAKjSp+nyl
	/JHLIRtPjaPxLA6FqEIhh8FDp9t6W0pK7UTP3Y76EyGeuCf2lFHf23TYaLPVvVb1HCaWrp8m1Ba
	X/e91xij9KSARXYUsq+iowYwiJcGo4DlXFX2NBSpjqX/R7XhkzTHTc8C+prQylsH0iAv0pUrNeh
	//oZoGLwie7X/XrJlmpZul/FGVUuhXWjznAyLKyDq+ETlX0F/QqXOPWkh9A5x1C1Dm18Lb6YT5G
	XNDW3mxlv5odMmQU1TxcYnz5kgyemHImhVKvZp3XoO0=
X-Received: by 2002:ad4:5d66:0:b0:8ef:549b:794c with SMTP id 6a1803df08f44-9084965f311mr277037776d6.29.1785809858047;
        Mon, 03 Aug 2026 19:17:38 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::f163])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435b6778sm88836346d6.30.2026.08.03.19.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:17:37 -0700 (PDT)
From: Jake S <j@metarealtyinc.ca>
To: Ramshouriesh R <rshouriesh@gmail.com>
Cc: Jake Steinman <j@metarealtyinc.ca>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 2/2] media: i2c: Add Himax HM1092 image sensor driver
Date: Mon,  3 Aug 2026 22:17:34 -0400
Message-ID: <20260804021735.345039-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jake Steinman <j@metarealtyinc.ca>

Hi Ramshouriesh,

Relevant to your series: the ipu-bridge entry for this sensor landed in
media/next on 2026-07-30 as commit 4fdb0342f05e ("media: ipu-bridge: Add
Himax HM1092 IR sensor"):

  IPU_SENSOR_CONFIG("HIMX1092", 2, 180000000, 180480000)

So on Intel platforms the sensor endpoint is built with both link
frequencies as soon as your driver lands. That is where comment 3 below
comes from.

I have not tested v7 on hardware -- my machine is Intel/x86 and, as below,
the driver cannot bind there in its current form. Everything I say about
ASUS behaviour I take on trust from your testing.


THREE THINGS THAT BLOCK x86

The driver is Qualcomm/DT-oriented, which is reasonable given what you can
test. It does mean it cannot probe on the Intel IPU6/IPU7 laptops this
sensor also ships in, and I would rather raise that now than after it lands.

1. The external clock rate is hard-rejected.

     #define HM1092_MCLK 24000000
     ...
     if (freq != HM1092_MCLK)
             return dev_err_probe(dev, -EINVAL, ...);

   Dell supplies 19.2 MHz, not 24. That part is measured rather than
   inferred:

     $ grep -A1 HIMX /sys/kernel/debug/clk/clk_summary
      INT3472:00-clk  1 1 0  19200000 ...

   The PLL is programmed to suit -- the Dell register table writes
   0x030d = 0x0a and 0x030f = 0x5e, which read as the low bytes of the CCS
   OP_PRE_PLL_CLK_DIV / OP_PLL_MULTIPLIER pair and give
   19200000 / 10 * 94 = 180480000. I have no datasheet, so please treat
   that decode as inference; note also that Dell writes 0x0310 = 0x00,
   which under CCS would be PLL_MODE_SINGLE, so this part is evidently not
   strictly CCS-compliant and I may be reading it wrong. The 19.2 MHz
   external clock itself is not in doubt.

   You already use devm_v4l2_sensor_clk_get(), which is the right thing --
   it is only the fixed-rate comparison that fails on Dell. Dropping the
   check, or deriving the expected link frequency from the rate, would make
   the driver portable without any other change.

2. There is no ACPI match.

   Only .of_match_table is set. On x86 the i2c client is enumerated from
   ACPI by i2c-core-acpi.c and client->name ends up as "HIMX1092:00". None
   of the three arms of i2c_device_match() can match that: the
   i2c_of_match_device_sysfs() fallback compares against "himax,hm1092" and
   "hm1092"; acpi_driver_match_device() without an acpi_match_table falls
   back to the DSD "compatible" property, which Dell does not supply
   (modalias is acpi:HIMX1092:HIMX1092:); and there is no id_table. So the
   driver needs an .acpi_match_table entry for "HIMX1092" or it will not
   bind at all.

3. The mode and link-frequency menu are ASUS-specific.

   hm1092_mode_560x360 with HTS 0x0650 / VTS 0x02ee, and a single-entry
   hm1092_link_freq_menu of 180000000. Dell runs 648x368 at nominally
   30 fps with HTS 1620 (0x0654) and VTS 741 (0x02e5), at 180480000.

   With the bridge entry above advertising both frequencies,
   v4l2_link_freq_to_bitmap() intersects the two lists, finds 180000000 in
   both and returns success -- no error, no warning. So on Dell the driver
   would simply advertise a link frequency 0.27% away from what the PLL is
   set to. That is unlikely to break the receiver; it is just wrong, and a
   second menu entry is cheap.

   One caveat on my numbers: my Dell table is a capture of a whole Windows
   Hello session rather than a static init sequence, so several registers
   are written more than once. 0x0340/0x0341 takes three distinct values in
   order -- 0x031e before the mode is selected, 0x02e4 with the mode, then
   0x02e5, which the AE loop then rewrites unchanged five more times.
   0x0342/0x0343 likewise goes 0x05e4 then 0x0654. So 741/1620 are the
   steady-state streaming values; reading only the first write gives
   798/1508, which is what I got wrong myself first time round.

None of this needs to hold up v7. I am happy to send a follow-up adding the
ACPI match, the second link frequency and the Dell mode, and to test it on
the hardware I have. Say whether you would rather have that on top of v7 or
rebased onto a v8, and I will work to whichever suits you.

One smaller note: the comment on the init table says the exposure default is
programmed at 0x0202/0x0203 so the hardware and control states agree. Worth
saying explicitly that this is why HM1092_EXPOSURE_DEFAULT is 500 rather
than a derived value -- it is the kind of thing a later cleanup would
"simplify" and quietly break.


ATTRIBUTION

You have Reported-by plus links and you credit the register work in the
commit body, which I appreciate. When you asked before v6 I said
Co-developed-by would fit better, and I still think so, though I want to be
precise about what I actually contributed rather than overstate it.

The exposure, analogue gain, digital gain and group-hold register
assignments came from my analysis of an HM1092 I2C bus capture taken during
a Windows Hello session, and I published a working driver using them. v7
implements those controls as I described them. Whether that is
Co-developed-by or Suggested-by is genuinely your call -- the difference is
whether you consider the control implementation co-authored or specified,
and you are better placed to judge that than I am.

If Co-developed-by:

  Co-developed-by: Jake Steinman <j@metarealtyinc.ca>
  Signed-off-by: Jake Steinman <j@metarealtyinc.ca>

One thing to flag either way: I use an AI coding assistant, and
Documentation/process/coding-assistants.rst asks that it be disclosed. My
ipu-bridge commit above carries "Assisted-by: Claude:claude-opus-5". If you
take any tag of mine, the same line should go on this patch for consistency.
The analysis and hardware testing are mine and the Signed-off-by would be
mine alone, but I would rather raise that than have it noticed later.

Regards,
Jake
