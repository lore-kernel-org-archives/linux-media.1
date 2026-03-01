Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF89C29A9E9;
	Sun,  1 Mar 2026 01:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328726; cv=none; b=qC/l9dZ4jiMcVvOLMnHvkp91oyrGfTFzsyrakRL/JEdQ3JImRi5bLZbuYfpPCrgM+ide2qQT38q7cCwy9O/HSjo2kKk5YwP1xjYzy3Wtnoijldv0jPGtoHkS3TuLzFqxJgFJloY9DOqaR7GO0pJDNfXgPmlX/J4SCNtMMe9gq8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328726; c=relaxed/simple;
	bh=4IIQIZCc15Ddvymf0USimfx5Rjn2+u/XMtRFDuwNex0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cgidvzvxgZRIuYft/PKqWDm7MDtuPRROLGLvs659lDwpEbMSiAIyPdHeSRcObXGbBs8Ij1Q5C6YjoV4gFbr2w1Njft+tUL5E7Usy5HiJBPQK4zBF9whxW+uk0XB/rWURa9BKEM8e23glri7f/gGVquRtEcJgKRzHa1Ua2oPROdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0LHiBOH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0LHiBOH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A4DC19421;
	Sun,  1 Mar 2026 01:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328726;
	bh=4IIQIZCc15Ddvymf0USimfx5Rjn2+u/XMtRFDuwNex0=;
	h=From:To:Cc:Subject:Date:From;
	b=s0LHiBOHM+4MnE+G30l1C25jxFDMScl71+ZWz1PNJSaCLx+HMKUZwDlDxdGEzpblb
	 fw1gYkZI7JJ4DPxAY231KqlWzGeN2vwSHot7k5j1mbZ+bcTEcnD7HElWK6eSnGvfs+
	 AQHePTuxtDMBlbAa96PnBqEvVWZkaDbtRk5Iobfk7sPEuM9g3ocH2aiPJvdHOUnx3G
	 1HYJsr11wTQiIGNjbPnFAEW+JiKCaq9lX9qcmJw6kU+CzmytF8mGxP7phBCRGT8a1l
	 9vh3liL1Cfisd0Ji/NiUTU5rAc+mDbyjZc7ifSFeOmflVYd2stI8+TqnYSt/v3TLU5
	 tNw+KTKByyKog==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	david.plowman@raspberrypi.com
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: Correct pixel array offset" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:32:04 -0500
Message-ID: <20260301013204.1690850-1-sashal@kernel.org>
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From a4e62e597f21bb37db0ad13aca486094e9188167 Mon Sep 17 00:00:00 2001
From: David Plowman <david.plowman@raspberrypi.com>
Date: Mon, 22 Dec 2025 13:45:26 +0530
Subject: [PATCH] media: i2c: ov5647: Correct pixel array offset

The top offset in the pixel array is actually 6 (see page 3-1 of the
OV5647 data sheet).

Fixes: 14f70a3232aa ("media: ov5647: Add support for get_selection()")
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
index f9fac858dc7ba..d9e300406f58e 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -69,7 +69,7 @@
 #define OV5647_NATIVE_HEIGHT		1956U
 
 #define OV5647_PIXEL_ARRAY_LEFT		16U
-#define OV5647_PIXEL_ARRAY_TOP		16U
+#define OV5647_PIXEL_ARRAY_TOP		6U
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 
-- 
2.51.0




