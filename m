Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985DA2E8897;
	Mon, 20 Jul 2026 02:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516116; cv=none; b=YaNRsycU+k8n1DnzxC1Qmn7MHnnFvsFYRHlbY39yAh42EriOnRsOBfuIIKccdeLUgxDBpFl4t1deqCm4LHen9hiFUrCzhiKpyB24tANnB5wCbcinVcHrtL6i2e+F/y1H4QQ5XFGO3NZinQdn1FEKI1ZJA6Pdi0eZNdSaAqL4Hdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516116; c=relaxed/simple;
	bh=qHxZk/FUoslfSqT8XBYedc13K+J/VKCtVdunJRkQNww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TI3BKz8CO6uuSqVt0gNSwBaGC+cWb0xl83NJdupOFnVbEI8KMFN20FZtXrihGOgKhOgegfoqzqtkp83ySe8Z0ssyP3aI2gj1hpO+8HdxoJ3sFip/hKywnuPh5gxkmqNSBzjDOykAo+4n/7CKNpdo+g2WGf++6TLPEu7zUOME2lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Xc5DcQwc; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Xc5DcQwc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=D2
	WojmfVLIwx0/sDZR7a5gpCn5z6FTcCsg/aPSWKpgs=; b=Xc5DcQwcxAZyDjDiZu
	2hwvgofNZR8E6a9RXlPh2CHIftU602EJdSosTyi41PMWPE3CuvN4DD/CykSd1ZT0
	r0nGtmzHAn4tTkgpkdC8TjxuFCs3JojAjnLv0FJb2YFZ+rGh0WEpVE3FoxrlWVrK
	Trk4vsON3X8OXoLwiG77Kqg/Y=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3v5rwjV1qaGtIJQ--.123S10;
	Mon, 20 Jul 2026 10:54:53 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 08/17] media: s2255: Add blank lines after function/struct/enum declarations
Date: Mon, 20 Jul 2026 10:54:37 +0800
Message-Id: <20260720025438.207149-9-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260720025438.207149-1-huanglei814@163.com>
References: <20260720025438.207149-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v5rwjV1qaGtIJQ--.123S10
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw17Cr1rGF18tw1kGryrtFb_yoWDJrbE9w
	1Sgw1xWFy0kryY9r4jkr1FyrySva1UWF1kXFyvqF13Xa4jvw13ZrWv93W7A34qqFs7AFn8
	G3s3XF1xWrnrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0eRRtUUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0R2Ui2pdjf3NmwAA3C

From: Lei Huang <huanglei@kylinos.cn>

Fix all 2 'CHECK: Please use a blank line after function/struct/union/enum
declarations' issues reported by checkpatch.pl in s2255drv.c.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index dc3a9d69789c..3aa6270358fc 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -1178,6 +1178,7 @@ static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
 	*i = 0;
 	return 0;
 }
+
 static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
 {
 	if (i > 0)
@@ -1332,6 +1333,7 @@ static const struct v4l2_frmsize_discrete ntsc_sizes[] = {
 	{ 640, 240 },
 	{ 320, 240 },
 };
+
 static const struct v4l2_frmsize_discrete pal_sizes[] = {
 	{ 704, 576 },
 	{ 704, 288 },
-- 
2.25.1

