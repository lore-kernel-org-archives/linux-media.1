Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE6D37701C
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130479; cv=none; b=CNlT/ATNj+wQxh2RWKGFe50+gzISde8xLmzbEfqj9ZeRlztWpUmhfSW6JGWTIyjVYyesqnMNZE/lZJ/DHv/rmPHAJ7QPhRS8wPvqy9jJRTgqxpqxAZ5/7oZryC7enbAJp+WemNZosjUM6xIjAY/mCwowLB0svmWEdouHFN92sVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130479; c=relaxed/simple;
	bh=Je4ATXoR4va71A2ZAIetqA9Orlr2fNUDHK1Gq/4Bdgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Amyz5enXaOD9YcZ8W7N4WliGnUUljPTOVEhMTWTQqfvTI3bLHXFqbEBc0zUqGAhfFyxNKlgufz+3tzM80zzYtL7cDWdS3vNwaDyrBKwItmXrOl9XTXMDx7YcuZswwL5jsgbUSrWpjFk3TmlwJXQu3xHIWhCHBTZjQ1OnIj5Lavo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsNT3tok; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsNT3tok"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8453a67659fso2287032b3a.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 05:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782130477; x=1782735277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O5sfJNmc1yKWdZTqu3HegJ66XvBTGvbaI9z9chRhIF0=;
        b=YsNT3toklcqnrjz20RrfSZL6/5iYNoLG7wJbdlaM9HUPMpsDRifJ+bn7q0cRTeMTyF
         ieL3++lq8vfJckHuvRNloJWS1nzZYNSjt6m+QZxc/GSVEhplLoWz0YZxAhB21p0SgyKc
         F0bycQ3O/giPHYhPTLc6++WnlQRmEZv5SrztNLh09lPsS2Fyz3mQpK7O7w4DVquuqsgX
         vSWxfHld3XDLu+7O8k0DYN0JMPtK+y7q8o3oLLOJaVUaE3YGNaSJ579HihdqEs3i6X4l
         ZAitQm3r5heFIXo5W1ZS5lo9BuPeizfF4GmXEQ6S7WBgMdFj7T24ybXLGwpIi50sQ41y
         79Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130477; x=1782735277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5sfJNmc1yKWdZTqu3HegJ66XvBTGvbaI9z9chRhIF0=;
        b=a9neP8QMGnMF2HojSqzHscvo0XNoYwHIb1X+VS7x50MlqSIQmVc7cW9yuUg9i1SKjT
         HeK/CKmAUm8u0fSkptC7UkwExQX5Pmo1PD8NdtjImqF/ShAXw6PzCyjnbrQT8VPdXA8J
         5TybCNAHkedrqsesxd+Sz36l/JMKC763godjm0qqpUGOPsXp0+Dj/ewZNWF3ELSyL7qV
         V+tb6stxSQCjKXWIovUan36+NCJBZG5o/kOj8bEbbMQR1CE5jMtF3gmNkkLi4KgA74UZ
         gDXRoqnySOFe/6tnVlpjWTfMZ2sSc+3pxytBJ3jQGycY8azH/cMPEtdBxJHjLPD4qCIW
         Ekfw==
X-Gm-Message-State: AOJu0YzMAlwQjpeSuq8eetZskdDYmcvlKbR1mDOhybCMFge4n5FBGgzb
	Mq5B2GDFuyNp4q1D+rKO8EJ9nOwV2NeV1i8Ttd8n8FWGr8LimK1uWpk=
X-Gm-Gg: AfdE7cm2rPJYUXh1ffYTw6IvqOjVMYuP5GUofHjUSl4EhXAJ57GwWWydrfeOVfd8zgB
	7Riaxn5U7pxC4zccDTTC4AzMRfXPtHn1wRJ6aGnKgJ7nod1UW0CKbOxUdUVMBOnJYOKIvzV5diV
	9gA/a/SNBYWIQb2jse2FEOyS6ptXf/d/swVQLURyT382Ni2bdPT/Sv88dQRsuMQE/H/6BZ8o7qx
	9JZFUlLPUNLf3AgxvS3KB9M+DSeg4mTelfZ9Syym8jiYzmHQEgKkwpRHlM0iV0fIQpHbWAbpCa4
	TZVyAS+pcN2GVbghzlSPbFkAbVoUx5SpqpIDrhuUxBMkcDFdPvcwcBUiK20pLCxQRxuh7ZbsOUU
	bgk2sULr/aYNdz9EROz5ff4zyY+ynAdPizerztjkPX4tOEAJwQ1sofBMd8m9IKyVPU9C/OUq4qP
	LTrSAZmSlPPMHdb+sKXbdTNekspoqSPAb7wLm7m+xmNzsjBSXpyMbxJIykgXJcmfIm
X-Received: by 2002:a05:6a00:94ee:b0:842:2419:6c0b with SMTP id d2e1a72fcca58-845507bac4fmr14675413b3a.10.1782130477449;
        Mon, 22 Jun 2026 05:14:37 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d8ee89sm7046238b3a.20.2026.06.22.05.14.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 05:14:36 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH v3] media: i2c: vd56g3: Clean up subdev state on init failure
Date: Mon, 22 Jun 2026 21:14:29 +0900
Message-ID: <20260622121429.47765-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vd56g3_subdev_init() calls v4l2_subdev_init_finalize(), which allocates
the subdev active state and requires v4l2_subdev_cleanup() to release it.

If vd56g3_update_controls() fails after finalize succeeds, the probe error
path currently skips v4l2_subdev_cleanup() and returns an error. The driver
.remove() callback is not called after a failed probe, so the active state
is leaked.

Move the control update to vd56g3_probe() after vd56g3_subdev_init()
succeeds, and route failures through the existing err_subdev path. This
keeps v4l2_subdev_cleanup() in the common vd56g3_subdev_cleanup() helper.

Fixes: 87aa97fc3157 ("media: i2c: Add driver for ST VD56G3 camera sensor")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.4
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Restore the capitalized subject summary.
- Route vd56g3_update_controls() failures through the probe-side subdev
  cleanup path instead of adding a second v4l2_subdev_cleanup() call.
- Add the Assisted-by trailer.

Changes in v2:
- Use a lowercase subject summary.

 drivers/media/i2c/vd56g3.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/vd56g3.c b/drivers/media/i2c/vd56g3.c
index 157acea9e2..39fb14bab5 100644
--- a/drivers/media/i2c/vd56g3.c
+++ b/drivers/media/i2c/vd56g3.c
@@ -1388,7 +1388,6 @@ static int vd56g3_detect(struct vd56g3 *sensor)
 
 static int vd56g3_subdev_init(struct vd56g3 *sensor)
 {
-	struct v4l2_subdev_state *state;
 	int ret;
 
 	/* Init remaining sub device ops */
@@ -1421,15 +1420,6 @@ static int vd56g3_subdev_init(struct vd56g3 *sensor)
 		goto err_ctrls;
 	}
 
-	/* Update controls according to the resolution set */
-	state = v4l2_subdev_lock_and_get_active_state(&sensor->sd);
-	ret = vd56g3_update_controls(sensor);
-	v4l2_subdev_unlock_state(state);
-	if (ret) {
-		dev_err(sensor->dev, "Controls update failed: %d\n", ret);
-		goto err_ctrls;
-	}
-
 	return 0;
 
 err_ctrls:
@@ -1452,6 +1442,7 @@ static void vd56g3_subdev_cleanup(struct vd56g3 *sensor)
 static int vd56g3_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	struct v4l2_subdev_state *state;
 	struct vd56g3 *sensor;
 	int ret;
 
@@ -1517,6 +1508,15 @@ static int vd56g3_probe(struct i2c_client *client)
 		goto err_power_off;
 	}
 
+	/* Update controls according to the resolution set */
+	state = v4l2_subdev_lock_and_get_active_state(&sensor->sd);
+	ret = vd56g3_update_controls(sensor);
+	v4l2_subdev_unlock_state(state);
+	if (ret) {
+		dev_err(sensor->dev, "Controls update failed: %d\n", ret);
+		goto err_subdev;
+	}
+
 	ret = v4l2_async_register_subdev(&sensor->sd);
 	if (ret) {
 		dev_err(dev, "Async subdev register failed: %d\n", ret);
-- 
2.50.1

