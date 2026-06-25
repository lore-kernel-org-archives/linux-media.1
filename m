Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2479A380FC4
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 08:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375689; cv=none; b=jjfVlJHToYTTxKz0ER2WW5TWMQmogcAQw7XJqkPx1VFdFz/X6FhlMofxRYaUebvmm3Nvr/MRhYsd1kqt0ShjPrboXmIqoG4dw/5fdMz1yqryleQz7oGOvUpE2ITrB3RmZiq/qtUfApkEVWP0VGZxx1Ye+ZkbrH8qEfwZ+O26s0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375689; c=relaxed/simple;
	bh=gSX6KqPA/5Nw3cjKmpw31wmT3V1bR1hYOq73V9FJfu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VUQ7BRs98pXvbbHb+5JW6pH1qjrnvVa6Hj/5523UV7PnM+UH1gfpz790e6a9OmpgsnQz3yNsX1EPZuJSHQLcsEdRRvDpqo+Xh0DF1tjQKohG84CiUDKVdkDEQZsbAxq0zUktYuZE9+DwbhaUm6B5UID6BlnKd+7vINvTQp0oaeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSxvDqIo; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSxvDqIo"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39acf7c6d59so2289431fa.0
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 01:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375684; x=1782980484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXp2EXE6kultyDnkZ6jPOv1Hatsx2+KE38CNHXZv9vA=;
        b=GSxvDqIoy2WheW7ttla+gKI+01XjejmB1Yi6bMp52XaG9PU6OEeO+4e80wfmULmHf0
         q3cWwyx+1oBqOAk6H0QJiNj04vdVU2Rmyfmtk/6NaR6MnGBQPDA6C8wxV6lgFteu6aN3
         zSCyI+KkyW/zhewgr7cYMXxb6RMsJRg7S6jMluIY0DSOjRLZ8o3DLPvOQ/oOO9kvhVts
         hDRXrUFhZaQbYkmF00Jj7gjC2ZqI1gRctA7+OPBcR4zOYW/XQ8g6vyIZONIbA67+hvnu
         N72zRk49bgAG9hOJPhglz30kIdLgxhXnrtC91VYcrnPqfHpHkaO+IDtmTJSEgZMcl8eJ
         dEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375684; x=1782980484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mXp2EXE6kultyDnkZ6jPOv1Hatsx2+KE38CNHXZv9vA=;
        b=o4qqJfZzDiS7TWOSdLgiAE1qhAflbzF/XpA9pN2bV2hvODtu7qpixXAHyRdgg9CChd
         e+yNF4mEpO7EX1ux5/O71ccKOaPMfo7w1UvNV4zVWIE9gWWLwoHQ0SedDnEGCHzya3SF
         kipyqdhV0k7D3FSjsjDK+qKzicLJo1m+Eq44QMKFH9PwMWSdcOTJHkbvd4h/BCm1uYxT
         OoK/ZepJkgCRz3TT0W4wl4rZaU3XoSSdr8uC6BbbuL+R3y+PsXi0bs6SubBxjeGdnw72
         W/RbUAlyvyut9P3F/GynotbI5s2KRxgwF0Sb6G/IVmIV+ST5CMtJz0reYonkvGj23KdZ
         AQGw==
X-Gm-Message-State: AOJu0YwxWV0W/IJQ+lVKu5UyaMtXon0PNUDzm4+5jY1kjpKssoQib1ao
	SM6iUJb8Re4Kd2bExXwj4zf5dU8QrUZp21X/pIgrYAGFhWiiNLzeh3Od
X-Gm-Gg: AfdE7cnercPYsILOC0/eInt2Nhhs+SG7R1wr3qKviJ+7K/6u70oVdVQxBy5j+SZw2Rt
	qhdvpecma8t46P5Mce0Rr4AVowQaoKVY5jECAT0P/ineg41PtmEANq3lby2TaInDIUofZTTXpPI
	Jwxc4tBT9kninXho35mV8XuVsHiIcmVyOB9slQPgmXw8/6AHTbVOTTDRa/ARMADptZYkkPTDMAo
	DMqgz6my9Eu+ZTgKbEPzCQob1OIEFjqsbYu5M/a/FJSQgGHqT98jYwIKC8jF8W1V0fBecmKVBWI
	Bvp5+zU5ZlwKPMHbU9NQ7PNsbxXrg3H4cCwmf/WQSU1y449mftqq25yeYmuklYp6WTOKa5mbCw2
	A2E3S9K1WfbwGXsuOPEEIf95e39uI0+jw337B3pBu4mGPfYliM7E4USRxdFxH26dxe/ZgM4kxoS
	dRVYA24xlyuCn2b0+aLy9CcEzsbDXZMb60Eg==
X-Received: by 2002:a05:6512:6712:b0:5ad:4ef1:7968 with SMTP id 2adb3069b0e04-5aea1f47f27mr417867e87.17.1782375684080;
        Thu, 25 Jun 2026 01:21:24 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69580f73sm2430529e87.63.2026.06.25.01.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:21:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1 RESEND] media: i2c: mt9m114: Add get_fwnode_pad operation for IFP
Date: Thu, 25 Jun 2026 11:21:11 +0300
Message-ID: <20260625082111.47898-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625082111.47898-1-clamor95@gmail.com>
References: <20260625082111.47898-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the driver's binding exposes only one endpoint, which maps to
the IFP subdevice's SOURCE pad. This configuration causes failures for
many devices using this camera because both the DT binding and the
one-to-one pad mapping logic map the endpoint to the wrong pad. Fix this
by implementing the get_fwnode_pad operation for the IFP, which correctly
matches the endpoint to the corresponding IFP pad.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/mt9m114.c | 44 ++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index e395e2d14e97..16c2582551d3 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1020,14 +1020,6 @@ static int mt9m114_stop_streaming(struct mt9m114 *sensor)
 	return ret;
 }
 
-/* -----------------------------------------------------------------------------
- * Common Subdev Operations
- */
-
-static const struct media_entity_operations mt9m114_entity_ops = {
-	.link_validate = v4l2_subdev_link_validate,
-};
-
 /* -----------------------------------------------------------------------------
  * Pixel Array Control Operations
  */
@@ -1381,6 +1373,10 @@ static const struct v4l2_subdev_internal_ops mt9m114_pa_internal_ops = {
 	.init_state = mt9m114_pa_init_state,
 };
 
+static const struct media_entity_operations mt9m114_pa_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
 static int mt9m114_pa_init(struct mt9m114 *sensor)
 {
 	struct v4l2_ctrl_handler *hdl = &sensor->pa.hdl;
@@ -1403,7 +1399,7 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
 
 	/* Initialize the media entity. */
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
-	sd->entity.ops = &mt9m114_entity_ops;
+	sd->entity.ops = &mt9m114_pa_entity_ops;
 	pads[0].flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&sd->entity, 1, pads);
 	if (ret < 0)
@@ -2092,6 +2088,29 @@ static int mt9m114_ifp_registered(struct v4l2_subdev *sd)
 	return 0;
 }
 
+/*
+ * The IFP has only one fwnode endpoint, which corresponds to the pad
+ * linked to the PA (PA SINK), while it should be the SOURCE for the
+ * next media device in the pipe.
+ */
+static int mt9m114_ifp_get_fwnode_pad(struct media_entity *entity,
+				      struct fwnode_endpoint *endpoint)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
+	struct fwnode_handle *ifp_port = dev_fwnode(&sensor->client->dev);
+	struct fwnode_handle *ifp_ep;
+	int ret;
+
+	ifp_ep = fwnode_graph_get_next_endpoint(ifp_port, NULL);
+
+	ret = endpoint->local_fwnode == ifp_ep ? 1 : -ENXIO;
+
+	fwnode_handle_put(ifp_ep);
+
+	return ret;
+}
+
 static const struct v4l2_subdev_video_ops mt9m114_ifp_video_ops = {
 	.s_stream = mt9m114_ifp_s_stream,
 };
@@ -2119,6 +2138,11 @@ static const struct v4l2_subdev_internal_ops mt9m114_ifp_internal_ops = {
 	.unregistered = mt9m114_ifp_unregistered,
 };
 
+static const struct media_entity_operations mt9m114_ifp_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = mt9m114_ifp_get_fwnode_pad,
+};
+
 static int mt9m114_ifp_init(struct mt9m114 *sensor)
 {
 	struct v4l2_subdev *sd = &sensor->ifp.sd;
@@ -2136,7 +2160,7 @@ static int mt9m114_ifp_init(struct mt9m114 *sensor)
 
 	/* Initialize the media entity. */
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
-	sd->entity.ops = &mt9m114_entity_ops;
+	sd->entity.ops = &mt9m114_ifp_entity_ops;
 	pads[0].flags = MEDIA_PAD_FL_SINK;
 	pads[1].flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&sd->entity, 2, pads);
-- 
2.51.0

