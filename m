Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850401;
	b=AAJVQQm0GBRvbBcxuwoDdjkLotYxYzNTTPnxziXcgvHUEqFNHDtb/n5X8GbP/oUseexU
	 xMlFcyD6B4cGWSwbnQ6+ereRkX3Xq1thcWPj+j6MlpfWJUnx8zHeV45BQPHalbWXCmtGH
	 ho5pmDgRPEZOErm/rroe1vZQETnWxAuoMOJuvnzVriymFJ2VYTTsLY6x2uV3kwkOVvF4x
	 /3MHslKUPnQ/UE8JBP8LuH9k2CGYYiSOIFNcKeRdWWy3TxiPwb7WdF78tAk0N/2j6B75w
	 zPXkE9fHkrGJjFsoZBFDazbazwl0eFtxUEissYV9Jf5q90BnIesHuVwiN9tJ2zNLD/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hg9Uic1Jci3EVD6ABAnH87aOxyU3YxP5Q27E7GZD9Wc=;
	b=sGKvMygKOlzYJ6bNImZzSpx0Zg9/obHA0isjsYq2tStUr1s110/a84jeul852UiYFJIj
	 nSbP0Vi5JvF9s+IJ5lcSlnFAyV03dYmOtwQ/6u9VocBy1XNQqOKqTe/iYuXm3HnqeRCek
	 LSDuvCgsDwmDkiru3vowF7vATymWtHTQncmjRCyVDXnaROjitm9qOpPNy99LcyM4n2YLu
	 IuegOcbD8jlepz5YT67gYJyDcnrv1Snrc8Sz4kqj+mkjSBHxjs/4s+JRz05+3oD7sbnBD
	 ViVReNCUsW/CU0vI44ovFqN8m3GRnNoHb+O0rWitA6/QkWChGdycNUlzwDKfjrcTGEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SnKDhOwR;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FA3606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16FA3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SnKDhOwR
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so12931345e9.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850398; x=1795455198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hg9Uic1Jci3EVD6ABAnH87aOxyU3YxP5Q27E7GZD9Wc=;
        b=SnKDhOwR5tgdadrFwvHn93b37aN4q5Gh7FM4QLzz9gohk/670mFtGsPCOz6Rx77nvn
         T2/LRf4LAEbDHfP2RSUTr69b4x3uKiW2FqfeEVBgO9XQs2HgOQXvb+dF7BaBm0dQ3WCT
         sEOzMTz1Ket9y0lVXKPRejygv8nhSSpRPwPmEvCM0aWEeZg0/qW7BiH7HsctunmZx7sv
         3VraXx1ZR3FCS6wO5hjrrK3rjFEAd44vQFieUFgURPcgtX2v17VxYxLvYJ9FyVMIqmjO
         bvPiE+0oufmlt9h5BubvDGooNrFksu0X2Yl5OccED8qW2WKqcj8y5Vrqyu4NLrn4wb54
         U5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850398; x=1795455198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hg9Uic1Jci3EVD6ABAnH87aOxyU3YxP5Q27E7GZD9Wc=;
        b=r0SBCGl19ltX6h9+tpnyDX75YWwcSgbPkphdm8/TltFF0AM9rZ7+XlY+Ma5xXtTvAc
         FBUgJRAz4NXbEGbu2PTTBvSMMhwCm1AJww5QCQ4k6a9SqsqvSon/NKdugduhC/Uj2D1s
         NU8un1ani+yXDO4uzS6ktHybPShRCeHkCL55/yuF6U4c7MG5poThCJK/oZeXUS05qB2D
         MZYr205ueetWQNzFx068RJuJhifXJbb0iep3eHQ6NhiDmiaGpPaN2xP5nfh22HJQiqta
         516iMMsMz1PKRlecF4BEP1+H3NFZJMhia7iLYL29ryKvh/Ou3Jmsyn+PXLcbcYCY10ir
         9eQw==
X-Forwarded-Encrypted: i=1; AL+hErFh/Z6/dXM8yzHEE5Yxc16PzZenkd+MJ3+egv2Gi5Er7xoqa1rtN5BDiduJVY7YMo1h7kN6u0AuvgpwbA==@vger.kernel.org
X-Gm-Message-State: APuU4Z89rr2Zvy1pLnWckwx6+BRPCO+eXWNlGwf0JFFlt7sdBhcX+G9Q
	uxG/WOuIO2X0dD7fYnwl2N5JfnHv1tD7IdtSjc2ToHYkVqJTKu7f/x8Q
X-Gm-Gg: AYBFou0EQbF2VwXg2OWIhdUKUZr1J+HSldZDuQppeZnLQfV71j7JC1EbR6gjn8AIXF9
	kDy4lokACZ8NKUf0ALEZ5I2H2hv6IUSe5yCtmGhclwmKQPwwsyvYCiN2J/r6/6fJc1KasOaH0ij
	geUWk5LJ+ebgp+Hr2fV5w+kC4+FN5nySfjYhHsqBhau1BnXOoia/s29ftwgOqHjIwYBMq6dkpc3
	HWNTJApo2s+CyRwsHBJ2GEogQLvrRq1/M3W0mANdKH8V6rBuE0BcFMC/eCdJTKilkY61K0grJEP
	4JOAw8bVXoA5JrEESq7imKNO9oq5PNQtTrs29Q5kbUGGH5Rx6zFv+pazsuO+PcHNVtycLCfVlrW
	Ap+MaRuBdsDABA3wnufXJelv0UWCU/K0aYUpjKq/lafjDqdfyo4sd9V33ndMFfWB2t5+lHznXNo
	Z6n4oDngU+jjv4EDJz0l8KUA725HikFabzOk5RAiSL8bjX+XSTYs6SpAL3E6349GrkUp3wN2O6B
	bbfb5MJLEZ3WYqpU2jCQ8MPHG3CShFKQiiZvTsKlqqYGwtGd0OGT4N3MNYUhlVCDc/YlR9IMTMp
	YYUA4koenZp3U34IXa4O7H9H3fAvvGyH+eTzZ8pvneGzjxxOxlT1gsGnpSNB1LhRpTI=
X-Received: by 2002:a05:600c:8905:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4bb55a57c66mr161878745e9.8.1794850398200;
        Mon, 16 Nov 2026 09:33:18 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm3327525e9.12.2026.11.16.09.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:33:17 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH] media: atomisp: csi2-bridge: Don't cycle the PMC clock if its rate is correct
Date: Mon, 16 Nov 2026 17:33:06 +0000
Message-ID: <20261116173307.14169-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
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

atomisp_csi2_set_pmc_clk_freq() enables and disables the sensor's PMC
platform clock to be able to change its rate to 19.2 MHz. ACPI however
also controls this clock, through the CLKx power resource in the sensor's
_PR0, and caches the state of that power resource. When ACPI has already
turned the clock on, the clk_disable_unprepare() turns it off underneath
ACPI. ACPI keeps considering the clock to be on, so a following power-on
of the sensor does not run the clock's _ON method and the sensor does
not respond on I2C.

On a Lenovo ThinkPad 10 (20C3) with an IMX175 rear sensor this makes the
sensor's probe fail intermittently, depending on probe ordering:

  atomisp-isp2 0000:00:03.0: Found supported sensor INTCF1A:00
  imx175 i2c-INTCF1A:00: Error reading reg 0x0000: -121
  imx175 i2c-INTCF1A:00: probe with driver imx175 failed with error -121

The effect of the clock cycle was also reproduced directly: with the
sensor powered through ACPI, a single clk_prepare_enable() +
clk_disable_unprepare() of pmc_plt_clk_0 makes it stop responding.

Only cycle the clock to change its rate when it does not already run at
19.2 MHz. The DSDT's CLKx._ON methods on this machine already select the
19.2 MHz PLL.

As a side effect, a clock which the firmware left enabled at 19.2 MHz is
no longer turned off by atomisp_csi2_set_pmc_clk_freq(). It is turned off
when ACPI powers down the sensor, e.g. when the sensor driver
runtime-suspends it.

Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795, BIOS GWET50WW 1.50),
with this file built out of tree against a 7.2.15 kernel: without this
change the IMX175 probe failed on 2 out of 10 boots, with it on 0 out of
10 boots. The probe failure and the direct reproduction above match;
the boot counts on their own are too small to be conclusive. This change
was also part of a media.git next kernel (7.4.0-rc1) built with the
pending IMX175 driver, on which the IMX175 probed on both boots tested.

The problem was investigated and this patch drafted with the help of an
AI coding assistant (Claude); the testing was done on the hardware by the
submitter.

Fixes: 0af9078315c1 ("media: atomisp: csi2-bridge: Set PMC clk-rate for sensors to 19.2 MHz")
Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_csi2_bridge.c   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d7..a49996e26 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -257,6 +257,17 @@ static int atomisp_csi2_set_pmc_clk_freq(struct acpi_device *adev, int clock_num
 		return ret;
 	}
 
+	/*
+	 * ACPI turns this clock on and off through the sensor's _PR0 power
+	 * resources, without the clk framework knowing. Cycling the clock
+	 * below turns it off underneath ACPI, which keeps considering it on,
+	 * so only do so when the rate must change.
+	 */
+	if (clk_get_rate(clk) == PMC_CLK_RATE_19_2MHZ) {
+		clk_put(clk);
+		return 0;
+	}
+
 	/*
 	 * The firmware might enable the clock at boot, to change
 	 * the rate we must ensure the clock is disabled.

base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.43.0

