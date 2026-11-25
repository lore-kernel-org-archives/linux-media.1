Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604906;
	b=YR7cp0dD7xuiW+R9EZkQU+YhmXByrHUDm/eq3xVQIZ52I6VQSx6dxDgLx8+CwVpBPvO9
	 Z/TBarSxZLK4p/LceOT/1u4u/4nIjZrlzlRhK0vvOhfRcb1B3hHqf+PFs9oe2M7bXyJye
	 0QI5SAEtRYdU07MR6DLPJZOSUIL/31ZqLSX5qr2ALZ8BgcUVADuLh1U7mY84GwSdzzQb9
	 MSGpqB6RKpA08sxmcw6a0+VBoMh5YG2ggYq+fclJScFTc34Bc1elc/QUVrWkmLW6SSjpg
	 E+FT8blfZ7QORFsd/VR3Z6+fcsPE1MQfZeyE0pwj/0M7P8VydH4BspOWlHo5l6PeQGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FPC7WvKQPOHddTcCwt5ZfmTpugqnrOt4y+DtQtGxVhA=;
	b=nuhYOj8E6dG1oIdx8GutNS2FW7QMhNiyycvJWHDp1ES2VcRC1tQ/wNcdM/uhVB0qqQFc
	 f0NsQrc2sQ/i/06OtZakUdEU2RDkOfmVpJ3x0yFUIIG1wYQjEJmenk9ygFeiKPPSe3KkE
	 mUEXz1FagG4n8VYQgoWLOmDct/B2KsfkiLQgu/M7JdXwhL4J6DEwgayE9hI/+M+KwqwdL
	 8ZuAsBzpmuBJDYk8Hp/aC8xSmE2W2BKSHGDAUgnXtFbZqrpAGN9MyzLJcsL7ItZtAGlnQ
	 vpc5rHpoXcBGXwq+iXX4+urogMHysqTxpYJ2pvzbHWnEueU/5ZBtMzmZhkmjd0WcGPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ev60ytHr;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC2E606A696
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC2E606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ev60ytHr
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c516a1623d0so548322266b.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604904; x=1796209704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPC7WvKQPOHddTcCwt5ZfmTpugqnrOt4y+DtQtGxVhA=;
        b=Ev60ytHrSQHBeKtyq7piY+87HV9Q/sxLiGTZ4oeWGaolpSyEaW6VlnhSpdTzUIwDQb
         ls+ObkI2VjYUuIecEQDlc/xVy6VwW8JODj3Kgxd3HgYN2P4sTiktqjPLgWuXa4tbKb74
         LumBod3hO3BHfEdEVC6IUqpTWtBa6+7rPObDTH6wg2KGrJz9vK0Rb2Cp6DjJZRWtJrXo
         kCh7JB40eZsAZj4QhwPeBbi20BJCV5991KT93D9PpNUQSpEkG+hgehgX9aHmIpDZGdqD
         r/EswOL3D1tYb3v6VnwdntKheFyeO88MHO2rVo0YZXlANKrvVCgXLYj3JJAU/OZq5iOZ
         qWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604904; x=1796209704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPC7WvKQPOHddTcCwt5ZfmTpugqnrOt4y+DtQtGxVhA=;
        b=hGMSwUXkC9+rt2ws2RBhL6N5Srlpcezigicr6CCvvKMBbaNRQJ+cXP3ehQNh52wqo6
         XHAG3EnGcLWmx0LPwg2ta2cZY1Phm/4on2OmBJ/gxXhJa81OHmaD/bGwcv8z4iK/lX5n
         JaX+W1Bjh/RjCNd6Mht92v5fZSYQ7hUyCaFRdDdChTZKItAxVFe1E9yfuQB7SONOWR5C
         I2UfOfCHy7vXXpOyNzo2mI+bG2qZhH6b4fvsBotWJdJO1o2ehjE5jo252b3XNQHSBCYx
         h2XjPD6tP41WWfhZwVuWtjYaa9hgd51XI/40iMrvvQRpxOVNEtVfr0AxbcqqRNgh1GZW
         IBMQ==
X-Forwarded-Encrypted: i=1; AL+hErGpmgPCnuH8C7ptU67gue9OW44/ZOuEQXZ5hKKIA/z1TOD62i2WlmgeOoPuQY8wjUQ5TAW+tWBEwCc8vg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+hvrEsaKEPGxIuXihA4KN5TH8O1goWh5KvlRM/hJAPHbz6Ajxo
	dNLFI7Wco3DzYILQ6Mwq+Ktof1TTM3Z1d6dFS+OjRSYjS2VWNL1XbxMx
X-Gm-Gg: AZFdTZfpKOurzXJd0wgvDknp0qLClpgQvl0thxiTAIU0txZeRHtDPulBiruyQyeQEd1
	4TMQEXYAsJQDqwlcLB4ZZ2VHXdpUZaQ70Cc6H8RGjGJJocrnnWBmOme8VpsuSXTisz6dt7KmZol
	nIvmPEuPXBVXRtfSEvbtWbHmrSBmsRCxjXmR+p+IC4yamuLHPB2y172JM32Z6CoE+UqgMIOAmHV
	eLRkvBekwbHGMySVAVtTF0I6bAMz4/AHxts2PDV84YpXVvIqIEyBOq7eBoZOcjcHq8k5mvv96IW
	/PofQ5UbpghMUtWmtscANp3VvRlYz1PdF882B/mvuJDwaUFYWfbLDaAvYYU+bn/iMqKp0jkIfmm
	IKAjz31Ycm2Ik65sVmuKHAkygkwpI22aSUiCP0wadrEc9R7cj+PaDveyiHZw/xj6ygxahlLvu7p
	VeV4rqjJOZJ83iuA092KDhKKp4BWcqZ2f7Nouk7SqT0671hoQgA2T78c2wNYvLN6DPe9mVoioMX
	wwWevNbzqCagc6JPeAFir1x8IaFqkOPCKgLBimYWMH+7rWGDR0B9a2kgHCx5TFlwzBhqKY/62AS
	dESuz+9Fe9RwZSssv1Js/X0eMziS89kw56YNepgYYad1hxhvV6Yt8oIvHIVSkn4gchqTPW+TWpR
	jpBTLm9gKag==
X-Received: by 2002:a17:906:5006:b0:c50:5e10:71ae with SMTP id a640c23a62f3a-c513a5e2124mr1216666866b.17.1795604904078;
        Wed, 25 Nov 2026 03:08:24 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:23 -0800 (PST)
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
Subject: [PATCH v1 03/13] media: tegra-video: vi: Expose all sub-devices in the pipeline
Date: Wed, 25 Nov 2026 13:07:40 +0200
Message-ID: <20261125110750.223628-4-clamor95@gmail.com>
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

Add support for exposing /dev/v4l-subdev* nodes for the CSI and VIP bridge
sub-devices to userspace by setting V4L2_SUBDEV_FL_HAS_DEVNODE flag. Call
v4l2_device_register_subdev_nodes() in the async complete notifier
callback to expose all devices in the pipeline, including auxiliary ones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/csi.c | 1 +
 drivers/media/platform/nvidia/tegra-video/vi.c  | 4 +++-
 drivers/media/platform/nvidia/tegra-video/vip.c | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index 44bd53dbbf7fd..add526de536f9 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -680,6 +680,7 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 	v4l2_set_subdevdata(subdev, chan);
 	subdev->fwnode = of_fwnode_handle(chan->of_node);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	/* initialize media entity pads */
 	ret = media_entity_pads_init(&subdev->entity, chan->numpads,
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 71921931457be..4753ca89666ae 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -1548,12 +1548,14 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	struct tegra_vi_graph_entity *entity;
 	struct v4l2_async_connection *asd;
 	struct v4l2_subdev *subdev;
+	struct tegra_video_device *vid;
 	struct tegra_vi_channel *chan;
 	struct tegra_vi *vi;
 	int ret;
 
 	chan = container_of(notifier, struct tegra_vi_channel, notifier);
 	vi = chan->vi;
+	vid = dev_get_drvdata(vi->client.host);
 
 	dev_dbg(vi->dev, "notify complete, all subdevs registered\n");
 
@@ -1610,7 +1612,7 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	subdev = tegra_channel_get_remote_source_subdev(chan);
 	v4l2_set_subdev_hostdata(subdev, chan);
 
-	return 0;
+	return v4l2_device_register_subdev_nodes(&vid->v4l2_dev);
 
 unregister_video:
 	vb2_video_unregister_device(&chan->video);
diff --git a/drivers/media/platform/nvidia/tegra-video/vip.c b/drivers/media/platform/nvidia/tegra-video/vip.c
index b73ba0eab5573..040776775aacc 100644
--- a/drivers/media/platform/nvidia/tegra-video/vip.c
+++ b/drivers/media/platform/nvidia/tegra-video/vip.c
@@ -165,6 +165,7 @@ static int tegra_vip_channel_init(struct tegra_vip *vip)
 	v4l2_set_subdevdata(subdev, &vip->chan);
 	subdev->fwnode = of_fwnode_handle(vip->chan.of_node);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	err = media_entity_pads_init(&subdev->entity, TEGRA_VIP_PADS_NUM, vip->chan.pads);
 	if (err)
-- 
2.53.0

