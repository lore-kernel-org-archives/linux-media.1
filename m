Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A300433ADAD;
	Mon, 18 May 2026 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103795; cv=none; b=PtOjoq9J0WHO7S0CuZ9iCoxsCqV6mnEEVVqSPOcK+z/jsF6GzOMIOQykqk+HVaWyspPRO3JKqHxxw+CE5PhiVzcfvCGYGReHa7jbsVY51DR43gRBXBmnIDtQGKXEJ0FDZvTgRcmj7wEmMs7dpCm2eL7y1uzJeSTOCDdFEC9HOjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103795; c=relaxed/simple;
	bh=+bDa60wNtgw5ZkxVhKiwLfuDt6fHkP58C4HJF2lBzDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dOnjgTjG10Z9mrv8ChKFfp0OiOvqftCX3KpRCCz3/OMkJn3IRSColNpiYEBKycfPduWTqMsvxwg0Kr2FsmMlqKl+mDdCrJ9T4Vbkpb6r3Jp2YxfeZrUcBWW1kVdYwLBGZVp4isYhrKvKH9NmCJQWMNZHqmuG0kPvYsTP8egCPQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Rp08nDHA; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Rp08nDHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779103793; x=1810639793;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=+bDa60wNtgw5ZkxVhKiwLfuDt6fHkP58C4HJF2lBzDs=;
  b=Rp08nDHAs/fvA7xH/iQ5mLstk3Ig6Q8CJniXk1Okiy/7wFYmp8HdsUfO
   33GbmBsyLgMM5CYXuh3N1SpfK5XyiXxH1aZ2IDRigkcGxl8MS0aGpU0IJ
   BKYwRrtd9NWHQnjh82uQSv/pC3ZGCFnUPu76qwG3+W/Q30hIkkD6ruTCG
   941nH2k6F4v15Mz7iLRdakJHc6o8ixL0d0PGQ09uqY6cDx9LzqZ9+1Lgk
   h61mNhR6EzB5aU7t/iaJTxJIKM97lIjMzBUn40AM29Q6UWDx+qXPxmXUx
   fc2uyUPdvrZzKJNQjIUIqZXpD7F1EtpvHaCqy1gTy+5cb9SZE2eZrMm8K
   g==;
X-CSE-ConnectionGUID: 8gjqCgtnTUKW+SeJOeKvlg==
X-CSE-MsgGUID: HhrNaQ/hSwe/+h/dDOzGAA==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="57659227"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:29:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 18 May 2026 04:29:49 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 04:29:45 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 18 May 2026 16:59:39 +0530
Subject: [PATCH v4 01/12] media: microchip-isc: fix SBGGR10 Bayer pattern
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260518-balki-isc-series1-v4-v4-1-97f189185b7e@microchip.com>
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

SBGGR10 was mapped to ISC_BAY_CFG_RGRG instead of ISC_BAY_CFG_BGBG,
causing red/blue channel swap.

Fixes: 91b4e487b0c6 ("media: microchip: add ISC driver as Microchip ISC")
Cc: stable@vger.kernel.org
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-sama7g5-isc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index b0302dfc3278..ca23e8adecbd 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -156,7 +156,7 @@ static struct isc_format sama7g5_formats_list[] = {
 		.fourcc		= V4L2_PIX_FMT_SBGGR10,
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
 		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
-		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
+		.cfa_baycfg	= ISC_BAY_CFG_BGBG,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGBRG10,

-- 
2.34.1

