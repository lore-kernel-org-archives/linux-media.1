Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEDB41684A
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342358; cv=none; b=awBzD9EmqYQepaEonPL4yjbs0EW/Yrsbn3ID7rw/BNoLT73qYICrqqziLPye0pyzs65pUhNYt+nYEr8hWKi6Yoaap1hUFu2FgI45dWMZdKQEq0dleOQqBqnNVV69F4/f2no84ho7RARotRK5k/mWtTfTNjUc3P2zgNzvkGMPuzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342358; c=relaxed/simple;
	bh=8oV6y8ZtcTf8WuUM21XZuL0i7ONNvJMzfIYSy8jcdqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cQt3D4OW0dcvp33dU01pxMkZp7yc9TMz0Iw7rZv4JcR+z5MIQ3DknP/4e9b5ko9Y66oE65nSqP/jNrBXJFS+WqH50zcwQYBWjrakothJxB4k1hRALYPwEyNTRgU0x0dkSGIS91ZU8Vgdv/O3YQZON27k/VOv6LmQ7T1Lz9/u5dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CeeNuEvC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CeeNuEvC"
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BDA419C;
	Wed,  2 Sep 2026 11:44:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788342262;
	bh=8oV6y8ZtcTf8WuUM21XZuL0i7ONNvJMzfIYSy8jcdqw=;
	h=From:Date:Subject:To:Cc:From;
	b=CeeNuEvCFKyCjbzp28GgY0bu69qLXHVRLlkvH4IBkf8HvSkI0oNf5gTb/igieFp3r
	 7kCiTE5EqkG6MAw3nZ54JCd0k0ck4huwmLA2Cuwcw1Cg0Hmy22TdnVeOCAhs9ww0Bp
	 eeGblVWgQWiFlEovd7Er+ZEZJtK+ln21BkvmWVRk=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 02 Sep 2026 10:45:43 +0100
Subject: [PATCH] media: platform: Delay registering rkisp1 media device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-enumeration-v1-1-0cb266dd6d41@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAEbwl2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMj3dS80tzUosQSoDrdxFQToyRjs9S0FAMTJaCOgqLUtMwKsGnRsbW
 1AP4nxkJdAAAA
X-Change-ID: 20260722-enumeration-ae42b36efd04
To: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: laurent.pinchart@ideasonboard.com, linux-rockchip@lists.infradead.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3087;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=8oV6y8ZtcTf8WuUM21XZuL0i7ONNvJMzfIYSy8jcdqw=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBql/BQzYvYoO1KUoFkc55MQKr+MOfUdmyqrEeoq
 ojGJyhXxmCJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCapfwUAAKCRDISVd6bEV1
 MpdwD/4nNreE/757sxuquaDlvay2VD5LFYUdzeIC7pAMXYcXmqg3hB/2CAuqrqrAWkvIpx6lRqS
 SmB6ytS+gbU7TqAptnil3nZ1bNQMurvPzxKrFROcFD947NHwrdI1Isq1w+uxmLxI7rb2+7i+xuf
 GJQijOtHiWRmVD4g9k9Ys5J1H3kPopN+Heetf8pu9vDkV4eLLaFsBFOLn/ufTMvatxvkecfEpBo
 1fkatfeQJ80I2twCWKQ2QMfmgD8WRouZ6PeeBjL6M8x6fxKWqtI2K5MDBAtl31FrhpffLpXXY/s
 O7hR1T1ZqvLqCLlA+pLGxnVg+LK39im+BYqLImHmtmU9FLkZ6aSClbz/9mrmxhH0ymUJsv+5VDJ
 VIcuY0rv7vj20s2T0LiRYovQTo+fGLd8SoBsI7dXaBB3RbQSNbMHBSh1xitA6Vk6Jy4XClTOFwM
 ACfwp2wjIbQMYW3HbZEK2u1O6ffArfv61aJoAy/RiiwoLyqlxY1I4UwBgZHoCrED3IAne19PLgy
 OzoBlXN1iB9NAOsy2ekzHGavlZ2tnKLOzmb/0w4fjhCrZaU20KsOfr7mOPvicKo9PQF459kpdUs
 OQRTb89mAccM8DnarM18upl6W2xBvTx/8IX9g5UxTmEfRA8zOKD2VxBvErdcxzTpHQSpPHlntqE
 oGNg/GoiPWR7C0g==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The rkisp1 driver registers its media device before creating entities
or registering the v4l2-async notifier to which the CSI-2 driver (and
by extension the sensor driver) will bind. This means that the media
device node will be visible to userspace before the media graph is
fully prepared.

Delay the registration until the ISP's notifier's .complete()
callback. As this is the parent callback, that will mean that all
v4l2-async subdevices must have bound and the graph must therefore be
fully ready at this point.

Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 35 +++++++++++++++-------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 1791c02a40ae18205f5eb2fd6edca6cda6b459bf..8d423441824ca836dacb0aa1e00cdfc774e61e2e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -165,8 +165,31 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct rkisp1_device *rkisp1 =
 		container_of(notifier, struct rkisp1_device, notifier);
+	struct v4l2_subdev *sd;
+	int ret;
+
+	ret = v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
+	if (ret)
+		return ret;
+
+	ret = media_device_register(&rkisp1->media_dev);
+	if (ret) {
+		dev_err(rkisp1->dev, "Failed to register media device: %d\n", ret);
+		goto err_unreg_v4l2_subdev_nodes;
+	}
+
+	return 0;
 
-	return v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
+err_unreg_v4l2_subdev_nodes:
+	list_for_each_entry(sd, &rkisp1->v4l2_dev.subdevs, list) {
+		if (!sd->devnode)
+			break;
+
+		media_devnode_remove(sd->devnode->intf_devnode);
+		video_unregister_device(sd->devnode);
+	}
+
+	return ret;
 }
 
 static void rkisp1_subdev_notifier_destroy(struct v4l2_async_connection *asc)
@@ -753,16 +776,10 @@ static int rkisp1_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_media_dev_cleanup;
 
-	ret = media_device_register(&rkisp1->media_dev);
-	if (ret) {
-		dev_err(dev, "Failed to register media device: %d\n", ret);
-		goto err_unreg_v4l2_dev;
-	}
-
 	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
 		ret = rkisp1_csi_init(rkisp1);
 		if (ret)
-			goto err_unreg_media_dev;
+			goto err_unreg_v4l2_dev;
 	}
 
 	ret = rkisp1_entities_register(rkisp1);
@@ -782,8 +799,6 @@ static int rkisp1_probe(struct platform_device *pdev)
 err_cleanup_csi:
 	if (rkisp1_has_feature(rkisp1, MIPI_CSI2))
 		rkisp1_csi_cleanup(rkisp1);
-err_unreg_media_dev:
-	media_device_unregister(&rkisp1->media_dev);
 err_unreg_v4l2_dev:
 	v4l2_device_unregister(&rkisp1->v4l2_dev);
 err_media_dev_cleanup:

---
base-commit: 34e31390a3b939db2e0cbfef4c40d95052572df0
change-id: 20260722-enumeration-ae42b36efd04

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>

