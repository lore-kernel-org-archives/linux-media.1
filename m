Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD293FF8BA;
	Fri, 17 Jul 2026 11:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286122; cv=none; b=Bf0YU2mDZBYD4QGGqsbous2MfF5dAF/LL+tXF6SWSTgs8sXZj8oLqQpTNOdU/wrcOBwkyhEgoZDXesgqUPZ2XTHam2zTzvbifMNhUXYCuywpSQ0Vila1Nl6CvO+ovDjXYpMDR90oEXNggI7NcBN4ZtiP5pDODPW2V1KdxV1n+9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286122; c=relaxed/simple;
	bh=kb4l2DEd94lduGCrSlqitRAeM8XIspCXJWknqCki/60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLnYbkJNrtc8pafbj2/zRWXep07zOwY/qMEeh7LoMSxY+KI6Q67alp6E2RupwcKNFkMmdc+khH1aAC7yZhuL/QM51EhCsRs05RMO3EzV7Rn8qaDMYjCxKyVsdqyZ2gyIwmMQxeaswx6ilvqJsLSfVhudAxrR1n5wb/hgGv7Fb4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iOmCcD5B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iOmCcD5B"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82C35192C;
	Fri, 17 Jul 2026 13:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286038;
	bh=kb4l2DEd94lduGCrSlqitRAeM8XIspCXJWknqCki/60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iOmCcD5B1DkjwPY7FHrxsuATnx4AGfvg52Qy8f1N02/0n/z/2tbUGNlsdhn/i3rZl
	 1FMnpJwiyO2KPRm0ulO+49qd7bjlPJzt0f+/GfbdJSS6ZrsyePOqjAwNG3YgNHRCJ9
	 a4XZ4ubirgGVam29iJ4A7njU2o6w6Vy5qPRJHEJw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:30:17 +0530
Subject: [PATCH v3 6/6] platform/raspberrypi: vchiq: Register vc-sm-cma as
 a platform driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vc-sm-cma-v3-6-6c4e77804e5d@ideasonboard.com>
References: <20260717-b4-vc-sm-cma-v3-0-6c4e77804e5d@ideasonboard.com>
In-Reply-To: <20260717-b4-vc-sm-cma-v3-0-6c4e77804e5d@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=8Q92fhIMTneVekfo8R0Zg6zqThHD2FXSRlScas2p9Dw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgtjZC7wE9H1LCRxydwSuICaF20SK+wjTTj1X
 4SlVqXpID6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloLYwAKCRBD3pH5JJpx
 RT4vEADDbDVElarYBSoDxyudsg2X2caK7sj6VQBXonWR5pXqcp/b17i9VmNuJ+m6tv+V4aeBuEF
 4p/rCLU1gUWQF8ewmy7wGgPXh8o90rkvuT0CdzhIcmLKdj9qRLvBCs7xx5uo4yFmIp4S7YXDf5a
 07U0GfXMffetIjUV8nkTcFNGcavK9+vd72hix3hB9A+FIxAbRffTMOiWEoSBC8owTBTaPoNNWkX
 mEXI6ZWROjMXfUD9y0xekRyukHeTonM+7LHQb/KoQv48c1D+i4G9mfO0zfdnOfktJIypHAZTMP8
 VthBu0xNJxRO3T4FZs8V9O4UPO47/kpAhlrPR3TPNm9JqGSHAMPMEEvw0xfZAV+PLr8LsuvrtJt
 X2Hda/TsbR188goApF1qQc1vJpzVbX0OAdO/crQ2x33AhQniecJy3gagi2lcsrGGLq/xrRULYwH
 xZk/beL1HQNHnDSkrEGX+QJYivJvyh/AnJGSUQNr37nFAZBA8tgMBGVkgq+r8yQ2o0zV3i9Mw4r
 XFAIE5XI0zyyLjlCMnTTM7ksXK7s+6MtgPDL2DwF+tjtc4E6qOk1OEL0envNR5Av5rrz/goTnNd
 +Hr4uNSQUaF3Lb/9jKMRh6BGj18a2+JNCD1YqBQhBiFkdpsvb5G4LZA3peNxhVA2iigwauYFp37
 nttfCDm+AJVvNRA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Register the vc-sm-cma driver as a platform driver under vchiq.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 ++
 include/linux/raspberrypi/vchiq_arm.h                    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index d5a25033a261..ec951ab19d67 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1414,6 +1414,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	vchiq_debugfs_init(&mgmt->state);
 
 	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
+	mgmt->vcsm_cma_dev = vchiq_device_register(&pdev->dev, "vcsm-cma");
 
 	return 0;
 }
@@ -1422,6 +1423,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
+	vchiq_device_unregister(mgmt->vcsm_cma_dev);
 	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index 541b4efd64d9..d59837eaaa8c 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -62,6 +62,7 @@ struct vchiq_drv_mgmt {
 	 * the interface.
 	 */
 	struct vchiq_device *audio_dev;
+	struct vchiq_device *vcsm_cma_dev;
 };
 
 struct user_service {

-- 
2.54.0

