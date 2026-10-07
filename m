Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DC82F0680
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 03:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791345001; cv=none; b=j2rXKTpgG3wmrvdav0XTPdpFPCCIo87iXLC1QGgQXUaHD+jriv0vcIfCOCo3apBHtSSOdAnydWiNaYO+ArIvnqJ5YG10qX6ZNx+nYbwUmjoMIs85yky/UMEz4iiIb56ulekUyRKPS95mo21ZlMsU+T7OQlDcep7TH1cNr2Txppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791345001; c=relaxed/simple;
	bh=NPnuan4kTzqZfHjXOi/0tORHIN1CkfS3Gy8hAX0YjFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sdepjd2OBRMol1Ugsze6GfOva9/Pl4r/TZNZTmd322bvcI9cDphNS97wyJnRni5/wyy/09ti4D7WL0mO6t3/TF4Uy/0SCI9dKzP/Iykdfm4Px/RL+CYdaFrjKC+Gxtnzl9dsgt5nonuTRS9vHr4vsl+D761mea4PsTAnQ6MahzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lc8nf5BM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lc8nf5BM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791345000; x=1822881000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NPnuan4kTzqZfHjXOi/0tORHIN1CkfS3Gy8hAX0YjFA=;
  b=Lc8nf5BMvFUP2zx2LwJLFnByq1fxFFBuoIytLatVwJf7PayhLGX93z68
   OBAkkaknjRfpHWdGTKLCmmk/Lq59+/BxzVgn/cjozN8vab2CTkwiPsIfP
   hZ80c7S2Z6E1B8MkOkW4Vn3hbVxr6lqmY2LFO67h8XxG2Fc2d1OiR/7bt
   fw/R+1igURgIOULfORe0alRyUCt1JYH0lVtiLmc6rpiTsL+p0boZrzfri
   iaSXaI9LWOcjyb7StBsc9hZXN89ZnjOeelj+v+6dO/C2kQmWzC9d1FNxe
   iiZWB+QSa9nPBqJr5M7ABO3zXLBXeTVeUuPAHyB1Gll4SGgN0XCyWDrf8
   w==;
X-CSE-ConnectionGUID: qn/Dwn8uSyK9IC5y5fiOrQ==
X-CSE-MsgGUID: 6kOKdBZ8TCeit7uaDOrujw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="87883"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="87883"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 20:50:00 -0700
X-CSE-ConnectionGUID: AoR2LNkiSB6QsANak+gu6Q==
X-CSE-MsgGUID: N9BDe89/QpGnRmPwhOxIGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="277469979"
Received: from jimmy-x299-aorus-gaming-7.itwn.intel.com ([10.225.65.17])
  by fmviesa008.fm.intel.com with ESMTP; 06 Oct 2026 20:49:58 -0700
From: Jimmy Su <jimmy.su@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	jimmy.su@intel.com,
	serin.yeh@intel.com,
	vicamo@gmail.com,
	sarang.sapre@intel.com
Subject: [PATCH v1 2/2] media: ipu-bridge: add upside-down quirks for Dell PA14260 & DA14260
Date: Wed,  7 Oct 2026 11:49:14 +0800
Message-Id: <20261007034914.1654831-3-jimmy.su@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007034914.1654831-1-jimmy.su@intel.com>
References: <20261007034914.1654831-1-jimmy.su@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add rotation quirks for two Dell platforms:

- XPS 14 DA14260, which uses an OV08X40 sensor and can be identified
  through its sensor HID.
- Dell Pro 14 Premium PA14260, which may use camera modules sharing
  the same sensor HID as other systems but requiring a different
  orientation. Match these modules using ACPI _DSM module identifiers
  and apply a 180-degree rotation override when a matching module is
  detected.

Co-developed-by: Vicamo Yang <vicamo@gmail.com>
Signed-off-by: Vicamo Yang <vicamo@gmail.com>
Signed-off-by: Jimmy Su <jimmy.su@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 64caa4254e41..a7c71df8c7bc 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -144,6 +144,16 @@ static struct upside_down_match_info ov02e10_match = {
 	.ids = { "OVTI02E1" },
 };
 
+static const struct upside_down_match_info ov08x40_match = {
+	.type = UPSIDE_DOWN_MATCH_HID,
+	.ids = { "OVTI08F4" },
+};
+
+static const struct upside_down_match_info pa14260_match = {
+	.type = UPSIDE_DOWN_MATCH_DSM,
+	.ids = { "CJFOE90_B", "BBG809N3A_B" },
+};
+
 /*
  * DMI matches for laptops which have their sensor mounted upside-down
  * without reporting a rotation of 180° in neither the SSDB nor the _PLD.
@@ -184,6 +194,20 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = &ov02c10_match,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 14 DA14260"),
+		},
+		.driver_data = (void *)&ov08x40_match,
+	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell Pro 14 Premium PA14260"),
+		},
+		.driver_data = (void *)&pa14260_match,
+	},
 	/*
 	 * The first four characters of DMI_BOARD_NAME identify the Lenovo
 	 * machine type/model. For example, a DMI_BOARD_NAME starting with
-- 
2.34.1

