Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4989471CE6
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738726; cv=none; b=bziaQMSkNkw0zTfkOO0QQJWuVkz0utloSV7UjkxD/JpcuZv0GGWD/xxY2YAvSGUENf7PtzZgorKP8LWXUBnyy+9u7lmAD2JvgluGozgIXUzNAuyUZvxQlOo20I6Ojft8oc4EBQk+/WqrEnWVGMFt+ydmr/vYUj7JDdVYgfqLDqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738726; c=relaxed/simple;
	bh=izjVJ1GsaHMy0A8Z4dzQrA/0kJYmzfi7T0ir8KG7JY0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a7AUlWrcTgNeYRYK7/Eio1qwoEHgDVqO6Zcickxn7ttab9DJXIVmVa4HE50cHt37qQ9Kc265Iv1JpOf/Ix1c7nTZKJYL259ZvDTh5/XSnuDT8xbcdnlUr1rnVdViEpQnnWcfVCBDLaXFs04IjegwDv1JgK6Bn8qj31oPMD3Ixp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaFvnh0D; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaFvnh0D"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aea0fff535so10602118e87.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 09:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784738714; x=1785343514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RMaItLf+wLPzPOkAIWLQbZ5Iu0QU3hrWrmvyorzSKio=;
        b=RaFvnh0D0aJGTHuzESvpBwj8zJbWDJQN5rMr6JN1jJ6Mpzn/3z2kJ5bf+9chzYJqeT
         jh4JQXo6iUbtGJjOOvwEEXwIAgleturkK+DpPRpor7vGokZRuoXgH0/AHGt2P11lrosW
         CiXFY0Rb0/oH460BT7ZGBG1+BcS2OAUzcVqF8RzzxTQ1JwWG8xvOXN4awA3vx8Go4b6v
         lZksGS441u5/OokqtE6iKBoVc+xj61r5509/7uUQuNeU9X/u9iF7u6WDFWIDauiveRU7
         XAvjGpE46W357z3S8GJ946YwxJQVw80duaXUSGdaBne1IuY9xILIi46vhZV/mJOynsHv
         czaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784738714; x=1785343514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMaItLf+wLPzPOkAIWLQbZ5Iu0QU3hrWrmvyorzSKio=;
        b=s336JJRk+zKPZHqe0Wsze3n7EP0L4kxPyBUF8w6q6dNQEjMGjyhtC0H/7jtWwOnrZJ
         c0nWGYV0skSfvX2ja+T0eVT2FTDSfRw3HxtxHert9/VhhmSLcRXGhkZzd9PZLmicrsAH
         e4O92rU+vLzLvTiYr6uJaC4ulXm989aX/hYTke6mHPj5MGOWEZErtpaZwywAHfHqI3Nj
         uMPeZdg6X8yJqqnuGbFj9QYunW3jhrFgufFVwH7RJbYSgmy0RL+uh1JHKoCfLfiJIB/4
         7jE1T5jsliydVKE5hV/ONd8aUSIHKBus7qArgDuuT795/T4KiwSKmSWn9Q9lp1Shc2x+
         K2tg==
X-Gm-Message-State: AOJu0YyvB0LrLw8097ncMInv8J6qI+WNGptiViHfjx9us8T1qh6MR7tU
	kKV12D2Yz7wTQ5Pr6W+AfxLO1JqAcRvsM5PMFE/rwSRFTd2aQc02XqAr
X-Gm-Gg: AR+sD12QnizaghQDq81QWin2ucAfNOK3n5XlSYQhTgna6GCjzHupt/Gb+SjienESVFv
	LXMUczzsb+I3gUfLTwvqh7BCNdBtRh9swvOkmzaHfDb8NDhgjqdnxHGBUNekb2giwQii+gC6OY3
	B2pt2dq4pwd85QvdE4lsBkKpG9DbjQBDQUTIddLfIkwiH2QfJTQl3Cp5n9jxa0U6tJffKvTa0NM
	SK529JcAsso1CkIAbRRBcg9C0ICjp2Yyd1TYi9YNUHOAQHqZrmsv9YOnFsX8xKxN/2Rf4eAT+uZ
	ORxVqwqBzVoTPwLV4K9zx2gJ0Z38P6ySOLpijC+NNLOOOw1avmFA7TCoucaBio9yPX78zipMIWA
	BnrpA08EXJISvyoSxh5rQbGuMbctSk0EquyuiRTHvQ4NR6KXnbv+d5C4tbl+1l2K9olAGqAQmuU
	8/HoS3HKTgG2P1wfUoFjfsBhE02Gw5Nu6A3QZS4cwRsmFFJG/jHzQaJX8wT4du
X-Received: by 2002:a05:6512:1309:b0:5b1:56db:b069 with SMTP id 2adb3069b0e04-5b28f9bc8a3mr5436335e87.54.1784738713899;
        Wed, 22 Jul 2026 09:45:13 -0700 (PDT)
Received: from thinkpad ([5.217.151.126])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d302e3sm590498e87.51.2026.07.22.09.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:45:13 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	lucmaga@gmail.com,
	helen.koike@collabora.com,
	Arash Golgol <arash.golgol@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: vimc: fix pixel format lookup in enum_framesizes
Date: Wed, 22 Jul 2026 20:14:51 +0330
Message-Id: <20260722164451.13485-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vimc_capture_enum_framesizes() looks up the requested format using
vimc_pix_map_by_code(), which searches the pix map table by media
bus code (MEDIA_BUS_FMT_*).

However, v4l2_frmsizeenum::pixel_format holds a V4L2 pixel format
(V4L2_PIX_FMT_*), not a media bus code, so valid pixel formats end
up being rejected with -EINVAL.

Fix this by using vimc_pix_map_by_pixelformat() instead, which
performs the lookup by pixel format as the ioctl expects.

Fixes: 09c41a23a2e2 ("media: Revert "media: vimc: propagate pixel format in the stream"")
Cc: stable@vger.kernel.org
Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 drivers/media/test-drivers/vimc/vimc-capture.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index e0c6bc9f8f20..ac60c9b5418e 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -175,8 +175,8 @@ static int vimc_capture_enum_framesizes(struct file *file, void *priv,
 	if (fsize->index)
 		return -EINVAL;
 
-	/* Only accept code in the pix map table */
-	vpix = vimc_pix_map_by_code(fsize->pixel_format);
+	/* Only accept pixel_format in the pix map table */
+	vpix = vimc_pix_map_by_pixelformat(fsize->pixel_format);
 	if (!vpix)
 		return -EINVAL;
 
-- 
2.34.1

