Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0244F3FF1AE
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078745; cv=none; b=jXskhiZGWCz6jeoavHmDA3FhowCJ/QjRquyGALMtyW9ByFKIiq+nd5tBG8mWW+okIcVxPN6G1sDDJPRrXy/aMRNbXUZYF6K+y9j5cVLHa+TqdLMuD/r+hGuNTO364biTdOMmSPZZBxOj9TMVfCFy+t1xgTcn2aKJ0FZnBuhdtpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078745; c=relaxed/simple;
	bh=wDw0yu6r2kscDtN2UX1BzfTAz9CUPRPWOpC2zP35QY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FozmoT/b8wTBHpoY1ESyhnZI3g+6B8KLleznhkZS7gjneUgXveVryDyXnC7qKUzjAWYEW6Hrr1cIwNsYbzmicfxhcU/umlrRZGFz5tr4IL9U6GCDn9XWxBA5e99F+PwWR5a3RaWkwo4nLycWuLcG2yWaxVz62jvuGIUv8HeGWaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBbw8n0o; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBbw8n0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078744; x=1821614744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wDw0yu6r2kscDtN2UX1BzfTAz9CUPRPWOpC2zP35QY4=;
  b=DBbw8n0oM5A6CSD3FTXUZ0fpFPh1PRcsWnkRPQFt/yd5+nVXJHRQ4KbV
   ZfKpFy4bmc+6bmIb1QdL0SqWO+EqbQojK4+x6OORhJf5lDuE/JSg1oitQ
   tfcHzoqQ2BO5+90xkdzOG9BkuQG2gIwnoCwUjOZrXHXf0mU82F/w8nkIU
   OsbuHJ1qly2n5m/c2KSpWN5hic/S/46uRIOoqeuJk87KFrSSNsYvKMeOj
   s3wS/OkYIqkdNgv3NrnF81VMeQEaGWgT2IMz5VrIJMOF71anRZgGybwP6
   hBVONDOZ9oDYipQ9VGB0TGRTWaunKDzNwfnxIwX4yrxAQQ99QegLrexDj
   Q==;
X-CSE-ConnectionGUID: ERMh2gV4TeSn+Fgy6wFuHw==
X-CSE-MsgGUID: lvKildeJS/y0WAuGdKk2Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78227068"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="78227068"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:43 -0700
X-CSE-ConnectionGUID: TQUHyejRSW2N3BHeXdEwVA==
X-CSE-MsgGUID: 6SO+kfr+Qd+2Um6gPtsejQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="301029121"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:41 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 997C6121C34;
	Tue, 22 Sep 2026 15:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x8zFi-00000003lHY-364o;
	Tue, 22 Sep 2026 15:05:38 +0300
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
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH v3 01/21] media: ipu6: Fix releasing resources at failing streamon
Date: Tue, 22 Sep 2026 15:05:18 +0300
Message-ID: <20260922120538.896684-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922120538.896684-1-sakari.ailus@linux.intel.com>
References: <20260922120538.896684-1-sakari.ailus@linux.intel.com>
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
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 38db162d64ca..572663451a5f 100644
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
-- 
2.47.3

