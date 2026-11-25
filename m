Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604918;
	b=z63NZhjztYc7r/h0tQ2YS79eNDO64jHI+7esb/vTcA2q/x+T4IKZQVL9Ahc/JSynrY0i
	 p6lSKAq6nGrf9LjqtOUqs1lWuRwVWvE9kbCuLaO7VhsisvM4h1tpgwjBU0A6PrPPnxLrI
	 HAgfS6/j8/AzGkVjk5u43f3g7q4Jt5nQTmllpJO8Kc2OZ/zEn5p7zYahf6vH1L2enF8jj
	 cj3tNeDD1+kE1N6p+xO+GJf3jijDR/1qBe4ZUi8Crux8nn7iwCnpoy5yQmZXCgJ+2cFJX
	 TculZRpg08mK2V4FbX2SkzVfWPrEmxLOSM2fB+JafbGIiPVY6zcNyrk177eOOK589EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2xZqCBF3DxWtw3VHWHDKC0wBIhQ2DmFWlvnLo9dgmGE=;
	b=vJDEuBPy9y6ZU4ikU05lf9vlK9HjOhS661lsyI4KcT7cCWM6JVJCW03Mhebo5IRQnxi+
	 Jq9U/2gcv+UVXDIXlf0uFw6lwHwaSPINE/AAC77f1TCTTf7bl4Oofe3Ewx6r88aRC8VMc
	 nntco6e/3owvMRQHuCj9u/lfcnHdb2HCFy8b12A0I8Wl9hSm9ISHVAijWxgLT8aF0d9zH
	 ah4gbBVEE5KJZFJ3QxY9D9XeVf2z228MHbRp6TWqSJxTFQHD7u68SxhFb755ZJawJiLxc
	 0oq3cbxnyCfCa7TRMbWQrWjNomJeXvBv0FnfVLjJGKegogPwfadByPGKV82H5d2DoFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vSnx/las";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D47C606A6A0
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D47C606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vSnx/las
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso1079734566b.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604916; x=1796209716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xZqCBF3DxWtw3VHWHDKC0wBIhQ2DmFWlvnLo9dgmGE=;
        b=vSnx/lasnYZkHde53/RRLf6xWmDpg550itgZvXEIzC30AK7juT+HNkMu5mTi6Cl09Y
         8sWfHhRgm6efJQRJTspvyEKQpXEdMTGx4cSlIEIS/diele0j1dHeItRbnhQE+LIJdmI/
         Aw8w37LXsuINfUyQYZQEm1ITDbhBXsyzJGPiL5Z+pGI9yzB9+bECGYmx7xUH+Bo3+nBm
         Fqawlf5pW2kD+csRnbcaiCcGrK7MhVaYf0C6y6DYrcyCj9hroKTdrt6Ldg+vjzKpkCzp
         FUSPufb+DC9ilwFbRTlAdnk8MJ4MDQ1cnaCpl0qWupZKlwj5s+Lrll8D4c/nsrgeGLC/
         GOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604916; x=1796209716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xZqCBF3DxWtw3VHWHDKC0wBIhQ2DmFWlvnLo9dgmGE=;
        b=rluQRMH89Utk0kUDZftOwHJEpM0Lb3+952bMAVLpuv4lYaNQQkZx1ybWhaIVDrPH29
         Llji4vXVKhnnnjGBBQFTPZMnUOMN8gjq5Ugodga82DQ+bOM0ySy6aaI0rw/Rk2fxES51
         0sUfaDn2SfQcqJImQkLvmGqNVNCQs+qYkqG1k703sheEvv7u3AG/fsJa4HXaE727vn9P
         nKWOhFIHIdkBt7OlLLYcYxVm8aPhObeXeZKic4AZ8jpaz1CS669sED9RyuGUh1y2rK6q
         n2PTaH7owxiXkQyFgYmKv+TB7OFQaUwsR1vbeF1ko9vSTLh1GGuXe0IBC+HQZ9GdY30I
         UwyQ==
X-Forwarded-Encrypted: i=1; AL+hErHFp1dm8SZJgUR/HlR6fYiE98U5TR8TRENKcdA3Wgj4kzTsDonrIbD+/STcQjc9OzGxqj7R9nt0Jmbvkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+yXlOMovqMDVPn+qnRrEycizorxzjipOyAvPdLLh9Dhyq+LOom
	ZDQYqPF6OSPR1l2VWUU2cuWyYd9UFq4rwg8IN8dW5ybfqtJgPWoip9ms
X-Gm-Gg: AZFdTZf3dzB3QAYLPHOxzJ5BgAsNyZfs/FzRbSTSHbxbJy7bEyBwnZQ7238bcYQrMgp
	w5m6+amoJqvMx1hLVL9NRrugAStgnamLVvatf230QzQd/Z44b59LZMVlTr4DfD2Df2nzdBVM40e
	HPWLsz0kF8k+GehQchglCzfE1W0Imggj8lrp+a3zfsKRblpmN7lWqDPovv6Gap4aczp3obNsdEe
	wJp21Qudx39EYRPx3DAWxoTnkECBGyyGd9bPgmMALSo+I8LoBw1RL2/UjpcLGEZlI7OxHKogZy5
	BqNi+cwkiP8iOAHJ2ZPihXn6lbYL9w2P+Hgd8Asty1WoH0d7uED2DXB8k9zuRMWrwk5pt1FhAZ+
	50YqFFu42lrCtBf6hmaDv43ozgyNE0Lfoo2gjV8htMlYu/+wpYkxqD+f8XG0EEVGXeOEyPB1w/g
	lB+kAXq7R4BGParOaeVSslCs9HRxtw/4uwx2fpbP4nEZn6gBzwn91xrkI3BONlDPnVH2W9DiFzH
	Ws4/n8EPdIHWtHOFey6tbIAvTB3f7WBIo7xFBzwBb3lu4eWrwN1mwwCpKzlCtSNyHGRoBHCiM8s
	2gy0HYF/hFTZJSPqxoYPf9Xu/8OzyRfeFcK5hlYEKtgGFCNiI8PgOQZZiSWBS9qMXCj9dCJ3mfc
	MbbfQKbFTCQ==
X-Received: by 2002:a17:907:8745:b0:c2e:7fe7:2898 with SMTP id a640c23a62f3a-c513a82fa27mr1307990866b.12.1795604916034;
        Wed, 25 Nov 2026 03:08:36 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 11/13] media: tegra-video: csi: Scope pad and state ops to TPG mode
Date: Wed, 25 Nov 2026 13:07:48 +0200
Message-ID: <20261125110750.223628-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the CSI pad, state, and frame-interval callbacks to
tegra_csi_tpg_*(), remove per-function CONFIG_VIDEO_TEGRA_TPG checks, and
only attach pad ops, internal ops, and TPG blank-interval setup when
CONFIG_VIDEO_TEGRA_TPG is enabled.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/csi.c   | 119 ++++++++----------
 1 file changed, 54 insertions(+), 65 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index ab6162720ab78..fb6608e0f632d 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -21,6 +21,10 @@
 
 #define MHZ			1000000
 
+/*
+ * Test pattern generator configuration
+ */
+
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
@@ -52,13 +56,10 @@ static const struct v4l2_frmsize_discrete tegra_csi_tpg_sizes[] = {
 /*
  * V4L2 Subdevice Pad Operations
  */
-static int csi_enum_bus_code(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_state *sd_state,
-			     struct v4l2_subdev_mbus_code_enum *code)
+static int tegra_csi_tpg_enum_bus_code(struct v4l2_subdev *subdev,
+				       struct v4l2_subdev_state *sd_state,
+				       struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		return -ENOIOCTLCMD;
-
 	if (code->index >= ARRAY_SIZE(tegra_csi_tpg_fmts))
 		return -EINVAL;
 
@@ -67,15 +68,12 @@ static int csi_enum_bus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int csi_get_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state,
-			  struct v4l2_subdev_format *fmt)
+static int tegra_csi_tpg_get_format(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_format *fmt)
 {
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 
-	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		return -ENOIOCTLCMD;
-
 	fmt->format = csi_chan->format;
 
 	return 0;
@@ -114,15 +112,12 @@ static void csi_chan_update_blank_intervals(struct tegra_csi_channel *csi_chan,
 	}
 }
 
-static int csi_enum_framesizes(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_state *sd_state,
-			       struct v4l2_subdev_frame_size_enum *fse)
+static int tegra_csi_tpg_enum_framesizes(struct v4l2_subdev *subdev,
+					 struct v4l2_subdev_state *sd_state,
+					 struct v4l2_subdev_frame_size_enum *fse)
 {
 	unsigned int i;
 
-	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		return -ENOIOCTLCMD;
-
 	if (fse->index >= ARRAY_SIZE(tegra_csi_tpg_sizes))
 		return -EINVAL;
 
@@ -141,18 +136,15 @@ static int csi_enum_framesizes(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int csi_enum_frameintervals(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_state *sd_state,
-				   struct v4l2_subdev_frame_interval_enum *fie)
+static int tegra_csi_tpg_enum_frameintervals(struct v4l2_subdev *subdev,
+					     struct v4l2_subdev_state *sd_state,
+					     struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 	struct tegra_csi *csi = csi_chan->csi;
 	const struct tpg_framerate *frmrate = csi->soc->tpg_frmrate_table;
 	int index;
 
-	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		return -ENOIOCTLCMD;
-
 	/* one framerate per format and resolution */
 	if (fie->index > 0)
 		return -EINVAL;
@@ -168,10 +160,10 @@ static int csi_enum_frameintervals(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int csi_set_format(struct v4l2_subdev *subdev,
-			  const struct v4l2_subdev_client_info *ci,
-			  struct v4l2_subdev_state *sd_state,
-			  struct v4l2_subdev_format *fmt)
+static int tegra_csi_tpg_set_format(struct v4l2_subdev *subdev,
+				    const struct v4l2_subdev_client_info *ci,
+				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_format *fmt)
 {
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 	struct v4l2_mbus_framefmt *format = &fmt->format;
@@ -181,9 +173,6 @@ static int csi_set_format(struct v4l2_subdev *subdev,
 	struct v4l2_fract *interval;
 	int index;
 
-	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		return -ENOIOCTLCMD;
-
 	sizes = v4l2_find_nearest_size(tegra_csi_tpg_sizes,
 				       ARRAY_SIZE(tegra_csi_tpg_sizes),
 				       width, height,
@@ -225,13 +214,10 @@ static int csi_set_format(struct v4l2_subdev *subdev,
 /*
  * V4L2 Subdevice Video Operations
  */
-static int tegra_csi_get_frame_interval(struct v4l2_subdev *subdev,
-					struct v4l2_subdev_state *sd_state,
-					struct v4l2_subdev_frame_interval *vfi)
+static int tegra_csi_tpg_get_frame_interval(struct v4l2_subdev *subdev,
+					    struct v4l2_subdev_state *sd_state,
+					    struct v4l2_subdev_frame_interval *vfi)
 {
-	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		return -ENOIOCTLCMD;
-
 	if (vfi->pad >= subdev->entity.num_pads)
 		return -EINVAL;
 
@@ -240,13 +226,10 @@ static int tegra_csi_get_frame_interval(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int tegra_csi_set_frame_interval(struct v4l2_subdev *subdev,
-					struct v4l2_subdev_state *sd_state,
-					struct v4l2_subdev_frame_interval *vfi)
+static int tegra_csi_tpg_set_frame_interval(struct v4l2_subdev *subdev,
+					    struct v4l2_subdev_state *sd_state,
+					    struct v4l2_subdev_frame_interval *vfi)
 {
-	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		return -ENOIOCTLCMD;
-
 	if (vfi->pad >= subdev->entity.num_pads)
 		return -EINVAL;
 
@@ -255,8 +238,8 @@ static int tegra_csi_set_frame_interval(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int csi_init_state(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *state)
+static int tegra_csi_tpg_init_state(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state)
 {
 	struct tegra_csi_channel *csi_chan = to_csi_chan(sd);
 	const struct tpg_framerate *frmrate;
@@ -490,23 +473,27 @@ static const struct v4l2_subdev_video_ops tegra_csi_video_ops = {
 	.s_stream = tegra_csi_s_stream,
 };
 
-static const struct v4l2_subdev_pad_ops tegra_csi_pad_ops = {
-	.enum_mbus_code		= csi_enum_bus_code,
-	.enum_frame_size	= csi_enum_framesizes,
-	.enum_frame_interval	= csi_enum_frameintervals,
-	.get_fmt		= csi_get_format,
-	.set_fmt		= csi_set_format,
-	.get_frame_interval	= tegra_csi_get_frame_interval,
-	.set_frame_interval	= tegra_csi_set_frame_interval,
+static const struct v4l2_subdev_pad_ops tegra_csi_tpg_pad_ops = {
+	.enum_mbus_code = tegra_csi_tpg_enum_bus_code,
+	.enum_frame_size = tegra_csi_tpg_enum_framesizes,
+	.enum_frame_interval = tegra_csi_tpg_enum_frameintervals,
+	.get_fmt = tegra_csi_tpg_get_format,
+	.set_fmt = tegra_csi_tpg_set_format,
+	.get_frame_interval = tegra_csi_tpg_get_frame_interval,
+	.set_frame_interval = tegra_csi_tpg_set_frame_interval,
+};
+
+static const struct v4l2_subdev_ops tegra_csi_tpg_ops = {
+	.video = &tegra_csi_video_ops,
+	.pad = &tegra_csi_tpg_pad_ops,
 };
 
 static const struct v4l2_subdev_ops tegra_csi_ops = {
-	.video  = &tegra_csi_video_ops,
-	.pad    = &tegra_csi_pad_ops,
+	.video = &tegra_csi_video_ops,
 };
 
-static const struct v4l2_subdev_internal_ops tegra_csi_internal_ops = {
-	.init_state = csi_init_state,
+static const struct v4l2_subdev_internal_ops tegra_csi_tpg_internal_ops = {
+	.init_state = tegra_csi_tpg_init_state,
 };
 
 struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
@@ -677,20 +664,23 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 	chan->format.colorspace = V4L2_COLORSPACE_SRGB;
 	chan->format.width = TEGRA_DEF_WIDTH;
 	chan->format.height = TEGRA_DEF_HEIGHT;
-	csi_chan_update_blank_intervals(chan, chan->format.code,
-					chan->format.width,
-					chan->format.height);
+
 	/* initialize V4L2 subdevice and media entity */
 	subdev = &chan->subdev;
-	v4l2_subdev_init(subdev, &tegra_csi_ops);
-	subdev->dev = csi->dev;
-	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
+	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))	{
+		v4l2_subdev_init(subdev, &tegra_csi_tpg_ops);
+		csi_chan_update_blank_intervals(chan, chan->format.code,
+						chan->format.width,
+						chan->format.height);
+		subdev->internal_ops = &tegra_csi_tpg_internal_ops;
 		snprintf(subdev->name, sizeof(subdev->name), "%s-%d", "tpg",
 			 chan->csi_port_nums[0]);
-	else
+	} else {
 		snprintf(subdev->name, sizeof(subdev->name), "%s",
 			 kbasename(chan->of_node->full_name));
+	}
 
+	subdev->dev = csi->dev;
 	v4l2_set_subdevdata(subdev, chan);
 	subdev->fwnode = of_fwnode_handle(chan->of_node);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
@@ -706,7 +696,6 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 		return ret;
 	}
 
-	subdev->internal_ops = &tegra_csi_internal_ops;
 	ret = v4l2_subdev_init_finalize(subdev);
 	if (ret < 0) {
 		dev_err(csi->dev,
-- 
2.53.0

