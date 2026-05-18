Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D337352C4F;
	Mon, 18 May 2026 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103806; cv=none; b=C9/dR8IvoUhquStNoL5QJKxu3OtliggvQ2tSTKiQ+8dmKDr/OwTFOMuIj5y7ZlWjSvHF4zekjw9MXf0gqJuYrPXMBOuYkFCmzTGPcwMoLttJvnOIulsWwbvqBieuQKlyX1fwgrhQI13F03h+37/zqDHgKD+I6bQafJqsXBsITPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103806; c=relaxed/simple;
	bh=aU0h4iGXClnIzKcybJRuKFUv+3+oLLIWDAVu+DcXYDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZjBpiRlUaV/FTceazk2dxTYWJU2IdfWQ6s8FHt8CBUNjSh0Dy4SXe5VZT2v/Wytudjtw6ag7artovLD7FwAL/mTAekHKffVKAkUU4gpOZJ89xNg/q9F4z+O3pJQs108bkXCxCGU80pSmzAf/arIYP/pzpUJdX/Tkq2jtA654tUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=JjRECYqC; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="JjRECYqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779103804; x=1810639804;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=aU0h4iGXClnIzKcybJRuKFUv+3+oLLIWDAVu+DcXYDk=;
  b=JjRECYqCtqb3aAdQQv95/YV/kJkMbxSoJfS8FVy+XuZqsrKhF98xx0ka
   D96gPqdchPtwK3HSSGE9k9rSAycgbZH1697U+cYLYoFhgEmralLa2LSDx
   313eXRPBWdVAYxYbgkT8Hid6FwpKmdSqPk6OaGgbV2zY5Tjvyd3ZB5qhE
   I1e03OY4GpAffCQmEzm/XXS+fZ8sgZWxtTJL/gCv4XR7Yrr9t3LH1t8w1
   F4PCMtePXsC6SU8H26/qhgmuTK8prQTpkgXh7WA3qdsK3WH4MvcYN0Mb2
   52DlN9NGpF/yO0BCl+Ewk8ztGucJOL1CovOD0KAkYlA0dm+9+Oh5hovw6
   g==;
X-CSE-ConnectionGUID: mO9/WeksTvOFOTqVDx/qow==
X-CSE-MsgGUID: VgFrmMx0S/qlaToNPqJ1jQ==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="289025035"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 May 2026 04:30:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 18 May 2026 04:29:59 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 04:29:55 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 18 May 2026 16:59:41 +0530
Subject: [PATCH v4 03/12] media: microchip-isc: fix race condition on
 stream stop
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260518-balki-isc-series1-v4-v4-3-97f189185b7e@microchip.com>
References: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
In-Reply-To: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	<stable@vger.kernel.org>
X-Mailer: b4 0.14.3

Disable histogram and drain AWB work queue before releasing DMA
buffers to prevent use-after-free if histogram IRQ fires during
stream stop.

Fixes: 91b4e487b0c6 ("media: microchip: add ISC driver as Microchip ISC")
Cc: stable@vger.kernel.org
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 45b94f1e89d8..b19c5a63b4bd 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -427,6 +427,14 @@ static void isc_stop_streaming(struct vb2_queue *vq)
 
 	mutex_unlock(&isc->awb_mutex);
 
+	/*
+	 * Disable the histogram so the ISR stops firing HISREQ, then drain
+	 * any work that was already queued before returning.  This must happen
+	 * after releasing awb_mutex because isc_awb_work also takes it.
+	 */
+	isc_set_histogram(isc, false);
+	cancel_work_sync(&isc->awb_work);
+
 	/* Disable DMA interrupt */
 	regmap_write(isc->regmap, ISC_INTDIS, ISC_INT_DDONE);
 
@@ -1519,10 +1527,17 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		mutex_unlock(&isc->awb_mutex);
 
-		/* if we have autowhitebalance on, start histogram procedure */
+		/*
+		 * If AWB auto mode is requested and we are streaming RAW,
+		 * start the histogram procedure, but only if it is not
+		 * already running. Repeated enable requests would reset
+		 * hist_id, preventing the 4-channel Bayer cycle from
+		 * completing.
+		 */
 		if (ctrls->awb == ISC_WB_AUTO &&
 		    vb2_is_streaming(&isc->vb2_vidq) &&
-		    ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
+		    ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code) &&
+		    ctrls->hist_stat != HIST_ENABLED)
 			isc_set_histogram(isc, true);
 
 		/*

-- 
2.34.1

