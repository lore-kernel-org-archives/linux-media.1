Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C962F6910
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 22:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774218308; cv=none; b=mI4WxWhC3BT9vvFSYzHM2Gr57ZYNqZORboDLaG2JJ+zi8mHD8EWzctp/BJUDqS5LlzjHDwaURXXil2bnpKPTO0teoHGyM3MWP4ctGTJBiGnaARVS/ZXVmf4AC3Myr1ai21JqorbGnMz/hkOR+2DxRc7bMnEx26kuYZ5rOt/Tc+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774218308; c=relaxed/simple;
	bh=+ibYbI6JR+RlIXMw+5kWun8pbbF5p2m5AIQozJ/5g4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OlLtLkNAjhaLcEiZV7K4hE8fKHXcKVpsfhzKMEdgDOiRmW65Xitz2HKYDoW6rT1jorx1yJko1IotGt3TPlJWu65o/JTnoS8p29QsOwO8s1zPXgIPprBEHPT3Pl97nwrofqROV0Nxi2q2pNR8mcgZG3It814IaQ0pxkPB9bwQ3M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIT58S9V; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIT58S9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774218307; x=1805754307;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+ibYbI6JR+RlIXMw+5kWun8pbbF5p2m5AIQozJ/5g4Y=;
  b=GIT58S9VeBpgvMn7eBcBGM6Eo78GqM+NjLRKKo8DOKU2HuqGzKyCLyQu
   uoBIsaoW3tqT2NOgoDwIiYeSiPX2906VdVwQ3I7T62VmkoU2MD1SVJxuB
   7ETc2SlrJFtiotAXon3XL5mQcp1G0vNCMZvuscs8/IUYfJTrf6ErE+QHy
   CJyjHmIVy/y4OZ2+puFf4qiaZmz2PL9nEz1PNp/CzX801gD5vvGQzJSZo
   I29nOdfUbLp/8lyWWxx9JYtZ0NiepBi6atsExbKMenth6ev/pAXkAdKhD
   9YWsy2FGTkRIG1fvkCLboeaEkt5OpoAndH+EeHfu5hHM4GIh7w57KeoJs
   g==;
X-CSE-ConnectionGUID: bCvkJZtSTIqFTSG9SN80fQ==
X-CSE-MsgGUID: xO3RUNWEQX+HP9s0C8xCUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85847430"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="85847430"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 15:25:06 -0700
X-CSE-ConnectionGUID: UCFmLrVETCGCqaA+duyvTg==
X-CSE-MsgGUID: fxtQHPXqSl2rMb3tanBxtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="217426172"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.240])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 15:25:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7FEA6121CFA;
	Mon, 23 Mar 2026 00:25:08 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w4REJ-000000036o0-3u5N;
	Mon, 23 Mar 2026 00:25:07 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>
Subject: [PATCH 1/1] media: ccs: Avoid deadlock in ccs_init_state()
Date: Mon, 23 Mar 2026 00:25:07 +0200
Message-ID: <20260322222507.741136-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sub-device state lock has been already acquired when ccs_init_state()
is called. Do not try to acquire it again.

Reported-by: David Heidelberg <david@ixit.cz>
Fixes: ea3674c4465c ("media: ccs: Switch to guard and scoped_guard")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index aa4dd7e7cf5a..8e25f970fd12 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3080,8 +3080,6 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 	struct v4l2_rect *crop =
 		v4l2_subdev_state_get_crop(sd_state, pad);
 
-	guard(mutex)(&sensor->mutex);
-
 	ccs_get_native_size(ssd, crop);
 
 	fmt->width = crop->width;
-- 
2.47.3

