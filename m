Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEF449C4BC
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419246; cv=none; b=aogUvgMQ7VZXQ7iFPSs6hMrv8ySq3UWFILgi4zyGYVnMl2yoSBeUqUFFb743C5/PxXqa4DZn+G9QT+raNPVDm6fD8DDzxxJlxZBigv5TBwdDVAbaAnhjSwuEvN0FE0ow43uWLlJV+QKkdI23SbcvrSgXGEzWzaPoJSwQBZ0MWHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419246; c=relaxed/simple;
	bh=DZnPKwZNsG+8m+mQHUinvfWQyGn+LpxnO0KsluBUrT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WnZah85OcpUpOB+HhGB3UhpI9qiFxqdLjoEUKQj7JPsSQo89WRac4xp7Y85vbqj2uyrfIfcQQnjMA6SB1CbpbT9iGF+yF5Drfc2yaU67r2doEAR+dOFMu+osE9cla96wl+BQz8Z2h5Fpn8vPkmshYKoUi13bvhDTGj7mAXdLpUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOacPF/j; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOacPF/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419245; x=1820955245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DZnPKwZNsG+8m+mQHUinvfWQyGn+LpxnO0KsluBUrT8=;
  b=UOacPF/jG9li56jcReH6RRLeGuXqoBMnulIZRC3UOEISK3+2pY89+h8c
   mjQ0plSEKpcO34OLxE8daYP8GCdmKcwGxOG45GyviNn9VYLGLe2y3CfoZ
   b0K2845G7bKRUsBnvfEQ4teWGrCxQoHMWlWwOpdPYNs2FrG3eGBlGXHS0
   CVBKpCU2CqNYq3Xjr60ugixDowFpTOpjjwX79ZyHtMnbBsk0tktjxC9sY
   fgiyPO1/PUqhlIKa4oIhtPHpixku8oZDYlfXwte8/gL8OfhWh7s7au+u+
   dbEjYzdNLL69sEeq24uNglvyb9wBxl6chgsOyxzDxFptMrK7keYE6wNQq
   A==;
X-CSE-ConnectionGUID: OyuJg1+WSjutkTKnqDDAYg==
X-CSE-MsgGUID: wR5llMc4Sx2LHKaTN5eMRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984126"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984126"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:59 -0700
X-CSE-ConnectionGUID: OmYkioolSxmBBgUkVKms/g==
X-CSE-MsgGUID: nC9Y3Gu+SHG1623b9kqJmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760733"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 64737121BC4;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035Jd-3jc1;
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
Subject: [PATCH 13/21] media: ipu6: Avoid accessing av->streams before streaming
Date: Mon, 14 Sep 2026 23:53:50 +0300
Message-ID: <20260914205358.735307-14-sakari.ailus@linux.intel.com>
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

Streams will soon be allocated just for the duration of streaming
operation. In this case, obtain the CSI-2 sub-device through av->csi2
which is set up during driver probe.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 5c00c98869d9..66f1a28a444e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -860,7 +860,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state)
 	struct media_pad *r_pad;
 	int ret = 0;
 
-	sd = &av->stream->asd->sd;
+	sd = &av->csi2->asd.sd;
 	r_pad = media_pad_remote_pad_first(&av->pad);
 
 	if (!state) {
-- 
2.47.3

