Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2E13E95B2
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419240; cv=none; b=NlxAAHhRzK/V6trWNwJYJQlYT4xqoZRL+t4tF9qDIVjLO/Q8jdXRx1xaMKNxArG5SKiQnALwA+fEBdFNDASLuq6VAlpg0klMvf4G9yzcqPRtXhQEmnYS690qTbVt8rPh9JmNaxiZLw6bi96ZnQyoMshVd5UU+319tGWhEfVjmDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419240; c=relaxed/simple;
	bh=myul2k7iqXXwkC+SXchK0yw2GdQw69X76IcwPdYJNts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gs/IAgUqC7WYXUT9r6jJkponAuEGkdnTywkzYGcJANgu1TrXVpKHFAob7HAu2TXs7soSDotam2y/4haggTmGighCWefCS3wFeywcuM5O3fx0ikTHKySalwaqinFuTqsRAFi5TC2TLyzgrFwfX5PbdL/WtFrkLywff6deZIYZ+28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXiXbIgw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXiXbIgw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419239; x=1820955239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=myul2k7iqXXwkC+SXchK0yw2GdQw69X76IcwPdYJNts=;
  b=dXiXbIgwaSgHpNkq6adGUH+3w5tHRE09DD0U5fCAwZ1d8Fm22cRaG1Pi
   CT02PatDSlqtJbBSFGY7Ahq3OrCopDwSTc3DJ9Cvs0H/gPz5hk4RY37Ce
   dJbtrP2YDAN61/Lb3uYz6vgSOdXKhdvECa284BqYIxts064FgfOvczWMP
   H2EE5MBXvf7B7Hy0Ekzds1qBYb3K9nkp5nzAZxtHwURaqy0QSqIH7Tn9h
   9rGwvWERYm7fT10YvxPd0XYezi4W3lXv0bshOuqKOYBagpXMRKIBCUaYq
   i/1x20NaOIbBT40eZoRnwOgS3DuTptZFat91ZhA7GgOUG4K2PRF2Kt844
   A==;
X-CSE-ConnectionGUID: ijbLdw+ASxqvC3IzhIiMyg==
X-CSE-MsgGUID: ZjPrJJNvS6OT9ZrzZwzgmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984114"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984114"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:55 -0700
X-CSE-ConnectionGUID: WAoui7NcSwOPKUldunnTnQ==
X-CSE-MsgGUID: D/MnE6cKQVax7kmEBwSa6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760691"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4968D121BBA;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035It-3Cdw;
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
Subject: [PATCH 04/21] media: ipu6: Rename misnamed out_free_watermark label in video init
Date: Mon, 14 Sep 2026 23:53:41 +0300
Message-ID: <20260914205358.735307-5-sakari.ailus@linux.intel.com>
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

ipu6_isys_video_init() has a label in the error path where it is used to
destroy a mutex. Rename the label as err_mutex_destroy.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index b15c24b1b710..781fc0e88417 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1107,7 +1107,7 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 
 	ret = ipu6_isys_queue_init(&av->aq);
 	if (ret)
-		goto out_free_watermark;
+		goto out_mutex_destroy;
 
 	av->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&av->vdev.entity, 1, &av->pad);
@@ -1144,7 +1144,7 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 out_vb2_queue_release:
 	vb2_queue_release(&av->aq.vbq);
 
-out_free_watermark:
+out_mutex_destroy:
 	mutex_destroy(&av->mutex);
 
 	return ret;
-- 
2.47.3

