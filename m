Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572333B6C13;
	Fri, 17 Jul 2026 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280281; cv=none; b=apyQ4IjXPa6YC8nQh6+bN0ldEnxQqvthez/M2g9N63XPCikB8M3lDiks9WTfdM/cQ3WWP+KqtqVeGwf3qyjXmx1oPJhLvBoMaHNMOBZN6jmk4/C+6IzblSpjOgPRkI8eNtoIkw18sRMvAweWGy1e0VAj1xC65o2jgFC6M1RVS1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280281; c=relaxed/simple;
	bh=qHxZk/FUoslfSqT8XBYedc13K+J/VKCtVdunJRkQNww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JgHDDd9eRUjOab+T7vAkBjIVfVcqm5TEj82mp+RGr/BA4TCgABxskmoxDyFlcHgJs6ROvzmxSA/MVxQHdabi6FmM89ytVmkVH8qTkp0CdEfSbiO+teS8hlN690i/nUcCMvWxxLc1rey4khSQAV6978U9Km1joWshth7grK6Mmzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FnFU1CW2; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FnFU1CW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=D2
	WojmfVLIwx0/sDZR7a5gpCn5z6FTcCsg/aPSWKpgs=; b=FnFU1CW2bnfWx3i2/Z
	klsGNsS58dKrviKJBNyf536Yj0EzyeU82Y05ZqFhJHwirkouF7Dy0sSkn8v15fPM
	WDSQBbl8SUr2R1cSN4AwaslAXZxI9v+ln67roK7aLNzQhQI8h8EkyxVE4q2j24EC
	ya9Even/9grLwj76uSvlvbWIM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnESG+9Flq5w+gHg--.17942S9;
	Fri, 17 Jul 2026 17:24:27 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH 07/16] media: s2255: Add blank lines after function/struct/enum declarations
Date: Fri, 17 Jul 2026 17:23:40 +0800
Message-Id: <20260717092349.684342-8-huanglei814@163.com>
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
X-CM-TRANSID:QCgvCgCnESG+9Flq5w+gHg--.17942S9
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw17Cr1rGF18tw1kGryrtFb_yoWDJrbE9w
	1Sgw1xWFy0kryY9r4jkr1FyrySva1UWF1kXFyvqF13Xa4jvw13ZrWv93W7A34qqFs7AFn8
	G3s3XF1xWrnrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0beOPUUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC9AtgV2pZ9MuGBAAA3G

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

