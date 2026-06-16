Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006DD3B7750;
	Tue, 16 Jun 2026 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610692; cv=none; b=KbLHaJeaFDBy4SArBDCa9D69u+MYwocdE43qxc4hKxvgDcgrtEq/ZGXyssdUf5QwLebjt6PfwmUldmAWlYm+XRU0LiJI7i911DZkyvaSVY2MIFZmyBazOYOme/2Iqhu+8AMePN3YsejyqNgjmFhQ2ctB7VimGG5dZgOcssB/rwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610692; c=relaxed/simple;
	bh=NlX7YKOIsswBINjHIlPNCVkks9/E/FAs3zAbMrJR3Tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fGC9st7BjNTuc//xkGmyZH56cPE0rAQTKd5KPHCTEd4Y5rQt64qjgYdgNI+HrbC4U5F6FGftBw7zDBqR42Dw268N8PRbkqeC05ciX/uwixF9uu6laTxqiwaYXpu4erQxnjQ7RptRdNFfG4BqbFko3qIzjsLmrqOblsZ92xBgFMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=LtUG0eU0; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="LtUG0eU0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781610690; x=1813146690;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=NlX7YKOIsswBINjHIlPNCVkks9/E/FAs3zAbMrJR3Tk=;
  b=LtUG0eU0BqHQZd966BB7b86i/0sz63hsy6bC//mG+9ZlBSRXQEGJMLTl
   hTHAJ6IGul8cPP6oh5GqYsy2t/7yBdqW51Sz1nv1+ekGQv9kxz0MsP1iD
   9nu/eYOzYQqONhXyebuTPd+Y22mUwQ2qnJEp6d0HOm5N7xV97yqMFF89H
   nG9sbn/OQGtcwYRO/gNsc2nU+0R52fwLdGWPw27ocvmNAHJE4ORcnHzn1
   6hdewEI4mQWp44PysFossSk6gGRtrP/4txq7s37IYlTt2QLKnBXnd1zV6
   mB4lwtIou4hpYRzUrU5+YnY0Jvq+EBO1CHhgcRvcC/T0/UteQMGrUEAQt
   w==;
X-CSE-ConnectionGUID: d39gvYYvQ1ujZ+IOf5KqlA==
X-CSE-MsgGUID: BOkWxAYwS1GLFVyy4G/2ew==
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="226388488"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:51:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Tue, 16 Jun 2026 04:51:26 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 16 Jun 2026 04:51:23 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Tue, 16 Jun 2026 17:21:02 +0530
Subject: [PATCH 07/10] media: microchip-isc: fix pfe_cfg0_bps comment
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260616-balki-isc-prefix-fixes-v1-v1-7-b23677fc5ab6@microchip.com>
References: <20260616-balki-isc-prefix-fixes-v1-v1-0-b23677fc5ab6@microchip.com>
In-Reply-To: <20260616-balki-isc-prefix-fixes-v1-v1-0-b23677fc5ab6@microchip.com>
To: Eugen Hristev <ehristev@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3

The @pfe_cfg0_bps comment claimed the field holds the "number of
hardware data lines connected to the ISC". It does not. The field
stores the pre-shifted PFE_CFG0 BPS value (e.g. ISC_PFE_CFG0_BPS_EIGHT,
which is 0x4 << 28) and is ORed straight into the PFE_CFG0 register
word in microchip-isc-base.c.

The old wording invites a reader to treat it as a small bit-depth
integer (8, 10, 12) and compare or do arithmetic on it directly, which
silently breaks since the value is shifted into bits 30:28. Document
what the field really holds and how to read the bit-depth back out with
FIELD_GET(ISC_PFE_CFG0_BPS_MASK, ...).

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index f5e322c2e36b..b084459f4583 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -62,7 +62,11 @@ struct isc_subdev_entity {
  * @mbus_code:		V4L2 media bus format code.
  * @cfa_baycfg:		If this format is RAW BAYER, indicate the type of bayer.
 			this is either BGBG, RGRG, etc.
- * @pfe_cfg0_bps:	Number of hardware data lines connected to the ISC
+ * @pfe_cfg0_bps:	Pre-shifted ISC_PFE_CFG0 BPS field value (e.g.
+			ISC_PFE_CFG0_BPS_EIGHT), not a plain bit-depth integer.
+			OR it directly into the PFE_CFG0 register word, or use
+			FIELD_GET(ISC_PFE_CFG0_BPS_MASK, ...) to obtain the
+			3-bit BPS field value.
  * @raw:		If the format is raw bayer.
  */
 

-- 
2.34.1

