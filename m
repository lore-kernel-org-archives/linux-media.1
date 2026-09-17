Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8304D7D5F
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645173; cv=none; b=O1nYXbglAyzfAOM+Y4uddk99TQF9RjnYsBcfs75/Yj3sqvG48T6aldKOIIRCnE8r/0qv/WNBvUzhyXIIaszAXOK2BbeUifABptWa+DfxPXtyFZQiTiS85JUbQTIiSwVyEUjzhjc8l/B9SuejjyHM18fbbZqGF1byLx9HL2OCyX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645173; c=relaxed/simple;
	bh=ObT+EvUcx7eR8lkOz2IZVXNY8eqpBNc2+eT2rucnoSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHnnU7NC9lqSRTFDfXQDmjMEDhDlC9ItM+XI7R+fp4ZO2tg30yN0tR7b75knHGoO4kXqTFU1LjfnXjxNtgwwChP26eRo67Q534rPhWK8nPP9sMS8nWd9+aOOTtT4zqx9+8Y7XvyQ1htewpPR0frTxLQCwBSS2QohXzVlT+821vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=geFQktCI; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="geFQktCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645170; x=1821181170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ObT+EvUcx7eR8lkOz2IZVXNY8eqpBNc2+eT2rucnoSs=;
  b=geFQktCIO8oj82VGGkBZuNWJTfMwOy6MGTbcMJz8OF7vbP3tTr6yEGeq
   lCemx7iq/2NYr+ucUAgjP/w/YOMMh0Al9UhxpQDd1fvd1ul96mZNOI5XT
   uWv0/DQQd7jjpxqfbqtS1ckNX/Df375r4rjqaRz7W7+n7sNqF/V8U01eP
   1kkDeCmIlqgyGcn9KzMD59h7RwCu3/jmDtk63o45r6t2gkwN3jzxlkwy4
   thGw0LYOu8a7F72zRRrl5br+k+k14QWMeX34C5XObOaC3QpRcwPxegssb
   YPC9wDxtae1JZBir1MNC0HHLS/S5mx3Fp1UsqrhPxTNrt0O1K5FsCzi01
   Q==;
X-CSE-ConnectionGUID: qpRQshZySsyd8ZfZv0xQAA==
X-CSE-MsgGUID: EynB8Zo8R/yy/vlB0StXAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="561852"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="561852"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:30 -0700
X-CSE-ConnectionGUID: nH8fxzjYSNaitSglqjYMkQ==
X-CSE-MsgGUID: CwG/lNcxShWZkwesuO9LmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1932281"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CC069121C62;
	Thu, 17 Sep 2026 14:39:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASZ-00000000FMa-3zZc;
	Thu, 17 Sep 2026 14:39:23 +0300
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
Subject: [PATCH v2 01/21] media: ipu6: Fix releasing resources at failing streamon
Date: Thu, 17 Sep 2026 14:39:03 +0300
Message-ID: <20260917113923.59004-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917113923.59004-1-sakari.ailus@linux.intel.com>
References: <20260917113923.59004-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If obtaining a firmware message or requesting to queue a buffer list
failed, either the buffer list or the firmware message buffer wasn't
properly released. While this is unlikely to happen, return the remaining
resources now.

This may still leave buffers queued.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 38db162d64ca..4d862f14c765 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -242,6 +242,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 	struct ipu6_isys_stream *stream = av->stream;
 	struct device *dev = &adev->auxdev.dev;
 	struct ipu6_isys_buffer_list __bl;
+	struct isys_fw_msgs *msg;
 	int ret;
 
 	guard(mutex)(&stream->isys->stream_mutex);
@@ -254,26 +255,26 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 	bl = &__bl;
 
 	do {
-		struct isys_fw_msgs *msg;
-
 		ret = buffer_list_get(stream, bl);
 		if (ret < 0)
-			break;
+			return 0;
 
 		msg = ipu6_get_fw_msg_buf(stream);
-		if (!msg)
-			return -ENOMEM;
+		if (WARN_ON(!msg))
+			goto out_requeue;
 
 		fw_ops->prepare_buf_set(msg, stream, bl);
 		fw_ops->dump_frame_buf_set(dev, msg, stream->nr_output_pins);
 		ipu6_isys_buffer_list_queue(bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE,
 					    0);
-
 		ret = fw_ops->stream_capture(stream->isys,
 					     stream->stream_handle, msg);
-	} while (!WARN_ON(ret));
+		if (WARN_ON(ret))
+			break;
+	} while (true);
 
-	return 0;
+	/* Error handling begins here. */
+	ipu6_put_fw_msg_buf(stream->isys, msg);
 
 out_requeue:
 	if (bl && bl->nbufs)
@@ -282,7 +283,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 					    VB2_BUF_STATE_QUEUED);
 	flush_firmware_streamon_fail(stream);
 
-	return ret;
+	return 0;
 }
 
 static void buf_queue(struct vb2_buffer *vb)
-- 
2.47.3

