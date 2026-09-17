Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DC6377EA9
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645182; cv=none; b=qsW/OOpofi5ZikbedvA1z/DDf+MVBIlbsaXzUj9KaOL+6lVLeG/gi2atAGNujJGUdTQP2qP0C3HPfdNKK0jwtofX/kUYSgZGqHiBSGxyOtt4On/eAgQgOJC4E1SJlR0R3MGG3P8w8j59BUupGkFKrVYzbvzfG0t9OMSB6WTknOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645182; c=relaxed/simple;
	bh=Ye5xWuG/nV628OEQQJRs+jI5+wY8Ux2BYd8s66Tc3Vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3Q5wBhMeuvcXsI09TBbiqxVRQl/z3Ka1X+mscqzNh4UR4+Ha01YOESUqy6NmKGKmgXJ4BbiLvMtuBWS0ir65G7KEwqPpGzJwg/cKHkLI3ZZOwNnL4qEpezaXIrFgGf+UMCCUCuvhM+sh0FJA0WG9uuNlXb61UJvEleMt+9kC/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YjMtKnpf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YjMtKnpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645181; x=1821181181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ye5xWuG/nV628OEQQJRs+jI5+wY8Ux2BYd8s66Tc3Vw=;
  b=YjMtKnpfYLAbE/RoX/5EDag1ywUYdjTUBUUS27hoXmu9j1pJhhK1B1rb
   gr+vIMf2QvukBnMsUYpnUlCDCGGJwH+KAmAI8g/5as2pEVK5Uh1RO9k0q
   v4fR6qhidRu65MRD96lzxfPX1fpVNUrE7jV1vJf+NE7RSYEPe268vbzYD
   B5PuvOFO5iU45dd8V4LMkThwrKbUIEl23xVpGF7SpwGXsKQDMEhkLzTPw
   7w1FZsnuwa4stWqPC1GRwtxzjorls82zwYWHvCkEdKZbGInmkvbP8QFXv
   vaq03YtKm2R8F2NRxD4A5hltk5Fp2HhAoGSygo5OamiReTxJw5+WXd69h
   A==;
X-CSE-ConnectionGUID: YsvCgljtQh2+kliy4irt3g==
X-CSE-MsgGUID: DgXhqqclQRKQi2urfBxsKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77622377"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77622377"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:35 -0700
X-CSE-ConnectionGUID: FEqbGENHSQ65j+0XYiaaiw==
X-CSE-MsgGUID: GfxTpebIR1SR4714H+xyRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271097349"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:33 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D40A1121C72;
	Thu, 17 Sep 2026 14:39:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASa-00000000FMq-06kz;
	Thu, 17 Sep 2026 14:39:24 +0300
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
Subject: [PATCH v2 05/21] media: ipu6: Always request a capture ack
Date: Thu, 17 Sep 2026 14:39:07 +0300
Message-ID: <20260917113923.59004-6-sakari.ailus@linux.intel.com>
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

