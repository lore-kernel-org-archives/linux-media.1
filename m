Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18CD48BD46
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312689; cv=none; b=NXwJOMAtyfUZ2SpPBglM1UKiWUuLMzFtcQduTH/vejOuqlMfYLSkkHsg68o34az6SWUNpv6sbkM/zXu941S2vG59OnoiKwlyS/sGY44MKLq04mUQy6IIYJSF2CKqOOLNMjsOAUE3+7rnpnFal36QtN2BIZ5dRfrpwB7BYhhrohc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312689; c=relaxed/simple;
	bh=9s7GRnDvDzjfn2uBkS4SffAWS2nxV9mHHmUuuZWoXoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uimuiYAD1OUpIzPeXmiL1icyr6hOUhvi116qpXdjqXmFq3Kim2LwHMZ+cx249H3Frt45L9V+sb4jtovF4Djkr1tjcw4HwbyhpbFBaAUHQwfStBJC7o671hkwnG34wmHmDPykcExGLs5rZyMTAbQGXQV8CIJcHL39FuS8l6yrDRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vm25NI6/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vm25NI6/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312688; x=1818848688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9s7GRnDvDzjfn2uBkS4SffAWS2nxV9mHHmUuuZWoXoI=;
  b=Vm25NI6/zNSwvmJ9OUHgnhegJwxoe4zwBrjOxfPSaUCxxBudD4ZcUbxV
   LAJySv7MCyifqGID0a8hREjIEs8Xv7B55xHvYBenwuFrrRhC/b4ov/g+U
   SFTvz22TBaLJuoH6qZ8uSH3E7AfkDSpYpVvaShysoV9X24+IyMOAkgIH5
   HfRin0h9iX3WqfU+hJAJg0YlGU68GsvBqvG/Lk3VqTCIloQsyyQbGvtHA
   hWwj+RLKvqMKk20Z/FG34+2qrnb0VvSXtLWxl1z3UDeKTua4fibP0UAJZ
   ag9dCyzoDK6fsX06ywoKVooA9hnYUt9REiqcty+6Rxv3OWYMMao5RcxZg
   A==;
X-CSE-ConnectionGUID: jJieKaveTLWwHgM3PauaAQ==
X-CSE-MsgGUID: 5pIGvEUvQRS5M9THluR50Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989109"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989109"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:48 -0700
X-CSE-ConnectionGUID: d5VCBzAGSyCx06SEqxB9TQ==
X-CSE-MsgGUID: 0rYIdryfThSZuExL48lToQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172358"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:46 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 30/44] media: ipu6: Parse bus type for ipu7
Date: Fri, 21 Aug 2026 14:42:48 +0300
Message-ID: <20260821114302.365532-31-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821114302.365532-1-antti.laakso@linux.intel.com>
References: <20260821114302.365532-1-antti.laakso@linux.intel.com>
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

