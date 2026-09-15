Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58A3387590
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458933; cv=none; b=JhZCbqS0MsS6EkiUtNmEcCeHlD12U8gFUNthPz7s6rz337YtfocKPHTJIi/F+nfHhNAcTSCvIR4sYUFvrNp01GGwWJ6Ygr87gbIrVnYxVb3LfabLkxPm3J1KJ7fUN60e6r1gjsP0d2Drt8Co8NdYZ7PrtgGxINbUtUNu/PcH5wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458933; c=relaxed/simple;
	bh=tCmrY8bbWX/n5rVI3Gf1grWS2sFWfnCZLxtu4re3KDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JVyxeZKx04v8vm5Aj0cKQ4XTToOWrg6WjpRwCaPWee2NMFdV0UpZKfcIQbBUYEG7wA/O6kSuGKe5xJNdssj+MdGdimceJUeJN24CZp0wPIngxdRrjhPnMuTW4OEbOFWzIaOH6Cjxv7V4IGurcROlXfpkE0SGigX7Fbm7P3PBJ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bE4uWn6F; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bE4uWn6F"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e211a3so2251801b3a.2
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 00:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789458931; x=1790063731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VKOice3d+d9oEFyie9yQ2tllBkQHbuzBZLWo6vl/Ptg=;
        b=bE4uWn6FQXPPHeSYqFLTJMcg9+Mt7PlBT1NSIR7QJfn2w2Y5PVjKrnKviaj5pRu5PT
         VCykXEEmWcRGeRO0TeokyK49x+LkYVNMNBvQKBYGqCC2puGGsgtw1IghDfNMXdLzMPho
         4dPNgKZEpNILE9CfdQXl+GdjcTWDbhLy2G5vjFiixsNaT9ks2ueL+iCM5mfOOPD385Ia
         GJfBtssZdZC8SFRowQ7X9i+DHo0v875wA4B3EQ9O1ZoqPzsWE0lFXzmqdQhnSL032Sxv
         ueHFWhD7ILT6GziQZW/NB4mHdsRElQXQ3vHEUl0bvLONWplk3Y4Hv1VmOD85R0OLrmAX
         dOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458931; x=1790063731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKOice3d+d9oEFyie9yQ2tllBkQHbuzBZLWo6vl/Ptg=;
        b=0M9IawR2vv9/ICb7/Ql4g+V+qVlAYGHicHsT3c+f2lTprkOhauTgjGsqCX1bzKtH5/
         zd7g7YTMTw2tABsIQ8/4XiqELC22u2uEdlS0w9UnPCDamotj54b/nFmDgnc0zJikxu04
         TGVcYdAEiP+DWqcZhdvUYa7BZSgoznOUeYwpdXn9jXEEZj1BgMZzTXKAJ3Is1gkZDqDx
         2NwwJDBwPXDJmxkqxC1/rL31jj9ozELyzHUL4FiNo9TBrwBwO2woCuY7XSHWZPwp4CVu
         oEbMPtRqMxIPWPLl1fcE6/OMm51G/oNetcDRKgaHyXJZGOAKg2o7vW3MXTCfcounAdB1
         p1tw==
X-Forwarded-Encrypted: i=1; AKwUvBzI/VsqLpZm3YjxxSD2kNVIgJ3Nx+0aYItmWYftuz/si+Wunpec2ULNyqwjRAZMIuJng1SMJiZnDODFYA==@vger.kernel.org
X-Gm-Message-State: AFuF++n9WJRp7WOzKg9Yk3+MISJUamalj8c5bi0T79igJDFKNXhfcRdY
	8ODBdWYeOzW87ClzYcCVzQW1hjXYAwx35cRG9AZtfAAOd8lpXNN7ivmw
X-Gm-Gg: AYBFou0XwmiRL7FutLCDJaylej6F3sOFIK/rcSUG2Ec8bALfslB1/lwCXWpP1xehcwx
	YRRA12TCDgxcISLQRvQs8EpClu8WTVk+Y5x4TRnnkzi5Z0jXzY0QBdsOfjjJbzUijF9/GAV4sVo
	8WbfX0K2BUJvRTZWrhzMsRyz1HAun4j13JIJzEq44JfWe10p5E1/0QyQ9aH1UO5bCeq/9o1BqDZ
	2djyOJnqurZnE8w+JfLp/qRK4fT3r069ryc7DaoYlb5Yst4sXRssx1JUrbSjDMI6s5N8bQjIlvx
	vC59veNwDL/gtiCI4VyBYwXCiGIRw7gwMiXFR1aVV4EqgYVUljldPhpdFcjtINLmgq7lr9KNa1w
	3g3bz0eTOSfrQSWwev/WwGTofQRfedV3FvzWdU8Pds2T2NQrZ1HMWpNSCujJp+dRvEFpoN75mMA
	sWeXH6CxYUBaZ/G9lwyxvh+oX6sDI+ts0dKEq02fvLGRxXq2bCriH0Dw==
X-Received: by 2002:a05:6a00:2d88:b0:845:cf73:c1d8 with SMTP id d2e1a72fcca58-86f85106b87mr11748969b3a.14.1789458931018;
        Tue, 15 Sep 2026 00:55:31 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c659b9a3sm6172351a12.29.2026.09.15.00.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:55:30 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: i2c: ar0521: remove duplicate media entity cleanup
Date: Tue, 15 Sep 2026 15:55:20 +0800
Message-ID: <20260915075520.2122757-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error path taken when ar0521_power_on() fails calls
media_entity_cleanup() at the disable label and then falls through to
the entity_cleanup label, where media_entity_cleanup() is called again.

There is no need to clean up the media entity twice. Remove the first
call and let all error paths converge on the common entity_cleanup
label.

This issue was found by manual code inspection.

Fixes: 852b50aeed15 ("media: On Semi AR0521 sensor driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/ar0521.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index ed324c2d87aa..be68789eb8f5 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -1142,7 +1142,6 @@ static int ar0521_probe(struct i2c_client *client)
 
 disable:
 	v4l2_async_unregister_subdev(&sensor->sd);
-	media_entity_cleanup(&sensor->sd.entity);
 free_ctrls:
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
 entity_cleanup:
-- 
2.43.0

