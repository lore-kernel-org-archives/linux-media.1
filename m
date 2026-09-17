Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF544D9F9B
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645180; cv=none; b=W/5F2ty+PWKefsBX31wMEQwHQJZd/B1ift5VmnxXHuj8jBNSlZc1m50TanlvW4wrepzrSmPtuO5QXC5L6fG9ME7VfwNa1EAjXSXaoqH6fRyZCgA+welpm6gpQbyND03Oi+T+52ju9fkSDKXh726TfEiqJFYbm/T1y02hXQM+tUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645180; c=relaxed/simple;
	bh=DZnPKwZNsG+8m+mQHUinvfWQyGn+LpxnO0KsluBUrT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWgVKpVNt7xoyGWI+O95C65Nr/uhB6nAMfKLe0QNazPRPAr1tFce77/jlMLDeR5nGeKU0TtOyAHgTC1vMtHXZevuw1Jh0K83eOiJTn2hOI8JwzAXDHvtP0jwhHiX5ALTkt7sTgDr5hMIA1AmS57A2QLV4093fclmRO0tmYvonas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LtVR8DAp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LtVR8DAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645178; x=1821181178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DZnPKwZNsG+8m+mQHUinvfWQyGn+LpxnO0KsluBUrT8=;
  b=LtVR8DApKj1GKZKPUOLZBeRpTlQ5cyY7h8qyH6GiyeFCthbl6qQOutG9
   zol9W8oym30DrdPQi7PmPLkXiZKYy20/zW62d6d+zA5CLQnmA31a9Yl7u
   XQPYPZafbUnd9v3/MNNpW7TgQ3BAJ8CFr5kRGoLMbWW/kcrlsxUo2wz6d
   mjBComkmMn4uG1dIRLM7xqIeeMDhc9E9RXjjDvUzVRLSuY9d73XxJK7Pk
   5HQqmrPvWxRT6rA87XaKzqxdHGlSsk33kf+r8r4hbnYqUXOomxQ6c5iY2
   tMZ3O2xQ6SIoJoTvuboHz4ZN6UpKLC+o5oBEeUruMWXqGpmjMTySZBF2J
   A==;
X-CSE-ConnectionGUID: yM0kHd/pSQqwGlatI7fuVg==
X-CSE-MsgGUID: kbBqJzBGTEm+7qyYUCQqnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77622372"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77622372"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:35 -0700
X-CSE-ConnectionGUID: M82ROK7JSMyL8asG2VnOBw==
X-CSE-MsgGUID: eojtfoKgTrGxjSJPb7vASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271097341"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:33 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EF7B8121C87;
	Thu, 17 Sep 2026 14:39:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASa-00000000FNW-0b9i;
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
Subject: [PATCH v2 13/21] media: ipu6: Avoid accessing av->streams before streaming
Date: Thu, 17 Sep 2026 14:39:15 +0300
Message-ID: <20260917113923.59004-14-sakari.ailus@linux.intel.com>
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

