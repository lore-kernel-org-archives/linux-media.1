Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107603;
	b=zVjleKxKG0ZloTg1CNVfMo+9J3Z+GaGvLiARfUaIlbYPWvDbnO0vArgbc/MMVVFntTSh
	 bWTHgdOoU4m2G3jEm7h+tdoyNWvCjfnxQNsnkmgSznkq6dhn2qgTFuI7NekRtczVcjziO
	 UpI4sIJQpYbQIin2XPH9KGsdG5/GElI4ohlcOhu7iv2bR7coOi97AQeegEJeKztR9sOHv
	 xJJIBjkjhQhjK5hsi199Z3hAIdmxYx4cPn7KSai2n5opF9JLKJGMZXte2RF0PIL5Ohv2k
	 eOw56o3zNEPYTABRLOWZ7Zt7wmMOfcuYkSAZaiWXIt7B96bhmbz6LBYDgzoXxHOe/ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UaQii/2KLE61POICHXTv/XcYptcQvuPmNYxjzl0fZKI=;
	b=zZrhFWR7keou5hQRGn8HlB558Ub3zD6a/8k3K2PC7/l9La+xIZX2Dy7egdqca9CLq/E2
	 xfOuBY4HXq69hJUS2zXtBWCcr9IgdVV5lKGZYofqBIcci+xWU22j5I4EKMp9wCmYwLHAF
	 vIwG77houPShifP/Gye571P5+nYVHzEx6dd8GhHYCJIVtQiLJOVjV7hE+6mj16bs6kfx4
	 fH7z09iycu0RgdoM20P4p5Vn2NcQkcTzvh5FRd2CiK5MNEWyvslH8zE5xdyFf8viBrLrH
	 f0zZFBbsN53b20JShyJNgFmewLFK/9gSw0YVsXhMdC1C2aWuzRjodKg8rU7rCm+a20A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OK9TotMC;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA3C606A31D
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 13:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA3C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OK9TotMC
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1438dbb05c1so218327c88.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107601; x=1793712401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UaQii/2KLE61POICHXTv/XcYptcQvuPmNYxjzl0fZKI=;
        b=OK9TotMCE05Hedid5XG0LVl7FLYqe8ZH8kprcIB7UdfEYJGARO7MopLEC7hlhuiUfd
         0d6/N8qFuGmAzBQRrKU/QKdtNKmfzLWoc7TOJ1fWJbsHwMcE02GuvHGkgRs+tvs2LhAK
         Hkrscyu0EGwegZHJhqwGb5RZn3lLam/DERk2NF4dffTs1dBg9gA9oh6rd93RghAtjSv+
         /Cks4H01uITera+4iEjCUQJF0lp+IW9yYuPyVdLYFpY2B2Kb8yvkVPUvXjgfgjIobD2e
         7D87S+QCzblGbPBx3qiGf49thDvLaKhj2MfyrFjcWsPwMUaJYG+nSaS3Y1zV3APa0dHQ
         QsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107601; x=1793712401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UaQii/2KLE61POICHXTv/XcYptcQvuPmNYxjzl0fZKI=;
        b=lZzd+LLRtXMRgMeyTkZz3r91G+7b3MLSa+IXdOH29L1uyAcvww6WOiUEPZobLIAOlq
         owTyhIZ4ASrB+kBMRYj7VYL9kPFuH28HfAwVmr2rvYNRIe8+j073P4FarMWVMmvmMN9+
         bcDw7XYfdRcCaYIhQqAg3sLl8YYQyZFC+aqS6yOXmSxJxwQ7JzlyBTbfd3df0r7r+uSy
         esyrmAC11hyC1N5jfBHDBQW0X/bkdXTM9e7kuHrJyJ/2qAQ7F7U077HZ88buornRHpFu
         xxfuVmGno/3smOpSwDIaRu9vocY1mEkfoURN+6YaL0Xa1dp8GVQYtgzcl9iGKsZ1a7q3
         44VA==
X-Gm-Message-State: AFq9FYJvouEK2UuPW+5URmYRBeHsImMw+vy4ipjATWf6HIytrqLnM0uu
	pRT8OWgyZcFQIsJCcqHo2GZp7jvTnJL+r4HAMIWEPREeQSUXIxSIZger
X-Gm-Gg: AYBFou2A7QdXsmnURqaUFH9cF2aYgn+xK5WfG9ZA8g9b6F5beyYhMBkufQO+sWqpmEC
	uGk8arsELD40ZkR3ZAcgvqvzYtdomBWTa0ErUAUUYM4qDWDKXTLoufa1TQTQhDr+0SJkQcL9yQY
	PhJVcOG0/X9CO2PspLAOWoM4hpzdOcuHLzOgV/xF/n8m5iiIQAbPvrZzW1dMaV/6pay86Xs805W
	OgBxtEoT9pVUiqx6HBIPrAVtefJtRiGOetHT9BuXyU0zXjnxYWMc3yT076GKQwBtjIj2cu1yke9
	akRAJh0oftljDbf2bx45kZp963abhkxk2MDJh2H0V32cxcfc4VRtAAONrgkqhuaQPbPsClaHVQY
	e+jHEUoCVP1ttvv9pAQoiTtID0BwtHVOfc5BO65IzHy2qddOryWDq3t+vQIXafGelcs9fgN4FJq
	Mo9MhAnktCWy+OReCKhEsv+/OYq3BXaCvp6X7hubiR3GrzGVasFoEDIbCV+t5NZ9H5m1AkmCy2d
	rzCe80U3aD0QpqGm3CH9hCBVJ5DlSFfs6/V3+AhdT6G0OtviPglV2CKJ6NmqIqrDoYEc23B1KxS
	Qfof4Absh6m9Aoor9VPVpihI/OUXNs8DSKgDtHJMsx5KY6LomQMzOUw+yCE6CAxST+pxpyE3UFv
	hYf2jx7ZkqGkme3FCxFMn6xZ1RzIb/2jlbTy0Gyx8hG7NSg==
X-Received: by 2002:a05:7022:264b:b0:165:be2f:c56e with SMTP id a92af1059eb24-199376df85bmr20204030c88.2.1793107601105;
        Tue, 27 Oct 2026 06:26:41 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm30235977c88.8.2026.10.27.06.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:26:40 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: dmanresa@gmail.com
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/7] media: i2c: ov7251: Fix link frequency index
Date: Tue, 27 Oct 2026 22:26:37 +0900
Message-ID: <20261027132637.540222-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <6ae07c65.e52dcaf0.293af3.e7d5@mx.google.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com> <20261026111032.88355-2-antoine.pichot@gmail.com> <6ae07c65.e52dcaf0.293af3.e7d5@mx.google.com>
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

Hi,

On Tue, Oct 27, 2026 at 03:26:45AM -0700, D. Manresa wrote:
> Applying the patch makes this machine worse, though, and since it carries
> Cc: stable I think that is worth resolving before it goes in.

Agreed, and thank you for the measurements.

The patch selects the 319.2 MHz PLL table, which the index bug has kept
unused on IPU machines since it was added in 2022. That table runs the
PLL oscillator (the VCO of figure 2-12 in the OV7251 datasheet, rev
2.12) out of range: it multiplies before it divides, so the oscillator
sits at 19.2 x 133 = 2553.6 MHz before the divide by 4 brings it down
to 638.4 MHz, and table 2-11 allows 300 to 800 MHz. The 240 MHz table
divides by 3 first and stays at 480 MHz. The datasheet is public at
https://dlscorp.com/wp-content/uploads/2019/02/ov7750_ov7251_csp3_rev1f_ds_2.12.pdf

The Windows driver on the Surface Book 2 uses both orders. Its Windows
Hello mode divides by 4 first, which keeps the oscillator at 638.4 MHz
for the same 638.4 Mbps, and writes 0x1f to 0x4837, the MIPI pixel
clock period register. Its two 640x480 modes keep the mainline order,
with the MIPI divider at 0x01 and 0x4837 at 0x19.

On my Surface Book 2 (IPU3, kernel 7.2) I ran three 150-frame captures
at 30 fps with each of these, the last four with the series applied:

  the 240 MHz table (unpatched)
  the mainline 319.2 MHz table
  the Windows Hello divider order
  the Windows Hello divider order + 0x4837 = 0x1f
  the mainline table + mipi_div = 0x01 (what you tried)

All gave 0 dropped buffers and 0 CSI-2 error lines, so the divider swap
is only a hypothesis for your machine.

> One hypothesis tried and failed, so you do not repeat it: the out-of-tree
> Surface driver notes that the vendor runs the 319.2 MHz PLL with the MIPI
> divider at 0x01 rather than 0x05. Building this patch with mipi_div
> changed to 0x01 in the 19_2_mhz_319_2_mhz entry was worse, not better --
> 3 frames in about four minutes. So the divider alone is not the missing
> piece. The vendor path also uses VTS 522, which I did not try.

The datasheet decodes both as "divide by 1" (0x30b5[2:0]: 2 is /2, 4 is
/4, anything else /1). A frame length (VTS) of 522 belongs to the
Windows driver's 640x480 modes at about 99 fps, so it is no alternative
at 30 fps.

> So either ipu-bridge's advertised link frequency is wrong for this SKU,
> or mainline's 319.2 MHz PLL entry needs more than the index fix to be
> usable. I have the machine for a few more days and can run whatever would
> help decide which.

Could you please try the two patches below, the first alone and then
both, with your 150-frame measurement? They are on
https://github.com/antoine79/surface-ir-camera/tree/test/pll1-vco under
kernel/patches-test/, for git am on top of 1/7.

The first swaps the two dividers of the 319.2 MHz table:

  -  .pre_div = 0x01,
  +  .pre_div = 0x04,
     .mult = 0x85,
  -  .div = 0x04,
  +  .div = 0x01,

The second also writes 0x1f instead of 0x19 to 0x4837 in the three mode
tables.

If the swap helps, v2 puts the PLL table fix before the index fix, both
Cc: stable. If it does not, the question moves to the Pro 7+ receiver:
ipu-bridge asks for 319.2 MHz on both machines, and the Windows driver
programs 638.4 Mbps on the Book 2. Your unpatched numbers point the same
way: at 480 Mbps, three runs logged thousands of error lines and your
568-frame run logged none, with the same timing per line. Could you
please also run 2/7 without 1/7 at 60 and 90 fps? That shows whether the
error count follows the number of frame starts.

After 1/7, pixel_rate reads 63840000, but the pixel array runs at 48 MHz
whatever the link frequency; v2 fixes that in a separate patch. My
319.2 MHz captures above ran at 30.0 fps, which is 48e6 / (928 pixels
per line x 1724 lines); 63.84 MHz would give 39.9 fps. 63.84 MHz is the
CSI-2 bus rate, not what V4L2_CID_PIXEL_RATE reports
(Documentation/driver-api/media/tx-rx.rst).

Thanks,
Antoine
