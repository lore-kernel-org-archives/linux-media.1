Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EFD3A6F17
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419238; cv=none; b=CNKvtHZdTibJrvr4PLCo961cAFyR36ILCU6LZSwwc+X/yM00e3kLuD+VaLEjbqxLerIcAMCg7j45agmj1rpQaI/IbDTzStU+FIIqURaqfcplGW4cfg5EIcN/91kwTPmRui6qdjRyrvzYM8atSbkiRrgKEXdgqNgiU/kSoxXylPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419238; c=relaxed/simple;
	bh=ObT+EvUcx7eR8lkOz2IZVXNY8eqpBNc2+eT2rucnoSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+Ej9EW3aObQQvRvlOF1QThxq/XMJEqLd+drw5zRit80WpfPCEjMkW+Q4Gp+x1gnSoWYgc/w3jW65riXJBfreEeRqfs9xZlKLygydfdEsmxQhaJWNh1XRuxbLmT2qvjGB/6dh1GXaEX9qwXBhL2fBBCpFAkleJAYk2ru8yZcLXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=defGEA++; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="defGEA++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419236; x=1820955236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ObT+EvUcx7eR8lkOz2IZVXNY8eqpBNc2+eT2rucnoSs=;
  b=defGEA++OOiq3ktCuh4ILTeBejBQ1ia7Wk3AtbC68ReWRm+twBOP4i3w
   OVuhNBVgPg/oWpWo4z5lUzOy9CxuSJyUz/y/9WSQN+hKWvOW4ubXUY8+D
   mAFdbhZy3KW7E/UiidIQDB2MZYg8LynR9eUAf+pVzkIbnjJGE6tVZIARM
   KFTZ8zEzf87XnA60k9720XrbLIf059VdxPP9MNVyHDQCw0yVa08xWS8Nz
   E0g8oVdugR5hzALBrb5o9viItzMZDhlFDO77RfXY9yeLPjwwmGCBLNS5S
   H9gnMxfyRejNVFGEicMuJTLMx7DQBlxL/EFuHImsuxGL0OcCZpvifhjdB
   A==;
X-CSE-ConnectionGUID: SsuQC48cR2W72+T/VODfIA==
X-CSE-MsgGUID: EPveq3wLSIyRDq6eQ1NL4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984113"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984113"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:55 -0700
X-CSE-ConnectionGUID: t9UIrnxbTVScnVz9HsUzlg==
X-CSE-MsgGUID: AM66oBZORaahWrc8iGOYMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760689"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4438911F7E9;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035Ih-31p6;
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
Subject: [PATCH 01/21] media: ipu6: Fix releasing resources at failing streamon
Date: Mon, 14 Sep 2026 23:53:38 +0300
Message-ID: <20260914205358.735307-2-sakari.ailus@linux.intel.com>
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

