Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D66C49EC78
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419244; cv=none; b=T5LNYXlHBIK0DE9zHGmxDeDs+iF7TVYNkSoQo9e1zcx48PAXdyEbcxlvRI/90et7Tc8iZij8It6n6Cl0T9wEPEWzwSzq/4zooHA6zm3EmW3q1IIefCP22FZ10LUl227j5EJTwJQYvKLqDVR3kjQDnNCysJJuZ/HIFNhatnRcxn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419244; c=relaxed/simple;
	bh=jMwWKcv9Snp6Ce9P2Hq1hqk/4X5bAdqNthFZSA2aCfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIJ6/LgW9hRNqyK2PQGggeqeWMDkQLM0YbMWXF9W2OBkKy/NhlQ/KrzmMdT8m9hT862peO0Dr34VXQ5eoqOJrOBrvAkieQYDD2/eU9yajfGidRiTVSamkxjbMcy3NTfL0lTDheqrlo0x7vJFkJALL2pBJeQiQR6nX99ZJnXZz1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZanAkw83; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZanAkw83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419243; x=1820955243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jMwWKcv9Snp6Ce9P2Hq1hqk/4X5bAdqNthFZSA2aCfk=;
  b=ZanAkw83tagwI9AfqD7fEz+IVirHx6imKZlDZdxflzsP8yOPQukS1oen
   rlX2AM32TzXLrpzT90aMw69gtO0rugwXmF2lMakWjG9SFUJHV0aSI2Ynd
   zX3c9MwhqT+9PUaXvbVgpTODsKAw7fxVON7TtksMJZMR/kiVfdXpSLp1R
   CBDW7d2qw26yiOsvIK+AxGgVKM92yUuZ65+9bwQkZ1o4i+AJU2CvBywBy
   h409DAlPY+MmMeah8ngKn2v+1DkcMMHxUp28H3P+Y4fwKOOkJLlpMZWHp
   Zun7Y1XU/5DwfI6wb3FfDRK5B4jIyPMtTqz0hUPlxRTvZ7+9l8l1l++Pi
   Q==;
X-CSE-ConnectionGUID: t4WovpJWRAuSJnzuX+7/iw==
X-CSE-MsgGUID: qjPh4C3sRceG+zhmP1hUWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984121"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984121"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:59 -0700
X-CSE-ConnectionGUID: h0187VFzQS+pQJm32+W13Q==
X-CSE-MsgGUID: VhzjQwfeR/uPxgHgw4PwJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760724"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5D26E121BC0;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035JO-3ZVC;
	Mon, 14 Sep 2026 23:53:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH 10/21] media: ipu6: Add lockdep checks for CSI-2 streaming enable and disable
Date: Mon, 14 Sep 2026 23:53:47 +0300
Message-ID: <20260914205358.735307-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
References: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The callbacks for enabling and disabling streams access data serialised
using the isys stream_mutex; add lockdep checks for this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 946a9fbfd6bf..70b48d02c0c0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -536,6 +536,8 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	int ret;
 	u8 vc;
 
+	lockdep_assert_held(&csi2->isys->stream_mutex);
+
 	ret = ipu6_isys_buffer_list_get(av->stream, &bl);
 	if (ret < 0) {
 		dev_warn(sd->dev, "no buffer available, DRIVER BUG?\n");
@@ -608,6 +610,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	u8 vc;
 
+	lockdep_assert_held(&csi2->isys->stream_mutex);
+
 	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, &vc, false))
 		goto out_del_csi2_entry;
 
-- 
2.47.3

