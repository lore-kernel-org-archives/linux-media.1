Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619659;
	b=W9v1AGKycUDp+aN6X9EOHu8Y8ERKmfML484R00YfWJFcVfiWq+2SqSfW8hPff2iP3KPb
	 X7aTAZBP/BD3kSf+jDxY8klpX5Cs8YudDmKrelrbHpx8Wev0+Ar8Kp+Qs+k9e/CuvCeuP
	 beBWnn6Nh+xiRaGCdAudiJi0boQ9oNxXWLZSgkewEsPDyxYo4sn93UPg8oJdW6BK5jgMv
	 1zHGlM/Ts29R3Bg4dSi3Qmckm0DFcpg27Cmtl5U9pDKBRzqMAzqjhlQZMPgWPl3R17c8F
	 CvkSm7kNnOy8Y2KczXzREilB/ehNFuqt4/VZrc9QLUWhSnLMTgT9UqfZ4Pg5KgJU/0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619659;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=CPGHdi5hn3UUOKK1RE9pKHspisRxsJXHsd478u7KaXE=;
	b=18BpM4XZWKp3bGCjifyoHLoq5sCUHBG7IDOBfo8Co9Q5jYiVVNQ+c+zzc/zW9ZaiAPMV
	 VMVl2J6NRIOX55oXFXTWTmDPlapE08IO+vt4aNllEc1ZQe5EtxT9uPKP/KMZGvAd+Ojgj
	 5w7k4RnI4YIHjIm4HoPiYaxM8vmj8Rj+V0ILSTdcp8kdB26JQgr+p368L4CMKuLZJOhan
	 5JYUD6s91sEHM1LjZrnN2YXLn/1vsmyZisx2rvpD8QlbnnPV5zJzC83m9FJhf9cKQZGWN
	 TTnjbgUK365SJdoiI9jqmb2tK8jZ7aBISTK6X6249wS+yQjmqi7Wv5qs51rWyEvulYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SDpNnEOa;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CD0606A32D;
	Wed, 25 Nov 2026 15:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1CD0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SDpNnEOa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795619657;
	bh=5SVJit0opG7N0D4+Pi1jC59zsOBfQVNHBUgYfuYT6WM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SDpNnEOa9na5DUl++Ar85gb61ANlPHVYx0XxQJlY58/NX7wLvPymkux4kHvn+KUtF
	 yR/TXWJjlZAzJXZekBPON+buancX5p0XxP+nLKSBWPwhPbvcyq4TIpcIv3mhgp2K0B
	 YMIGjmF+o7/+lQQ2FShBrMUCwKpq4okoY3zIg94F1oJnkp8cGBUmNicBON2T99vZ1V
	 YxDIs5rg+UAwnuiACe3Wluiw/b7X+CeGdLp3FHFOwRRAn/ZNBZkkA1NldjPvxfyZZX
	 +pAjxdnZiJa/kkoY8WO/tvoA60rJefqOfylMW51ABskMJY0QEbUMmzj/W4XSmJ/3Fp
	 Dg57LivNcARmA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4A2317E00C4;
	Wed, 25 Nov 2026 16:14:15 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 25 Nov 2026 10:11:58 -0500
Subject: [PATCH v4 1/5] media: v4l2: Add callback for show_fdinfo
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-v4l2-add-fdinfo-v4-1-2dc73fad9932@collabora.com>
References: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
In-Reply-To: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
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
 include/media/v4l2-dev.h           |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index fd267fb74905..8a350ef3a9ed 100644
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
index 2e0f6d2e6a78..258b3e7a76e7 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -191,6 +191,7 @@ int v4l2_prio_check(struct v4l2_prio_state *global, enum v4l2_priority local);
  * @mmap: operations needed to implement the mmap() syscall
  * @open: operations needed to implement the open() syscall
  * @release: operations needed to implement the release() syscall
+ * @show_fdinfo: operations needed to implement the show_fdinfo() syscall
  *
  * .. note::
  *
@@ -212,6 +213,7 @@ struct v4l2_file_operations {
 	int (*mmap) (struct file *, struct vm_area_struct *);
 	int (*open) (struct file *);
 	int (*release) (struct file *);
+	void (*show_fdinfo)(struct seq_file *, struct file *);
 };
 
 /*

-- 
2.56.1

