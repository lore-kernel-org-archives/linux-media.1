Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6DF4ADD9D
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191986; cv=none; b=ACMi1Ja1lgW+mEgiZp1xcwuSXR2mHy6KRc655nWUtqy6UvRIODpw/SB1YglhMMKhrpGZOolCAjCVBjGtPuaX3Lo8VS2hpBabEIvhsIn4x0AuV7DmBsIQhjpQQeEyaNZ+NWl+aA1rGeBYljCx+/zb1rp/HoYRmnV5CO0q99/RG+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191986; c=relaxed/simple;
	bh=4LDeHdUUUoJcULdyGajYEkI2HWQKxFN6f+R9WC2e2c4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ng8ibnHvm4umpOXxWF0CLJecqvstjm28vZgPmUjtY/ZTRo7mIQe6ESNZshM9N74LtySn3VIQKNhr4k+m/RQNuZlehO1B0n7HzqKmdpwIzGOWCh12lDpdc3D4kqBGH+65qi6LgGi5V2RUTmScTIIxueYGuG+ac8j/1PeqxLhevj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvTDLcxv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvTDLcxv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD9AC2BCC6;
	Tue, 19 May 2026 11:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779191986;
	bh=4LDeHdUUUoJcULdyGajYEkI2HWQKxFN6f+R9WC2e2c4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KvTDLcxv9zA+VFdUbUnMEC1nCgAjxIo0iRWZnpu0O0s15U5eqHUMJmoC/Wg9uhs5p
	 z7cy7k/fOfhiJGWNaKW/lZUVo/Jwr/+ng7Hn/v9OYxxn6V1X4qiLej2sThWERmwEL4
	 P17x7jaWItlHoohpTuMHyl1R4O9wqDW0R4DYDIiiyEbPpys44rmPTnC6KyZMen+8JQ
	 t4/mmNIIFCPcY5OPBD7vzF2gIrERHe35vnPc184j2mDRLm61fbYuJgIUXBSUFuqDtB
	 cieAgg9c3OnEgw2gUSxfz0QG496ej4Ouvw/J1BA7YEvP5gEHVutoytH8wuF0J7JuTS
	 SXMQO0MZJWM1A==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 3/3] media: em28xx: use vb2_video_unregister_device
Date: Tue, 19 May 2026 13:54:43 +0200
Message-ID: <ad61b2c30cd477599312e9d5c12045dcd05c8ecd.1779191683.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779191683.git.hverkuil+cisco@kernel.org>
References: <cover.1779191683.git.hverkuil+cisco@kernel.org>
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

