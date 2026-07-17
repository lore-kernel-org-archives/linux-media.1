Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD43B71B0;
	Fri, 17 Jul 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280292; cv=none; b=a0efB2/EVfVFikrbzDtEk5K+BLEC+Pnf/Ehc0TcHi3+wA66QAiEs898oI5VREFxmaQOP7C4Rt4KiAf2qzNi9mEWM5254jq4kC6d18aj+MlJwc3snzpVDyoxOYr1ws49D1mr53UuQvB+BguA+F5hmIaGK0OG4RfHnxGC799aVRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280292; c=relaxed/simple;
	bh=rzTz2wzxr0Mp54f7SiO6FNGM0JSGFGWz6Gb7YxZH8Z0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cxJdiN2U0gjezEnC+RLOH7fngburkEamXS11NLMH/XdgPelLQjbM3Nq7KxhySZp4yvL391pWlfRlffWGmDrFMErL9nEHSYEy3bNoyddsDSWtAlvQkRGjNVunE1rFmwvTXGSuiFXlTLS9aEHua4DwFBO8bFtXZY69+Vh9XVF2zGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TIz110b/; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TIz110b/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=PQ
	XcGhJtmahdcwoxeFucFOAsheV4ROAo21FxFXhz8JE=; b=TIz110b/NpUMQKrjFn
	JPBoTzbvQpoNFKIqkr2WXb5lY+SDicmwbr5JdPl3KTP9X3fNxABgKUSKjLW+/ghT
	hx7OGKUZqfLTS/4r2Ux5+LVx+7JWP/F/Csob2TKb+P4eKF/zfE6OdjCyQ7OQki+w
	bLwU6Bs/saKfUd6qMZ+9/OhFc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnESG+9Flq5w+gHg--.17942S12;
	Fri, 17 Jul 2026 17:24:30 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH 10/16] media: s2255: Parenthesize macro argument to avoid precedence issues
Date: Fri, 17 Jul 2026 17:23:43 +0800
Message-Id: <20260717092349.684342-11-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260717092349.684342-1-huanglei814@163.com>
References: <20260717092349.684342-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCnESG+9Flq5w+gHg--.17942S12
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF13uF45Zrykuw48CrW8Crg_yoWDGFbE9r
	1rZrs3XF1UKryY9ay2yr1IvryYyw13WF1ruFnrtr98Ja4Iyw4UZan0vw13tw1DZFW7AFn8
	J3s8tF1rurn5CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0bJ55UUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0Q5hWGpZ9M6oGgAA3d

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

