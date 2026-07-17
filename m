Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B63B2D1907;
	Fri, 17 Jul 2026 11:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286367; cv=none; b=NubesVi8v0WKskCvSCnCwlHzgzXGuy6nvyy2PxQpMNa1oEUDF5tR/hr2uO4XsGllR27gA9ewyXT4IYFAdliJs66YU1S2WkiOqGEY677uB97NQwXQ4X5T/2sG4RvXK/w83JvYziRD/xhiyHQeujBtDB66PR3bDZilrOVAzmdoRmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286367; c=relaxed/simple;
	bh=ibx7fG9Wzqf85tzttrVVLhdgIp/LbxYrepWsi0/AZtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LioJWpTU2gNcoJicibt3gV6ZY9ba8SjOSSK+41GVImEr77O+ZLe4RgPFwCl/0dZ0sueXrRS7PwVgM9XkYfM+chqhx5+1JAot1RN6TTr75++7ZJzjdltcvcaP2Y7tmWqoxVI6J0EukimIC9Jz4H6QTJQPaS5mQlfTy63JXzfuvAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SPpljAf1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SPpljAf1"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0933130E;
	Fri, 17 Jul 2026 13:04:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286298;
	bh=ibx7fG9Wzqf85tzttrVVLhdgIp/LbxYrepWsi0/AZtw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SPpljAf1G107qvYTBAgjWgin9ZbmwoKO/c35XR4TzjVyzDI8/PZ0O1zhlAIrul8bc
	 CA80jXFRrQxYwIuojmqm4jf8f2R0XNzargRzjFbM3Y+CjlHg/OREngH1Zx8nlNKEgq
	 NKqvV04Z47xmsk091XqdxEo8SEXBEVtF/2e4ctXU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:34:24 +0530
Subject: [PATCH v3 9/9] platform/raspberrypi: vchiq: Load bcm2835_isp
 driver from vchiq
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vchiq-isp-v3-9-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
In-Reply-To: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=4zGYHXb5ZMuExbzfl+PH+g9m0HG1I8UvfWyqwEiF4+o=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgxca2F6lkfC/0/79zBeD5hW5EF02cvBkoSWB
 3VF28+amzuJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloMXAAKCRBD3pH5JJpx
 RQ/SD/4j7T2B+fSnAsT1Oq0i4ryW7+tQbSSMbDGtMx4qfjmHRm3nt50bsyyF087CxiJpdD84p+s
 tTCG0x8+8o6yaFTuVymJbJadeGEQ+G2wtJ+UYTCl3QvfMC0xG1tWCs9RehaqMftfXsQDz9C/37t
 Xv+EEtmGaDKB7hsrYWqr3z+LvZxFIaS6+xBBHnW7MRW9WMWbKYo2WcyZp+qfYpYJVUl0FaCiDsQ
 G7iRz7WUfs53D6Yvw123J9BYW9OItukXzgkA4hDolEdAxU6hhWn5pKcx8W45vMY/45eD420b/H9
 h58t/uLNr7cKJ09qWqXLKOabeojnjGcTO5RJTgLPYZla/JJgVL3IAzoQMeTAS1b1qT6THy21iMG
 OipSZ7hR1sf0Y+H2MKGRKmW9YuBU4j+4zCFXQqQUNCAbZiUUjTBZc+gQMfDsw/c3dpdqEaxcVuh
 hg7kMd54IgeFdV3grN35s5m15tbSC8fBKlnYjdLwSNatfCXXav7uTaXrTQnoehrJzlI354ry/oy
 RVnPZ6X4l/PzDEWH5OXro5teZjUuYQ5NH3S6HqzWqBVM1VgDTRXNTyvm4cY87x7ly7LHMLpclco
 mL3NQiCdewjrwdWHevbW0LEEKaTvWDuki5EBuqCoIbMN3FHARjAn788TNGwsogoQqD/dr46GX6h
 SnhD4LRiHDccs8A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Naushir Patuck <naush@raspberrypi.com>

Broadcom BCM2835 ISP driver is managed through the VCHIQ interface, so
register it to the VCHIQ driver, similar to the audio and shared memory
drivers.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 ++
 include/linux/raspberrypi/vchiq_arm.h                    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index ec951ab19d67..f35b40bdd963 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1415,6 +1415,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 	mgmt->vcsm_cma_dev = vchiq_device_register(&pdev->dev, "vcsm-cma");
+	mgmt->isp_dev = vchiq_device_register(&pdev->dev, "bcm2835-isp");
 
 	return 0;
 }
@@ -1423,6 +1424,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
+	vchiq_device_unregister(mgmt->isp_dev);
 	vchiq_device_unregister(mgmt->vcsm_cma_dev);
 	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index d59837eaaa8c..ea1bd419e471 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -63,6 +63,7 @@ struct vchiq_drv_mgmt {
 	 */
 	struct vchiq_device *audio_dev;
 	struct vchiq_device *vcsm_cma_dev;
+	struct vchiq_device *isp_dev;
 };
 
 struct user_service {

-- 
2.54.0

