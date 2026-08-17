Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DDA3B6C1D;
	Mon, 17 Aug 2026 06:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786949558; cv=none; b=RpJgpuZfKL8hRLtI+iboezqHCYXVwN4+pJld6jrxNBE/hN8S0AyMl0nZsxiR+s1wmVvWKrrmJdus79veHn/zFERmKVkE9ceLJbg1BnTyP1zwKk8Y4ZfvrbxX9Hes+I06we58sI2lASlboX4FHQCtm7rsRzUn7KO0Dyv7mjuxdlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786949558; c=relaxed/simple;
	bh=DokWnrK2yqWi9cQiBgNvGnMVLvU9Yfy8CL5z2COi+MI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZSFrLfOtOpUYlbWOi+ajB1awz7uZSnt2JTp5ZBxSklGHdy+PaOEuIPD3wX55wIUHJnQEsO5VNbpASVIgMBijTbV8HGkBJeflz+lqpGbtW1T/sTMWDCUQGMTpdkk1MDsy6KGD4J52l1tlQbWVNOAwIGrhG+9q/1eyJMlBiB6Ozh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=opC1nmr6; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="opC1nmr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786949556; x=1818485556;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=DokWnrK2yqWi9cQiBgNvGnMVLvU9Yfy8CL5z2COi+MI=;
  b=opC1nmr6k+rTlknxSu5vsDhi0uBOuow2kpvMPwIcnneYLioS/JtO+n0K
   qt4yRBVSVdlUotSuzkavKe9fqR5QWl5FszNfjHM+3rEW3NJDhKFRqlsn7
   Bn7MQrzYvjxzgIcvcoJytQvbf7OOAqUuKwjPedSpVlXpyiHpXN1xCIqm4
   SbVy+EuHEqgI4Co2cQh/S7DutDmrEBbW9m522KEoHv4NtrOTf0yT0VEh+
   qkV7SvrqeHMHoXph9MtWQ2Izmb6a6rmR/eZAGXkSjAchG8vhYe+BeGWBl
   rRUAKkvljZ6Crhm1V/3FmcWhWT0lKn0Kor91qdEpt85AdHvSPGMkW/AHL
   w==;
X-CSE-ConnectionGUID: NGlbiYAORm2Q8Dm/bqPzjQ==
X-CSE-MsgGUID: jiBO0J19Sda9a3jHVz4eKg==
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="61331932"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Aug 2026 23:52:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 16 Aug 2026 23:52:35 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sun, 16 Aug 2026 23:52:32 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 17 Aug 2026 12:22:04 +0530
Subject: [PATCH v5 07/10] media: microchip-isc: fix ISC_PFG_CFG0_BPS macro
 name typo
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260817-balki-isc-prefix-fixes-v1-v5-7-2514df336c5e@microchip.com>
References: <20260817-balki-isc-prefix-fixes-v1-v5-0-2514df336c5e@microchip.com>
In-Reply-To: <20260817-balki-isc-prefix-fixes-v1-v5-0-2514df336c5e@microchip.com>
To: Eugen Hristev <ehristev@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3

The BPS field macros for ISC_PFE_CFG0 were spelled ISC_PFG_CFG0_BPS_*
(NINE, TEN, ELEVEN, TWELVE). The register is PFE, not PFG. Rename them
to ISC_PFE_CFG0_BPS_* to match the register and the EIGHT and MASK
macros. No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Reviewed-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/media/platform/microchip/microchip-isc-regs.h  |  8 ++++----
 .../media/platform/microchip/microchip-sama5d2-isc.c   | 18 +++++++++---------
 .../media/platform/microchip/microchip-sama7g5-isc.c   | 18 +++++++++---------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-regs.h b/drivers/media/platform/microchip/microchip-isc-regs.h
index 185ef0eab7ad..9ddbbb6dd68b 100644
--- a/drivers/media/platform/microchip/microchip-isc-regs.h
+++ b/drivers/media/platform/microchip/microchip-isc-regs.h
@@ -32,10 +32,10 @@
 #define ISC_PFE_CFG0_MODE_MASK          GENMASK(6, 4)
 
 #define ISC_PFE_CFG0_BPS_EIGHT  0x4
-#define ISC_PFG_CFG0_BPS_NINE   0x3
-#define ISC_PFG_CFG0_BPS_TEN    0x2
-#define ISC_PFG_CFG0_BPS_ELEVEN 0x1
-#define ISC_PFG_CFG0_BPS_TWELVE 0x0
+#define ISC_PFE_CFG0_BPS_NINE   0x3
+#define ISC_PFE_CFG0_BPS_TEN    0x2
+#define ISC_PFE_CFG0_BPS_ELEVEN 0x1
+#define ISC_PFE_CFG0_BPS_TWELVE 0x0
 #define ISC_PFE_CFG0_BPS_MASK   GENMASK(30, 28)
 
 #define ISC_PFE_CFG0_COLEN	BIT(12)
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 5bd109e93a8f..57a5aae3cabf 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -147,49 +147,49 @@ static struct isc_format sama5d2_formats_list[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_SBGGR10,
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGBRG10,
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGRBG10,
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SRGGB10,
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SBGGR12,
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_BGBG,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGBRG12,
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGRBG12,
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SRGGB12,
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
 	},
 	{
@@ -210,7 +210,7 @@ static struct isc_format sama5d2_formats_list[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_Y10,
 		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 	},
 
 };
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 3ebcbc1bb5a5..0a4dbef72d12 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -156,49 +156,49 @@ static struct isc_format sama7g5_formats_list[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_SBGGR10,
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGBRG10,
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGRBG10,
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SRGGB10,
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SBGGR12,
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_BGBG,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGBRG12,
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGRBG12,
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SRGGB12,
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
 	},
 	{
@@ -224,7 +224,7 @@ static struct isc_format sama7g5_formats_list[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_Y10,
 		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 	},
 };
 

-- 
2.34.1

