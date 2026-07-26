Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CA82E7623;
	Sun, 26 Jul 2026 06:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785047963; cv=none; b=KSgeoKBw6W5tRwurHbjAxsadO9ztPrUIgA3gcr6BhTe5tTtTpKqKzvUpKqcFbIVHT1sqZn2LMyaaRYTvnQiL5Mt9PYerCRJLoaCzAp2yQ7zaChazoOki6adw1KYsS/eyXz2OJ2sLw/wievZNCNbvpVMajAsZiaC5CycMjKH55Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785047963; c=relaxed/simple;
	bh=NXhCqH8tHJ3Unh5kazoVaOAxEKyPUYJQ0yxBijqlhC8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=unSxOjw22arJVGWrej9m4dnuG1lpbWVXrpHq0AYSV6sPjGpMN2B/ffmRTgi/tVw639I7yS4URUhfE4z7FWXUMfjBKlbiM03fyGT/GNzqnnASYIvf1JeUynp2YxSCaCa5/ki72uSatjfBkU/TpNsSYKR0NLlAmq/8pdiudBXnlds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=GgmbK/m+; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="GgmbK/m+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785047951; bh=T5hU8qNF6Up6AhgpXdI57MB4pDQysX00+xHwXiNi8DE=;
	h=From:To:Cc:Subject:Date;
	b=GgmbK/m+hhC4BcIp5Tg4Pva+u1RNfeQm65JfH7Ap8CubfgpfLdG+B0gkCQfvlaEY5
	 dAy/SaxDvBn9Ltu6ocM7zupFBB2Qz1EPjBw+FZcdkJ7GB61PwHmA/ua5EBKUTkCDPB
	 ZgZLGRsaD/lP/W/ycGZuhUOpPS0jpSA1sd1fk2Fc=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8EA2BC5C; Sun, 26 Jul 2026 14:35:42 +0800
X-QQ-mid: xmsmtpt1785047742t2ooy1gea
Message-ID: <tencent_F163A5663D7C110964AC2EAF933720DEEF06@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJ9WXvdEt4xddUsgGzJXdxIg3IiSPDxni6LIp6a+x8nqG2KR9+FY
	 WQRChnnNWekMu4LVDoaQOJ2EkfdhbgTlP8Y/dORgEnsgEZR+DL+bTC4ELc++vsX5Z/tKygOyIkzd
	 mH53vbm6oZI8ocG6Lh8ObcJmWtmbQh84yK7z4ozMOwO/+xA5FPmwyidVxhEUqcb7Vhakq4bJcP6g
	 YEa5yhXnJCMrXXsnIGZNfBTmeXKphAwtxcpWu9D3PNXZ+pOc32s2oyJpGUfQ82mohZjrbo4nbU8C
	 qGDXc5XBW5C2dYz5aGT8/AKLuE0Hvw4F8Pdj0dWF95PWdyLjBq3dfMtjkixzhZCflzVx3K0SW6PH
	 uVxjXwHej1I8baj303Q4ENozhS8Z+74q4zQCJvMAfzQn7V+NfHcJxLBUbPLOzBAAEhw9NwpZQQzQ
	 eogslTnAaYYMZS1uQoYyZWFBDLhOGAFi8K/LuSSTJDqNmUv7Rap6tN9AXkzqMABjf29tnEaBfdGb
	 h6OjhNnQmUwxD9fM9fgQv7s0hf07PC0EZiJQtyEnGF53PhxH0SBvW8RgWLFwd1vGfs+XvNqHmG0Z
	 KzcLJN0meKn4UB4rOiUN+AvGSqxf5rhTqIxewOIen506J04Po+CPKRCHA9j+xA6LqMXs0YGzGPtv
	 HkJphEWJyNjnHrbpOaoxqo9dHvohNFqVV2RKXtaGZaJtb0NzPnGsBJlteWxMM1aP3CT9FlbccMnT
	 QWkWtD353EsVO/wd4aMHUdsnPTqkQVSlyWUecP9lOU5WuIzKTF8QcOEAyhtbY0Wcx8hJ/2cBdNBT
	 8Xg4MvC+OlfUbKIUPcghSx72VxxNkdg+3bn14BNddk/9MZz+HxznEJjBsaifq9keUxdVH0GNkkJw
	 mhnQZT7Fo8yH/04I/B4DT1nQSg4FADp9uror26NOJLWCi9Ja1XSw5JPfcusdyMmjZLnk18sonVZ5
	 l6lFKPGssIMfsgAchrdVVjPGpoONFranlifmUjBFEXZP1dwk0uRx0s1GlEBi/fA7Fpq+NvJsxxg4
	 K9TMvDgTSr0Pgee0VECbTtwlS9DMkRG/LJNS5ax6kbTPlIKaW+pVZS2ttdFbI=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Jiawen Liu <1298662399@qq.com>
To: Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiawen Liu <1298662399@qq.com>
Subject: [PATCH] media: amphion: fix runtime PM imbalance on probe failure
Date: Sun, 26 Jul 2026 10:35:39 +0400
X-OQ-MSGID: <20260726063539.1434847-1-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vpu_core_probe() enables runtime PM before calling
pm_runtime_resume_and_get().

If pm_runtime_resume_and_get() fails, it has already dropped the runtime PM
usage counter that it acquired before trying to resume the device.  Calling
pm_runtime_put_noidle() again on this error path drops the counter one
extra time.

Remove the extra put and keep the existing cleanup that marks the device
suspended before disabling runtime PM.

Signed-off-by: Jiawen Liu <1298662399@qq.com>
---
 drivers/media/platform/amphion/vpu_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index 85cc4a14f8ed..3192cccb7e68 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -666,7 +666,6 @@ static int vpu_core_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
-		pm_runtime_put_noidle(dev);
 		pm_runtime_set_suspended(dev);
 		goto err_runtime_disable;
 	}
-- 
2.34.1

