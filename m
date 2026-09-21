Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C87B27FB37
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981702; cv=none; b=E3TCS5FEdVnt4hzqjnrTPZp4mccSfon2PYOvK6BDD0ER8pzlymq7Fw6pql4vQgbkehCJXHkY33UVrJy5MZwJUVgdr//apckG696K6O9hMOQBIz90/SNdh7no2Or3nG8n81N9pKLbKLiIps/1sa+U6/7StR2XjLWaCrOm2Ee9PWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981702; c=relaxed/simple;
	bh=N0b8EmSEWVJczB6H2qZwDcYiZkDK6GT7hkNKj4yRWHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AeAYh2YWnoXvSUEtDtHdpmRIiuWU5h3NWaGDk9gXfjHQervupeb2k1z+exuMBbafCt9sUu+0siIoZSp7qBpQ1gPnLIvHCsWzjiMy08SeLjHptnLnqKJPNbpWwrbqHebRXBS4Ya/PSVI+YKsKVPD2YbXTuBcYTlJCY4zlkdFpJvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVjPJbQH; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVjPJbQH"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so1587164a12.0
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 02:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789981701; x=1790586501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZfNRDAZYMOe8/raf1+kfme6bgo4XiPP5kMyL6mrkfE=;
        b=CVjPJbQHI+RkMEXTuT5a+DoQVzH+g5w+QFeJmSjx/uyon15H6xcOm4xetV5ybkX97N
         7mOt4IcCP8PthhpahSMIf5mtPacJtdPLqe5rHkQPMVmlUn+oST85xI83poRv5ARtTi0o
         OeJ+X/Ij+1tUnW71s6a7EHjbhcIchBbwJJhA1btukNGs9PKt8KF/xQD2RnRLfOXodERK
         y69g/8KPbeIJ3Ul8AA7gRptOnjy6XtsjzwKua6Ji4U1gGuFXWj6cmRWBwUeAz3RJwK0V
         cg5Y3NPRow0MwUTX/7D+1Sio6M78anLw2ukQTNYZeHK30kA6dj87THPx/1WI/O3GU8Dl
         Gi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981701; x=1790586501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZfNRDAZYMOe8/raf1+kfme6bgo4XiPP5kMyL6mrkfE=;
        b=zcLQMSl2Qk/eXVt+gRtzw4AuT5Y4SFIO4aqJWKbdvOs0Vt8R8xeUm5TqyEkDuiZZXj
         2HQ2EhtIvOLA2Jkk/H7nyOlq16c3CjaduS6fEyM49Tm6P4G8xj1ZVzRz3qpTJTUyCLrv
         o7TcCcu69AN+K3ncNt07q8JfdE5uMCE6p7k29+NfP1PlEFvATElKbn9hqaZ9yyOj4TW3
         nLI172kd8n2OYJ5PbWnZPJcguqe5Wakfcz2SlKBUPoXTdZ/4QkLOm84Ao+HPfIez3xYU
         /B86W3P24SZeApqjN/c+u3MTonOqhK9LRwXiHH3ETK0HsW3e59qnqpOh6UEZseX2NZ/Z
         d7WQ==
X-Forwarded-Encrypted: i=1; AKwUvByeQEkihsOnE8dIThB0h+y6opG/lHryJufXIrR1AAfNMROFd/VdRnVpOcxpOmc8QVrXEFJ7Y7t038cYxA==@vger.kernel.org
X-Gm-Message-State: AFuF++lq86NG7FDo5jOLDf6PGIVk11mdju4fC8MAXRBvLUs+BDIEj82i
	eAIkaNI1vNLY2i+hJd9qgmTx8ZRM6b4kBN0y8wKEhB/89JnYRyM5Own8
X-Gm-Gg: AYBFou3nPydOsZqxLjrixH+mAyPJ6TzQI3iP3G0CtWO8nEPVK7SGpyQASsQB5GxUnMR
	ov/ZwudyOZugImm+hmLaCbLhaJCtW4s7CZlJVmOTPOL3lkYTKsHm+DXOMiuRqjEvEf7YXOKIp/7
	Jh7HYgCrzkryzN1o3vWyvXSkvwLPsf4wKxa56HKMhuH8FEVehXSfc7a4jiIrpNSWzaaxMi95Ted
	98fGG8KQN6h4CJoeZIAYyWDmlvJVPqmlDAyqvNjaKThV4vWZc8JTOyBn24WU7oe+C/TXObT5+Go
	fmhTNpns+V+DInQywuxJqqMNKUqp7xf361KJh5wz3ubqmjjBYPIKMnHjHI2y6y6D3Vl7Ss1C8La
	a+RmgnKLX+cAzUOe7R+2416aHCIdNsJSAfN6k1rAVZEAMCjW+lIzsh9/KNOa74PgVRX0mPCEcr+
	x4V+9swwBuc81Nk1m9u4FmHizqiqsVV5LC6F6AkuJZ3KDvaVfmg1wYYg==
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:4b6c with SMTP id 98e67ed59e1d1-39e6c6a54f7mr7862823a91.54.1789981700866;
        Mon, 21 Sep 2026 02:08:20 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6f1835adsm13203772a91.6.2026.09.21.02.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:08:20 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: fix decoder child device leaks
Date: Mon, 21 Sep 2026 17:08:08 +0800
Message-ID: <20260921090808.336112-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_vcodec_probe() populates decoder hardware child platform devices on
platforms that support decoder subdevices. These children must be
removed with of_platform_depopulate() when they are no longer needed.

If initialization fails after the children have been populated, the
probe error path releases the parent decoder resources without
depopulating the child devices. This leaves the child platform devices
registered.

The remove path has the same issue and leaves the child devices
registered when the parent decoder driver is unbound.

Depopulate the child devices in the probe error path and in the remove
path before tearing down the remaining parent resources.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: c05bada35f01 ("media: mtk-vcodec: Add to support multi hardware decode")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index e936ed8dffba..592685ad522c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -517,6 +517,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 err_dec_mem_init:
 	video_unregister_device(vfd_dec);
 err_reg_cont:
+	if (dev->vdec_pdata->is_subdev_supported)
+		of_platform_depopulate(&pdev->dev);
 	if (dev->vdec_pdata->uses_stateless_api)
 		media_device_cleanup(&dev->mdev_dec);
 	destroy_workqueue(dev->decode_workqueue);
@@ -569,6 +571,9 @@ static void mtk_vcodec_dec_remove(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dec_dev *dev = platform_get_drvdata(pdev);
 
+	if (dev->vdec_pdata->is_subdev_supported)
+		of_platform_depopulate(&pdev->dev);
+
 	destroy_workqueue(dev->decode_workqueue);
 
 	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
-- 
2.43.0

