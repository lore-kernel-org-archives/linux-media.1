Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1A22E3B15;
	Mon, 20 Jul 2026 02:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516121; cv=none; b=u2MzX2NESbgysZyze9/RLO1pKsksW4aMDftmaKU9oTBI5aHYKM2vEBusCSIrWAeHG3+5CRjg3LhmcLtpCuEhJKTOJeJJ0tZdg1ZXUnQGS2wS/Smejt7LQO4LIv4YlRykp8e0tmKYva9BQHxeEADhdUz+xDLFMR0YbpdQPaGdkkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516121; c=relaxed/simple;
	bh=dzRGBBdcRV9pFEaHBB6L1KYX9geo/tRkjlSW01786QY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UlKF0A5IqP+ashzo0KBow32/sFfgYakeU+2WWiRQadHjfs+vnr7h0D+mKY+n3VxsIy2zujrN4rRjUKnlrFdtJnFMKPvBewtjFNwxRwXHz7i3Y8tZDuCiMJszfAbKJ0qQCUhcBlDjHfgaf5aVQUJM2fWZ2SLgWJGb9ec6eNHKeg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Cf7gGOyO; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Cf7gGOyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Bu
	cxJunHYdfaz2vPFDEMTkXya3D0p0OPJTTD8Pugtgs=; b=Cf7gGOyOoGctMLzHBw
	IR1IutfWVPJFcz5/8m9PDYcRjjSWhLTS1qV9YFRO+bvHmxcxw2OpVdqFTt2Z7ImM
	E6rTBsXVglBuwgGr64BATo45eBwgLdDxjqR/icRPRQDiZMn9qMv3KkU07OLjpWo0
	bkZISgq7+1ZDEH6lJ7CUudJeY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3v5rwjV1qaGtIJQ--.123S11;
	Mon, 20 Jul 2026 10:54:54 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 09/17] media: s2255: Add spaces around multiplication operators
Date: Mon, 20 Jul 2026 10:54:38 +0800
Message-Id: <20260720025438.207149-10-huanglei814@163.com>
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
X-CM-TRANSID:_____wD3v5rwjV1qaGtIJQ--.123S11
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw48Aw17Zr47ArWUuFy3Jwb_yoWDGFX_Ww
	13Zrn3XFyjkr15KF42yr1vvayYyF43WF18uFn0qwnxJa4jya15XwsxZw13A3s8GFZ7ZF45
	X398JFn3ZrnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0eRRtUUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0R6Ui2pdjf7NtAAA3t

From: Lei Huang <huanglei@kylinos.cn>

Fix all 3 'CHECK: spaces preferred around that '*' (ctx:VxV)' issues
reported by checkpatch.pl in s2255drv.c. Add spaces around the
multiplication operators in the SYS_FRAMES_MAXSIZE macro.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 3aa6270358fc..ee69492ba8b9 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -69,7 +69,7 @@
 #define MAX_CHANNELS		4
 #define SYS_FRAMES		4
 /* maximum size is PAL full size plus room for the marker header(s) */
-#define SYS_FRAMES_MAXSIZE	(720*288*2*2 + 4096)
+#define SYS_FRAMES_MAXSIZE	(720 * 288 * 2 * 2 + 4096)
 #define DEF_USB_BLOCK		S2255_USB_XFER_SIZE
 #define LINE_SZ_4CIFS_NTSC	640
 #define LINE_SZ_2CIFS_NTSC	640
-- 
2.25.1

