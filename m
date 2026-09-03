Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B9F3CC330
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 19:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465581; cv=none; b=nxEvKWz4OVcD84PpwHgk+Rz0tyRMnoPSCS+9EV/ESmGl3ndBfti+IaKQfPF2xt/IRpqLmeEc8iJ2Byw9duOys2KvyjkE/enLIPGfHBL+61I97BKBP+7I/3uBSh6jXun3xE82ij3UW4htJtd11YEAHHUKEDwRwvfmTOaTsT5Lw1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465581; c=relaxed/simple;
	bh=TvM7yklByQdosOAshyqJicwaDEbgeGRzfcbvIhmNFk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cIG+8mIrHErugL4h/GMsK7R19SR5dnOWeAFRV9jOEBh3P32yMnVxgpbvfKrim3mrz+iR/4cNGb58H2ZJS4vO8u5l0GXd7qbwlmzQcx+OdN0UGYZmKLgN2rvz9p3oReLdlR9+mcYnernpEvTX0hmbL5tt4HWpcWyyzPDs+xee9bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMA/CGOc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMA/CGOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788465569; x=1820001569;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TvM7yklByQdosOAshyqJicwaDEbgeGRzfcbvIhmNFk4=;
  b=MMA/CGOciJpd7hFF4LTica9eK1EDZ6e+CsB5FS21jmL1GcLzY1MnD4Mf
   C6wl2YPMEFRV03vyaA2WW4Z5qOXPvKEf0dkW+Fp2bODmZFN1IL1JaL11F
   wTm5o++PhLVn7xXfzwn5FFWoMMHFneCgeNljGPlmJKTwF10Vt+j/23572
   qaliOEvteG3zfIbCYH9tZcGJYAgzAzFZGCNNoyy34h0BgWHJqVhrU6wnX
   wqu7KvC+OJRI2npeg92PLRhDHt3J+qqFIjkU89D5oUQB2CYgXsd/hZjnw
   NO90BtDbxBCxl89xCzH+cXbogS+Fxp84E7eel/LJDottYfjXD1TRq+MPm
   g==;
X-CSE-ConnectionGUID: xQ8jkuzyQpmEd3W83gclvA==
X-CSE-MsgGUID: dCxlmRMRRVeywekT+k6C4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88806681"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88806681"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 12:59:21 -0700
X-CSE-ConnectionGUID: Y2b6g6TnTDqrGYx1cnBOVA==
X-CSE-MsgGUID: ONI567qHTVScjdh3lRAeXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="269292387"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.184])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 12:59:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 47D7011F894;
	Thu, 03 Sep 2026 22:59:17 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x2Dae-00000008n47-2xwh;
	Thu, 03 Sep 2026 22:59:16 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	mchehab@kernel.org,
	sarang.sapre@intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 1/1] staging: media: ipu7: Update TODO file
Date: Thu,  3 Sep 2026 22:59:16 +0300
Message-ID: <20260903195916.2095224-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827123336.2219048-1-antti.laakso@linux.intel.com, Ricardo Ribalda Delgado <ricardo@ribalda.com>
References: <20260827123336.2219048-1-antti.laakso@linux.intel.com, Ricardo Ribalda Delgado <ricardo@ribalda.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the TODO file to reflect the plan to drop the ipu7 driver in favour
of IPU7 and later support in ipu6 driver. The ipu7 driver may still exist
for some time as users switch to the ipu6 driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu7/TODO | 28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/ipu7/TODO b/drivers/staging/media/ipu7/TODO
index dc27bb6463da..57cca4e4033f 100644
--- a/drivers/staging/media/ipu7/TODO
+++ b/drivers/staging/media/ipu7/TODO
@@ -1,26 +1,2 @@
-This is a list of things that need to be done to get this driver out of the
-staging directory.
-
-- ABI headers cleanup
-  Cleanup the firmware ABI headers
-
-- Add metadata capture support
-  The IPU7 hardware should support metadata capture, but it is not
-  fully verified with IPU7 firmware ABI so far, need to add the metadata
-  capture support.
-
-- Refine CSI2 PHY code
-  Refine the ipu7-isys-csi2-phy.c, move the hardware specific variant
-  into structure, clarify and explain the PHY registers to make it more
-  readable.
-
-- Work with the common IPU module
-  Sakari commented much of the driver code is the same than the IPU6 driver.
-  IPU7 driver is expected to work with the common IPU module in future.
-
-- Register definition cleanup
-  Add IPU7 prefix for IPU7 specific registers and related macros. Some
-  ISYS IO sub-blocks register definitions are offset values from specific
-  sub-block base, but it is not clear and well suited for driver to use,
-  need to update the register definitions to make it more clear and
-  readable.
+This driver will be removed soon in favour of supporting IPU7 and later
+in the ipu6 driver.

base-commit: 0cf9df256e97bb6ea1e936a7399be1675c7f564a
prerequisite-patch-id: 50856908ce9badbc03765bfbb49fe67f3dffc89f
prerequisite-patch-id: 15431f165ff5c789dd0e958a228ffa1e03a3668e
prerequisite-patch-id: 734492a207870f1b6b3fb6ac882245e6a120f1c2
prerequisite-patch-id: 56223856c727d416ecf312ffe4e8b820b0c7f5ef
prerequisite-patch-id: 0a58102a63e9a66befe3ad69319506055d180ede
prerequisite-patch-id: cb34049cf2bf418106c74ab7ec41fe8022b51f5b
prerequisite-patch-id: 1fa808f0fec7ec733a8aa93f40974844d958291f
prerequisite-patch-id: ebaeb384de7f3a7f31b15d11a02415944f954a87
prerequisite-patch-id: fcf19314a683fa787aacb933e227f1cf4eba48af
prerequisite-patch-id: fbd1dca9afdf208e7a7ef171a770e6451effa67f
prerequisite-patch-id: fab2e30f46498ba4c94ebfe1148f4a113ac632a9
prerequisite-patch-id: f9d0887218781cc4750e674af791732a124dc936
prerequisite-patch-id: 7b9599d525685094d059b3ff5c07477fa5363ef0
prerequisite-patch-id: 24797d9b2413920c595560a475e105b1d537f262
prerequisite-patch-id: 68c4c8fdf97a438eb89c5c2f823604fbe90651b7
prerequisite-patch-id: 4e82f7c21c70f4b74488a56426fef7d50e293fd8
prerequisite-patch-id: 54ff13db3aecd7dd7ccf027ec929ad2f8225890e
prerequisite-patch-id: fe65b24b749f0ac7282a1af0fba14c6004c090ca
prerequisite-patch-id: d5eb002cadb3e2e760135011306f49bba3c5abe5
prerequisite-patch-id: cc13ab54bb81ff7ee1336e2941bdfa54901e765b
prerequisite-patch-id: 5709e4f4eebbaf6edf8a88695d29e8cc70a708ea
prerequisite-patch-id: ddbfc0360030ef98c21aa06f709b9ad9fbd6e8a8
prerequisite-patch-id: ef9b3e50c49a3a4144cf55e5d34a0f54c110090b
prerequisite-patch-id: d4622868e4ff1d8186c3722727530d8ee251bb68
prerequisite-patch-id: 88cdfb12109f19cc643c1037a3506f525ce5c7f8
prerequisite-patch-id: d3f0657a7fb2222a6d0de9fd9df8faefcb88c4e7
prerequisite-patch-id: 9396e2cbe6c82778e9c589ae8c4d50c68fce4a54
prerequisite-patch-id: d2d5cef88a483b1c01c26cf3cdb958920b94db52
prerequisite-patch-id: c18a0e871b6ba5f501b8615b6914f8070bc9ebeb
prerequisite-patch-id: df220b267694663be45023f499407771a1215cda
prerequisite-patch-id: a60c0bc05ae8b0eb037f3bd41b1f9d1c6c287563
prerequisite-patch-id: 3d7f821db922a869aeacf6322fde359bd0e318fb
prerequisite-patch-id: be40017296955faef77638be5f0867ea7309df82
prerequisite-patch-id: 2efcb5f489e58084c05739e860e1b47643850374
prerequisite-patch-id: 2d005004560da48e2207141c1ae85f251dc0249d
prerequisite-patch-id: b6da1454b6474b13cd89a7d7b5eef2208801e28b
prerequisite-patch-id: dddf7e938f6cc98d695a0a6047168733fe60e0d1
prerequisite-patch-id: f3a5c5f58a9fd9624fa6f3afb0747b13b98a690e
prerequisite-patch-id: ec5dbd156cf963e4d784080b28301d4434d86d80
prerequisite-patch-id: 6712d8933601fa7668c0e1d50a33b197ba4cdfde
prerequisite-patch-id: 29b4797fabd81a0c89745cc22acc8f6437ea8f4b
prerequisite-patch-id: f9a7d2468799cefd8c099b89b7e6688dd215758e
prerequisite-patch-id: 94f69f633ad2d59f85623e9869c182cdaf28e0e1
prerequisite-patch-id: dc0f740ab403e520bba0c9a4cd64e5cd13b55d3e
-- 
2.47.3

