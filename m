Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E41853D9FA
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078751; cv=none; b=YYXzJFZabhHXDc6PLo9dXtcx/qegV+6yVkpNVcngqmGVyH9lHktFNaXX2dzejIdBU02nC6jtBtWL4xYDlN+zM0H0kXXsnlzxAFistrZEJ/QGmwPKx/rLfvAqWDGM3ZCDPA+QHtqT8RVUsn01p0br2QtdJANDZ12ig6a1Eevj6XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078751; c=relaxed/simple;
	bh=z5W0F1Fg9MSkV0L+U0sDzjncnMjUUu0cCw7HIQ2ufc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=codF6isJt3hfKA76zofRk9EM0YOWPkuL/CEMQG5vHkgSFJPAZ1OHUlSomM/C54ul38KAsJLuc6AxHrlllilfanqG45DAkXa19DRqRva75Z1VLG4AW20FdOophmU8Hbif2MryNmVaEjVvhsdkDN6a/Rj5g483aFhu1lYa3KnDGMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jH/AwIHV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jH/AwIHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078750; x=1821614750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z5W0F1Fg9MSkV0L+U0sDzjncnMjUUu0cCw7HIQ2ufc4=;
  b=jH/AwIHVV/1zYdUTrBUXiB9pmwqa8z24H8hRG8xDDdw6lh4h54NzXKZA
   saPST1P+RYF5m4pHSfr+CB7i3FkpoUmwC8RKQxXZfb35nJ40pAw0gmnWz
   EFlgvSNxEIW2aWNM8uka247dO5z5c8Q7b1deLmFMo7TgmABOC2ZyYpTEi
   QiSLHzUEtmtKP0Fc6h9UQFdjax2BZhUNnHertDuP/Zy45gOlw7X0fU310
   Ohb0MtE4idaZftwi/uaBuAawGWsE84jHivW0k55OE3gG4p1vwGLpp/b1v
   ZLaBXkuTAqYSWs///gBv5RE3mVAfuUL8+yspJ5hTJz0gILxbsR2mYpThx
   g==;
X-CSE-ConnectionGUID: tQsDOsXUQHKESzrstxtDmQ==
X-CSE-MsgGUID: Cs1UyhAEQJCQygrbRtawlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78227089"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="78227089"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:47 -0700
X-CSE-ConnectionGUID: ZJOWVAVERvyf9CB9ongQCw==
X-CSE-MsgGUID: 8Sy7dwILQiaLrtSlq9Sd7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="301029157"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A7787121C8A;
	Tue, 22 Sep 2026 15:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x8zFi-00000003lHo-3QFP;
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
Subject: [PATCH v3 05/21] media: ipu6: Always request a capture ack
Date: Tue, 22 Sep 2026 15:05:22 +0300
Message-ID: <20260922120538.896684-6-sakari.ailus@linux.intel.com>
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
index fd9935267769..35cfd7a10882 100644
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

