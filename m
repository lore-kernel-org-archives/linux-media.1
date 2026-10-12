Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F78439349
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805364; cv=none; b=YE1T8554dGMcJ6ej1EmusroVrOiDVnt+pibis5RHSSsSpIIDEuwyBqROKLgGV55IXIn8GmKCa2sd0UnDPzhS/9VjVqSxU6AhrkK+wq4E2lQRoZdZOrdTopCxLqTEddtR63tYgwtfvjRxfcC3lA7hvBy8liLsJg3n9023jAAvm1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805364; c=relaxed/simple;
	bh=Ho7pJobPgVkM3xYGBaeTHcr5XEVneZDpjtW0AZJLv4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kr4XtR1Yl7rAEDmkmiz2t6pda6vdIJvct4nJUYtG67oqpX7MXcrCrYwcQsVrdFKKAsiIIoYva9bVfnf8whURlO3R/ZrZT1zdQVERlTPL7ti20hrk8Us6Zu5/IjX8a4fxI6fKJiktwRMuB+FATXL7/hYH+0J4HEkEFuOogGelW3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UH330OKl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UH330OKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791805363; x=1823341363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ho7pJobPgVkM3xYGBaeTHcr5XEVneZDpjtW0AZJLv4I=;
  b=UH330OKlAwcoyEg1vKBrNL32BgYRX/F776VBWYgROzPbIxL5N2osL1l1
   NcSGBkR3s6+9rbIUmecrXRgRBWqjvQhO4Y24/sbPlAWPro46YXrNqOY00
   HVpwqFbaYM0Y/+0pWJOJZY3XEVe7WvrRe/GUuX5tMlE3YcalC8ENO4TMM
   O8oZPq+tlpO0W4Ox6jHKpC0Wbg5dTh9zz9Hp740khaIh+Ae8gHwkavvxX
   Oji4lteFyG/APg784/WXjNPkyiDHIepsnJmnNbZp6SZhzQfhSXICpsBky
   DLHUEuksEcaUwwagux+j5fyz2Jl+QcHmqZtrM4OFSK639G4JrO1EERFA5
   Q==;
X-CSE-ConnectionGUID: +/o6D131RpyFkr1hCb648w==
X-CSE-MsgGUID: tYc6Des5Qym3OqzXGg5k0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="394320"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="394320"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:42:40 -0700
X-CSE-ConnectionGUID: DQvmN4ZuQDeA8bypmljl3g==
X-CSE-MsgGUID: Rw3p6UBMRaCEk5QYk31hmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="978027"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.165])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:42:36 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3B522121BA5;
	Mon, 12 Oct 2026 14:42:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xGENu-0000000GeyK-2JE6;
	Mon, 12 Oct 2026 14:40:02 +0300
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
Subject: [PATCH v2 3/5] media: ipu6: Prevent starting streaming if ISYS needs reset
Date: Mon, 12 Oct 2026 14:40:00 +0300
Message-ID: <20261012114002.3970409-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012114002.3970409-1-sakari.ailus@linux.intel.com>
References: <20261012114002.3970409-1-sakari.ailus@linux.intel.com>
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
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 6596833e95d4..d637b428b0f5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -481,6 +481,13 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		av->vdev.name, ipu6_isys_get_frame_width(av),
 		ipu6_isys_get_frame_height(av), pfmt->css_pixelformat);
 
+	scoped_guard(mutex, &av->isys->mutex) {
+		if (av->isys->need_reset) {
+			ret = -EBUSY;
+			goto out_return_buffers;
+		}
+	}
+
 	remote_pad = media_pad_remote_pad_unique(&av->pad);
 	if (IS_ERR(remote_pad)) {
 		dev_dbg(dev, "failed to get remote pad\n");
-- 
2.47.3

