Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E9A3C279B
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716241; cv=none; b=QDBrEPzdz3pcex+tnUFHBv/EDVfkdwXpMHbjlz+jQeTmSc4C+lh7wJ4rftvskdPJw8iBoKWi6n89Bwflm+XqB1hB8iC18kv6DL5AINy/jYa8w3wjT+bjzquveF5Al+2oHf7C4tpatmuQdTlb0tPlPNTXMcXtwQTxhtwxf10SzIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716241; c=relaxed/simple;
	bh=D/9EFdR6b9LvR2+vOqAMX9wsIzPdMbBECRGp89WBgwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VlAZJSqNGDaKiYCUKwA1a63nj/gtAEQ6yyuB7bdVknsJrHjk1ay+9Y2dky7rwGtcs27Xp55EwP0uw1sA17yNjOlobvzaOfubreh0tFjLnaWgkxBjzmkOJsYliQyLOn7BuA86KcDzbcfP1KMMnE0DyJH81SLKRAOmILa8N0qr+to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiN+BJUp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiN+BJUp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7689B1F00A3A;
	Mon, 29 Jun 2026 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782716239;
	bh=EHnqnuvMsaaXAIPL92tsS3R/9bZGuCuZJHjLYz85z1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jiN+BJUpDAqoxXZaM4uYdurTYBU/8hw3aNQH+kwnqHUBk4DGumK35qse4pGJMVe1G
	 ujWjANG2KC/zqsu6osDXUz0dl7p07E9Vj5hJEF6lv0eNwXeQiirNzFMgpAzXL5uFev
	 SJ4H7zUCDySyTqUuueun5N2iUDCaYsaDeZD7IfIaSpylF1lZaHKlOBwPgMeGXxwIhT
	 YDhRX0PZUly57H/iSp8jecqH3EzoEUgZMCSER9z4Q7+LL1uix5VQvzZUffJNbNUCV9
	 QMw2e2seVeJVufAMq/kQ7Mgz3idkSBUFOFoFBKX9FqumWr/28Hn8txjww5DBVEMM4c
	 7/us/Pniir3nQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 3/6] media: em28xx: drop 'users' field
Date: Mon, 29 Jun 2026 08:55:51 +0200
Message-ID: <b2c05b43c497a323e2d29e87a11322089407f670.1782716154.git.hverkuil+cisco@kernel.org>
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

Drop the em28xx_v4l2 'users' field, use v4l2_fh_is_singular_file()
instead.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/usb/em28xx/em28xx-video.c | 18 +++++++-----------
 drivers/media/usb/em28xx/em28xx.h       |  1 -
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 42f5e7547cc4..6c726764a5f3 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2332,9 +2332,8 @@ static int em28xx_v4l2_open(struct file *filp)
 		return -ENODEV;
 	}
 
-	em28xx_videodbg("open dev=%s type=%s users=%d\n",
-			video_device_node_name(vdev), v4l2_type_names[fh_type],
-			v4l2->users);
+	em28xx_videodbg("open dev=%s type=%s\n",
+			video_device_node_name(vdev), v4l2_type_names[fh_type]);
 
 	ret = v4l2_fh_open(filp);
 	if (ret) {
@@ -2345,7 +2344,7 @@ static int em28xx_v4l2_open(struct file *filp)
 		return ret;
 	}
 
-	if (v4l2->users == 0) {
+	if (v4l2_fh_is_singular_file(filp)) {
 		em28xx_set_mode(dev, EM28XX_ANALOG_MODE);
 
 		if (vdev->vfl_type != VFL_TYPE_RADIO)
@@ -2363,8 +2362,6 @@ static int em28xx_v4l2_open(struct file *filp)
 		v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, s_radio);
 	}
 
-	v4l2->users++;
-
 	mutex_unlock(&dev->lock);
 
 	return 0;
@@ -2467,13 +2464,13 @@ static int em28xx_v4l2_close(struct file *filp)
 	struct em28xx_v4l2    *v4l2 = dev->v4l2;
 	struct usb_device *udev = interface_to_usbdev(dev->intf);
 	int              err;
+	bool last_user;
 
-	em28xx_videodbg("users=%d\n", v4l2->users);
-
-	vb2_fop_release(filp);
 	mutex_lock(&dev->lock);
+	last_user = v4l2_fh_is_singular_file(filp);
+	_vb2_fop_release(filp, NULL);
 
-	if (v4l2->users == 1) {
+	if (last_user) {
 		/* No sense to try to write to the device */
 		if (dev->disconnected)
 			goto exit;
@@ -2496,7 +2493,6 @@ static int em28xx_v4l2_close(struct file *filp)
 	}
 
 exit:
-	v4l2->users--;
 	mutex_unlock(&dev->lock);
 
 	return 0;
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index 90b83e4598ac..f68159fab345 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -580,7 +580,6 @@ struct em28xx_v4l2 {
 	int sensor_yres;
 	int sensor_xtal;
 
-	int users;		/* user count for exclusive use */
 	int streaming_users;    /* number of actively streaming users */
 
 	u32 frequency;		/* selected tuner frequency */
-- 
2.53.0

