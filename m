Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE1414DEE
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092332; cv=none; b=Dc0RwC1pw7K49Ob4jdsSEd9Mlp82Ya8zQV9ebZZe1ZJJx0dyh5d1olGHzcSDp37o++vL48Ls5kUYliQPG+hP+AKPmYvFgvx4GwQbXPKZIlmt7v9z3kq9O9Ey6T0zS0akrr5YC/na5Jd68BxP/wv6de2rOSpAETXMvSjn3yvULkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092332; c=relaxed/simple;
	bh=y6VVAUQ3SMI93dy9+ofAFWpJx9oA0/DUKyKTWV5Vjec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2BS7z5XvEEkC6U67HJ27CoBXt4bcsgXWyso7gEe5pop6BUD8HmXtXA2w/J3CPBb+FFCOO3g/qDWXnbKti9Cut2WRpWZ4clXjAEh40iRV0u/m1WULxBwXq7/ArAYwSlcUAjA0kNV5b1iYsRNcNWQpCZP8NuAeCKsjrxENRlj+Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8kFCrg5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8kFCrg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092332; x=1814628332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y6VVAUQ3SMI93dy9+ofAFWpJx9oA0/DUKyKTWV5Vjec=;
  b=S8kFCrg5/iuD3NvDzC8prho0se9bHtEM5TnfmpPsR2M3pl4Ryvqq4qgx
   g6dQHXA/I2DP/tCdZAPSCO/7KJinW0h8nlsoLQm6kBAeX54FpcZMHzYdS
   9oRTDabyA/NgHjL51ZF6Md/jYTWUTtZ7+3LaT7t0FMAlKgCsg2DKzOCJu
   XASufPShASNIlK/zEcUVAl38USPmasiK7mTRxoICn9hL/5C6QgZHK/YHn
   Sbx+IQuemSsWDTDld5KC/Tbg/gp/QkQ97AzLFnppubZoxtCjl9SmA6IWq
   6Qf1IQCax3c1GxeAjoU0emI/1bqorAiaGQtzSoJl7aJH3jb7W/Ju1DH4m
   g==;
X-CSE-ConnectionGUID: EntIeSzOQKqjQnxr1lI3Bw==
X-CSE-MsgGUID: xYzQOvl6R2a7TcWk+a5p1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396143"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396143"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:31 -0700
X-CSE-ConnectionGUID: 7a88i86zR+23eWlBo9W9Eg==
X-CSE-MsgGUID: W402RRG7QES3sxKYvFG+vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799492"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:30 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 09/41] media: ipu6: Add ipu7 match tables
Date: Fri,  3 Jul 2026 18:24:19 +0300
Message-ID: <20260703152451.1743132-10-antti.laakso@linux.intel.com>
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

For ipu7 and ipu7.5 runtime detection.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 3c1197b59240..fda75f94b0da 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -47,6 +47,16 @@ static const struct pci_device_id ipu6_tgl_ids[] = {
 	{ }
 };
 
+static const struct pci_device_id ipu7_ids[] = {
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7_MTL), },
+	{ }
+};
+
+static const struct pci_device_id ipu7p5_ids[] = {
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5_PTL), },
+	{ }
+};
+
 /*
  * ISYS DMA can overshoot. For higher resolutions over allocation is one line
  * but it must be at minimum 1024 bytes. Value could be different in
-- 
2.54.0

