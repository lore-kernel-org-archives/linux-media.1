Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D06C345EB7
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834093; cv=none; b=THst6ig0MTpE+vcp4OXCbcqn2jgzkCiFWcN7mRoiYKRZgrhlkWMTm2v/ql0nXwmzxtrLGc5CvdptdfiHBKj8ObfISXyIl8nl0X2uOqK/zgOJC6xNE/dNhahMa0GVz7BB9waL2MuGfWZ1v4G8k3ED35n6NXH6Mp9YCNfsFWBYb9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834093; c=relaxed/simple;
	bh=9s7GRnDvDzjfn2uBkS4SffAWS2nxV9mHHmUuuZWoXoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEeJQdDQkNSdasWHciHvZrM0VNv2vJgNsow9e53scmhrTSYiKT4us446xE8UFL4SoEc3y0AXtYlKHhERUSX46rFDQCxpGpYxtFaCJvuEgwoWWY171SHOmXdCBI4oNTZdRAaFOwGlmIeBP881T7Xz2UGcyN7T0Yeisi21+uRG6q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMWpt3bi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMWpt3bi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834090; x=1819370090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9s7GRnDvDzjfn2uBkS4SffAWS2nxV9mHHmUuuZWoXoI=;
  b=dMWpt3bihrxSsqakV6fxR9xzqBTjHZuKRUcVtG9WiJ0ZLNk0J6vYSBXq
   6NXnmMbTYCe5aXMJpyu7wX1xi+k6BBGvqWMRZsQRe3S9tjLseNeLVx7Cf
   ZF+hvmuKU983Rd2E3hvH2ERnZhipj9pIAMPdWCvzboxKieEp7pmL8dkrc
   ERZbbefexRO4z49PKEc0bcL63cdiumiLUynD+cVf+zo3O4v7lrEP1NGPl
   LH47inxBOHfPIaeLir8rVETpdjtyVlC/mjCk+lL9oos6FIQzkRIRRA7k0
   GBOagiRLpJAceUXfust4GsVjWL+bzIFenif2EVU1gdZENf+Mg2zuCqvsv
   w==;
X-CSE-ConnectionGUID: oQ/eandjRL6G+z9ZRVCOwQ==
X-CSE-MsgGUID: 7bvA2CC7QQKqmnyWdlH2rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188649"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188649"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:49 -0700
X-CSE-ConnectionGUID: eL2EsRgnT8yMEaPC4WUQMw==
X-CSE-MsgGUID: yxhVuvA5Sn2Ts7b47XmbSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384493"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:48 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 30/44] media: ipu6: Parse bus type for ipu7
Date: Thu, 27 Aug 2026 15:33:22 +0300
Message-ID: <20260827123336.2219048-31-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
References: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For ipu7 bus type can be CPHY or DPHY.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 8 ++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 5de5fd16ca30..976ed064f262 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -133,6 +133,9 @@ isys_complete_ext_device_registration(struct ipu6_isys *isys,
 	}
 
 	isys->csi2[csi2->port].nlanes = csi2->nlanes;
+	isys->csi2[csi2->port].phy_mode =
+		csi2->bus_type == V4L2_MBUS_CSI2_DPHY ?
+		PHY_MODE_DPHY : PHY_MODE_CPHY;
 
 	return 0;
 
@@ -639,6 +642,10 @@ static int isys_notifier_init(struct ipu6_isys *isys)
 			continue;
 
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		if (ret && IS_IPU7(isp)) {
+			vep.bus_type = V4L2_MBUS_CSI2_CPHY;
+			ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		}
 		if (ret) {
 			dev_err(dev, "fwnode endpoint parse failed: %d\n", ret);
 			goto err_parse;
@@ -654,6 +661,7 @@ static int isys_notifier_init(struct ipu6_isys *isys)
 
 		s_asd->csi2.port = vep.base.port;
 		s_asd->csi2.nlanes = vep.bus.mipi_csi2.num_data_lanes;
+		s_asd->csi2.bus_type = vep.bus_type;
 
 		dev_dbg(dev, "remote endpoint port %d with %d lanes added\n",
 			s_asd->csi2.port, s_asd->csi2.nlanes);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 30539ea5f826..8674c041b994 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -14,6 +14,7 @@
 #include <media/media-device.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-mediabus.h>
 
 #include "ipu6.h"
 #include "ipu6-fw-isys.h"
@@ -96,6 +97,7 @@ struct isys_iwake_watermark {
 struct ipu6_isys_csi2_config {
 	u32 nlanes;
 	u32 port;
+	enum v4l2_mbus_type bus_type;
 };
 
 struct sensor_async_sd {
-- 
2.55.0

