Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31F45012A3
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858754; cv=none; b=REmgZR4CrhelB2F23BgyFkoCVaBMUXJ8aZ4LEDXD590cNLnrMwr9srhWuea0bVltDQiwMPFeWLRTSy4/aodb0/mWFz43X429VsRpVWeIPBVnj8Xay1C3eXtlX5OZVGme/urhiFVS5g848ct0FfF5n01E2jeuITc9rrjR3G/RV+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858754; c=relaxed/simple;
	bh=UlxRCl9vSBazgGUf8fRrAI3G5vnIheZLkkw9mdiXAE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUt50WjOZRXmdwUf8tMbAYh73Hpl0MymdoYGenx2UfJe2E/AiWw5NgQHCYiThzDvH/xcBBdZUIxLhK4hrlrKHQf8NHLB3RdHP5ckwnPj8CPchjCEwMVcslIWKvEBtif2032IC+5TYwhcu5jq6phUJYENH3Et5IV06VMBngphF0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJd39AUq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJd39AUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790858753; x=1822394753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UlxRCl9vSBazgGUf8fRrAI3G5vnIheZLkkw9mdiXAE4=;
  b=AJd39AUqDqOrKd8a6Gw9eDDOOi4aQdmJLsOQkb7JU4VBbk4G4eJnd2eA
   /HQuzrBHrr6rZ4SUsiDprsp6bgmp74RhLS6woFvOgXwnQSEREtEHeDtr+
   cSeNdG8YV4lQe2iqzgur/njIpbELsrFyQjupcmAt35x42odykciaBINt7
   ZSgBIagdTfXdJc+tdJNoQKfQz24iO4r5F+fXan+IiqMkM54r47uM/3WJ/
   CTxckcNgXi2z78nbRyEo3YnV0tRwWZATKX3cVkJsqIpE80aMz99C/RLnf
   EdOFAg00q6XatvE7CBf2IrJs+xau6M4TNYW6KmWK6EJ9ABFI/33yShOqW
   Q==;
X-CSE-ConnectionGUID: XwKEvxAbQn6/Lj3ZiYrj1g==
X-CSE-MsgGUID: O9ZWZ71jRJeyK/7OcQVwCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101774555"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="101774555"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:45:52 -0700
X-CSE-ConnectionGUID: lb5+m5nATsaKfT8BN/KmQw==
X-CSE-MsgGUID: BSwz4ju6Qyifx7mSJQusJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="313934883"
Received: from cooperst-gp119.amr.corp.intel.com (HELO alaakso-desk.intel.com) ([10.125.111.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:45:51 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com,
	divyamani.tripathi@intel.com
Cc: manik.bajpai@intel.com
Subject: [PATCH 1/7] media: ipu6: Fix media entity names for different ipu versions
Date: Thu,  1 Oct 2026 15:45:34 +0300
Message-ID: <20261001124540.2129309-2-antti.laakso@linux.intel.com>
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

The media entity name prefix is ipu6 for all the hardware, fix it.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  3 ++-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  3 ++-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      | 18 +++++++++++++++++-
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 4a2b3d460782..152545427930 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -937,7 +937,8 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 	csi2->asd.source = IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + index;
 	csi2->asd.supported_codes = csi2_supported_codes;
 	snprintf(csi2->asd.sd.name, sizeof(csi2->asd.sd.name),
-		 IPU6_ISYS_ENTITY_PREFIX " CSI2 %u", index);
+		 "Intel IPU%s CSI2 %u",
+		 ipu6_isys_entity_version(isys->adev->isp), index);
 	v4l2_set_subdevdata(&csi2->asd.sd, &csi2->asd);
 	ret = v4l2_subdev_init_finalize(&csi2->asd.sd);
 	if (ret) {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index a6b79a7be871..094a98e31c06 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -263,7 +263,8 @@ static int isys_register_video_devices(struct ipu6_isys *isys)
 			struct ipu6_isys_video *av = &isys->csi2[i].av[j];
 
 			snprintf(av->vdev.name, sizeof(av->vdev.name),
-				 IPU6_ISYS_ENTITY_PREFIX " ISYS Capture %u",
+				 "Intel IPU%s ISYS Capture %u",
+				 ipu6_isys_entity_version(isys->adev->isp),
 				 i * NR_OF_CSI2_SRC_PADS + j);
 			av->isys = isys;
 			av->aq.vbq.buf_struct_size =
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index c5c8ede8e64e..f4d00f763eba 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -25,7 +25,23 @@
 
 struct ipu6_bus_device;
 
-#define IPU6_ISYS_ENTITY_PREFIX		"Intel IPU6"
+#define IPU6_ISYS_ENTITY_VERSION	"6"
+#define IPU7_ISYS_ENTITY_VERSION	"7"
+#define IPU7P5_ISYS_ENTITY_VERSION	"7.5"
+#define IPU8_ISYS_ENTITY_VERSION	"8"
+
+static inline const char *ipu6_isys_entity_version(struct ipu6_device *isp)
+{
+	if (IS_IPU8(isp))
+		return IPU8_ISYS_ENTITY_VERSION;
+	if (IS_IPU7P5(isp))
+		return IPU7P5_ISYS_ENTITY_VERSION;
+	if (IS_IPU7_MTL(isp))
+		return IPU7_ISYS_ENTITY_VERSION;
+
+	return IPU6_ISYS_ENTITY_VERSION;
+}
+
 /* FW support max 16 streams */
 #define IPU6_ISYS_MAX_STREAMS		16
 #define ISYS_UNISPART_IRQS	(IPU6_ISYS_UNISPART_IRQ_SW |	\
-- 
2.55.0

