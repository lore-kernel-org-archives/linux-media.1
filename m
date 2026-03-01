Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6893009F6;
	Sun,  1 Mar 2026 01:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329794; cv=none; b=YrbsEsh6zdP/aZS1M5fRjLHJbmLxWDg9z421fz7zO3iQ1N13NxKi3JUUhvCMRIl14C72W6UbdhMJngVmJfUURbWHWbgyDeJYEMjXzQ99Dx7TELqWoC7q00UkqyL9QxhKNRFqMbRafcvckaPsivUeffKEv15MhlojiCI2NdNgMbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329794; c=relaxed/simple;
	bh=aPP1Mn4eKRYix5C4M7upTZGeicGC95HumCNQWnpDwqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RafjXreg9/jLWGOLl3ko0mnBOPsWyY7JpnORWqx7srBEzO4eGcpqEfP/pd22/c4VhREwGXrZLgv/iUOVmVU6bI91agMPhSqal8yecR3MijN/pnntxikGrwHXakYeZJt2Q0AQtFBzVw9hmLVXuKAFw2RTMG/mp4IPP/UM2zVRvFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DI4SlsHK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DI4SlsHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A423EC19421;
	Sun,  1 Mar 2026 01:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329794;
	bh=aPP1Mn4eKRYix5C4M7upTZGeicGC95HumCNQWnpDwqM=;
	h=From:To:Cc:Subject:Date:From;
	b=DI4SlsHKX7a8aJVS/ckwqOcE2sS1Qm9w3jYhfAxnmS7VGR/TUzWgYjgRikvlmYusK
	 POZ8zx54YOmUsztcIsrkEZU0Aoj4+daxdLXEOEs6SQRiI/SxyK1pglUGsSr10PBAZo
	 rexrC+aFePOpmwuAMg1nfnZNtRIVELItqdz2Jsmo5zzB6jAGmRNAl/Ub0iHyVJQAB9
	 vD1yv9pF5Ci7F2SOyte7SfZjJZ76ByTtYhkFyn6Z4qil27wpR5UBXO4Bfa5Ow7LOa9
	 c5/yuS3Xhq1WjU1J7ufARlThvnNNCq8gxl7X5XtS9CE2+wKSL7i+a2WGPRFZJCk1BO
	 8GkNbyNIfkc5A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	david.plowman@raspberrypi.com
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: Correct minimum VBLANK value" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:52 -0500
Message-ID: <20260301014952.1715057-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 1438248c5a82c86b4e1f0311c3bb827af747a8cf Mon Sep 17 00:00:00 2001
From: David Plowman <david.plowman@raspberrypi.com>
Date: Mon, 22 Dec 2025 13:45:27 +0530
Subject: [PATCH] media: i2c: ov5647: Correct minimum VBLANK value

Trial and error reveals that the minimum vblank value appears to be 24
(the OV5647 data sheet does not give any clues). This fixes streaming
lock-ups in full resolution mode.

Fixes: 2512c06441e3 ("media: ov5647: Support V4L2_CID_VBLANK control")
Cc: stable@vger.kernel.org
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index d9e300406f58e..191954497e3db 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -73,7 +73,7 @@
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 
-#define OV5647_VBLANK_MIN		4
+#define OV5647_VBLANK_MIN		24
 #define OV5647_VTS_MAX			32767
 
 #define OV5647_EXPOSURE_MIN		4
-- 
2.51.0




