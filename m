Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B29381EA0
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 07:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148059; cv=none; b=N3te8Cqhhq8okedTDTyQSt3LjNUJJPay0wycA+VUYMOfaoA6A7xWINVDAfACF03dXG4ZD+0/vd/iLVd/Nw1CJt3JWTKt3ruXR5ryCp/tIQtdGc83L4dNEa7zAguzKRcIKZFzkJua+t0Hci0jABSbkIQEU7dhGAVm834DoWlSPL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148059; c=relaxed/simple;
	bh=0hxanbK4yIWzoGvQWd6GLvT1DhcDi5OPHr4is5h1MOU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=L1NEc8sCjDYHpy/VIhxgNPi4UrKMP0V4gPcuITVCw027A1wPMM9oIfyp5tBV51rq7u3SiR9orre3oHGk8ADqpOb6hTnUnvWAy1YIctXlKMT/2+CDjzj8JwYXcfouuFmcAg2ZliQatd+pP4R/kB/NozD00O1WYqBv6GOZl/xhMvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eq/v6biv; arc=none smtp.client-ip=74.125.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eq/v6biv"
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-327b1d5824fso418313eec.1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 00:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790148057; x=1790752857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=geEmw+R/kfrbLwVLDAsBiL4pN21rLxye59h2geFDiOU=;
        b=eq/v6bivGRdeAlSE+Vu7p+q5LH3tSYjUQMFy+5DLCaylTB5aYT8jesIX3Pgft8KQt3
         Ck14kB2q8rXXeY19cxoaGSofhDdU2Tw3Riwo9hZTIRWEwFW0mVsEUzbZFYFMOUDrdlJN
         N6YmxBKdPJCihc2sHDTn2RRWJ/ul7rwSNolhwRyHvvR2R+q0t3O7RQmU97DDkECdGax3
         eu8LEZI0YFlQXZQqGO3d7RiijyIwAnjsXjITDf7YXBxuKE675/XVRYOVnusEiDvgsAh9
         OPWRGz3/+riou49PIPW9WupVOW5rB5lNvCOkbSXRzkRZv2XYhSiJ+9Y5vHG6SCFwfiFU
         LzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148057; x=1790752857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geEmw+R/kfrbLwVLDAsBiL4pN21rLxye59h2geFDiOU=;
        b=Q5bKL95OHK5Xvo994R3yDokPWmQPHjFqmrlbQ1o9JJVFsuE9rHW6eFV0BFX7wt4VGr
         bZMW1DOSx+60vwm1p30SFWMarKs62W0YSedlDLD7+qJOhZFra2mGx8SR7IPgwlqzUb9d
         2+f5W8kiVNcKchYKxSVIZkyc+47E6p+JB3jzFNUXYGPks72nciS4JckP0Gjy2jyFQXbm
         SQAyYvNW7SXf9DX3SPhg63xi+qXFIisR911Ggq1poJ+GDCB/4M5R5Aer2mXZLrRxNMt1
         c5KMBk1zwPH7qGEQOZhOFbARqCHaiu1JXeCz3LSmhq8wr0QPkaps+pnscP220kYvSrIt
         sgEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZ1n+lnTnAgXLds+EuQKaIfG9qfrl6Jsj0RkJZt85QO2cAAW58YYZXRDwPccsTiqG34wGWKtY8j2TBIg==@vger.kernel.org
X-Gm-Message-State: AFuF++nJps1ZHNoyoUZV3pQevDGW5oYKPHmuV80K2QKSz2irVCZtCDgR
	bO9WSVOnJOmEL+80ZW8JT+hXWI6l55faZuQWdsGhm/BreIeiaH/o2XD/TDgtGnqX4jACnA==
X-Gm-Gg: AYBFou13G8ZYilPKKCxcod8t6d/nJfTxyWcWJPNUH1gYkskT/PkTuw4QMUf1cJNApRp
	vvgxgCStILLKdu9g4rVmKbFvkTBYJ6kKoRoAcsM7cSFKYUO40VllK1c5+5DlntpRYC5DHzzbKri
	URchY4F3KfIAXjjmVuYvf58yjZAmNWakI2glPorz6FzhDnNLYjYh1cFuTLfyGks6zDYMz+aNUZb
	lgA1Z+5yCI02u2lOBYM9NeKTkP1h2rP+LIIL6nM/aPoWpiijJajY2uxCIkC0adoWXeF+RmzTfF8
	sJ2XXXE33AZJ5bspLd7RzUYI+V31/X402C9QVmDEuVL7/hL5qNt7pkRNlAqF1pnOjoSPiiRllf+
	h+IJjn6NXYNsIGvy4V6APygpA/wTijlGguvBT5WfTAzBexFA3vd0y8SBWYONbz1q1F6AhnbuKK7
	RRY9w6gtFj0WWYnYtiH9xelGFq4EdjQxkkbzVe3qgzfL05zOGWS64mssHC302oZZcYmHmNBG7aJ
	iVWrVVPebw2yP9ioAmDtZhh/g+Df+HfGBqnHJu8QvKxaRQDBl3u
X-Received: by 2002:a05:7022:7e81:b0:144:ddf7:256e with SMTP id a92af1059eb24-144f9179543mr2414871c88.29.1790148056999;
        Wed, 23 Sep 2026 00:20:56 -0700 (PDT)
Received: from Raccoon ([113.30.177.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f949e51asm4162367c88.1.2026.09.23.00.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:20:56 -0700 (PDT)
From: Rohinthan P <rokinthanp03@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+f26bc23e42eeb548dee1@syzkaller.appspotmail.com
Subject: [PATCH] media: em28xx: use video_unregister_device for radio_dev
Date: Wed, 23 Sep 2026 12:50:50 +0530
Message-ID: <20260923072050.24427-1-rokinthanp03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7c8bf63b7937 ("media: em28xx: use vb2_video_unregister_device")
converted device unregistrations in em28xx to use
vb2_video_unregister_device() instead of video_unregister_device().

However, radio devices do not have an associated videobuf2 queue
(v4l2->radio_dev.queue is NULL). Calling vb2_video_unregister_device()
on a radio device triggers a WARNING in vb2_video_unregister_device():

    !vdev->queue
    WARNING: drivers/media/common/videobuf2/videobuf2-v4l2.c:1264 at vb2_video_unregister_device+0x1f8/0x200
    Call Trace:
     em28xx_v4l2_init+0x1c39/0x3150 drivers/media/usb/em28xx/em28xx-video.c:3085

As documented in vb2_video_unregister_device(), video_unregister_device()
should be used instead when vdev->queue is NULL.

Revert to calling video_unregister_device() for v4l2->radio_dev in both
em28xx_v4l2_fini() and the em28xx_v4l2_init() error unwind path.

Fixes: 7c8bf63b7937 ("media: em28xx: use vb2_video_unregister_device")
Reported-by: syzbot+f26bc23e42eeb548dee1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f26bc23e42eeb548dee1
Signed-off-by: Rohinthan P <rokinthanp03@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index c418add..79af154 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2416,7 +2416,7 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 	if (video_is_registered(&v4l2->radio_dev)) {
 		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
 			 video_device_node_name(&v4l2->radio_dev));
-		vb2_video_unregister_device(&v4l2->radio_dev);
+		video_unregister_device(&v4l2->radio_dev);
 	}
 	if (video_is_registered(&v4l2->vbi_dev)) {
 		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
@@ -3082,7 +3082,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		dev_info(&dev->intf->dev,
 			 "V4L2 device %s deregistered\n",
 			 video_device_node_name(&v4l2->radio_dev));
-		vb2_video_unregister_device(&v4l2->radio_dev);
+		video_unregister_device(&v4l2->radio_dev);
 	}
 	if (video_is_registered(&v4l2->vbi_dev)) {
 		dev_info(&dev->intf->dev,
-- 
2.53.0

