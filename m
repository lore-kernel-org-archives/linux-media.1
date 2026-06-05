Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DD3262FF8
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780674177; cv=none; b=ZwtgZT7FHjDs+DMeWs0vszQ5kBsUTwaYDhxw3C0NR8u4Jc5GpC10cXfxM5pOFSK5/mS802rTnF8ITIgcCmQr1IJrl3ZNbGI7s/QnOIjmkFEgng+XkNIG4xeoMjugv5neu5i9U/AKz+2zfhp35zEPfdVLpKkwcGzzWS4ChA4vrVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780674177; c=relaxed/simple;
	bh=YAskgcRC6xlIG9WLtneXK8hG9C15GuuVSTM1/jPvzpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCIIK2q0M2foMs0uOMwaro0NIH9Vla0JfEmKYir+a3u0Ix0Y+AZ3ejJS63up4meFSDwb0FnJQLUqQs56yyJcfKAN//9pRE+0pctZqTQBR+sLQNv01+Lf1sJiY/bMhTgbxTAHyHOXmf/Og8+ylYPa73ZDbzdCYldz4xi+KUSPIyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=ZbiVVBoW; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="ZbiVVBoW"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9156ceb55ffso180840385a.0
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 08:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1780674175; x=1781278975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jDvkiRMPuLtyk7kkNunkFVh4+WhfFUZFqxPcwQnozzM=;
        b=ZbiVVBoWi8anJrluG2/2rrSjS2m8p0UW3t5rDwuvnKoq1xkwM5pSxlG3Z+xMP24hVA
         YMKOeUZolx3hIplZXJQnyWo/QtOcvfRW9bggthYSE6tdjeFUFxM9mP2wBUZdTH9LgDV+
         OozyijGbBTe/ApzkPCGtlz7urwDGpJQ2nu1bbKGS8LWkuarHDA2hxbBFlTtRnphD+01v
         ype1NWAfmzsoX3JOGj3L6cqBc/58PLZezmBLziZdaU0WFPNv9WH5K31GM4sMsDkvNXjc
         IgbXk38X7USVx65fR6jkUqQizJgUNoxSlCWVZHdgWg/Ygj4yAn92PJnYLbrh7FWR2KGb
         CSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780674175; x=1781278975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDvkiRMPuLtyk7kkNunkFVh4+WhfFUZFqxPcwQnozzM=;
        b=jOLJ9BeooEZXlMOG8MBNgSanXzYeIWrGThuOoiLJPBgFySpLPlDxPpdFnPkP6GuGeQ
         3JywMCZMWxo53ZfaN3gnkZLZbQo74I/9XdASy1yogu0Cnf54LYs9ULwsnAGYMPRVLCGo
         HjhQ6HzlgOCrWHYd7ScTgyXiFN5729FVvZehOIzvtvTk85JORXEzAqQTiDE11Nyzd4FU
         0uVM5ZDrUX8WqKCY9IzRJmZfIEMjQGVQcfPi1LI/ZYA7cBhtgKB63aSXctOF25SyuJ0f
         OEo9sRw6/qZglhwG3aTkpI8mqtvTAp/WEmyhb8r8rYNf0II9g+LIm8i9hCyGXyqoD5lF
         XXxA==
X-Forwarded-Encrypted: i=1; AFNElJ90Q6atB/RCAMSIuMQ3OknC5BmsWbED+zhnTTCXkhxph7IQ26OQszcZgGaWj9mGPHcB6f/q/Tc5yDwgpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5cZkD/73pA5QNe7743p+yU7hZHVrqXhE9gY6wWm1m2mVa/JJ5
	VXmFEzVxSidjUcMMw0/kDEWg8cGHaxylEEtMivKf/agIQsqeLXqTXT76NI1SlSfUfwY=
X-Gm-Gg: Acq92OH/iBxF3vzFl+2lcBtWytwTemEPKBdvsLw6WGLSkqSx8P1xf9vJ5FyQH3bQG9I
	jJfHevfcoO4mPRbKA3mFE/6dV96UIL/WecXuLPExrH0JXWKmMMOmdWwsDq57SuHHGjphvAvTP1f
	1HmID258kb1ffQTO5BwmqlK25o/civ5xGBf/Km14GbsR/WLY9YTfI+1ZENaxFRaQJeeuw6r6nP3
	5QPSUrpqqRHG8avl61IMIFIbS0cTyr4f+74LhODVo2R6lV9OZEvBUyV1aEANrNMdsQD9IP1kZhM
	RRuG+pQb92sQtF1ZiXti+YjEIGChQVRvJDfAkRK3CUGpU2qcfNJAtNWDd5OOIq5oysOsHn8zI7T
	NKAE0MdK1BcjKEuXZ8lurPwU6ZPgz8y0dMeiqVbl4g/fi8DO2F2srYBr+kdqPAvwOq8IUSOOdFT
	8a8s/nAsVdClYYPXgeql0aIoJRtg0L7xToklriuQ==
X-Received: by 2002:a05:620a:254a:b0:910:db3a:7bdb with SMTP id af79cd13be357-915a9d888demr747343385a.32.1780674175256;
        Fri, 05 Jun 2026 08:42:55 -0700 (PDT)
Received: from localhost ([161.35.96.86])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-9158a37bae6sm927242485a.31.2026.06.05.08.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 08:42:54 -0700 (PDT)
From: Samuel Moelius <sam.moelius@trailofbits.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Samuel Moelius <sam.moelius@trailofbits.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org (open list:USERSPACE DMA BUFFER DRIVER),
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dma-buf: udmabuf: validate create-list count before copying
Date: Fri,  5 Jun 2026 15:42:51 +0000
Message-ID: <20260605154252.2125942-1-sam.moelius@trailofbits.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UDMABUF_CREATE_LIST copies a variable-length list using a byte count
derived from head.count. The list_limit module parameter is signed and
writable, so setting it negative lets a large unsigned count bypass the
limit check. The u32 byte-count calculation can then wrap, causing only
a small list to be copied while udmabuf_create() still iterates over the
large count.

Reject negative list_limit values and use checked size_t multiplication
before copying the list.

Assisted-by: Codex:gpt-5.5-cyber-preview
Signed-off-by: Samuel Moelius <sam.moelius@trailofbits.com>
---
 drivers/dma-buf/udmabuf.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 94b8ecb892bb..46b077639bfb 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -13,6 +13,7 @@
 #include <linux/hugetlb.h>
 #include <linux/slab.h>
 #include <linux/udmabuf.h>
+#include <linux/overflow.h>
 #include <linux/vmalloc.h>
 #include <linux/iosys-map.h>
 
@@ -489,13 +490,14 @@ static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
 	struct udmabuf_create_list head;
 	struct udmabuf_create_item *list;
 	int ret = -EINVAL;
-	u32 lsize;
+	size_t lsize;
 
 	if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
 		return -EFAULT;
-	if (head.count > list_limit)
+	if (list_limit < 0 || head.count > list_limit)
+		return -EINVAL;
+	if (check_mul_overflow(sizeof(struct udmabuf_create_item), head.count, &lsize))
 		return -EINVAL;
-	lsize = sizeof(struct udmabuf_create_item) * head.count;
 	list = memdup_user((void __user *)(arg + sizeof(head)), lsize);
 	if (IS_ERR(list))
 		return PTR_ERR(list);
-- 
2.43.0

