Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B9242D9B;
	Fri, 24 Jul 2026 02:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784861434; cv=none; b=gAiywvoLSK3W7NgUcyl5IWTMz+W3qAaW7mmB20OBt/i8ZDs0sOYW95qnI9GKLfc9LmNYb7CEePkGLc27acVKLL3OxZ5Fx0VtSaOWjvuuJlDxQ06M7AYVSwBWxp02k2+8GO5RjK4I3gHj77FMwH7F8pw77BYUM/3hh+9dCvny7i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784861434; c=relaxed/simple;
	bh=D2PUSwc1EniJAO8Gf4PrNXME8NO94FY5HMrExxJTNrY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nn2njafRVsMuIeYncEUH+Bpw22UOvZM1JpnIVgYkKH0HSBcFoDSSF7Hy5ekc4lR3OY5x860FBe8MbGtoXMiPgyAJf3Zmpz3acSv6M4WfHRNbdZvoK2ZeD29xcuRvDrPZ1J+m6vMDN4GcFolCdH3/31EnqlaWZ+Ha/CNN/+3TVDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 66274076870a11f1aa26b74ffac11d73-20260724
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:912b4b18-64df-430d-8289-ee75738c8cc3,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:6ec185b0bb2af017b7eba870b99b086f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 66274076870a11f1aa26b74ffac11d73-20260724
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 519654972; Fri, 24 Jul 2026 10:50:15 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: hverkuil@kernel.org,
	mchehab@kernel.org,
	obias.lorenz@gmx.net
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH] media: si470x-usb: fix memory leak in probe error path
Date: Fri, 24 Jul 2026 10:50:12 +0800
Message-Id: <20260724025012.31811-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When probe() fails after calling v4l2_ctrl_handler_init(), the goto
err_dev error path skips v4l2_ctrl_handler_free(), leaking the memory
allocated for the control handler. Now that err_dev is no longer
referenced, remove the label as well.

Switching from goto err_dev to goto err_ctrl ensures that
v4l2_ctrl_handler_free() is called via the err_ctrl label, which
falls through to v4l2_device_unregister().

Fixes: 4967d53dbbce ("[media] si470x: Clean up, introduce the control framework")
Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
---
 drivers/media/radio/si470x/radio-si470x-usb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-usb.c b/drivers/media/radio/si470x/radio-si470x-usb.c
index 869b1e7e34b9..6272c2418408 100644
--- a/drivers/media/radio/si470x/radio-si470x-usb.c
+++ b/drivers/media/radio/si470x/radio-si470x-usb.c
@@ -655,7 +655,7 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 	if (radio->hdl.error) {
 		retval = radio->hdl.error;
 		dev_err(&intf->dev, "couldn't register control\n");
-		goto err_dev;
+		goto err_ctrl;
 	}
 	radio->videodev = si470x_viddev_template;
 	radio->videodev.ctrl_handler = &radio->hdl;
@@ -745,7 +745,6 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 	kfree(radio->buffer);
 err_ctrl:
 	v4l2_ctrl_handler_free(&radio->hdl);
-err_dev:
 	v4l2_device_unregister(&radio->v4l2_dev);
 err_urb:
 	usb_free_urb(radio->int_in_urb);
-- 
2.25.1

