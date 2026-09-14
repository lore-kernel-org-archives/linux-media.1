Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614804968FE
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419241; cv=none; b=DnVD7qPSAO/nsFIo5WOAk3q3V65jm0AjxgAwKJ1jyFqSvNDokfyswuw1qQd45gXVG/RLTuifyqrlG7Gqhy4MtI1Hj41xhgtwPVY80jAry2VJvIf4ioQSQOA++/3ACAcSiLuuBOvpfqTIIPswbMZAU6W2Yv35CRCqryn7EYHADXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419241; c=relaxed/simple;
	bh=Ye5xWuG/nV628OEQQJRs+jI5+wY8Ux2BYd8s66Tc3Vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bx4glEqHQqDU4hcpIELJJAFkoFz+mMEQfKKLiLIYEpvqMiyQXmHvB5/a3C0ulWLqBOzq+nnL8lfX9s6SK7CtvGcy2xQiGhs976mUqNvDn5JvYnn2GUqq6ic0RC5ZGhLfR+Qkqo3wmPr3FVH0V7txVTdf/ghehCGCpb76EVQrCMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/I475RN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/I475RN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419241; x=1820955241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ye5xWuG/nV628OEQQJRs+jI5+wY8Ux2BYd8s66Tc3Vw=;
  b=R/I475RNOpStUMWDC+r0mZuqbwb71Ja1GQgeKF95yaZroOuvl6vUfvXT
   ik1eYX5Yv7+5byv/NFDQaeuB/Tu+C0LJKredr+L/UWlfJWdYriUIYu9rR
   eZw/BPH0Macf7f8jjVGbe4Qk3GjIffpzKyC8IWm/UND46DLhuDU6sMoaR
   qT2QyDmjMSfOOrUFbK5/eRqil8NpJO+m5nXbI2b4xeWWAM1iRm4Tezdu0
   Dvz7C3q95IqoEabpoaCN/5g8GqTPxF6ynaZmP+iStvHgZ74IgnMJhluE4
   ydsQhOtqN0WVrOsk+83yzCr+4JtNn3ftRJttgLs9IUAdZDG3/otboDVbw
   g==;
X-CSE-ConnectionGUID: TucVul4USmyyfgTQo9cOrA==
X-CSE-MsgGUID: mPSCrOMERRKM6An59C0ngA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984118"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984118"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:59 -0700
X-CSE-ConnectionGUID: qUwRCtpCSvq6u0b672NrTA==
X-CSE-MsgGUID: lelbx+T/R8GHDnC9r/WOfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760717"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4B65C121BBB;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035Ix-3Gk2;
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
Subject: [PATCH 05/21] media: ipu6: Always request a capture ack
Date: Mon, 14 Sep 2026 23:53:42 +0300
Message-ID: <20260914205358.735307-6-sakari.ailus@linux.intel.com>
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

Always request a capture ack from a queued buffer. If streaming is
disabled, no buffers would have been queued in the first place. Remove the
streaming field from struct ipu6_isys_stream as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c    | 5 +----
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 5 +----
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h | 1 -
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index 9fc42c591dc3..2c71bf27a91d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -934,10 +934,7 @@ static void ipu6_fw_isys_prepare_buf_set(struct isys_fw_msgs *msg,
 	set->send_irq_eof = 0;
 	set->send_resp_eof = 0;
 
-	if (stream->streaming)
-		set->send_irq_capture_ack = 0;
-	else
-		set->send_irq_capture_ack = 1;
+	set->send_irq_capture_ack = 1;
 	set->send_irq_capture_done = 0;
 
 	set->send_resp_capture_ack = 1;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 91043b531821..4754e95e4007 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -250,8 +250,6 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av)
 	if (ret)
 		return ret;
 
-	stream->streaming = 1;
-
 	do {
 		ret = ipu6_isys_buffer_list_get(stream, &bl);
 		if (ret < 0)
@@ -576,13 +574,12 @@ static void stop_streaming(struct vb2_queue *q)
 	ipu6_isys_update_stream_watermark(av, false);
 
 	mutex_lock(&av->isys->stream_mutex);
-	if (stream->nr_streaming == stream->nr_queues && stream->streaming)
+	if (stream->nr_streaming == stream->nr_queues)
 		ipu6_isys_video_set_streaming(av, 0);
 	list_del(&aq->node);
 	mutex_unlock(&av->isys->stream_mutex);
 
 	stream->nr_streaming--;
-	stream->streaming = 0;
 	mutex_unlock(&stream->mutex);
 
 	ipu6_isys_stream_cleanup(av);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 5e0ce7979cfd..5e522686135f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -54,7 +54,6 @@ struct ipu6_isys_stream {
 
 	int nr_queues;	/* Number of capture queues */
 	int nr_streaming;
-	int streaming;	/* Has streaming been really started? */
 	struct list_head queues;
 	struct completion stream_open_completion;
 	struct completion stream_close_completion;
-- 
2.47.3

