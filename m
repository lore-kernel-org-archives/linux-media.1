Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397873;
	b=s1XFSx1X1neNnJb1DPMf4zsEuq/WIJ/7po0XpHstyNK2BXGWTJVH0dOdij/sBElr+O+5
	 2GPPpVbLum9ayapdyqgj1rNs0hwUmW5SFATGZIPcSSpmkFoXVw10f6UaWPprV48sXPmn0
	 72qEGPaKZYUMZ6fBifLaRrIvNsEV6qIjWTt6PVLeWniSLdGZF4sk9h53eieat6KBa2Y8A
	 LpNIcq1UR3R26nOUFLyfENzqNrhHH3+JAOvp8VPCk66SZ3GSyCapfw4wa63vrD7X84igj
	 wGyqN1UcNYhBn/ntWDf2brWaJ2KgDdh/+i1qeKc3d6w+8cqqJeRxZESHKqbv7JbccuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397873;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lBhQmOkV3VI4LUiwZhyJ/bAcfX2YSM8fVCAFeer0wgQ=;
	b=FQ9byuajTzBaawG3kj6/eVZMtJqtCUNIgoZyXMeq0Cwm+538EcrO4v5219ZhGwbsmQvc
	 c3M77+EfyxZ60h6kBb57k67Cd3/sVRZu0oS+5UTT+pSSOu3h7lvYNxFfeU+2ttDGLzZb9
	 0e2OUpfS/s3oQIt1DVN9b1jfAbAaK48QwS4Zq09hZoT/3DljLkz5AK2kJS3+SbmOfXM7h
	 7BmZ+MwRLGl8WH0ojiciTRInamfBcM6Lhgj7XDZhJQbF7kI8QDmrAg98bLRhd6olHS7b2
	 V6SSWGEPnPv+j3CPSLMaqX+Y50HcL6evLYy6uQsAVSq9yliHpFJYE4Wef06lGxR9kYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CFh2QbgS;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45674606A339
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 01:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45674606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CFh2QbgS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795397873; x=1826933873;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kygoMksJfQVVTUB+ISiQgn9xKObA/PkWx/S3q9DDO3Q=;
  b=CFh2QbgS/1u7PBBSutzLKeR4MdPALbpKS1kn9gur+EU76TlT7qiiENzL
   LyF3o42gAerSMXdP1utqBg0UTYHjGu4NSP2J7dvMAIDUTcHEAP9Tfdc1K
   jK1enLRfPTIyRi+3J5fc7i6ZoMl2Z1JD4v5f3ctSFEHyo4L3S6TNlvff1
   830D6hgu+JxWCWz8gKiOIPjaZzXzzhCJ10Ta4XwZLj6iNaclvAU9cl6nm
   RGAVWn8mxd4hboiYImwKC3Jacnmqu7uEbKqW135ury/QWfTTS3hAITUL1
   z4HsyNPiRGTuXSNzNXvsluKrkttgi94AUP9y2qzctg5nMz9olH2DOWLLt
   A==;
X-CSE-ConnectionGUID: 8qRBnYQUQWCLhavLn8eIlg==
X-CSE-MsgGUID: pYABflUJQ0inH8kFg5YxGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4091824"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4091824"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 17:37:53 -0800
X-CSE-ConnectionGUID: 4EOGXoLZQ6S3NCwOrXT7aQ==
X-CSE-MsgGUID: FxYfRKh5Tna2TuvgGWystw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11173698"
Received: from pg12hl01tchew6.png.intel.com ([10.107.246.123])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2026 17:37:52 -0800
From: vunny.sodhi@intel.com
To: linux-drivers-review@eclists.intel.com,
	linux-media@vger.kernel.org
Subject: [PATCH 2/3] media: i2c: max9296a: fix video pipe status register offset
Date: Mon, 23 Nov 2026 07:43:12 +0800
Message-ID: <20261122234313.327866-3-vunny.sodhi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122234313.327866-1-vunny.sodhi@intel.com>
References: <20261122234313.327866-1-vunny.sodhi@intel.com>
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

From: Khai Wen Ng <khai.wen.ng@intel.com>

Correct the VPRBS base address used for pipe 0 status reads.

Per the MAX9296A datasheet, the video pipe status register block has
pipe 0 base 0x1DC and a stride of 0x20 between pipes, so pipe 1 is
0x1FC. Using 0x1FC as the base for pipe 0 reads the wrong pipe.

Signed-off-by: Khai Wen Ng <khai.wen.ng@intel.com>
Signed-off-by: Kris Pan <kris.pan@intel.com>
Signed-off-by: Sodhi, Vunny <vunny.sodhi@intel.com>
---
 drivers/media/i2c/maxim-serdes/max9296a.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/media/i2c/maxim-serdes/max9296a.c
index abc2a0f03a8c..096942ab0a77 100644
--- a/drivers/media/i2c/maxim-serdes/max9296a.c
+++ b/drivers/media/i2c/maxim-serdes/max9296a.c
@@ -65,7 +65,11 @@
 #define MAX9296A_VIDEO_PIPE_SEL_STREAM(p)	(GENMASK(1, 0) << ((p) * 3))
 #define MAX9296A_VIDEO_PIPE_SEL_LINK(p)		BIT(2 + (p) * 3)
 
-#define MAX9296A_VPRBS(p)			(0x1fc + (p) * 0x20)
+/*
+ * TODO(VERIFY): Downstream uses 0x1dc as the pipe-0 VPRBS base; upstream
+ * v17 keeps 0x1fc. Confirm the correct offset with HW/ADI before upstreaming.
+ */
+#define MAX9296A_VPRBS(p)			(0x1dc + (p) * 0x20)
 #define MAX9296A_VPRBS_VIDEO_LOCK		BIT(0)
 #define MAX9296A_VPRBS_PATGEN_CLK_SRC		BIT(7)
 #define MAX9296A_VPRBS_PATGEN_CLK_SRC_150MHZ	0b0
-- 
2.43.0

