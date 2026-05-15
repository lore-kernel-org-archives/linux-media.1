Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8EF34F241
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 07:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778829944; cv=none; b=cm7WbnP+3LU0fMW91GuxKNsXd1lWu4IbXzz8t2AT4/ZSXOVIKjMT6MuYiMy4k6fa+oTISE1wKtN7K+TCyga+yUhjvCnjjcGtTdD87i9SPuhsEWZy/0UR1l2111QbJSJzNfV3dswNShE7xZ+MRXkUgAEIO1CptVvk517TBmRTocc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778829944; c=relaxed/simple;
	bh=V78qE48UZLs/XEakcgJEAYoYr9qaH6PyXDTJCVi3D94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ns5LerMYIT8c8RoMxuS1LLdIPg2XXpxDlK+X7UUE1HaVwOmt0PaByrEVXUCksQME7CCO2Opt6laPkKPN5t3eusihLvf8qsy/zUn7EjjkKuJCP6SuU5FwYDVYVKuyYKSytOHGVkQISqXNi/bLLY4TjNjH5h48luE/dxdFLTHnYVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZUJdNtN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZUJdNtN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so82497985ad.3
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778829942; x=1779434742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ktiNCFovlAzqzGJ/+v1M6lVl5fNaz808WBhWl9izIqI=;
        b=AZUJdNtN1HEMa8t6IxEO6AXVRuOi3i6o0qgnY+T0cqgRe3VhrxmM3z0kPOog8Wrukp
         uFjs0x+IIstY05rVGWZp3GJ8sJpZgWIp7qtIHyTs/5jSCZ250b0Bk9rtEhF6LIDI/WRO
         a+3+0L76kQ456ooWszvetQzT8wYBziOao6u/83CX33gdiv5W7GHHd71J+vgKpTV8olVj
         I8RNAkSBVwJ/N1CUHFiXY1kA9/w3/5WKmxZMkvB/jnA5QSwSlXShNgVUFnkLsdz0e58T
         P/pF/yDcFRC5KI1SrxQVRLSKnjHZVg/ZYabNPOqG4UK8O/h+0lfx7qOl48N1sHtLrzIE
         Iu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778829942; x=1779434742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktiNCFovlAzqzGJ/+v1M6lVl5fNaz808WBhWl9izIqI=;
        b=Xpgeh/29O66ZqhrvBQ3bBYjoy5nOMgl1T5p4R7ToXoLHQb3zAE3TYrK77U7RnommkO
         oPy3R4NDhU6DY2xx14YTXs4uOrLmgHyRq26MjGI3wjqhJoQ0t4Kb5UZw9foapBdBbgyO
         j2x3bX0fFPlH0kjqrERisGRWzVWlnaGgIeauYFMxiZ2+MQNVfCb97o+DEqQ0ZYD01Bb2
         sjzaD12CHFdEHRmc5jy5Qd12vGeCNBe5S8TdS1qGj1+dyjlJbBSbYMwLlYXTj0usFwA0
         Bqu2g3KcGtm8htVkEILLaV45Ncwh4wsBtW7o/2qnWO3mMoee1uuYA+c8HA1Y5ZKoy4V+
         k5WA==
X-Gm-Message-State: AOJu0YwzOh4jXRoRUosg765102h7QGRXMaFKHI13/2lfi7s3BhabDFeO
	c1DsLaZY3TtXk0ncCNL6wVIscxvyPIBLxmAY/I3QPQXloi7HEMElpNlT7AErXw==
X-Gm-Gg: Acq92OFbhfz2D51yHvWFb9nIBw+xyfOjz6JPcUMRSJarzsWckQvcxIKt/FpieALrJ2X
	ZapTDyXu6np+dKCBcfjcogOrBg8X8sUiN0JX9klCtBwchOr8GwWW1qurPwkpvaAUY85WpVCO8ul
	pTPkqIVAFju8Y5pIIPHAcfCoOc/4fWkMYQFmM77+3ccmWIeDeoVv+tr6AxzvWK9mFkDut/aro+S
	7R5mlZ37G3ElrE7a35L95Ml+zX8KECFaNulXNAFQMowMQyiS7H0SQQpF1nJpUievPVNhHmobVfl
	MzYon1xSlF5d5Q/o3vbCsZb7rUPLdEzVzSW0I+tVXSqxMih5UOai55vGE32XKANkTl8awEPwWwm
	wQ61mMLVPzYjQkSUy2XWSRFkR3PfJsbQJ59/mlUHL4+m3d+yY6Qz3gqRaR+worQjoOccH7PjdV3
	Ac97JJniz4zWgHhct1j2svAtqx9OoOVkWrRKyIEKforCLppO4yyyK6TZxaZfUBTvsEgQlVgdv0N
	goFRSBpyn/MMHdACKi/f1ZqGI6HaT0ZSzNiTLkSoMFBQhgUpfkKmg8efPw3fY4T7gc=
X-Received: by 2002:a17:903:40d2:b0:2b4:5f69:715d with SMTP id d9443c01a7336-2bd7e8f07f3mr31799295ad.25.1778829942504;
        Fri, 15 May 2026 00:25:42 -0700 (PDT)
Received: from ip-10-1-46-91.ap-northeast-1.compute.internal (ec2-176-32-72-196.ap-northeast-1.compute.amazonaws.com. [176.32.72.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d12372bsm62501565ad.75.2026.05.15.00.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 00:25:42 -0700 (PDT)
From: Daiki Harada <daiky0325@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daiki Harada <daiky0325@gmail.com>,
	Kees Cook <kees@kernel.org>,
	syzbot+b1de0d5fd8a15fac11aa@syzkaller.appspotmail.com
Subject: [PATCH v2] media: msi2500: fix memory leak in msi2500_probe error path
Date: Fri, 15 May 2026 07:25:34 +0000
Message-ID: <20260515072534.389995-1-daiky0325@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When video_register_device() fails in msi2500_probe(), the error path
jumps to err_unregister_v4l2_dev, which skips the call to
v4l2_ctrl_handler_free(). This leaks memory allocated by
v4l2_ctrl_handler_init() and v4l2_ctrl_add_handler().

This bug was introduced when commit 2e68f841a5d1 ("[media] msi3101:
use msi001 tuner driver") reordered the cleanup labels, placing
err_free_controls above err_unregister_v4l2_dev, but did not update
the goto target in the video_register_device() failure path.

Fix this by jumping to err_free_controls instead, which properly frees
the control handler before unregistering the v4l2 device.

Reported-by: syzbot+b1de0d5fd8a15fac11aa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b1de0d5fd8a15fac11aa
Fixes: 2e68f841a5d1 ("[media] msi3101: use msi001 tuner driver")
Tested-by: syzbot+b1de0d5fd8a15fac11aa@syzkaller.appspotmail.com
Signed-off-by: Daiki Harada <daiky0325@gmail.com>
---
 drivers/media/usb/msi2500/msi2500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 1ff98956b680..76e1f2bfab0c 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -1265,7 +1265,7 @@ static int msi2500_probe(struct usb_interface *intf,
 	if (ret) {
 		dev_err(dev->dev,
 			"Failed to register as video device (%d)\n", ret);
-		goto err_unregister_v4l2_dev;
+		goto err_free_controls;
 	}
 	dev_info(dev->dev, "Registered as %s\n",
 		 video_device_node_name(&dev->vdev));
-- 
2.54.0

