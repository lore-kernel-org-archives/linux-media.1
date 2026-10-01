Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BE551DB00
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858763; cv=none; b=E0EEGiipOPLJkI0AaGXt+EpF+wtK3eO5KmT1jMBeqw3sZGVuy+ZvquMzTdJiEZlrpjd4YlJdfoilC06oTJPGOYarZKdSBMkszoS4/EsH6PWe1BnH5vkeW34n4ansjLjkewk1b/OOvgq4zknnfYSXXmA2pN2RTRSIPk94HLl5DlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858763; c=relaxed/simple;
	bh=zqnG2W0qaT1fwXG8KwUbqmY1BUm6g27i3LA+pRAr86U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJvINwdq+JBygei3npHqyrxDRwnivdl7wQ2raXruj6qGfIYSC3rUxAAMp3wbKXMHB+AD2RHYVYeBEd9MEQU3AOP/OdAREqBEG7Z1yyhIVXvXOJ0QrZaeQRf2FiWgG6xzQozOw9D90dwOTfffjzUSsmt4LCdwDDGhuaA4ofYfp/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjSP8OT3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjSP8OT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790858762; x=1822394762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zqnG2W0qaT1fwXG8KwUbqmY1BUm6g27i3LA+pRAr86U=;
  b=FjSP8OT3v8/ucC9lo1lMrPG/2Bu4tVoxO/oq/4+9TJFSyupcCO0h6fTk
   N4eHMIYxek5hP71txa4kEBaIFIDpvpcssDnwoKKsQERzUXzDz8CiRs4Ng
   R/2q7WXwrdfvf//hyokFSaYV3gKyBAFwta3yyAgBVlOde6ZJZfXXy7BAD
   qZVez0lxNlYLjgb5GbCcjH+S+VUCZD0HNEQGJ94AkwxAtkTvVElqPoGoI
   iRlnu37YnlvLiewQgshJ05vBYFY+7MS0zabkvIrnYoyeaRhlUGhOr0JVo
   vmCXSYqEkmBgm8jr8knkd8AF3DVNqGqM6EWYTh7d1Dtn65A0/NMCZ+xJc
   w==;
X-CSE-ConnectionGUID: Aw/qhEjTRqSdqL/Yyh8JNA==
X-CSE-MsgGUID: Xs3/J3bdRr+BCb4lfHVB2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101774574"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="101774574"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:46:02 -0700
X-CSE-ConnectionGUID: pUafhS+tThyNLIie2nXM4A==
X-CSE-MsgGUID: WoyBZLWvQLeAjY0JPdx51A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="313934954"
Received: from cooperst-gp119.amr.corp.intel.com (HELO alaakso-desk.intel.com) ([10.125.111.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:46:01 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com,
	divyamani.tripathi@intel.com
Cc: manik.bajpai@intel.com
Subject: [PATCH 7/7] media: ipu6: Move ipu7 fw logger and watchdog configuration
Date: Thu,  1 Oct 2026 15:45:40 +0300
Message-ID: <20261001124540.2129309-8-antti.laakso@linux.intel.com>
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

The logger and watchdog configurations are not isys specific, move them
to ipu7-boot.h. No functional change.

Assisted-by: LLM
Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu7-boot.h    | 22 +++++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h | 19 ++----------------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-boot.h b/drivers/media/pci/intel/ipu6/ipu7-boot.h
index a7e59067b3eb..e7a21b16f41b 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-boot.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-boot.h
@@ -4,6 +4,8 @@
 #ifndef IPU7_BOOT_H
 #define IPU7_BOOT_H
 
+#include <linux/bits.h>
+
 #include "ipu7-fw-com.h"
 
 #define IPU7_BOOT_MSG_VER_MAX_ENTRIES	3U
@@ -12,6 +14,26 @@
 #define IPU7_BOOT_STATE_READY(s)	((s) == 0x57a7e100U)
 #define IPU7_BOOT_STATE_INACTIVE(s)	((s) == 0x57a7e300U)
 
+#define IPU7_FWLOG_MAX_LOGGER_SOURCES		(64U)
+
+#define IPU7_LOGGER_CFG_CHANNEL_ENABLE_SYSCOM	BIT(1)
+
+/* Shared by the insys and psys subsystem configurations */
+struct ipu7_fw_logger_config {
+	u8 use_source_severity;
+	u8 source_severity[IPU7_FWLOG_MAX_LOGGER_SOURCES];
+	u8 use_channels_enable_bitmask;
+	u8 channels_enable_bitmask;
+	u8 padding[1];
+	u32 hw_printf_buffer_base_addr;
+	u32 hw_printf_buffer_size_bytes;
+};
+
+struct ipu7_wdt_abi {
+	u32 wdt_timer1_us;
+	u32 wdt_timer2_us;
+};
+
 struct ipu7_boot_abi_version {
 	u8 patch;
 	u8 subminor;
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
index 30289d73be6c..2536f15a4962 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
@@ -4,9 +4,9 @@
 #ifndef IPU7_FW_ISYS_H
 #define IPU7_FW_ISYS_H
 
+#include "ipu7-boot.h"
 #include <linux/limits.h>
 
-#define IPU7_FWLOG_MAX_LOGGER_SOURCES		(64U)
 #define IPU7_INSYS_MAX_OUTPUT_QUEUES		3U
 #define IPU7_INSYS_STREAM_ID_MAX		16U
 #define IPU7_INSYS_MAX_INPUT_QUEUES		(IPU7_INSYS_STREAM_ID_MAX + 1U)
@@ -158,24 +158,9 @@ enum insys_msg_err_groups {
 	INSYS_MSG_ERR_GROUP_N,
 };
 
-struct ipu7_fw_isys_logger_config {
-	u8 use_source_severity;
-	u8 source_severity[IPU7_FWLOG_MAX_LOGGER_SOURCES];
-	u8 use_channels_enable_bitmask;
-	u8 channels_enable_bitmask;
-	u8 padding[1];
-	u32 hw_printf_buffer_base_addr;
-	u32 hw_printf_buffer_size_bytes;
-};
-
-struct ipu7_wdt_abi {
-	u32 wdt_timer1_us;
-	u32 wdt_timer2_us;
-};
-
 struct ipu7_insys_config {
 	u32 timeout_val_ms;
-	struct ipu7_fw_isys_logger_config logger_config;
+	struct ipu7_fw_logger_config logger_config;
 	struct ipu7_wdt_abi wdt_config;
 };
 
-- 
2.55.0

