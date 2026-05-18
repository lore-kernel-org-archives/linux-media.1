Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC563F58F3;
	Mon, 18 May 2026 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103799; cv=none; b=KqA21/i6mZrETIbVGVflpExLEqAABuRv4IFkAusi0c/HOfJb3k1bVfFH0brdSzbTqJKsdnrpq8FKYMdWnk7VaKJM8hx3Q9KIY3LmOZFnH56ZpLYj3J3r5p8aydOVWCecZEwXwhiotyI2wkXYyXKRTd3WRlJUoR1HceuPDPrFWQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103799; c=relaxed/simple;
	bh=gvdrgbWAjTx1CGi+PD6csR2l/AwBIyyRN8PqO/RwaYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mVBJnXGNm5m6Rs9nWZcMGdP33t/o0yHhi9+Y1Pfl9ReN3px2fBaZty4ePooMLFLlM5Iy3cmJQzg+EdezZEzOV1ogW1Nsjxa0Spo7OsXIMkM5lSQZLk6ZzV8LzR1P/mNheApRZh49CPwHTfr4SBp1oYldHPinwVP5ve67S1PbQvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=KlRRwiGy; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="KlRRwiGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779103798; x=1810639798;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=gvdrgbWAjTx1CGi+PD6csR2l/AwBIyyRN8PqO/RwaYE=;
  b=KlRRwiGyIWEAGh0NKGnqMybHfeEV3FNf1PG7CNsdTzlKO86XiRwUBZuX
   zqFBMekIDcv8EycmMB7CsL9Rz8sK6bk9FKyiWVgzmHsn7u2gcxIzBfE4a
   t3p9WgSDZ/Gz74FiGkzLg/RHfvCTVU6IavwSXsz+8muvUDk3osRaHv/eb
   w15jW+FdRk8U39x8YhehaDKLIHUnGmc9Ti5SgOJ50iRl+q34LvxeRrakP
   f1HDqgGdUcNJdrvj3r+8er3jpTnkCK+564EYnm+KG2WPFI37ha7jQH8i5
   Q2gZGQ3ucaMDe3fG/P6iHO4p4WGkbcX9nU8NuZq6gO9lr3sQfQV1EQym6
   Q==;
X-CSE-ConnectionGUID: McQheJilRZ2djUWa0gKEtA==
X-CSE-MsgGUID: BU/mtQk+TyO06ys8r0i12g==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="57659229"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 May 2026 04:29:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 18 May 2026 04:29:55 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 04:29:50 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 18 May 2026 16:59:40 +0530
Subject: [PATCH v4 02/12] media: microchip-isc: mask WB offset and gain
 register fields
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260518-balki-isc-series1-v4-v4-2-97f189185b7e@microchip.com>
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

ISC_WB_O_* and ISC_WB_G_* pack two 13-bit fields per register. Sign
extension from negative offsets corrupts the upper field. Mask both
fields to 13 bits before packing.

Fixes: 91b4e487b0c6 ("media: microchip: add ISC driver as Microchip ISC")
Cc: stable@vger.kernel.org
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../media/platform/microchip/microchip-isc-base.c   | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index a7cdc743fda7..45b94f1e89d8 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -61,18 +61,23 @@ static inline void isc_update_awb_ctrls(struct isc_device *isc)
 
 	/* In here we set our actual hw pipeline config */
 
+	/*
+	 * Mask offset fields to 13 bits. Sign extension of negative s32
+	 * values would otherwise corrupt the adjacent field.
+	 */
 	regmap_write(isc->regmap, ISC_WB_O_RGR,
-		     ((ctrls->offset[ISC_HIS_CFG_MODE_R])) |
-		     ((ctrls->offset[ISC_HIS_CFG_MODE_GR]) << 16));
+		     ((u32)ctrls->offset[ISC_HIS_CFG_MODE_R] & GENMASK(12, 0)) |
+		     (((u32)ctrls->offset[ISC_HIS_CFG_MODE_GR] & GENMASK(12, 0)) << 16));
 	regmap_write(isc->regmap, ISC_WB_O_BGB,
-		     ((ctrls->offset[ISC_HIS_CFG_MODE_B])) |
-		     ((ctrls->offset[ISC_HIS_CFG_MODE_GB]) << 16));
+		     ((u32)ctrls->offset[ISC_HIS_CFG_MODE_B] & GENMASK(12, 0)) |
+		     (((u32)ctrls->offset[ISC_HIS_CFG_MODE_GB] & GENMASK(12, 0)) << 16));
+	/* Gains are 13-bit unsigned fields [12:0] and [28:16] */
 	regmap_write(isc->regmap, ISC_WB_G_RGR,
-		     ctrls->gain[ISC_HIS_CFG_MODE_R] |
-		     (ctrls->gain[ISC_HIS_CFG_MODE_GR] << 16));
+		     (ctrls->gain[ISC_HIS_CFG_MODE_R] & GENMASK(12, 0)) |
+		     ((ctrls->gain[ISC_HIS_CFG_MODE_GR] & GENMASK(12, 0)) << 16));
 	regmap_write(isc->regmap, ISC_WB_G_BGB,
-		     ctrls->gain[ISC_HIS_CFG_MODE_B] |
-		     (ctrls->gain[ISC_HIS_CFG_MODE_GB] << 16));
+		     (ctrls->gain[ISC_HIS_CFG_MODE_B] & GENMASK(12, 0)) |
+		     ((ctrls->gain[ISC_HIS_CFG_MODE_GB] & GENMASK(12, 0)) << 16));
 }
 
 static inline void isc_reset_awb_ctrls(struct isc_device *isc)

-- 
2.34.1

