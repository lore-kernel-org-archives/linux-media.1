Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E993F2FFF90;
	Sun,  1 Mar 2026 01:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329797; cv=none; b=nRaCgXJ6XD/XXbemYyxOpZiLT55vWclz+qDM4j1eYlVeiqSYlirVW2umBD4N4Jp0S790T3CjU8SKffhk4sAWGaTI7KNXSJO0kE1KDnlYy8lpdG9G97/irkXDvz83qM7BfdErMoKgPpQWg+xJBSitNyaMsgsl7JSqc0PrjI1ePrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329797; c=relaxed/simple;
	bh=Baj9/3kl0k7qQZykgDocyVSYBs7JZUMOlTLBR1pP1V8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=urK3arnRbEaJdxzZXFIFb6yZY1UA6TWANwbGAd8h4TMzOJAha+H0f+E2ztcTqk+ifnwo6PSUVrStgF8VjbGoP6QfGfgeyeFCdoETkPeEIbU4Lw0tAeJ+ONcvgFZPt708r3Xi0oSZwcXmAZpjs03Bb5/sZ/fAncqnnt15TJ35nwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5tuOZD/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5tuOZD/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19018C19421;
	Sun,  1 Mar 2026 01:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329796;
	bh=Baj9/3kl0k7qQZykgDocyVSYBs7JZUMOlTLBR1pP1V8=;
	h=From:To:Cc:Subject:Date:From;
	b=q5tuOZD/72jp1kg4QAcf7MEBDyUMpaaFtHbYdb3uxJ+iTnHfCQdf2oQrNrbinEknD
	 qoCbyovlp+62q+Wu94CVhWTHSxui+vFbfL89vyAZHfc5UTyv4RjrBsrihA3sj2CplE
	 it2lMBj/UG8xMtKCBY88Fqx6NM8VC04iOjHTo9VyiZe4vPQUQWLNmMttB0y6vsH1PH
	 PEh5Hrgm4PIGHfaQYr2T0Rkv50FBr1o0gfccvCZLIQpwPojKHLo7snq4LoryZMOCcq
	 p6x/RCzn0rUtTkeyIiRZIWwXG4W3bSq7yLQFA3ocmDcwe/mc91b7IFX6zCokK360WE
	 u0bFFcqfGhQlQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	david.plowman@raspberrypi.com
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: Sensor should report RAW color space" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:54 -0500
Message-ID: <20260301014955.1715212-1-sashal@kernel.org>
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




