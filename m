Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CA236B043
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 06:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343137; cv=none; b=jUxFjTNe1hytB3nIvno0zHoLzHU7x8tRpIQTg/JIdmpL4ZBhPSEsOPuToF+DJEQ2bE3b0rMOv58/EBDcUaVWdAdOANKRBwQtnW5bN517Gywc47w2RcSpDSDn5DQKC/73zlrIITwJII0IrXpeM3+QMC3SRKm7WFotIuFEBoIbu6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343137; c=relaxed/simple;
	bh=tDsFj4Lh9ROCK1QL6OxCscLJBiWTpO7vMwF1199NUaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VxNtDO+3O+Y37t2u9KCyN8SG1aZbWQ0g0Zgf4Mtv7909EJTBckG9xyvSMEF9slb5/4kqmV4FOqc7a4qWmwzXg2bgI3vHGfe/C5YI11ZayV5FREzIEui0nuy/QFyN2UJnBhxAheD95LVcqWT7rYdo35mbqvafflIPKkE5W6RqpDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMTLKM+m; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMTLKM+m"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf52d15d88so11711635ad.2
        for <linux-media@vger.kernel.org>; Sun, 09 Aug 2026 23:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343134; x=1786947934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=;
        b=lMTLKM+me3iwLP1jIBaUymIFH09Qfg4iNFYqrrpSKZissCxk3xgRG5jNKhbiWP+kQy
         3quezdCUGOWgl8Lie1rknhOspmQlH1rpMsHOpwciGHV5RZzE1SiE9z6NkFXTYO8SuOGm
         cA+GX1l2H4j87TQkMbzOoeAaOQ+jKjJSg/7wWk2rg0aoW/6yqz/bN/Ol2nHIWwZYnETx
         Uwg247XT4ECpKX4ZxQlWY9outB6y6ajaZ4IJ92Oiptu8yOttZIwVZnHLRK0LIm9B1UW+
         0vIMRdzhuspaCNFQ/94khJSltGA3P32FgeVKiGuhtb2lVydprqIeN9H8XPgUh4h5P8nZ
         GUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343134; x=1786947934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=;
        b=Xm3OtB2O7fujpkKsTs2ssecdIHduNALyI9PwWwDc92W7kqPn8ts3GlnLZJY6WBxHfa
         01pUpbKR91lP6mUwJqQ1lRWorBKNAxrm91hPb6NMUgDsmXH0jWrmW1prmC1zq3wz+QtZ
         mQh/G72o1fE8fYB+ZJ+QF279re2Cj7+gBRgl8+NJ/a0OiWIDPtO9xe+41UjytMhgWJJ5
         rFNvrotkcvW9aqq/hPlWt7Yu2ketqPaxyhpgIfuJbMp5IYzmsVvl7CKVwVO5LfVAY1bc
         EroXrga8bdVf3LLCPEwQWUj0PyhoJ9K2+eAAhQcbjvBd5rR5RsBMfhfaoEIEV/ID5yaB
         rSTw==
X-Forwarded-Encrypted: i=1; AHgh+Rqepmd8fYVnk76PazbNYm4GYaxHVNCZ4A1Qoha7cV2Zqo5a31gobJZ6xCYDAMaArCgVgKrHyWmlWTZ/9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDAPgD+5+1Y85OieIDbOUqDbER+ErnoJGXGrkftYVH4HhcO4qN
	NN6Fe/OLzHFLHj2fka+qmD7bYHoFh4pTnixhOU9KaebBZs4sAPPCie7q
X-Gm-Gg: AR+sD10a+klsHJ86CCJWBXRtmnWW0lTqrDlRJfGqI5RMvgJRVgohn2V/j/pdU/gP0JL
	pbYUV1C2YPre0SW4yjc5RpAB66DuLAN4BsDu6AnbHVQ/QrG8bWnd31+jhXkOO67gty3kcBnIK3k
	H5UqcCxKevQP81gjhcByG/BrgyTtlAK26veKwMBPx0gNemSg/fXL2IJoK/LMU9ObdTD0is8HqYq
	odP6eNWCjj66EMTtw9VdMO/3JBikBXgBU2Y4mB3kCF01L1/6S0uNZL0hi4212Fa6PeKKqITfcW4
	o2CIgVWp/JoV87is7cIwf+Av47KkANoC/Nb7Kq8lKpvuSXc29/rbjwzwfZtwmcKmB3fMjNa+2Dz
	XB4cE6I634fRlcrRVp4a9AmJlRXEgwSVLvF4ehgNtaSu74c4CTO1hkqScFPI+08vHDHwolsOd1I
	DZ9trZMwddcpsYDu9xs46er7xEuNCkDyYu0QPH5RbkCikm+h3O14f4iq7WrDOgncONuLNIncfvi
	YwlxQ==
X-Received: by 2002:a05:6300:6d82:10b0:3cb:d156:d362 with SMTP id adf61e73a8af0-3cbd156d365mr11748055637.3.1786343134085;
        Sun, 09 Aug 2026 23:25:34 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm40642912eec.16.2026.08.09.23.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:25:33 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] media: sun4i-csi: fix video device and subdev leak in notify_complete()
Date: Mon, 10 Aug 2026 13:25:19 +0700
Message-Id: <20260810062521.1709379-2-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810062521.1709379-1-congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <20260810062521.1709379-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun4i_csi_notify_complete() registers the bridge subdev with
v4l2_device_register_subdev() and the video device with
sun4i_csi_v4l2_register() (which calls video_register_device()) before it
creates the media pad links and registers the subdev nodes. If any of the
later steps fail, the error path only unregistered the media device:

	err_clean_media:
		media_device_unregister(&csi->mdev);
		return ret;

The already registered video device and bridge subdev were left behind.
Because this failure propagates back through v4l2_async_nf_register() and
aborts probe, the driver's devm-managed struct sun4i_csi (which embeds the
video_device) is freed while /dev/videoX is still registered, so a
subsequent open() from userspace dereferences freed memory.

Unwind the registrations in reverse order on error, mirroring the teardown
in sun4i_csi_remove(): unregister the video device with
vb2_video_unregister_device() and the bridge subdev with
v4l2_device_unregister_subdev(). Also unwind the intermediate v4l2/media
registration steps so every early return leaves no half-registered state.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770b7..a8711336a754 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -85,11 +85,11 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 
 	ret = sun4i_csi_v4l2_register(csi);
 	if (ret < 0)
-		return ret;
+		goto err_unregister_subdev;
 
 	ret = media_device_register(&csi->mdev);
 	if (ret)
-		return ret;
+		goto err_unregister_video;
 
 	/* Create link from subdev to main device */
 	ret = media_create_pad_link(&subdev->entity, CSI_SUBDEV_SOURCE,
@@ -114,6 +114,10 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 
 err_clean_media:
 	media_device_unregister(&csi->mdev);
+err_unregister_video:
+	vb2_video_unregister_device(&csi->vdev);
+err_unregister_subdev:
+	v4l2_device_unregister_subdev(subdev);
 
 	return ret;
 }
-- 
2.25.1

