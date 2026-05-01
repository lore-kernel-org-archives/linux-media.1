Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF333D1CA4;
	Fri,  1 May 2026 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649974; cv=none; b=BslvM5/9RW2aPPw4KBRERvI/K7cvi++U+xa64DBeNgl0vs4oQ8CoCdbGt/05gUaIJ49J7idAIE3nWmR9iyHQIPZ//DMQUDuEC2dTw1GKC/INmCNQUQL2jfNuXg+QACYSZ1kXCeTSyzQGVxhnhGnGIId5m4cC/m4KfOG6cVlCe5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649974; c=relaxed/simple;
	bh=WezbV1kNoUX4SC2XbNke5CRabFXs5Z6dwCGzIqX1Kp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIPMkLGlKedUMmnUuH8d3IYlly0ZydbRSLP4x++W33IqO5eoYOz/DpJ5TtQCswPnMkYeKL3XuHqBQKTqermCd+8xeu+gITT77RMPLcmPtuhMNMcPHYC08AMS//PICLBldELGQ7yI1gJtrn+Kk8HGLUVHxpsQU1VPUKf5OdXMr0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mjpohP6Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mjpohP6Z"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69FA27CE;
	Fri,  1 May 2026 17:37:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777649855;
	bh=WezbV1kNoUX4SC2XbNke5CRabFXs5Z6dwCGzIqX1Kp4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mjpohP6Zil3wDDWcN5IzC5NkE3qvIS5dY/KPmmnWBcb8MBCzeX1VGXYA9vGFl3tiT
	 lHKf1FJGz2eAtmt0YRC53hkaB1Hg28Q2NIm3PRPpf9sGU8HQpn4ToXS2bwiO7ccRE3
	 dBgFmLTNO03QR1GW/akbQEIZEYQKOJip57keU3jc=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 01 May 2026 16:39:04 +0100
Subject: [PATCH 02/11] media: i2c: ov5640: Set exposure minimum and
 defaults
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-ov5640_cleanup-v1-2-0869a7802a33@ideasonboard.com>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
In-Reply-To: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777649959; l=888;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=WezbV1kNoUX4SC2XbNke5CRabFXs5Z6dwCGzIqX1Kp4=;
 b=Ud1RpjJU6BdVFfKU8aBqd9Wm4Z+1czJMXz0eMMHc53LXtrNIthcxIUeIL3VrIAvTVb39mBYsl
 uiRZUMH5DN6ChIkTczQ9E0dqwyFhgfJvCQFDx2HGdvXhc+3QM4tT81t
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

A zero exposure would be a fully black image and not useful as a sensor.
Increase the minimum and default control values to sane parameters.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 01ea6b2bfeeb..b5e529ea662b 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3479,7 +3479,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 						 V4L2_EXPOSURE_MANUAL, 0,
 						 V4L2_EXPOSURE_AUTO);
 	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
-					    0, 65535, 1, 0);
+					    4, 65535, 1, 1000);
 	/* Auto/manual gain */
 	ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_AUTOGAIN,
 					     0, 1, 1, 1);

-- 
2.52.0

