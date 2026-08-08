Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77D731E84B
	for <linux-media@vger.kernel.org>; Sat,  8 Aug 2026 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786187187; cv=none; b=sxEeFGPX8OzaLIkNrjrn/qFGsOfJ6btvI3/ANmVlzal7oOkPCj4pAXxsCkYKmo2ZBq64EGDRpCXL0FfyoyirHBdKT5WfkvZKDe2x64G/cEkDA3K84bpO0bAdv2gvoOS8cyxMO8zJsWvFrRfxWGiPWATH9GDwCYnf1mMZreYVaOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786187187; c=relaxed/simple;
	bh=tDsFj4Lh9ROCK1QL6OxCscLJBiWTpO7vMwF1199NUaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SHTM2zxDqy5/zdbRrP9eOQeZypntvmuAMeMu+RyGzfQmvlHjdxT4Z7F86c8nJ1BnDVchYgnCEyozij86FDbd0Ha7dMSNkxN+qvqjhkIi5fnlryFadfw7ey8iC0dvHWIvPIq4gHCxPi7w8Q2bFp+lNhp1aXRu589HNpUpW3cjdlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqtvqisa; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqtvqisa"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3900e39d935so350140a91.0
        for <linux-media@vger.kernel.org>; Sat, 08 Aug 2026 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786187185; x=1786791985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=;
        b=aqtvqisaSfmRgbgmXiZItxO6cdp6CJCvU2xi8KQyHTOEgXvX+p5mbLocVg2WkigFff
         Rj6zJwIMmnP3rezFT2a7ZCgLa+1j9cP8G0qbQOjJG31q7EBhNrM+tcHCwKPC4pWKs9KU
         h216ZnIHQtQCtBKvVfCDXhZ9QTsW06f9104xFGdlSeZbW+O7XRVXmqx0xCv66DKuMv9c
         fyvO9KeecpQtqLA6URSRQwOsq5toOIDyPyh199sWFtxR9WPpuFodkHYT2DSqqpgG37eA
         EcEBoFX+ttTj0p5SSacPQxQXLzM3hcp9wfW9KvCLe1ju04OUfZ88/OrhsnDW9vDSoinY
         Tgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786187185; x=1786791985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=;
        b=McRGTqjRsICTAEU7iDmu8EtcsvZAR1KOO4nO5mgYQmwtyOkPFgU9LvdZ7r2EtQ7w98
         g6ZHSlULE3jaQf0sLn85yH1NVCyuW2nf5sFZCJarJRH/rxdJjV2yEwWttfA/gjb7PB/a
         yHtwArOPzU2xYNW0chFT4KN5TvpNYKx5fHL7OPp+W/zpC9ow2DZdAIM6h+THKJIveeNR
         YaSc8lgqP1T/k6EHx1UgoMa6C6GAza37CMYPpl15gvfGvbBDUqp7tzv24he10UijPcY2
         wMLlH04UTOdKGGtWhpxxiP5gCPaZ8NPNjTFn7QFDFl9pg/o7/70Zk+gHfgcDI+iGkFqN
         Y1kA==
X-Forwarded-Encrypted: i=1; AHgh+RrBQTTGSgprcCu2AJnBe5rU0YssW21SDCDyOUWbEi4u06zIKuWHy4C9Be+iRURGhU2a48jeYe2FXNczWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuHKa80OLkiPPugP+jvHs9YMtP8Ug4AkwctgWUe9NG0ubHoT+3
	zfVOUYZ571Gg5HAFGDxxdB4Sw+uS37zcgzUuRwof42bZFG3gUQLtDLWw
X-Gm-Gg: AR+sD13dgsjTmQFdITf0yrHeLeTCv+tKQA5+pcod3b/3Dbiv8k9TaxYdSPI/tnhkZ3w
	w/SpH4jFOmQ41p2KyXfIBwEeeYu8d2936MhEBtza/pWQhEz0Iu2WcFmUt7f6SAnZ2ybf+tTa1k2
	IbbitTh4eGF2EpEqXP2i/YhLMezNVu0sGj2ZjFO5M33HTZwtM+vCJrF25OVDWS2k0C7VAirDrJT
	cT/BJ88kS2cckPIdU8VaZPi2Yj9R/rdPVSH1yZk6FSU09YBQIP/g+l2TGxn1y04Vy1t8DMpj9EJ
	zousjYxgoE51m/2/4v1X8imFNR4Tle/EBk85p4jLAObGBJOjoFd5tzM5Rhl3SZDW/3ST8uLraHi
	8mITMHlmAThuMp92vRGWyxhXI0it9fSwCalAZdmrPy/JkiiT+OfDx5DSgTULWq8DBpUHa2k1EsC
	gNnwx/Y2Udv0GdVV2nKRurA8csL+wdG0YghA44uSjHNZ2zUzjMiQnnQa3j/GToFXeblCUUjUvNo
	aRiRA==
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr33954628a91.5.1786187185202;
        Sat, 08 Aug 2026 04:06:25 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm15243343c88.6.2026.08.08.04.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:06:24 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1 1/3] media: sun4i-csi: fix video device and subdev leak in notify_complete()
Date: Sat,  8 Aug 2026 18:06:15 +0700
Message-Id: <7804a3c87beefde14e0358fa2a11e63005525890.1786184456.git.congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1786184456.git.congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
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

