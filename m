Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351411;
	b=ZMbH7FToBrWwWx5Sw+Uc9jfE5CzVfP+MK2oeiogoIvXwDqmmYGiVzdJNm66hlsBOViOM
	 iUy9iRr7m7fjyVXYAHL7YnI+H7dAOHaWpgUwMfQr6mBa2pbHxUYJ8LtPEfi9flEdim46J
	 ZVWfYPNO2LcTWHNlbff8tfx6ofXuSkq9am/NjoPbCWb38+Pch3RhFReJ5J4vs8qpF54R+
	 9wjkaCjbXxZ0ulPUqr54fyeaVLJTXqqPZ7jF5LTgg0yr17xX8VsDHriHRfGVSLyxFmzh1
	 XeFRO5Tm0R7OxInvQ2RfMR7D+xrHOKJ1Bgak9+y/mTWMcue6EauFW/yiTLjJgdASETA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351411;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=lsp96rurxc0p25j+OgOB9NZYhKU9SbPLfFcT+nkf59Q=;
	b=nTNuMK9peKaiODsn8t5WLbVQ2VRuOe2QzXI2DgyVPyhdx/oabXQaRX/W5pHxN38hKmIR
	 7sgH2tTiJKNJeD3fsMMYI0Nv6xUqgfz0prMIpwU67SOcVJn0UrEI0M/x/2IpNfwBMFa3K
	 0eopEnre+s0lfG/pWZpUJV6Mbd/Hya1zGVDYVJApUGsHjb0gKz5WOa+womYx5LAwjGC8I
	 mqypLwL5JjMjlsHWMSMCJtV6C8P2uhvSQ96BUwIeMO7+Jex/wijq7OdslSJ7nS/5pfdnK
	 g1a9pwMaJkmxlwKBRl9E55In66VTeZyPMsqokybpjsoyJdxZqUFIvDJ9kVsfeLcZVGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="qX5IkiU/";
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FED606A32C;
	Sun, 22 Nov 2026 12:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19FED606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=qX5IkiU/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ls
	p96rurxc0p25j+OgOB9NZYhKU9SbPLfFcT+nkf59Q=; b=qX5IkiU/6shITVkIWS
	zY0XM/GyzHh9uGgN2dKb6imYpt9fRWwthbeerBTl8sI0x3IXVKV6yWxO3TEGna2W
	noKSUbdXkU3OjpMi86wfEXusMyvtIvhlkXb9K9ic67uUZxxkti9EzzlR35pdBhoP
	G9K6pQY/KhQ2IjcO9ojnq1BUY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnD65R4wJrNbMuJg--.40259S2;
	Sun, 22 Nov 2026 20:42:59 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] media: cx88: Add vp3054_i2c_remove() in the error path of cx8802_dvb_probe()
Date: Sun, 22 Nov 2026 20:42:57 +0800
Message-Id: <20261122124257.1323416-1-haoxiang_li2024@163.com>
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
X-CM-TRANSID:_____wDnD65R4wJrNbMuJg--.40259S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4kuFWxKw4xKr15JrWkJFb_yoW8GryfpF
	ZrGrWYkFy0qrWUXrsrA34UGas0qanYkayxCr47GwnrZr1fWrWkXr4vq34jvr1jvrW8A3W5
	twn8t3y7uF47A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piX_-kUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7RNo1msC41M2SAAA3n

The resources allocated in vp3054_i2c_probe() is not cleaned in the
error path. Add vp3054_i2c_remove() in the error path. Also add a
goto if dvb_register() fails.

Since if dvb_register() fails, vb2_dvb_dealloc_frontends() has been
called, thus there is no need to goto fail_probe label.

Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/media/pci/cx88/cx88-dvb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-dvb.c b/drivers/media/pci/cx88/cx88-dvb.c
index c9cfceed2f1b..b94e4741fd39 100644
--- a/drivers/media/pci/cx88/cx88-dvb.c
+++ b/drivers/media/pci/cx88/cx88-dvb.c
@@ -1758,7 +1758,7 @@ static int cx8802_dvb_probe(struct cx8802_driver *drv)
 
 	err = cx8802_alloc_frontends(dev);
 	if (err)
-		goto fail_core;
+		goto fail_free;
 
 	for (i = 1; i <= core->board.num_frontends; i++) {
 		struct vb2_queue *q;
@@ -1792,12 +1792,17 @@ static int cx8802_dvb_probe(struct cx8802_driver *drv)
 	}
 
 	err = dvb_register(dev);
-	if (err)
+	if (err) {
 		/* frontends/adapter de-allocated in dvb_register */
 		pr_err("dvb_register failed (err = %d)\n", err);
+		goto fail_free;
+	}
+
 	return err;
 fail_probe:
 	vb2_dvb_dealloc_frontends(&core->dvbdev->frontends);
+fail_free:
+	vp3054_i2c_remove(dev);
 fail_core:
 	return err;
 }
-- 
2.25.1

