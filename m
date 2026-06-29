Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4F3C2BBE
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716242; cv=none; b=Dn2Yo43hOkTGkfq9tAD9KZJORMIhZaHvr1IPonHm3otknVlgcwuJOTYCFdNyY7alvH4VFPt/YpfKZyjN4nguJaCMipd7Jtl4m2cQRmy9r8jGSdcuiMtWCi2sfnH23mLuWWK4sNfjLSMy+yhAefmGNLb8lugVlv9Vn/jUkyaW4c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716242; c=relaxed/simple;
	bh=4LDeHdUUUoJcULdyGajYEkI2HWQKxFN6f+R9WC2e2c4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFu6Y4g8dSGXHark6XzqNd8X3AgSJprue8VMTAgbRSG3VoJg99cCJ37Hc0k4Kay2Bp5vUVJ8M26232yMxgkdpwQmV+YCT6ZjzStTtgh4d6wKTn/hwvUN7Hi2Tw5Ahpx1BNFhVOTOon3xmIJdrNJBhxprm3Z14EjZhouzQ9QLDKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/Ydt/At; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/Ydt/At"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516211F000E9;
	Mon, 29 Jun 2026 06:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782716241;
	bh=prMIHyCjsqe4rvw5zVm2cUV1Ji/zkuY9ffIznRNvXZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S/Ydt/AtU1Jv6gXiiv57ytg8Pr7GZb6yH15aqXM2a7bnpDxdFWpORHQTYN9yczrMG
	 D9xRyRlhOYKBj2eejVn+zGzT95FYMOg6CFIBbQYQNXp5Xh+U5Fl8FLVxZEi30TtIIL
	 SRONaxJy/2u2ka/lHJH88c9phU8sdLON9sa9n88Rmn5vJYwttHCtoZ2pQJ5iqotx97
	 sU4gAXDU3ga1Pxf7pdKPZvbG20XIfrxNRXz9kXT0/nXKYLaAFoWwUXl/YrbJ9faY9s
	 +4VWra4m4As1QgVfrizlvFbYgjJIm+DnBJyZsdA+X1+wV/Z7A00iIQdbFYYpr0ah6y
	 K6EpFYmc6tsvg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 4/6] media: em28xx: use vb2_video_unregister_device
Date: Mon, 29 Jun 2026 08:55:52 +0200
Message-ID: <77bdd330011d32e3cd4193ec1a9d322ac4a24b28.1782716154.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782716154.git.hverkuil+cisco@kernel.org>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use vb2_video_unregister_device instead of video_unregister_device
to ensure any streaming is correctly stopped at unregister time.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/usb/em28xx/em28xx-video.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 6c726764a5f3..e4554d015944 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2402,17 +2402,17 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 	if (video_is_registered(&v4l2->radio_dev)) {
 		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
 			 video_device_node_name(&v4l2->radio_dev));
-		video_unregister_device(&v4l2->radio_dev);
+		vb2_video_unregister_device(&v4l2->radio_dev);
 	}
 	if (video_is_registered(&v4l2->vbi_dev)) {
 		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
 			 video_device_node_name(&v4l2->vbi_dev));
-		video_unregister_device(&v4l2->vbi_dev);
+		vb2_video_unregister_device(&v4l2->vbi_dev);
 	}
 	if (video_is_registered(&v4l2->vdev)) {
 		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
 			 video_device_node_name(&v4l2->vdev));
-		video_unregister_device(&v4l2->vdev);
+		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
 	mutex_unlock(&dev->lock);
@@ -3068,19 +3068,19 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		dev_info(&dev->intf->dev,
 			 "V4L2 device %s deregistered\n",
 			 video_device_node_name(&v4l2->radio_dev));
-		video_unregister_device(&v4l2->radio_dev);
+		vb2_video_unregister_device(&v4l2->radio_dev);
 	}
 	if (video_is_registered(&v4l2->vbi_dev)) {
 		dev_info(&dev->intf->dev,
 			 "V4L2 device %s deregistered\n",
 			 video_device_node_name(&v4l2->vbi_dev));
-		video_unregister_device(&v4l2->vbi_dev);
+		vb2_video_unregister_device(&v4l2->vbi_dev);
 	}
 	if (video_is_registered(&v4l2->vdev)) {
 		dev_info(&dev->intf->dev,
 			 "V4L2 device %s deregistered\n",
 			 video_device_node_name(&v4l2->vdev));
-		video_unregister_device(&v4l2->vdev);
+		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
 	mutex_unlock(&dev->lock);
-- 
2.53.0

