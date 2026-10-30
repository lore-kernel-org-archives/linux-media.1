Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370389;
	b=IrvJteKZ9MZCVpjdLQVZdMK7UetfvDHz1dUERnshlafciNaYZcMzijXWZhI/cejMmHwS
	 za4CwBCSYvcwUUk8E5DM7ffMA/sPX/Lb6CzfWX7x4bCxcmbFvM0iTufz8VUKr+rDFP8YY
	 Tb1/8EydeczKGNtXu+nlKO5cGUXBddUr8QOho+ZVeTY46xSxdDOt0NFvPT9trEGefyPDR
	 N6P4+nyvG17+8Ox4Lt8Ffb8CrY8weBlubPKpCnVoYtXKLHrmdgCf6RSkijMWYhew9nWRY
	 3RmF+Cy9pnlk7jO9zYcGLgFEuY5AcZ+Aw3MHK61BNnlGGVhSxLET9j+tYQ15BtiIcUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sAoD4mQFdz5KOYnm3Mb3Er1f5ViHeAPHJb+fiv/iKuU=;
	b=wifn8i12f3LqQulCbXOnbOiIUDu/uMfQ/ANmBJ6Px9EAYfFLaih2bD1JXrEOPNI6JxtF
	 kWmzf1Y9fIzrB4G/UG7rt/iYlAoK740T1RAln1auPNp9tJkq8RFhBcbKxsKYwb8Hc3YIz
	 mJfRLuvX2QZ0KBAoinRCDMRTtxju2ZcuLeDkAG6A/5AJUQViFzr5A9gNWMsjzPTzCn0sA
	 //FmS6HwQk2rLWc3mih74a2LyHdZjiHFpiVDCqdDqSsvVWkvCjNgzXTO2Xc32dGocuezC
	 QS4WN0BoDEwRJww9uiiBJys7EBh14iuOccx1HVpYCf1+rqdm1R/mM+l0g9xneLXXweA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oer7YIdo;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB18606A31D
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 14:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB18606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oer7YIdo
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a0eecf73fso149359eec.3
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370388; x=1793975188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAoD4mQFdz5KOYnm3Mb3Er1f5ViHeAPHJb+fiv/iKuU=;
        b=oer7YIdotKz/JXRB0qdpxYIPan9ozLr+1Yi+VxrAD9kMoAS3kXA9PaZbyNOJyvMrbS
         v5fjw3XXmiEoi9gPbOXeUp2UbBBzqJztqgXUFxAgQVMjR9/jjE7+Na4ZasF4q3YRWgaa
         GhPMPJhn5SXgAJkQrRyxYp3+2mmlwe+tUW4/F8CyVOQky43y+AbcJAfjoPl/b6CJm+0s
         S+APslvYn7nYiXfzHxsT8UDd0tH5mTfRNwrCYIPe8f12gGx8hUF5dMSqG0eHC6LikE+p
         ekUQJD7QyZPHN8mBaH7V2gXWHApDzpBCNnG4/Uba7HY6byMSbN5w8aX2NoR4GmLRucM+
         Bl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370388; x=1793975188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sAoD4mQFdz5KOYnm3Mb3Er1f5ViHeAPHJb+fiv/iKuU=;
        b=R8vBPdBe8DklEIwCRQai+3hWSdf9NaWqAZv8a/gc1Qm3teuqGqBJ/RKEaKxEUYQwBB
         M+w9w6Ag3lwXLZPtFQtD0RNyFv5Fm1eJcVSN7xs5WCa5hELeE30D9wvEVZzhYEwBiPhS
         caM3KJMVonkMswdxaQFrlzaAh56O8oxeRocXNUA9lFkqfEwfbVrkfLGhcxssFV6uvwfB
         Cpc7EYnHZ14EgfFFGXjZT3UokKNXKRM2AsY5Yx+PwSFiYfFbADijT3E8ZLPCQgQ1VUVN
         Rgfz9bLd389zagHnGb+nVKjqwGBHHCOAheHIAL6LJab7DsYIF1DETnP3WtznHeQ2quUZ
         mxQw==
X-Gm-Message-State: AFq9FYIp1wWw6xKw+umM8su+P6nup8DupCyM4nlNP8Qdp36WyU7q0neZ
	y8sl6yEaZWivjJ1vSZjuAyTNWozruaYB25mow76MF0H8eKe7fzunStT6
X-Gm-Gg: AYBFou0wDbmJJOG5N/DHVEdMznHPHNNLNNbgRGUn3abqjcjV6bcb4oinG8miUhwYNCI
	WmXAPrD6FeATwKNuKgWLfXMTMKD8unoaW/4zNvS4ZADYd+DkQjS9TTYrGsmSTsh6AubitGX/r9N
	7KAl2hOYq+iwX/rBCxhRxkzuMfDhPmByycDi+VFG781zVb4BcNruaOcaNpNXLgojJ29mEw6EaAj
	cpIg9Qm7d6ZfuE0lEmq+iwkSexOuU0Ztpd0D0KUgggjVOEtAHorTSjZzuTgdC+RYnXiVKLj+aRw
	hIQ7+ZMKG6iD1jz3CBBmItlNaOMpOoktjj4PACOLjYXYyc1JA+ALl8cULQ8aHCYrQhvgLapH+QK
	0fQtR0NPmPi6sBJf7G65mk4PstjtN7plRSeXYyv7qvG5drQWipQ9nsLVj7M7+Fh/U5sUsYXj/BI
	m12P5lH2PtAbrfABDjDzpBkIR2Du4cdGmzyyv3wGY+6dszTyzo/NaR9IQhSFse8yVYTe0pkyLEW
	EMIAHSGrNIfHWTjDNGAq/CGUOqNGV4LwB0FqZ+c8XD2it2cnQKNrGyKgiwS7gyjS0wRWoTR27kq
	pi41TJcpUZUgc2UmDZ/x91XNxH18JEuEpLrMvlROAeeq4ZvNX20QFeRRK9OWMJxGAIo+m+JCcQo
	TwZONyKwFwGHnTwp2JyTatd3YNxPio4TJjIbtirdAEXxIdp8uB2cgd22krh0+6XpOAwXUE88Ejl
	V7fJ4LUoH2SRtlHJC42JvucQJtLcQzrkeD0DZHW3CL
X-Received: by 2002:a05:693c:6304:b0:368:1f8c:5f23 with SMTP id 5a478bee46e88-36a4205b0bfmr5705081eec.0.1793370388197;
        Fri, 30 Oct 2026 07:26:28 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm7869265eec.0.2026.10.30.07.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:26:27 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/9] media: i2c: ov7251: Use in-range PLL1 dividers for the 319.2 MHz link
Date: Fri, 30 Oct 2026 23:26:24 +0900
Message-ID: <20261030142624.2235132-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAPY8ntArdj338V8bcSxrmwKQecy-pAcCXMbkWy=qLckX=hawNQ@mail.gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com> <20261028112154.855185-2-antoine.pichot@gmail.com> <CAPY8ntArdj338V8bcSxrmwKQecy-pAcCXMbkWy=qLckX=hawNQ@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave,

On Thu, Oct 29, 2026 at 07:06:31PM +0000, Dave Stevenson wrote:
> I have a 24MHz module and had tested with it, which you'd acknowledged
> in the previous sentence.

You are right, sorry. v3 replaces that sentence: the 24 MHz tables are
left to a separate change, with your measurement cited.

> I've pushed where I am to
> https://github.com/6by9/linux/tree/rpi-7.3.y-ov7251. Patch "media:
> ov7251: Add support for a 400MHz link freq" fixes up all the 24MHz PLL
> settings. I've also done the conversion to use the V4L2 CCI library.

Thanks. For v3 I am taking your "Move the common registers into the
global init table" as patch 7, under your authorship, in place of my
strobe-register patch: the strobe registers now sit in
ov7251_global_init_setting, which answers your question on 5/7 of v1.

The move has two side effects on the bus, both in the commit message:

- The common registers are written at power-on instead of at every
  stream start, so a restart within the runtime PM autosuspend delay
  skips them. The datasheet allows it (table 2-8: software standby
  keeps the register values).
- Register 0x3820 holds 0x40 while the sensor streams, where it held
  0x00 before. The flip control writes back the value probe cached,
  and probe now caches it after the init table has written 0x40, not
  right after the reset when it read 0x00. I poked the old value in
  during a lit stream: brightness, picture, orientation and frame
  rate did not change.

Tested on the Book 2 against v2: the clock, timing, PLL, flip and
strobe registers read back while streaming at 30, 60 and 90 fps are
identical apart from 0x3820. On a sensor kept powered, a restart and
mode switches from 30 to 90, to 60 and back to 30 fps give a correct
first frame every time, at 90.45, 60.15 and 30.0 fps.

The rest of your branch (400 MHz, CCI, HBLANK and MIN_HTS, the
optional enable GPIO, the gain rename, the VBLANK minimum) I leave to
you as you offered, to keep v3 to the fixes and the IR camera. I can
test them on the Book 2 (19.2 MHz, 319.2 MHz link) when you post them.
Two things for that:

- A data point for the VBLANK minimum. A sweep on the Book 2 in the
  30 fps mode (exposure 400, gain 16, 20 frames per value) gives
  normal frames down to 41, white frames from 40 to 26 and frames
  rolled sideways from 25 to 16, both without CSI-2 errors, CRC
  errors from 13 and a stalled receiver at 10. The same boundary as
  on your Pi.
- At the tip of the branch (fde519da0503, "media: ov7251: Reduce
  OV7251_TIMING_MIN_HTS"), unless I misread it, ov7251_set_vflip()
  writes OV7251_TIMING_FORMAT2 (0x3821) rather than 0x3820, probe
  stores the 0x3821 read in timing_format1 rather than
  timing_format2, and the return value of devm_cci_regmap_init_i2c()
  is not checked. In case it helps before you post.

Thanks,
Antoine
