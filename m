Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604916;
	b=nGamz+r5G/d+X8rpm6JqOv0zEQzaFZ46a3vHPC/8HdKDgiUunVMUHS9GuzQ2kZNUroL1
	 kSEarTblxhisVENN91z7vr9NpYDlebbU8AuJvjQ94L3iOKJR0mH5FBTlTMSlzk7fdOwf4
	 JD2MU+EvN4Q3x7HC74RYXS0IURMnfTdENnk7ULVBST4V2ynIxHT52X+m0hhELTjPNMACb
	 wxDG6IGbff0+Pj2b7wrlaaw/KtyIq0emrkyuWicPTP8SuqOuhlXhi+lfb8ZBK/oo8lGbj
	 CHAF6UTKB4CmpOJS6+skK4zW46cjp8BZDWptrb9zEkcazdpNUiOGbiIXYLgtLxqyQgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EYa64r4v9WS67AE28HTR6GMnmq7I9DrwDxtBYjX90f0=;
	b=SVlVJ2zepKPxqAEek6ROrRltVdwblpTJFnHs8FGcDGPEtQYbXk8eD/dIdXHCj/qte1bf
	 8urtaE1QyWiqhb81+1QCBUCouGi5aBtzsq93+0v4yYNapUUfTyhNjbtQXbF3Lh5cO/Ou4
	 wqOXBkaXOllWzz6LeUariFmDbhZK+HfPacp38yOuhx1Neg7729YM8TwxniEloZDvXuywQ
	 /gHpXQ5qha9sZ2ELI8X5elwlEyyEp96u98vo4AI+2ntWHUN5Ye3FqIHuqISgDIj+Yt5Q5
	 jqQL4km9TUCE1IqWscYc+y1UnqXFGqr4Rr9CWpLOyrKm3Qghj2dBzuju91ltkpm/d/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZIXDiQ99;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446DA60A262A
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 446DA60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZIXDiQ99
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so727187866b.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604914; x=1796209714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYa64r4v9WS67AE28HTR6GMnmq7I9DrwDxtBYjX90f0=;
        b=ZIXDiQ99DD1RxABvfH8QdIcxJHtmq9ed8h9lri0iCz0zM9A8R4tY9P/61SC9dcKETF
         J/4UBL1XPZsXyLiCJSFieq7Nr7HV8bk8batnh0kGwX9++ivn5Ir17Bf3CGLDi0RC0fNh
         IQ5SmjIS2ha+x/g62rkocZ0rBXTVOIZXtDOJLQSE5jMRj/c7eg/eeM/DRIz0gpLI/kME
         DQbnJ0D/7OoGkDjcUAScyNrpTXoUAEb8GNrvK79bgxzDKcDPDQ+Ey/AC14VkSdPEGk7r
         H4Z1EOc666UahlPYUoII4EDg/rAHuCGNAwoo5227qfiQFlqPIqTlJRsPUMzySSKJDrzg
         hP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604914; x=1796209714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYa64r4v9WS67AE28HTR6GMnmq7I9DrwDxtBYjX90f0=;
        b=2MgdTrHotvKr2sb1Yux99r4DAhMFW6LmFDX6LM2AAau1bX69X6immduQIjQuGox+QO
         CEIend0ypRjTU3eP+ZSgWSL3gQlBrESfkqJ+U46z3AT8v5F5MixDW3t22tbY0OMC/YId
         E5eMfK8olMt2wX12fAcClAKLBFS5FID02qcSYDOYzHKTgPBMRdgWG499GmELTmDkh9u8
         A42xLoRLkK9DRHJuXA3aY8i9m8wipteVAOLufm5BMcU1uCHWjTidzTSGFgl/scXa8ltc
         lifmlgdlxEkFfPYnTxvXyBEoLM6c3AOaFZBvkF1fkAVXuXq4P6G4qlA7hFpBOM2fX6fM
         6tmQ==
X-Forwarded-Encrypted: i=1; AL+hErGqskOoE+R9OK4DTTmkDYFz+YAL7+S0cr3bl8GliohL7ZFvPUBbDGGqMC5Jj6esBuZF3w+Pt/0JHtw6lQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z96zX3rHKyhfa+xbHdIZoSekbwphCitw59IKfXpIAKPywWKS7T7
	OrX7BqyjpELCstKVZkAxU2aB2EsR0coprAGbyXZGHS7UCTf3eFTGsDpA
X-Gm-Gg: AZFdTZcHY/ftQs4oLJBDgki8RXKT5YIdI8NSw8OvpV0fr6+IjDAu31dFicdVY565a62
	OoeToEvZ+R3jdLSFTfFOoErzmIWv7KOawQ3eBukXTAQRlSOrApae1VtTrQXXnVTTxbS1bPvoqNj
	tKEVZI/DpwPb5cNwhXzdTQIsiIimI6Nx+QNMyIryosa3vGKubGljt0zgdvV5g3DDb3R/R+y5G1J
	Fwn6WYR363fZo7KH/Fn37OFuo3NdVUT1B+T5FxlcANbearAUfMA4iEEwBTHRfp4VAUtrTS2owNu
	GFwbQ1HEknFmAUqivWhTmuyQSz6BJ+jL46SjhiJpPYrMKpxMA12drLwsooQXcoKuR10RFW5ckj4
	zEUPAdsl/mkcuj3DflZcZ7+VafWe3XwpaG/5dLZsEBsupv/RjNJdWmfrIOriW8xTSmP2B9bC3e4
	sCxmrD8tFtTZzPxzHSIUcc2cDim/R7/zFJgGLUZrGI0AJZaOpUBsAyzIK8+Z2pRdhyhq0NOTvT8
	Mz+2tpgBicVns/i9+1dtThUE991gNUwSfiWEBuC+6CEjb4SblvQ6qHkZr0h3WsAIQWLGbZr5Rtg
	Rr/FW6WqGGpFzoxjGC+G/5h62+6UCaUvnNIHsxYdRLXVtipxDaBqjXdUKIBqDVRunnVjLNORwCd
	9YcOGkArq7l7046ihxWpZ4fxcOEHo4U5B
X-Received: by 2002:a17:907:9111:b0:c4d:31c5:cda with SMTP id a640c23a62f3a-c513a8140bdmr1037767666b.21.1795604914542;
        Wed, 25 Nov 2026 03:08:34 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:33 -0800 (PST)
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
Subject: [PATCH v1 10/13] media: tegra-video: Remove remote source subdev helper
Date: Wed, 25 Nov 2026 13:07:47 +0200
Message-ID: <20261125110750.223628-11-clamor95@gmail.com>
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

Look up the remote source subdevice directly via
media_entity_remote_source_pad_unique() in csi_get_pixel_rate(),
tegra_csi_enable_stream(), and tegra_csi_disable_stream(), allowing
tegra_channel_get_remote_source_subdev() and its subdev hostdata setup in
VI to be removed.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/csi.c   | 28 ++++++++++++-----
 .../media/platform/nvidia/tegra-video/vi.c    | 30 -------------------
 .../media/platform/nvidia/tegra-video/vi.h    |  2 --
 3 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index add526de536f9..ab6162720ab78 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -282,12 +282,17 @@ static int csi_init_state(struct v4l2_subdev *sd,
 
 static unsigned int csi_get_pixel_rate(struct tegra_csi_channel *csi_chan)
 {
-	struct tegra_vi_channel *chan;
+	struct v4l2_subdev *subdev = &csi_chan->subdev;
 	struct v4l2_subdev *src_subdev;
 	struct v4l2_ctrl *ctrl;
+	struct media_pad *pad;
+
+	pad = media_entity_remote_source_pad_unique(&subdev->entity);
+	if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+		dev_err_probe(csi_chan->csi->dev, -ENODEV,
+			      "failed to get source entity\n");
 
-	chan = v4l2_get_subdev_hostdata(&csi_chan->subdev);
-	src_subdev = tegra_channel_get_remote_source_subdev(chan);
+	src_subdev = media_entity_to_v4l2_subdev(pad->entity);
 	ctrl = v4l2_ctrl_find(src_subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
 	if (ctrl)
 		return v4l2_ctrl_g_ctrl_int64(ctrl);
@@ -383,6 +388,8 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 
 	if (csi_chan->mipi) {
 		struct v4l2_subdev *src_subdev;
+		struct media_pad *pad;
+
 		/*
 		 * TRM has incorrectly documented to wait for done status from
 		 * calibration logic after CSI interface power on.
@@ -392,9 +399,12 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 		 * CSI subdev stream-on triggers start of MIPI pads calibration.
 		 * Wait for calibration to finish here after sensor subdev stream-on.
 		 */
-		src_subdev = tegra_channel_get_remote_source_subdev(chan);
-		ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
+		pad = media_entity_remote_source_pad_unique(&subdev->entity);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			goto disable_csi_stream;
 
+		src_subdev = media_entity_to_v4l2_subdev(pad->entity);
+		ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			goto disable_csi_stream;
 
@@ -425,7 +435,6 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 
 static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
 {
-	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 	struct tegra_csi *csi = csi_chan->csi;
 	int err;
@@ -436,8 +445,13 @@ static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
 	 */
 	if (csi_chan->mipi) {
 		struct v4l2_subdev *src_subdev;
+		struct media_pad *pad;
+
+		pad = media_entity_remote_source_pad_unique(&subdev->entity);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			dev_err_probe(csi->dev, err, "failed to get source entity\n");
 
-		src_subdev = tegra_channel_get_remote_source_subdev(chan);
+		src_subdev = media_entity_to_v4l2_subdev(pad->entity);
 		err = v4l2_subdev_call(src_subdev, video, s_stream, false);
 		if (err < 0 && err != -ENOIOCTLCMD)
 			dev_err_probe(csi->dev, err, "source subdev stream off failed\n");
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index f2de3aeb05bbc..98411c3f4a037 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -150,33 +150,6 @@ tegra_channel_get_remote_bridge_subdev(struct tegra_vi_channel *chan)
 	return media_entity_to_v4l2_subdev(pad->entity);
 }
 
-/*
- * Walk up the chain until the initial source (e.g. image sensor)
- */
-struct v4l2_subdev *
-tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
-{
-	struct media_pad *pad;
-	struct v4l2_subdev *subdev;
-	struct media_entity *entity;
-
-	subdev = tegra_channel_get_remote_bridge_subdev(chan);
-	if (!subdev)
-		return NULL;
-
-	pad = &subdev->entity.pads[0];
-	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
-		pad = media_pad_remote_pad_first(pad);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			break;
-		entity = pad->entity;
-		pad = &entity->pads[0];
-		subdev = media_entity_to_v4l2_subdev(entity);
-	}
-
-	return subdev;
-}
-
 static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
 {
 	struct v4l2_subdev *subdev;
@@ -1134,9 +1107,6 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 	v4l2_set_subdev_hostdata(subdev, chan);
 
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	v4l2_set_subdev_hostdata(subdev, chan);
-
 	return v4l2_device_register_subdev_nodes(&vid->v4l2_dev);
 
 unregister_video:
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index fb377d428d510..44893c5c6e651 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -300,8 +300,6 @@ extern const struct tegra_vi_soc tegra210_vi_soc;
 
 struct v4l2_subdev *
 tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan);
-struct v4l2_subdev *
-tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan);
 int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on);
 void tegra_channel_release_buffers(struct tegra_vi_channel *chan,
 				   enum vb2_buffer_state state);
-- 
2.53.0

