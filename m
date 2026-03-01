Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC98182899;
	Sun,  1 Mar 2026 01:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329288; cv=none; b=d7TDXqv1sSeTdaRcgfpPkOERKQrLQTlFtzc+H7BtJkgfh0f+9r9AGYp5NoFH8ZlYrnFkqDD1pLavQ6KgT5kv5FZfEi8ptl9uH3GIwUFNL/ksGAn1FcOD6GpSwNKm2rpQN1uIZYa4j5ltz8Pfes9l5dlja1AMLlMlzxIzxGqEytI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329288; c=relaxed/simple;
	bh=J15jXZLlya45OrpOYesM5ZZHHypaqWJpW1QTUKSmAck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CH9uynmD7Rpl/p6khQRVelFLDqy3x2Ai3jIOhAHW79oyqvzSADAFEmwLdHWpwL9jRbHiCLFsym0ZnydDOyKgjy2rU4Z08rkWTpLhYZYTtA0orVEk+PMeTOLYYA5FtSLrrtmXSXUQGXorfFl+qJSHzcseGUwpSKVf1VMOzvjZxq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHgZEo75; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHgZEo75"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5351C19421;
	Sun,  1 Mar 2026 01:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329287;
	bh=J15jXZLlya45OrpOYesM5ZZHHypaqWJpW1QTUKSmAck=;
	h=From:To:Cc:Subject:Date:From;
	b=hHgZEo75HNA3LSXbSIM3QSUanFHCFaUbeFSCkJ/ku12lWTd2VErxg9kN60/pdS/gb
	 l9nrew6oMxeolyBxnVanfRXW5VtYG7o8O6Azi2ubutX3N4Lkxpk2PHfe82HUcB94en
	 KkR/Pzo2gjTXhcqb5x63l+2eIQNd71hvnbkbA+RJqfocprc3j1FzJMejriITecjpq1
	 hr+j00kICTLG2C5BxRhxUUf058BadpLLXh5fiGngEExfsHFK427zYtkOfxE6ByR+fW
	 6jAiQi3fkAj2Z+XJHYez1XBh76xrqpYdaeY+7joxr+KxYnlRCGWhu9YFwnG7feb2k7
	 H6ofOMFQZGN7A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	david.plowman@raspberrypi.com
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: Sensor should report RAW color space" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:41:25 -0500
Message-ID: <20260301014125.1703044-1-sashal@kernel.org>
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From f007586b1e89dcea40168415d0422cb7a0fc31b1 Mon Sep 17 00:00:00 2001
From: David Plowman <david.plowman@raspberrypi.com>
Date: Mon, 22 Dec 2025 13:45:28 +0530
Subject: [PATCH] media: i2c: ov5647: Sensor should report RAW color space

As this sensor captures RAW bayer frames, the colorspace should be
V4L2_COLORSPACE_RAW instead of SRGB.

Fixes: a8df5af695a1 ("media: ov5647: Add SGGBR10_1X10 modes")
Cc: stable@vger.kernel.org
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov5647.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 191954497e3db..c0f1121b025e5 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -508,7 +508,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 2592,
 			.height		= 1944
@@ -529,7 +529,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 1920,
 			.height		= 1080
@@ -550,7 +550,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 1296,
 			.height		= 972
@@ -571,7 +571,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 640,
 			.height		= 480
-- 
2.51.0




