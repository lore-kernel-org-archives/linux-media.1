Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795349202;
	b=1Y2yHC5ILOmikKh3F1ZdJJHAhkvBDsHckO4mA3aedT+Kz5BpSAV1is8Ov8EsH/ItFACU
	 AgxuB1P86RacXkmDyWdOGBb5q67L1F8izjAE8IFaLYIORkmrykqvrHKc8k0dp2w8QJG1i
	 3bSKU3dnYUEF/xg2SkCOD9dAzYKarC5ay9YXf/bqtNYdefTRx4mtZUk0gJsxgVZ0eZ6oi
	 oyX/W6ExWP1j/+MBDGU0TksWszZ5dToBbx3mTx1mocDswBhHRqbOlJVh5NF63Rt81y8bh
	 UisKjk/H3/H7QuesbnzJUB7vKg/CmZc/ri/fsrvfTTydPNdwheUShUKXlXQ83ZkVAYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795349202;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=GeO4kiL6Z3KLET5LUIDnQt3EY/SFCFs1b1VqgbnZ/Lo=;
	b=OW8huOQgPqC6GMlcTHI6UsFE0FqKhSYhEQ/tkJKQyzE7XkZcSemQr6Jd4Tcso6soPZY8
	 0CIfIhvQESFxhiKf/mCbg+1bIij/+TuUAx0O7/E1hVy9ijM7QTU5bBxlMlvDUwEbVyevO
	 y2W1m5f5Rw4chqEK7QqJoqC/cwm8HMdDth4G+GYK6GwZmPTdLcL9cJsFOgglEQVBykZpe
	 QXhXfKSqbBM3+GTi9UmdRk6X+HWqJYbQAJlTK0mJEvuAsDewh4hT8my0WBja8g5O4BO1y
	 H16orJFyygTwt4WSbxCpIh64wqOUxyiFBKwIXh5EaA7jf3Xny7zSA0G2QYhVv6juPdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Lcpmktfp;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F63A606A32A;
	Sun, 22 Nov 2026 12:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F63A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Lcpmktfp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ge
	O4kiL6Z3KLET5LUIDnQt3EY/SFCFs1b1VqgbnZ/Lo=; b=LcpmktfpIAuN9CyB2E
	e5A1ax9VFNqE46G/l3u9isOi0bbXqQhag59+WCRU8DdnDLaerePTJl+I65EVqjQN
	PHahQJjwKkCNli6S4npSIAD6YUtNrFGjZBEaq1S8kgvU1TBu7f88cKXk0zHnLiZD
	2U1P9ay7v+1NsSyhgNJ4mMpuM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDHK4y_2gJrQ93uHQ--.31753S2;
	Sun, 22 Nov 2026 20:06:25 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] media: siano: Free smsclient under media_graph_error error path
Date: Sun, 22 Nov 2026 20:06:02 +0800
Message-Id: <20261122120602.1290257-1-haoxiang_li2024@163.com>
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
X-CM-TRANSID:PygvCgDHK4y_2gJrQ93uHQ--.31753S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWktF17AryDXF18CrWDCFg_yoW3trgEkw
	s7Zwn7ur1DJFy5Gr1SyrW5Z3ykt34kX3WIyF1Fka95JF4DZa9rZw1vywn5Xr1UZFW2v3sF
	vas0ga1UGr17CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtJPE7UUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7QFCsGsC2sEthwAA3G

Free the smsclient object if dvb_create_media_graph() fails.

Fixes: 0d3ab8410dcb ("[media] dvb core: must check dvb_create_media_graph()")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/media/common/siano/smsdvb-main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
index 415c24fbbb65..d3b76e4370bc 100644
--- a/drivers/media/common/siano/smsdvb-main.c
+++ b/drivers/media/common/siano/smsdvb-main.c
@@ -1218,6 +1218,8 @@ static int smsdvb_hotplug(struct smscore_device_t *coredev,
 
 	smsdvb_debugfs_release(client);
 
+	smscore_unregister_client(client->smsclient);
+
 client_error:
 	dvb_unregister_frontend(&client->frontend);
 
-- 
2.25.1

