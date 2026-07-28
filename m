Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D057A448B81
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248253; cv=none; b=Xa7MNy6dhPdOPaZHRgqpkt2dKs33vAmXVG9wbAkGPWx7R6vxejbx1RHz3NUHBEmjD+3T0J/NGT9UGJtvBrJCC4Te4S0T/iA21PN8Xno2PGpsN0rRq66NyDgbbQBXAc/vDAPeVzSzmggC7o1hLQYnL80WxOFP2DJD13n1SgGJleI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248253; c=relaxed/simple;
	bh=GMBJxU+iC6WYPC48enAZZXUKRSG2uG3jL/7OYe5qSQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZmsv/XtFUkBlTTDSXkAjKs2VQgYXTEwXSgSTG+V/Q+TjAkkOHdFOAWT6YNJTTOjUL6JFfTjzdZo9Eto0CqozCVEPNlc/4HyOBltVuT1nSdk4tgMWDLVt/IhkCxS1OWLM6ZrnQzffDXcTqJt/FCpp9EqXoyLHZbb8IVONOGzIN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKWt3NQU; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKWt3NQU"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8f032b47e3cso28779216d6.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785248251; x=1785853051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sjhmtv/uEmlahFxE8xqef6JXqKOdBStYEX1wvTOt6Y=;
        b=bKWt3NQU9eBMs+ovVOEXVjZ24+tAwZmcPPyYyrOhmW51DNsdkM6UE3gROwhkgeJEJ3
         WGoImBKa95a6+kF6YMUTGgAD74gUD621PwwwTh+9yqamT9TjEL+QVATJarNg7AzFY+Cy
         HqGZoK0lgS9fTiRz2JvbKg2SnHB9KDiqSLCDIviMHL7RPX+vFA5rVLhzyy5nm7B5kaHv
         wlIvK7ag2g5Uq1TChpECNI89+okR6AoXJli14NT58fz2hBh6arPxrLAtVrOPT/zpuud5
         O7MGLkhK55zBLtdUqyvAtMs2nKg2cFZy7HcukHCqrlLMhFQVl3TIm129bHCQLCJeTkhw
         QvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248251; x=1785853051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9sjhmtv/uEmlahFxE8xqef6JXqKOdBStYEX1wvTOt6Y=;
        b=lX6us41o6hU62HzEBsltCp3MjUo4afOE2NcoFc9PCZTJX6L1MOCUZp7xgg4c1vvXIO
         hv3vsGc6hiqhyKat5dsj8Sk2YZNSpu6kssDy0PYRPO0cuL5Nz6TzCoFwohDkcujseflK
         QM426HNSqXKd8kt9kUkPMNNBJuKR8NivxYA7BNq8ue5VsukQ7c1VpBieB9RZzDX5Fauk
         yX4/TcJ+AlOUlK3optiawiTk2s0eeRlrtbI7848NsnLZ3Sy9qE6UGLGgWsj52v1ELxuW
         5gPAz5eG54hjzXpDSzXn2+eyenrGLGDGkBdHR5i8F1alY0ym0ANWzVbct5YntjUBtTS2
         klhA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+Y98eaG70omPQovJhxTG7Jh6BW1txKzBUIVv0wkf4y9R5WYE/QCEwNqRp4Lej9cQuLn80wAWfJ2NXgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiDzL70rCvDLU8CU99RM/mctvJ72vP9YRINuJCbCU8WTowdIWV
	DB91d8TWi/KAlHYTgB/Se3rNbW1BCgWVeQxi5QcyRTNh+BXUp5VzwS5S
X-Gm-Gg: AR+sD13Dy1tP4US2gUaR+foPon0bHbs11rgl2oIR33KphHFjSVR5thbNqa9+JhJ6Yq2
	J3oxVBRRcJIWeGr1pub2ifVBQTT0He2I2hc6+Kxs6GDtXlX5rF1szia1HrjMOcyrfxlb0IkaCf6
	40GF4Jr5PLWNxE5TQRY4EBJL5xCZZxfpd10HvzgAq5oTYWpzAi4bDlceUyT0eCGmqNNCte/VGol
	+bYvUswj5sUBo1NAQX29Wo6ryWIs6h9uZ9+3P+amS8TPn99HMgws/k36noDDUdzUr15z0oXWLN8
	vmKUth0JlBWe7s+84jFq5eEC5AFihqLlSVjEmgvL+gR1K4GUC3ke0Q/XS9SfkqOLpQxMbMzhRIt
	dFDLsKacgtS36HoQvl4bf5/jkrbZKz/H8J1iR9soT3BRqUbBLcD3b+xx3/cTFrbAnOyq0ieyogD
	BxPg8FXPIGiM2KN2/1n2aOiuCSgBK3M7rIb8XTvr1mVKH+l7BZb3GVyQ42mk9Qa9tdG9R5Agnbc
	H0FfaXn3qKo7TRVyoNZ8H9gaw3MtbfIXwYGMtIpfp4=
X-Received: by 2002:ad4:5aee:0:b0:8cc:ea95:2261 with SMTP id 6a1803df08f44-908172b02dfmr28914246d6.36.1785248250544;
        Tue, 28 Jul 2026 07:17:30 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd3b56esm85856d6.26.2026.07.28.07.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:17:30 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH v3 2/2] media: amd: isp4: fix self-deadlock in isp4sd_pwron_and_init() error path
Date: Tue, 28 Jul 2026 14:16:50 +0000
Message-ID: <20260728141659.62310-3-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728141659.62310-1-gyf161023@gmail.com>
References: <20260727183500.298036-1-gyf161023@gmail.com>
 <20260728141659.62310-1-gyf161023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isp4sd_pwron_and_init() holds ops_mutex through guard(mutex) for the
whole function. On any initialization failure it jumps to the err_deinit
label and calls isp4sd_pwroff_and_deinit(), which takes the same
ops_mutex through its own guard(mutex). Because the guard in
isp4sd_pwron_and_init() still holds the lock at err_deinit, the call
re-acquires a non-recursive mutex held by the same thread and deadlocks
on any initialization failure.

The error path cannot simply drop the lock and keep calling the full
teardown, because that teardown is not valid at the earlier failure
points. In particular, pm_runtime_resume_and_get() drops the usage
counter again on failure (via pm_runtime_put_noidle()), so no PM
reference is held when it returns an error; calling pm_runtime_put_sync()
unconditionally would underflow the usage count, and the teardown would
also touch ISP MMIO while the device is not powered. This was previously
masked by the deadlock, since the thread never reached the teardown body.

Replace the single teardown call with staged labels that unwind only the
resources actually acquired at each failure point. The error path no
longer calls the locked isp4sd_pwroff_and_deinit(), which removes the
deadlock, and each failure now skips the steps it never reached, keeping
the runtime-PM count balanced and not accessing MMIO while unpowered.
isp4if_start() and isp4sd_start_resp_proc_threads() already clean up
after themselves on failure, so their resources are not unwound again.

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

