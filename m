Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F3F3B71AC;
	Fri, 17 Jul 2026 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280282; cv=none; b=f0oTGFMEsz+oVl+sIjXU86IPNci7YVl6cG8R2i8lVt2D5ePcIPNEYU9Sr2O2IL09ua19sMBm58OWukI+cBUvwQ/d6KPxARrxvS0Vmb9pQggkh5te+w4mKpWPuV4KXmjjBjW9LJrkeQLCUQa0eBHfjUparj3GtH1QLoY037EQqfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280282; c=relaxed/simple;
	bh=dzRGBBdcRV9pFEaHBB6L1KYX9geo/tRkjlSW01786QY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JTeTDbbRNemd2KNuFmG/a1NYOFkisOWR5HApVJjF4gCQ9dAeTwG5wNOGQcpYQzyWGCi7S+RvxFD5ka1O+ITQgSrbClc1HsflsOEEslF+hK/ze7MW44gW9YmbFuGpmJIq4e7kA1tVZjZDzCwJALNqSG6QoU7UBIJxqREHMQs/bNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YlJ6Byim; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YlJ6Byim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Bu
	cxJunHYdfaz2vPFDEMTkXya3D0p0OPJTTD8Pugtgs=; b=YlJ6ByimmkicAn1TLS
	+8TzCPxiU6ElSSGw9DldcczpGWopOoEeOMAhkgEayJaBoR1yeN4SxOr7F2hrGZPU
	YeWTJvfoqrimQetMiOgHo5aBbax+wNx4Vc+0y++4I0EzQ2FwL72QsR0oE6+odpoQ
	QNwa4BhvarMcdCEYWKP9ZXbGE=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnESG+9Flq5w+gHg--.17942S10;
	Fri, 17 Jul 2026 17:24:28 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH 08/16] media: s2255: Add spaces around multiplication operators
Date: Fri, 17 Jul 2026 17:23:41 +0800
Message-Id: <20260717092349.684342-9-huanglei814@163.com>
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
X-CM-TRANSID:QCgvCgCnESG+9Flq5w+gHg--.17942S10
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw48Aw17Zr47ArWUuFy3Jwb_yoWDGFX_Ww
	13Zrn3XFyjkr15KF42yr1vvayYyF43WF18uFn0qwnxJa4jya15XwsxZw13A3s8GFZ7ZF45
	X398JFn3ZrnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0jii3UUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC9AxhWGpZ9MyGJAAA3o

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

