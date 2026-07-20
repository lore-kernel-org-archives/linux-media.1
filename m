Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8318D2EBBB7;
	Mon, 20 Jul 2026 02:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516127; cv=none; b=TKeg6k6FGJcANr+4zOQOEFicfNdFqoMzmgnXExIHVdR0zUpLo7kvxpA2jIVQrjk2NFgxou7tMJK/LvUtl+CBPi1IxflLHtTiNrC8n/Tb38QpFHmrUaUHo8O0h7tRH59imUZNpu6WKPZDUEgQ33XFWipgpHlEzKHDoycibBC6czM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516127; c=relaxed/simple;
	bh=rzTz2wzxr0Mp54f7SiO6FNGM0JSGFGWz6Gb7YxZH8Z0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZH6b+tfofnvak+MUVxPXejijtSWUrPb3MqeCIjp8K7A+3/f5sx0tjc/sS1TaZWTqCqcjCREap6esnPG2mdVFq9rCajSBPRdrEEAaBdByRElwoTg/qmyuxRuuwGw40IiMCsojQoS083mX6lHgD0GxaUf8SLdVNkNpBLU9igTu2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Jkp1hiR8; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Jkp1hiR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=PQ
	XcGhJtmahdcwoxeFucFOAsheV4ROAo21FxFXhz8JE=; b=Jkp1hiR8IR4tVXq3mu
	oU9YyPtmT6SZRLFjJAK5x4jZ0F9OAy7BQoPeVU39VF6+UHVLm3qLIFKfBqKBwkUD
	RMzW9j7r9TJB5wd/yHu6foFBpfgoxr+BRR71urWzNe9V1ggRy9AA055YUijIxWaW
	THOKzmPkwutjIbMhTJFnbieQ0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnZIkOjl1qWxR+Kw--.19016S3;
	Mon, 20 Jul 2026 10:55:11 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 11/17] media: s2255: Parenthesize macro argument to avoid precedence issues
Date: Mon, 20 Jul 2026 10:55:02 +0800
Message-Id: <20260720025508.207815-2-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260720025508.207815-1-huanglei814@163.com>
References: <20260720025508.207815-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnZIkOjl1qWxR+Kw--.19016S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF13uF45Zrykuw48CrW8Crg_yoWDGFbE9r
	1rZrs3XF1UKryY9ay2yr1IvryYyw13WF1ruFnrtr98Ja4Iyw4UZan0vw13tw1DZFW7AFn8
	J3s8tF1rurn5CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0Ul1PUUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0Q+Yj2pdjg-PwQAA3x

From: Lei Huang <huanglei@kylinos.cn>

Fix 'CHECK: Macro argument 'dev' may be better as '(dev)' to avoid
precedence issues' reported by checkpatch.pl in s2255drv.c. Wrap
the 'dev' macro argument in parentheses in the dprintk macro.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index c65cb794599b..e5242247a118 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -348,7 +348,7 @@ static long s2255_vendor_req(struct s2255_dev *dev, unsigned char req,
 		dev_err(dev, S2255_DRIVER_NAME " - " fmt, ##arg)
 
 #define dprintk(dev, level, fmt, arg...) \
-	v4l2_dbg(level, debug, &dev->v4l2_dev, fmt, ## arg)
+	v4l2_dbg(level, debug, &(dev)->v4l2_dev, fmt, ## arg)
 
 static struct usb_driver s2255_driver;
 
-- 
2.25.1

