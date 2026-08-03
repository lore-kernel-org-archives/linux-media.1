Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C33137F8B1;
	Mon,  3 Aug 2026 10:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752468; cv=none; b=cRuXPZGk9VuI5TGCfz/pW1tOOaHQRdhQgCrU/qA/VSYEZCpSNwBTG02o/tPrwbmvs3i5mVppqS2GcTj90EQgoE1xRjJVD2BrDOJfmvRBH6TpAeBFHfirTwTmTIaVei/HAWjkdF3RsgADoiGuMmEk1kow+S/ikfQFW+bDy64cig8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752468; c=relaxed/simple;
	bh=V7HFy0DGHkU5Mzgbh7WmrxPJ3UABDK75WI5+QjzATsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Xx94Mgr6s0C4MZCmxtljX6zSV5t6WglUBtju1daRRfC36M4SBabJ9c3tu+PVpO5p+qwCCDXYcxOavlHLO6/LeO6PtyLhyPLDyn90SllE+grlUBq6Gc/tjy5Y6I2Jh3PkyoG/KM8MKbqwGk7uKvpT84sMDEKTX9fv67MzyyGzqms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=C5NJe7RE; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="C5NJe7RE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785752467; x=1817288467;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=V7HFy0DGHkU5Mzgbh7WmrxPJ3UABDK75WI5+QjzATsI=;
  b=C5NJe7RE2CAoQff7/iPoFmS4+LgaO9bwF5opPCfT0H191NOU7XU+QWhV
   rgukuNI1v8t1HsgDvjBmk4KLcPspsZdYBJMNcXrP7Hoe3EYLjrWfJhYKm
   XKbeDC00tPbMO0cmd7E7gX6ZIrcjNqRD6JAsJb1wg2LUI3Dy1RegykYS0
   NXIvsmNbRmFl/2XTO5IEdtNHEi5HTOt2gyIrSk2SxSM6yrNZ76Wd9kNh0
   uMozI32GEjt7rHEiXFcmCRGly6HTl0sxn33OlRWGBVprN7ne8d2uGBl/O
   QP0ZMMoCnvoickMPcfhBN1pd4Hg/xuS+J0mLxIjybJNGiSxgMjGArFxbE
   Q==;
X-CSE-ConnectionGUID: CdjOMjPxTUu+jHE9UyXl1Q==
X-CSE-MsgGUID: kg+o9qRgRw2gWn0Qh8HESQ==
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="292929015"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 03:21:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Mon, 3 Aug 2026 03:21:06 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 3 Aug 2026 03:21:03 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 3 Aug 2026 15:50:41 +0530
Subject: [PATCH v4 06/10] media: microchip-isc: store the unshifted
 PFE_CFG0 BPS value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260803-balki-isc-prefix-fixes-v1-v4-6-f625d6aa0ae1@microchip.com>
References: <20260803-balki-isc-prefix-fixes-v1-v4-0-f625d6aa0ae1@microchip.com>
In-Reply-To: <20260803-balki-isc-prefix-fixes-v1-v4-0-f625d6aa0ae1@microchip.com>
To: Eugen Hristev <ehristev@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3

pfe_cfg0_bps held a pre-shifted BPS value (ISC_PFE_CFG0_BPS_EIGHT was
0x4 << 28) ORed straight into the register. The other format selectors
like cfa_baycfg store the bare field value and position it at the write,
so this one was inconsistent.

Store the bare BPS value and apply it with FIELD_PREP() at the PFE_CFG0
write, and fix the pfe_cfg0_bps comment to match. No functional change.

Suggested-by: Eugen Hristev <ehristev@kernel.org>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Reviewed-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/media/platform/microchip/microchip-isc-base.c |  4 +++-
 drivers/media/platform/microchip/microchip-isc-regs.h | 10 +++++-----
 drivers/media/platform/microchip/microchip-isc.h      |  4 +++-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 3ea38da0e2aa..466f15922c43 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -8,6 +8,7 @@
  * Author: Eugen Hristev <eugen.hristev@microchip.com>
  *
  */
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/math64.h>
@@ -290,7 +291,8 @@ static int isc_configure(struct isc_device *isc)
 	u32 pfe_cfg0, dcfg, mask, pipeline;
 	struct isc_subdev_entity *subdev = isc->current_subdev;
 
-	pfe_cfg0 = isc->config.sd_format->pfe_cfg0_bps;
+	pfe_cfg0 = FIELD_PREP(ISC_PFE_CFG0_BPS_MASK,
+			      isc->config.sd_format->pfe_cfg0_bps);
 	pipeline = isc->config.bits_pipeline;
 
 	dcfg = isc->config.dcfg_imode | isc->dcfg;
diff --git a/drivers/media/platform/microchip/microchip-isc-regs.h b/drivers/media/platform/microchip/microchip-isc-regs.h
index e77e1d9a1db8..185ef0eab7ad 100644
--- a/drivers/media/platform/microchip/microchip-isc-regs.h
+++ b/drivers/media/platform/microchip/microchip-isc-regs.h
@@ -31,11 +31,11 @@
 #define ISC_PFE_CFG0_MODE_PROGRESSIVE   (0x0 << 4)
 #define ISC_PFE_CFG0_MODE_MASK          GENMASK(6, 4)
 
-#define ISC_PFE_CFG0_BPS_EIGHT  (0x4 << 28)
-#define ISC_PFG_CFG0_BPS_NINE   (0x3 << 28)
-#define ISC_PFG_CFG0_BPS_TEN    (0x2 << 28)
-#define ISC_PFG_CFG0_BPS_ELEVEN (0x1 << 28)
-#define ISC_PFG_CFG0_BPS_TWELVE (0x0 << 28)
+#define ISC_PFE_CFG0_BPS_EIGHT  0x4
+#define ISC_PFG_CFG0_BPS_NINE   0x3
+#define ISC_PFG_CFG0_BPS_TEN    0x2
+#define ISC_PFG_CFG0_BPS_ELEVEN 0x1
+#define ISC_PFG_CFG0_BPS_TWELVE 0x0
 #define ISC_PFE_CFG0_BPS_MASK   GENMASK(30, 28)
 
 #define ISC_PFE_CFG0_COLEN	BIT(12)
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index f5e322c2e36b..d7bcd74efff9 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -62,7 +62,9 @@ struct isc_subdev_entity {
  * @mbus_code:		V4L2 media bus format code.
  * @cfa_baycfg:		If this format is RAW BAYER, indicate the type of bayer.
 			this is either BGBG, RGRG, etc.
- * @pfe_cfg0_bps:	Number of hardware data lines connected to the ISC
+ * @pfe_cfg0_bps:	ISC_PFE_CFG0 BPS field value (e.g. ISC_PFE_CFG0_BPS_EIGHT),
+			written into PFE_CFG0 with FIELD_PREP(ISC_PFE_CFG0_BPS_MASK)
+			at configure time.
  * @raw:		If the format is raw bayer.
  */
 

-- 
2.34.1

