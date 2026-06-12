Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62689369D67;
	Fri, 12 Jun 2026 14:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274408; cv=none; b=DNp1RKkD8+0NUjhVLxwBMfBUUgzHQP9xVIQ8VrPNyd/rHLU3pMjJb4x1v8NT3JUOAGRPtls9edoTTBf2/t95uEnIgX8gaZbY3hjrpneCAgF8Bcu5wFqvvm0FCjF+AuOZobur1Y52WSYYz2FKKu5v8PCOJFmwfCYGBdLPqX++zq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274408; c=relaxed/simple;
	bh=FABDxv4lHTYBByMlOCppusyHS79PePlZmwh5TvT0nmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iYMcDAr2Q9sTF6jIl6Ght7sunNrKuSknP6OH61x0gqWuDQP7smy72ofhrUobltumd7iDUfgHYbntcKrJofQm6sQy0MN93kmXG4b8Kd3a/DyS6dXQqS9SQUWyv4rr/5JJUZfsd6jxfawqgSo7Sju9+wswb1VI4w/QvHp8pEAQa7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FjDnNoxW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FjDnNoxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781274400;
	bh=FABDxv4lHTYBByMlOCppusyHS79PePlZmwh5TvT0nmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FjDnNoxWUT0sqITH/tw4NUUPDpyJUI8nnq4QE0kBG58+uQO1eHAHsP25Kqjc0Mfn7
	 LRdJ+6GjJk22ntO1PjgLjI4i1JxNvntoF6ZWPqFhHF1Dj/YOxaKdX7TQlVrRXODoRf
	 ca4455/KamvTOzAt/AD09zbcADdtiI7FlgMJedTQw40lMaQO9V2pmXAuPFkH0FcNtT
	 5OC/5qXBKse1SsbArBO64I6TNw9CqzWupR43vd+M1J1f5/xP6LVgi2L6r8I/jh0vYs
	 9Z/M1gc7MR2EGL2Lw8FzqHUFaZZFoYiQhsjaEMezoewxTJ8Q/iDlnxcH8oK2EVfV19
	 9bpJpdy1TrR0w==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 05E1C17E052F;
	Fri, 12 Jun 2026 16:26:38 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 12 Jun 2026 10:26:22 -0400
Subject: [PATCH 1/3] media: v4l2: Add callback for show_fdinfo
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-v4l2-add-fdinfo-v1-1-723211abc861@collabora.com>
References: <20260612-v4l2-add-fdinfo-v1-0-723211abc861@collabora.com>
In-Reply-To: <20260612-v4l2-add-fdinfo-v1-0-723211abc861@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Allow v4l2 drivers to add information in the fdinfo file matching the
opened /dev/videoX file.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 10 ++++++++++
 include/media/v4l2-dev.h           |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6ce623a1245a..3878fa2ff73e 100644
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

