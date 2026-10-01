Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727051D50B
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 12:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858761; cv=none; b=t2kEes8EHue9z+M7nLwxdW4EG5eowvBFoc+CfWVSj94X3NDmDEqKpfRU9tY+UR5oL5UmNlpyA4MmKgIwAtaYQXr0RHiS01t9gPfic62tNg9KtIJ5cfajL8QZwEbh7mKCcm464bUXsP5o43A/fPQUX6XksekjAD4I//YqOnLtXDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858761; c=relaxed/simple;
	bh=a9rX+6YvnHPIMS1e72HnzCHsejnBavS7gd/+VEJ+Wl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6/7mwIcbjMqCOaJ4raZ7BMLL5CZaSUXpRofvzgv+4ybivHblmw2xRSuwV+3YY5sdsIrUu8ZIdTkF9VON94pq9INvNb/E4nO3aceHpm3xDxX1659rVBUxMsqMejAqVkOEHPB2gYhLu30Aexrv1EbKoow0E9OllGGRU/4Ien4q/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8X63rc0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8X63rc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790858760; x=1822394760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a9rX+6YvnHPIMS1e72HnzCHsejnBavS7gd/+VEJ+Wl4=;
  b=a8X63rc0i1oZ6KZphvUtVrd0U6mqAsRzBayMAiL8PswIxfJ7/Iu7Ssy8
   LwQNNm2p9RXF7dcRxfs2S3Qmc1uSsv7SMO4nkr2uxNMgRx+88+ycXtIGS
   hSzz46mMojBiaikgXpN89V0j5VC0OojT49pWM6+eF5wgDNEimDtxHfvPB
   oAYsqCELrZKYVlsm9FSpZGh7Ck8mGDO5TzAvXc1UWeKcOTCb6m0Yk1BOQ
   2zZ0CP1TRaLz6y5VwnZijaTdnWkyulad/gXGccIUp1c6U1oRlJ9ztwECC
   hopTcSU7wY3GsnY1YXmVRr9ojTeLbIs55Jn+vsrlhw0QehEDfof1m9wiK
   g==;
X-CSE-ConnectionGUID: VhcTpfIkQ+q+2X/uJYi4+w==
X-CSE-MsgGUID: fNjP1slKQbG8Pcoylr7kFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101774563"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="101774563"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:45:59 -0700
X-CSE-ConnectionGUID: iuOjyGclQPatpAVIiJ3KoQ==
X-CSE-MsgGUID: qopfD8MyR4qLYtLFUZgpTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="313934924"
Received: from cooperst-gp119.amr.corp.intel.com (HELO alaakso-desk.intel.com) ([10.125.111.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:45:57 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com,
	divyamani.tripathi@intel.com
Cc: manik.bajpai@intel.com
Subject: [PATCH 5/7] media: ipu6: Export the ipu7 firmware boot state
Date: Thu,  1 Oct 2026 15:45:38 +0300
Message-ID: <20261001124540.2129309-6-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001124540.2129309-1-antti.laakso@linux.intel.com>
References: <20261001124540.2129309-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export a boot state accessor, so subsystem interrupt handler can detect
a firmware error state.

Assisted-by: LLM
Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu7-boot.c | 9 ++++++---
 drivers/media/pci/intel/ipu6/ipu7-boot.h | 5 +++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-boot.c b/drivers/media/pci/intel/ipu6/ipu7-boot.c
index f695d668d46b..965783fd50d2 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-boot.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-boot.c
@@ -18,9 +18,6 @@
 
 #define IPU7_FW_START_STOP_TIMEOUT		2000
 #define IPU7_BOOT_CELL_RESET_TIMEOUT		(2 * USEC_PER_SEC)
-#define IPU7_BOOT_STATE_CRITICAL(s)		(((s) & 0xffff0000U) == 0xdead0000U)
-#define IPU7_BOOT_STATE_READY(s)		((s) == 0x57a7e100U)
-#define IPU7_BOOT_STATE_INACTIVE(s)		((s) == 0x57a7e300U)
 #define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS0				0x4000
 #define IPU7_BUTTRESS_FW_BOOT_PARAMS_ENTRY(i) \
 	(IPU7_BUTTRESS_REG_FW_BOOT_PARAMS0 + ((i) * 4U))
@@ -395,3 +392,9 @@ int ipu6_ipu7_boot_stop_fw(const struct ipu6_bus_device *adev)
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_ipu7_boot_stop_fw, "INTEL_IPU6");
+
+u32 ipu6_ipu7_boot_get_state(const struct ipu6_bus_device *adev)
+{
+	return read_fw_boot_param(adev, IPU7_FW_BOOT_STATE_ID);
+}
+EXPORT_SYMBOL_NS_GPL(ipu6_ipu7_boot_get_state, "INTEL_IPU6");
diff --git a/drivers/media/pci/intel/ipu6/ipu7-boot.h b/drivers/media/pci/intel/ipu6/ipu7-boot.h
index 48b7cbbde3d3..a7e59067b3eb 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-boot.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-boot.h
@@ -8,6 +8,10 @@
 
 #define IPU7_BOOT_MSG_VER_MAX_ENTRIES	3U
 
+#define IPU7_BOOT_STATE_CRITICAL(s)	(((s) & 0xffff0000U) == 0xdead0000U)
+#define IPU7_BOOT_STATE_READY(s)	((s) == 0x57a7e100U)
+#define IPU7_BOOT_STATE_INACTIVE(s)	((s) == 0x57a7e300U)
+
 struct ipu7_boot_abi_version {
 	u8 patch;
 	u8 subminor;
@@ -45,5 +49,6 @@ void ipu6_ipu7_release_boot_config(struct ipu6_bus_device *adev,
 int ipu6_ipu7_boot_start_fw(const struct ipu6_bus_device *adev,
 			    struct ipu7_fw_com_context *fwctx);
 int ipu6_ipu7_boot_stop_fw(const struct ipu6_bus_device *adev);
+u32 ipu6_ipu7_boot_get_state(const struct ipu6_bus_device *adev);
 
 #endif
-- 
2.55.0

