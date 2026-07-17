Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE39B3AF676;
	Fri, 17 Jul 2026 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280396; cv=none; b=rtOMtVrGZD3FQXpC6btoZIq7TsNSq7ti9DLTld6ZkTvJELIm4u8zerl01oM1DV28Axo+NGuupqbFQwWtbi8RO9REvPNto8Am8yfYBVR0k5FipY3wqjEXUYV5bAkoXUJAHZWR6lAmKWDuzL3/DM+Z8GSeOWI4b9Jeg5J9RIRS6gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280396; c=relaxed/simple;
	bh=L9b59ub7U7vA2jsU+rA2jb1l60AoLfgfFgfWdpjC79w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=phYLMgULbfnZXorqkPCZ+6CCRLJx7t6pgJX+PAqzdBO72EK5ORYle8XizHg5RRMSe9GpYHaAHQax3JkwRwolQ2zlePQM+wNiRrJQ7DnFCC1o3c4uPozo0QwBOvhc5Pd+BEhoaAVLUVMSLzwCmBxvOUrBVbcx3Qj6hur6Em+ycXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SyaJwJEz; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SyaJwJEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=pk
	Jen0AxUQ0BHo3CSaakkmWU9JfgQ0RR4KeRAuzZFkI=; b=SyaJwJEzLAtfoWT36R
	yp7G87XhgB9ioSXtJ+IXZn49RUdVGtsH5X9QL1G/OpgzcOWITDPRo60Ya7apiyw1
	DwBQog5DsJdh4wQLccGbtMM22kp8C5dWrK5ZmBMJz4bhc0P+CM3TNW4Umu3UOyjI
	N8WnKnHXeKUpB76/goFIb0APQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3oOw99VlqW5qhJA--.19356S2;
	Fri, 17 Jul 2026 17:26:21 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH 16/16] media: s2255: Replace bare 'unsigned' with 'unsigned int'
Date: Fri, 17 Jul 2026 17:26:19 +0800
Message-Id: <20260717092619.687607-1-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3oOw99VlqW5qhJA--.19356S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr18tr13KF4Dtr4UAF17trb_yoW3Zwb_ur
	ySgws7W3WDtr95uF42krWIvryjyw47uF1kuFnFqr15Jay2y3W7ZF4vv3WfA34DJFZ2yFn8
	J3s3JF1xWr1DujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbItCDUUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC8x19dGpZ9T2ChQAA3b

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

