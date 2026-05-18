Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EF63F8EB9;
	Mon, 18 May 2026 11:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103857; cv=none; b=OoAIDLd/KZaYxMNQtxEdEIQuJkh1trOmuGdDjjsl/4hAhxEYTT/McyR556Zyiw2upo1nmeyie0T3kyG1MgAXuGQ/zNv50OVyUptgGBxfwOIAqnmXEfqNibzOgXzRgq7Af93evY+vDpyE8GYIJNW6UelvO2czMaiFX0CMfEAcXA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103857; c=relaxed/simple;
	bh=fo3V0BNkGHzTYJiMTMF1jfYcmbzJRYB9SsH1lTWpNoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QIT5iCesTVuUivQt/Ku89up+Z1hsyR4yRHH5SqUHbXaVkn+DXse96rMB2yVsiCGX5WuaLeIuDnNv/IRT5o2a+Qki66/LB4DKM3p8VaQsP+kLkuQ98zMTMPOMwm2/HjV/R0YcUgpA5i5b2pE2ooAr++ZuKZECBGY/ccQ0i5kfrUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=CJlIvI4o; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="CJlIvI4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779103853; x=1810639853;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=fo3V0BNkGHzTYJiMTMF1jfYcmbzJRYB9SsH1lTWpNoE=;
  b=CJlIvI4oTerwqxIrHNJfAE8M4cwkPjEDbOJABLnC2c6Flt7DCCT54UGl
   nBGK+orslzJVgStSXkzUD1+e/ldHakUfWo0M5F8MeoShtxyzlQH8BbM+2
   n2J9qOTNsQiZSPC9VkNfkATtY3cuY8xhWYoyUkikLWMvYtN7CYGlDS4hl
   TOdZpjvAQZLQWm/A5S4OkNcWqDU8yh7TqFtNqt4lI5E81rejaDT3S7ahU
   tffe/iKE/V01VvxpWCwGZu/nXsXP+0c1aXFQKoqKfFI8cLF7jzi4iPgfd
   Iij2X37AJtUsESAsqtHbVK1HlWbpS3IlLe7g5wRlxBSLLF+l2Ugi1E+PK
   Q==;
X-CSE-ConnectionGUID: jVACxADxSqO19H6k7nNPFA==
X-CSE-MsgGUID: nnLGZZ7cTDqX4/tGofW6AQ==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="56879107"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:30:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 18 May 2026 04:30:50 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 04:30:47 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 18 May 2026 16:59:49 +0530
Subject: [PATCH v4 11/12] media: microchip-isc: smooth AWB gains with EMA
 filter
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260518-balki-isc-series1-v4-v4-11-97f189185b7e@microchip.com>
References: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
In-Reply-To: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.3

Apply exponential moving average (alpha=0.25) to reduce per-frame
flicker from sensor noise.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 19 ++++++++++++++++---
 drivers/media/platform/microchip/microchip-isc.h      |  1 +
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 67c2999ae5b5..82eff6012527 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -93,6 +93,7 @@ static inline void isc_reset_awb_ctrls(struct isc_device *isc)
 	for (c = ISC_HIS_CFG_MODE_GR; c <= ISC_HIS_CFG_MODE_B; c++) {
 		/* gains have a fixed point at 9 decimals */
 		isc->ctrls.gain[c] = 1 << 9;
+		isc->ctrls.gain_smooth[c] = 1 << 9;
 		/* offsets are in 2's complements */
 		isc->ctrls.offset[c] = 0;
 	}
@@ -1472,11 +1473,23 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		/* Combine stretch and grey-world gains; result stays in Q9. */
 		gain = (s_gain * gw_gain) >> 9;
 
-		ctrls->gain[c] = clamp_val(gain, 0, GENMASK(12, 0));
+		/*
+		 * Smooth gain updates with an exponential weighted average
+		 * to suppress per-frame flicker:
+		 *   smooth[n] = (3 * smooth[n-1] + gain) / 4
+		 * Clamp to the hardware register width to prevent unbounded
+		 * accumulation under degenerate (near-empty histogram) inputs.
+		 */
+		ctrls->gain_smooth[c] = (3 * ctrls->gain_smooth[c] + gain) / 4;
+		ctrls->gain_smooth[c] = min_t(u32, ctrls->gain_smooth[c],
+					      GENMASK(12, 0));
+
+		ctrls->gain[c] = ctrls->gain_smooth[c];
 
 		dev_dbg(isc->dev,
-			"isc wb: c=%u black=%u avg=%u s_gain=%u gw_gain=%u gain=%u",
-			c, hist_min, channel_avg, s_gain, gw_gain, gain);
+			"isc wb: c=%u black=%u avg=%u s_gain=%u gw_gain=%u gain=%u smooth=%u\n",
+			c, hist_min, channel_avg, s_gain, gw_gain, gain,
+			ctrls->gain_smooth[c]);
 	}
 }
 
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index fccd7ff4846b..4503fcbfdce8 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -149,6 +149,7 @@ struct isc_ctrls {
 
 	/* one for each component : GR, R, GB, B */
 	u32 gain[HIST_BAYER];
+	u32 gain_smooth[HIST_BAYER];
 	s32 offset[HIST_BAYER];
 
 	u32 hist_entry[HIST_ENTRIES];

-- 
2.34.1

