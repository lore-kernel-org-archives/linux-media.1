Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE612EAB82;
	Mon, 20 Jul 2026 02:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516136; cv=none; b=b0lgft23XjHbPvc1nSAkik9ZxlY6u/xscXm28EE205BKNS4a8a+m5vmGcuj0K8bg9PuSFxkPuvyeAh3eFQi++BGR8OBLbZeRjaUZy4vCYovPQ4QF5FJeZ4SKnFZYRFqtVmQThRA2h1RbNRa/EkneQvcc1EEmGYNnCpaRj2qkjAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516136; c=relaxed/simple;
	bh=L9b59ub7U7vA2jsU+rA2jb1l60AoLfgfFgfWdpjC79w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=usBExNpu/zAd0LOQXr95uW2LPFl5hQSqtINDTmTEKlvuaaZ7PhnxOtcLL8dN6T0gK+zICJ96RadgeSP6mQ3gSUtNMZF/p3o0ivqXhZg8FDtq5VHiOHFEr9n2Ws1hg4k9efD1evvhM4fNd2L/nJ5zpOP/4ou+yr1m3583FxmO1NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cL9FT7QT; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cL9FT7QT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=pk
	Jen0AxUQ0BHo3CSaakkmWU9JfgQ0RR4KeRAuzZFkI=; b=cL9FT7QTLEaCCV38AP
	nIVj9D5UDeoUPYy7Pu6wXlnNYwR+YI+Ww0s1FM+Gj/zS07X2F7hzjtQETWECCByv
	5aqM+wEUlCkQH/q4XSCoEVhG1ZE0Q+Ff4yujTy/PNoL8JQF8hY/W6jbII0+6XBhD
	zjpFh2aB6v7XbdTyBu9hAKPkA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnZIkOjl1qWxR+Kw--.19016S9;
	Mon, 20 Jul 2026 10:55:15 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 17/17] media: s2255: Replace bare 'unsigned' with 'unsigned int'
Date: Mon, 20 Jul 2026 10:55:08 +0800
Message-Id: <20260720025508.207815-8-huanglei814@163.com>
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
X-CM-TRANSID:_____wDnZIkOjl1qWxR+Kw--.19016S9
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr18tr13KF4Dtr4UAF17trb_yoW3Zwb_ur
	ySgws7W3WDtr95uF42krWIvryjyw47uF1kuFnFqr15Jay2y3W7ZF4vv3WfA34DJFZ2yFn8
	J3s3JF1xWr1DujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8jXdUUUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC9BSakWpdjhTMqAAA3i

From: Lei Huang <huanglei@kylinos.cn>

Fix 'WARNING: Prefer 'unsigned int' to bare use of 'unsigned''
reported by checkpatch.pl in s2255drv.c.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index c66cca2e76dd..68cc4ea5b459 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -210,7 +210,7 @@ struct s2255_vc {
 	struct s2255_mode	mode;
 	v4l2_std_id		std;
 	/* jpeg compression */
-	unsigned		jpegqual;
+	unsigned int		jpegqual;
 	/* capture parameters (for high quality mode full size) */
 	struct v4l2_captureparm cap_parm;
 	int			cur_frame;
-- 
2.25.1

