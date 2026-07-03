Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E192B417350
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092403; cv=none; b=jUWMkOmL8IL6nDXX6uscZhE+iVZS6p0XHIPG7BTFN5Ny2e242+p7w3kDHJvKf+6j8kgYf2O/8qlhgAcWmhA1nZ+tyhzhHmuaPYCGwbWiZecjutni+gvfbU+BeTrrFNW4qnKCpgE8yDDggnbctBtv4RNj/qFfgSQ6PxBi0UvpdL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092403; c=relaxed/simple;
	bh=gtSjYtprV8NhgkLuic7vnrG7vzc34+zGpu3aJrky3Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MC5HI0kt5ZMkaZUMjthRM8EYIBWkiP6NE7Xltk4kwSLXBBMNvv4qfItKyOLwyF0rfojQm/k5cS2oQf4KWhR4mMxc/8trcOsIAaO+cipuw4aEldGg9VEE2IxkR5gWSfhayzdl4Azi4T/fVOEN+Op6uUHjw6dTxE1A/tgWkicCEb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fk7z3TXF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fk7z3TXF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092402; x=1814628402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gtSjYtprV8NhgkLuic7vnrG7vzc34+zGpu3aJrky3Uw=;
  b=fk7z3TXFuM1p6xukikPeGAeZ6bKb1qG8pFCWgcFJd5DH+cYTUPHK3bss
   LWoZ0F81lCIFV5Fd8BfNhKF4vYvxXIHl7yxQeC6TS3dVOaoYkqrU7DhId
   AZWvMrk3S2fz8N9UVkGT0gTtw39q8nKS0HOKDImG/Rf60zHzxtEI7HqTh
   4IcCnkkLPM7kSsUQfyFdPNJsMcHBGsnX6Z57qJi39wZvLcIc5izMwpBpa
   QWxQezDkraQoS646tgcO70bA5hBImS9vRMuo1xsKkBCxbHg9H1aNt7gv0
   raQuR5aXL3E4I1SuMEB9ttLiQqasLiANYG3CvjRXnOi8+3qEU7rJw3r9x
   Q==;
X-CSE-ConnectionGUID: 942IPJ8qTlmJQ4bEWzWx/Q==
X-CSE-MsgGUID: ipE7Dt3RSs+8ROXA/q//bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396282"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396282"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:42 -0700
X-CSE-ConnectionGUID: BS6JjbKeSGirK1GmN7oWxQ==
X-CSE-MsgGUID: 8ASgEh5QScuErC40nbOQmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799855"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:40 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 39/41] media: ipu6: Set model name for ipu7
Date: Fri,  3 Jul 2026 18:24:49 +0300
Message-ID: <20260703152451.1743132-40-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are about to enable suport for ipu7 hardware, set model name
accordingly.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 5 ++++-
 drivers/media/pci/intel/ipu6/ipu6.h      | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index dca6dd30a270..787da4b807fd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -739,11 +739,14 @@ static int isys_register_devices(struct ipu6_isys *isys)
 {
 	struct device *dev = &isys->adev->auxdev.dev;
 	struct pci_dev *pdev = isys->adev->isp->pdev;
+	const char *model = pci_match_id(ipu7_ids, pdev) ?
+				IPU7_MEDIA_DEV_MODEL_NAME :
+				IPU6_MEDIA_DEV_MODEL_NAME;
 	int ret;
 
 	isys->media_dev.dev = dev;
 	media_device_pci_init(&isys->media_dev,
-			      pdev, IPU6_MEDIA_DEV_MODEL_NAME);
+			      pdev, model);
 
 	strscpy(isys->v4l2_dev.name, isys->media_dev.model,
 		sizeof(isys->v4l2_dev.name));
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 4cdc58ef0194..18841141a120 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -17,6 +17,7 @@ struct pci_dev;
 struct ipu6_bus_device;
 
 #define IPU6_NAME			"intel-ipu6"
+#define IPU7_MEDIA_DEV_MODEL_NAME	"ipu7"
 #define IPU6_MEDIA_DEV_MODEL_NAME	"ipu6"
 
 #define IPU6SE_FIRMWARE_NAME		"intel/ipu/ipu6se_fw.bin"
-- 
2.54.0

