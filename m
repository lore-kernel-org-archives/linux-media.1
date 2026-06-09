Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838764BC002;
	Tue,  9 Jun 2026 17:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781025087; cv=none; b=dXHYPZAtAS+6PbctC4179js72w7a0Z/M3XfSoNNMrAyzj1YfKTYm90beEaEf0jcAt65QNYOm1Rve8yQhnw7cg0FphZ4RXEOjw8/AZLV23G6p/OTMp5kQgvFIFhzYP2L6dVGF2x1jDo3cKys8+2QbKnLVdmp5Urer5lY6pTWkAHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781025087; c=relaxed/simple;
	bh=BzLLIM23M2A1UoG7u/RhKM9xyYs5pfGf/s4pqyRUtvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lGa9WEw799AqWR1i7bGPxGJrF6beoaOtsq51ubHyNQF0IH89D6rxtlAV4zdin6ENxBwzNd7wlrhUNh/Xuf/G/cKnrWMUrMu+Kv89yiwiF6kc/wDFjiNlgqfh7eDYc2NelnpBjGZnHhAhpX8Fo6yn0lkiMl/nLxUCVJA8tgVbCGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4kH32iF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4kH32iF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E20E1F00893;
	Tue,  9 Jun 2026 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781025084;
	bh=8eDv60t59fij6+u3viH7XuZxXWmRapj5ScjYDalAZhI=;
	h=From:Date:Subject:To:Cc;
	b=a4kH32iFFZYBJ014WIRfA//0+3vbUCOXveTw2D8JHePmOxP9aTw8l0YT3ysWmv1Fe
	 wbFEakxFIMKwZHJGw7nT0SLFU9PhtcDRaILcY6/rZgwXhjU0VrisDWrYElSo5SqPF/
	 h7DgAr7Y2yzDPWatt5DABP0GBE5EoBbf/ncE0yGkIgP3vnXUCVYYMvbMHL14/sTIWn
	 3YBfy96ew7blLPaMLMgFGMpvWipNdtUwxlYq6Xr0yY/1B6auzWuNF097zmMAvBxX2V
	 FzTdEmGXvw54rsCCiXCdjv1OCc7d8k4keYi72hG13FfKD84rClgCkZpuOjxA+lwlHd
	 lJJxOeMv3igPA==
From: Eugen Hristev <ehristev@kernel.org>
Date: Tue, 09 Jun 2026 20:05:23 +0300
Subject: [PATCH] media: bcm2835-unicam: Fix asc leaked in error/remove path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-bcmpiclean-v1-1-23bdeb19caf6@kernel.org>
X-B4-Tracking: v=1; b=H4sIANJHKGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNL3aTk3ILM5JzUxDxdM8tEi9RUY0NLoyQDJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAIgU7h9uAAAA
X-Change-ID: 20260609-bcmpiclean-69a8ee3192b0
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Naushir Patuck <naush@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=BzLLIM23M2A1UoG7u/RhKM9xyYs5pfGf/s4pqyRUtvk=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLI0PE3bqvuLAtnk7P21OB33B7Q5V9uKuMxbZV/9PpX33
 G3X+3wdpSwMYlwMsmKKLNUm/2qF+3e4n3S1VIGZw8oEMoSBi1MAJiJ4nOGfoUpuLJf12fZds/6F
 CL0oz0vdGHe1yyc7sMZGdr3Bsrxchn9W7//5vN0zMbJwHrPGyf9yx0/91Ek5yPVaMrTDcOemV62
 8AA==
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8

v4l2_async_nf_add_fwnode_remote() allocates the asc, which is freed when
v4l2_async_nf_cleanup() is called.

Call v4l2_async_nf_cleanup() properly in the driver paths.

Discovered with kmemleak after rmmod:

unreferenced object 0xffff000084526b80 (size 64):
  comm "modprobe", pid 185, jiffies 4295013512
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 e8 0d ff bf 00 00 ff ff  ................
    40 83 bc 84 00 00 ff ff 60 83 bc 84 00 00 ff ff  @.......`.......
  backtrace (crc ac584083):
    [<00000000ffb081a7>] kmemleak_alloc+0x38/0x44
    [<00000000d2fd9301>] __kmalloc+0x1b0/0x250
    [<000000004dd5354d>] __v4l2_async_nf_add_fwnode+0x28/0x9c
    [<0000000067587657>] __v4l2_async_nf_add_fwnode_remote+0x3c/0x64

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..1508843ae58c 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2613,6 +2613,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
 	return 0;
 
 error:
+	v4l2_async_nf_cleanup(&unicam->notifier);
 	fwnode_handle_put(ep_handle);
 	return ret;
 }
@@ -2745,6 +2746,7 @@ static void unicam_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&unicam->v4l2_dev);
 	media_device_unregister(&unicam->mdev);
 	v4l2_async_nf_unregister(&unicam->notifier);
+	v4l2_async_nf_cleanup(&unicam->notifier);
 
 	unicam_subdev_cleanup(unicam);
 

---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-bcmpiclean-69a8ee3192b0

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>

