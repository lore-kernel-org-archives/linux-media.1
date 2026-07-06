Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8182385D83;
	Mon,  6 Jul 2026 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345352; cv=none; b=OUXwBXJdvyPgLkU6OHDbqz9d9idfLaHgFjcfLps2J30F2Fw+FK5N4v1a709FWz/sF3nvRsKdAMVRLWAH9kK5oj1fBy18pzLU3dfYrExknqybTqiYKAWzLYf3iRfTXNM18g/9aBLeNqpLXRPwCrV4y0utwNYHUDwKl+jUF7AwkyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345352; c=relaxed/simple;
	bh=WOdI6liJJoliaIn+JO2tFPyTbcueg6fnE6bGqwExDF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KfVlXLuMZyXsZv+UnoxtR+cILdgdgf4w1bekXUApGw1UDbx/ISomdxrO1/XnqVyP8FnADbRNsuMasagyo4p0mYyW7phH585VfqqVMSdjj8bj7dgeBzxtAFy5AUJrV1tpQ/soSR+C3Fv5xq5f6qFrA8xVGGuR7P0LOdrjT9Hy0uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T7/Tab6X; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T7/Tab6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783345349;
	bh=WOdI6liJJoliaIn+JO2tFPyTbcueg6fnE6bGqwExDF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T7/Tab6XtaY2R0En3PJVbZoiPJ6Wb7Z4a/14NF9gxL0PDfxKJdBl+dvVZjTT1yFrp
	 Pkdnxk3V8i+ElVFAKAFe5o5t1juVExh7AJF5k05fjFxXCy3E3sYPUMnJkF7V8Vu+n8
	 tMtcg2a8T9dV3qMecTiguqwvZK5qVFNq5ygbgaDmW0ypiN2nyA4Odabo+dRggOPO66
	 o/CYsb/kJViARCstN/upytQUHDvzfLCECQxmPjctmGRWoM227dzZ3RjdxZZVJJURO4
	 8Ycp121ntL33SMINjQimbiiY2Fz8EtsSC5OPTMn0sWV4h7gjLN8LKmcU3ZAkaER9IS
	 cCDAovKzhfBlw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBE3417E0D6B;
	Mon, 06 Jul 2026 15:42:27 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 06 Jul 2026 09:42:18 -0400
Subject: [PATCH v3 1/5] media: v4l2: Add callback for show_fdinfo
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-v4l2-add-fdinfo-v3-1-d556568cf38e@collabora.com>
References: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
In-Reply-To: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2

Allow v4l2 drivers to add information in the fdinfo file matching the
opened /dev/videoX file. The core prints the standard "v4l2-driver:"
key with the driver name and then calls the driver's optional
show_fdinfo callback, added to struct v4l2_file_operations, to let
drivers append their own key:value pairs.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 10 ++++++++++
 include/media/v4l2-dev.h           |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 5516b2bbb08f..6de85de0fd76 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -481,6 +481,15 @@ static int v4l2_release(struct inode *inode, struct file *filp)
 	return ret;
 }
 
+/* Override for the show_fdinfo function */
+static void v4l2_show_fdinfo(struct seq_file *m, struct file *filp)
+{
+	struct video_device *vdev = video_devdata(filp);
+
+	if (vdev->fops->show_fdinfo)
+		vdev->fops->show_fdinfo(m, filp);
+}
+
 static const struct file_operations v4l2_fops = {
 	.owner = THIS_MODULE,
 	.read = v4l2_read,
@@ -494,6 +503,7 @@ static const struct file_operations v4l2_fops = {
 #endif
 	.release = v4l2_release,
 	.poll = v4l2_poll,
+	.show_fdinfo = v4l2_show_fdinfo,
 };
 
 /**
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 2e0f6d2e6a78..1635ab186f21 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -212,6 +212,7 @@ struct v4l2_file_operations {
 	int (*mmap) (struct file *, struct vm_area_struct *);
 	int (*open) (struct file *);
 	int (*release) (struct file *);
+	void (*show_fdinfo)(struct seq_file *, struct file *);
 };
 
 /*

-- 
2.54.0

