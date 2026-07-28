Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE6A3DA5D6
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 19:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785265707; cv=none; b=C10fuCCQS5R0IL1XJqGsy9aXA/4P4KtAmf+xPwA4eyTrj0Q3xGlpNmBg4e8p0lqPIq8TS8nmsywDxA5vWCdlQa5e0RkGjEf5OKYVnQVBRnrL5gOdNw9l4ymd2FrCEg+j1fzSb10CsTaV104QLXLgzP4mAxKrHkBxwxaqsFRaNB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785265707; c=relaxed/simple;
	bh=LFAVFR/Ebd0M8gVoXYCoH/VogyPRgNY1LFnFp/ZjP10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/DEUi2F697meAYcGa+J+6SOw2idfZ8LQcJthhqzblgUPBmmAU/8k6Sa4O1ZpSMfd+ixQnJKn6VJyoPCkvGC0Cg8HxElijjp/rvO5UKtblVQbW8solbfeqeWzYwOBsQyxwNYwvjHyYcwfs5620o5Q0scxNYav5WAjP1YqxmVBSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSjX3zia; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSjX3zia"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-902fc790cd5so947756d6.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 12:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785265704; x=1785870504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2Ag2eYiDFYwVSdn+oCdd0do6bhUzUtBZUhVY0F4OiY=;
        b=KSjX3ziadDZPwq5I1I/hlu4OCfTSkoCktI/R14rN+cOtIhhF1Cly/QQeAMZTSTOpn1
         ACgZQS2AZqxH5Z1iMFXLQH5op931ZFVUB0STkt15jqMIvIXfOrhg9UNTNmTcPr5VzLEx
         1AGcw4MU9Zx/S/nVqmnTPPIlAgRMzXcWX95ej0QyY2ErUeQ3Fcm5oGOA4oQj+wzlciNX
         0osn1za+hTgA09u/IvKl3UTvjX8g3MuUvKw6OAHj+RDYbGqozcEZrfoAw6V0PO8940Oq
         gKoLhqqO4APeiXN+KmcqKwKivpdFgFS4ebcwhBGS0tonlAvoWSfD9YXJp4o1H00sqb3p
         V9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785265704; x=1785870504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r2Ag2eYiDFYwVSdn+oCdd0do6bhUzUtBZUhVY0F4OiY=;
        b=E3uuntLqUuxaAV6Qkz9KXCRYyQmK8lml9dPDWe8bfIveMIazRxIT8kE2It+JKmRSDC
         kq98p1Cer8yYxronNjmYkWzqzuXTF8pGO91ITv+vQdUbJkQcTTBGD2nVxW8rF50ghvT7
         XrT4jnbq6cutdYsMqcKQcQRag5DpSas8Vfx4bR/BLiwtbU6ewQ3hDs0dNcsbALg9jOS3
         9BXGBsri55PPtIrWBi00Uo1gTsBN2fVNAZ3Muz5fc3/rsnecqGexN7iCiqvkvjbdbKPQ
         KOL7r0Yn0QIuyMfb8xfoDc0uM80zoyTEtYEUTg9ykPjfj4w4DuVGzxl6bFNUaepuexXW
         IthQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVQyrlwD+vsMfDHxMriKtAadOesSRpb9gViGoyO+dui1a9bB9FqYPHtC6we2+nF8Z6+pwK4+poyixP1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkKNTzn1lLqljlq4bMbqDB5Ob3Pb+xYBnPjuCHmlzYXEvhs6pY
	uxB74wfuuLOKPhvIFtA+glx6IdilPe4J4rQVJUP7IZWi4WstqbTxYW9/
X-Gm-Gg: AR+sD137z8WBIxpSGiIK6Y2CbacpUQe785G93irjhUsu84kK+LPoB0orsv5wH8tjf1C
	GLjJOvRYvigxWzXh5ANsidjePftcQVQnBTyMd2isvc3bRwvTL8DZtGvbDraemPcCZFIpX7JazRi
	dBXZCR6cCUoaSSaf7VDOtDAVHprxT0GqK2FjvY4csJAoSEYLXAQ+T1gyWPXw/6ykhA0652ssNc7
	sqaOVE9AgI51xj+SKTR99yKIrEah+kUot0LZ5QXcDEGpjvwO6MOzQ9QGqLVgPy90Dq10VVRqlHv
	eyIhDUGF8/xLdfNY0gxWYTDLbkzo6SCXFco/mgGWV/hEEFGvoqtkEKA9P2mWZ+NxOkfj6sMyNe9
	LfDkLQ+L8aXONNxtPJZtJVLrFhFQhUmk3tm6+MLd7NHw5OpekzRpPF2uubeEg6v03kN+hpgA8mK
	1YU+gS5GgR7Mutuq1ukp+HiKXLg2qchysAWxgsowWlvziFvIjRPiEWFHbJ
X-Received: by 2002:a05:6214:19e7:b0:8ef:db4:d85f with SMTP id 6a1803df08f44-908172c32e1mr46063076d6.41.1785265704274;
        Tue, 28 Jul 2026 12:08:24 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd68434sm5556936d6.38.2026.07.28.12.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:08:23 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH v4 2/2] media: amd: isp4: fix self-deadlock in isp4sd_pwron_and_init() error path
Date: Tue, 28 Jul 2026 19:07:40 +0000
Message-ID: <20260728190754.363464-3-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728190754.363464-1-gyf161023@gmail.com>
References: <20260728141659.62310-1-gyf161023@gmail.com>
 <20260728190754.363464-1-gyf161023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isp4sd_pwron_and_init() holds ops_mutex via guard(mutex) and, on any
init failure, jumps to err_deinit and calls isp4sd_pwroff_and_deinit().
That helper takes the same ops_mutex, re-acquiring a non-recursive mutex
already held by the current thread, so any init failure deadlocks.

Unwind the error path in stages instead, releasing only what each
failure point acquired. This also avoids the issues that an
unconditional teardown would hit at the earlier failures, such as a
runtime-PM underflow from pm_runtime_resume_and_get() and MMIO access
while the device is unpowered.

Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
Assisted-by: Claude:claude-opus-4-8 smatch
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
 drivers/media/platform/amd/isp4/isp4_subdev.c | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 48deea79ce6c..868d1c74d35e 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -687,7 +687,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
 		if (ret) {
 			dev_err(dev, "fail to power on isp_subdev ret %d\n",
 				ret);
-			goto err_deinit;
+			goto err_module_disable;
 		}
 
 		/* ISPPG ISP Power Status */
@@ -697,7 +697,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
 			dev_err(dev,
 				"fail to set performance state %u, ret %d\n",
 				perf_state, ret);
-			goto err_deinit;
+			goto err_power_off;
 		}
 
 		ispif->status = ISP4IF_STATUS_PWR_ON;
@@ -709,12 +709,12 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
 	ret = isp4if_start(ispif);
 	if (ret) {
 		dev_err(dev, "fail to start isp_subdev interface\n");
-		goto err_deinit;
+		goto err_perf_restore;
 	}
 
 	if (isp4sd_start_resp_proc_threads(isp_subdev)) {
 		dev_err(dev, "isp_start_resp_proc_threads fail\n");
-		goto err_deinit;
+		goto err_stop_interface;
 	}
 
 	dev_dbg(dev, "create resp threads ok\n");
@@ -724,8 +724,24 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
 	isp_subdev->irq_enabled = true;
 
 	return 0;
-err_deinit:
-	isp4sd_pwroff_and_deinit(sd);
+
+err_stop_interface:
+	isp4if_stop(ispif);
+err_perf_restore:
+	ret = dev_pm_genpd_set_performance_state(dev, ISP4SD_PERFORMANCE_STATE_LOW);
+	if (ret)
+		dev_err(dev, "fail to set performance state %u, ret %d\n",
+			ISP4SD_PERFORMANCE_STATE_LOW, ret);
+err_power_off:
+	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0);
+	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
+	ret = pm_runtime_put_sync(dev);
+	if (ret)
+		dev_err(dev, "power off isp_subdev fail %d\n", ret);
+	ispif->status = ISP4IF_STATUS_PWR_OFF;
+err_module_disable:
+	isp4sd_module_enable(isp_subdev, false);
+	msleep(20);
 	return -EINVAL;
 }
 
-- 
2.43.0

