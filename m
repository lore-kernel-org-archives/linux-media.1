Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3743D3CE3
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 08:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449728; cv=none; b=hB/Qi1fhUPkPddaKyB4bK3RAJovVbnQk8CQVfMkiuL+b4BM5KbiGcP3BLM6sqLN72SkqecOMo/xAS/A59wZhkwBFdZoi6XgkX4rCES9r6rzJ4riOyvt+FU+aY50S50++ZK/n6N1segHHarsiY4rBhWbBWvBfZ5Aa9GVJOTfYjG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449728; c=relaxed/simple;
	bh=VLO5nME++DZABexoM3Aof8Ki6VqDOGyjq++/3qXBt3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6Isu7aCiaVMzs6bgngcxT2TY1ZBHPQuLKT6V+D4GBwMDJ054SUQBL2lpuiq320nBBcUXvUVKGFevkYtQif5nYeZc8EnLawMky7Opx4WMD6Qbyygb4mAbrWeHI3iB1FlMUvs2YIMFt6EkxA40rttmUtoSTvuV/y0C9X3Bdfs9Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+5maq8l; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+5maq8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791449727; x=1822985727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VLO5nME++DZABexoM3Aof8Ki6VqDOGyjq++/3qXBt3k=;
  b=I+5maq8lwj1WUgsg5DTPSpcmhGVHHW24Ldlu2LIlGPEuW9ZB2qR8zQOM
   jvDrb41LYcDm54VVkjTBMVt/iR6jIXSAW97QfHg0smcM/HWm3lqFvBTbF
   nQUX6uHYE9ggngvuRUe3nitV3fFSuHG8fI3/ThHqkmEdvuTW73ZUNojdv
   Q8UbTpNwir8BkqQeYZ0puXLoqG8+MwN/k5VMxCDjScx4zBGhnYxDcGuBY
   dGvWFW2O9rO5p2HPpkCIikskcOxNgSaJ9Dz6uo8/yAqH9DIUtamxzIl81
   QcyWWPO6eys3ZBL2rM1qRkFOBOyGZmsNPSiRfyiwt02Pb01/DMnVocyDx
   Q==;
X-CSE-ConnectionGUID: fsWt13sUQu6rtQYFn1luPQ==
X-CSE-MsgGUID: Z8Q3mjkCSCS9zO7WOOPD+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="233669"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="233669"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:55:26 -0700
X-CSE-ConnectionGUID: IkzlEF7KQ0iG9HWzJRiTJg==
X-CSE-MsgGUID: NAN0WZ7+TCmON6EAzLAxGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="86306"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.95])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:55:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 530FA121BCD;
	Thu, 08 Oct 2026 11:55:25 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xEjrr-00000003Le0-3IFQ;
	Thu, 08 Oct 2026 11:52:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	"Yao, Hao" <hao.yao@intel.com>
Subject: [PATCH 3/5] media: ipu6: Prevent starting streaming if ISYS needs reset
Date: Thu,  8 Oct 2026 11:52:45 +0300
Message-ID: <20261008085247.798156-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008085247.798156-1-sakari.ailus@linux.intel.com>
References: <20261008085247.798156-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fail starting streaming whenever ISYS needs to be reset to resume normal
operation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 6596833e95d4..978acbd72e63 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -481,6 +481,11 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		av->vdev.name, ipu6_isys_get_frame_width(av),
 		ipu6_isys_get_frame_height(av), pfmt->css_pixelformat);
 
+	scoped_guard(mutex, &av->isys->mutex) {
+		if (av->isys->need_reset)
+			return -EIO;
+	}
+
 	remote_pad = media_pad_remote_pad_unique(&av->pad);
 	if (IS_ERR(remote_pad)) {
 		dev_dbg(dev, "failed to get remote pad\n");
-- 
2.47.3

