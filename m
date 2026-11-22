Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353158;
	b=nYgR2oOr8Dpv0/0Q/w3gOSZI1HyCuA5xRPNPNehNd1RqU6KJGuReoFeqDl9VNCZbWbmp
	 qNLMORJp7ZnXIIdhEJIM7XR7PqsHKTSW0LpjaAwPSljphBT5p1fqLI0kr3ZnRApOPv1+i
	 ey4dTzSmxIspxdn4oVTCMkEfoVmDWsj/bLJ4BwctkKRdh94ZyczNkQuddVV0NfoIH6fkw
	 j9CQE3tAhE/GHUSc2AG/gFqHrCD7WjGhjK+kn9jwEmhQ4PU+OSeU2RnDTWIdkaPSdMIVX
	 fYmb80soRybIRYtwV/drL8PeGKqCl8jsUb5WbOH8BXFoydB4u1uSnhMyny8a30oUBNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353158;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=SmdP/7BfsYGhQv7wtbXz8vXzRDgZEp6wKFaOqLwREOM=;
	b=pneA/5Mm5SUpSPpyZMAY78uf6eSQ6pDLESOEVYaZQqDf3MBwdKcYJr+0MWhzdGRpI1pz
	 dTdxdxVypziX4ySUdqPmiHWL2lGtjEWYPYWJqkeZw/YOzxisL60ROKmhxTq+7PgiAj7dT
	 HUUcuQ2XYalZt+pBjVEzMO4uG49WXMokQthV3fznywMxSnxD69Q3zOSvD8GWsnOG5/3wd
	 FVhIcI0DMPJhI/O+ZOhmmVQUpmi62hsEEzbdLTUBhV2SZ26POWG8urdgsCXIO3c7E2WDc
	 bmiS3qTTZkwFG/FujWAx8reAelfWOcoeVlJEzRjmXNqkieKTarft4gvZmdqT9YddkOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ZQFCAJYF;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F98606A320;
	Sun, 22 Nov 2026 13:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98F98606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ZQFCAJYF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Sm
	dP/7BfsYGhQv7wtbXz8vXzRDgZEp6wKFaOqLwREOM=; b=ZQFCAJYFbNjaYqGNp9
	CYwrQqExzCkeHEZ7Yt/E7+YY44keBkRkaBfTLvjVYpdn5GLlySTfUCjvcJ3g7/tB
	aEaGulSkPusoa3t47CsIxV6T6vBBp686ZjySqlK+o1p234G9o8d/fEJUrjJmk9Mm
	KpThzEAKKhAqsrZc2Q37ikteA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDn14cv6gJre9m0Gg--.43188S2;
	Sun, 22 Nov 2026 21:12:16 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] media: saa7146: fix a potential memory leak in mxb_attach()
Date: Sun, 22 Nov 2026 21:12:14 +0800
Message-Id: <20261122131214.1347540-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDn14cv6gJre9m0Gg--.43188S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur1UGFWUGw4kZw1ruw18Grg_yoWDGrbEkw
	4jvrW7Xr1akF13JFWakr1fZFW8t398WFZ2yFyrtF93AFyFvr1jqr90qrn3Za4UWa1akry5
	tas8JF1ru3y7KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRt4SoDUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7RAikGsC6jAQ8QAA3d

mxb_probe() allocates a struct mxb and adds an i2c adapter.
If saa7146_register_device() fails, the resources should
be cleaned up to prevent a memory leak.

Fixes: 03b1930efd3c ("V4L/DVB: saa7146: fix regression of the av7110/budget-av driver")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/media/pci/saa7146/mxb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
index 129d41c1862b..3c399659bb48 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -721,6 +721,8 @@ static int mxb_attach(struct saa7146_dev *dev, struct saa7146_pci_extension_data
 	if (saa7146_register_device(&mxb->video_dev, dev, "mxb", VFL_TYPE_VIDEO)) {
 		ERR("cannot register capture v4l2 device. skipping.\n");
 		saa7146_vv_release(dev);
+		i2c_del_adapter(&mxb->i2c_adapter);
+		kfree(mxb);
 		return -1;
 	}
 
-- 
2.25.1

