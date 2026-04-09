Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1CA3D4107;
	Thu,  9 Apr 2026 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742701; cv=none; b=pxQawypZouKx4cYfi0kh7S7Lg0sdv2tMew6E4Hz0mB9s1723pb3GiFLiuEwHhTqNGkUV8K2UnN08N+qucAAgtR71L6j8Wm2nxzlVZcwllExSgv7YN5rewGQBr9cjgoY+BJYKBtfH3aXgSr5deTmGN+mce0JGTtSqcO/fdYUULFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742701; c=relaxed/simple;
	bh=Uf3oawvhkOYDFsuF3t/kHZrtN6yz3uwa92uWH3g5zZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=shXA3ZOwE2JRqbc7SwfJuFLfINW+vMjURGHDpQbHZip3OEB3IGthvyJ8anArdRC7B8OYL8rYLnRt5LTbivHKAg/pQmQA3RSMJf4nr1SdAp+oDIQY1RJBCRGhGOqV+zmqPLmdNtlydGwDq5FVdrfYdf8OULbqJklFgQEi/kKFMh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jOsFp6YU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jOsFp6YU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775742692;
	bh=Uf3oawvhkOYDFsuF3t/kHZrtN6yz3uwa92uWH3g5zZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jOsFp6YU19b4d9Al8Ya16eVbiA5JsxqAJk1Td7XesbTO3lecWg/CaHDjV0z88Z+wb
	 DyGdSLd82ehcyXpESkkersjoow99twav8ffpVGSyo3ljejE60umkCJ9pbHze46LVhs
	 oxjOOr/1tbekHy8UbuabqjGHmFVtrRN3wJcra9WNgm9OC1T/V4Q0YOy79DOrQlMl44
	 3lMVLCTZyFfuGEWUpqiSDomLanqEgLF4fT7glpfMKA0b+hD3NKsbNNNTYA51Bg50BZ
	 R9Oqk6nhI4gqtPtVmYnR9TjTyP1CWvkNOO90zFU29Aey0SxevVZ1FuUg+E6VCQVF+6
	 wGCto+Wtu4K+w==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 09A3017E1313;
	Thu,  9 Apr 2026 15:51:30 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 09 Apr 2026 09:50:37 -0400
Subject: [PATCH 2/7] media: v4l2-mem2mem: Remove WARN_ON() in
 v4l2_m2m_job_finish()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rkvdec-multicore-v1-2-62b316abf0f7@collabora.com>
References: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
In-Reply-To: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.1

This warning was added because there was no way, for drivers that support
holding capture buffers to mark jobs done correctly without calling
v4l2_m2m_buf_done_and_job_finish().

Now that v4l2_m2m_buf_done_manual() has been introduced, it has become
possible and drivers can use it with v4l2_m2m_job_finish() for finer
grained buffer management.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 7f9fad4f6807..27f7dd7974b5 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -487,13 +487,6 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 	unsigned long flags;
 	bool schedule_next;
 
-	/*
-	 * This function should not be used for drivers that support
-	 * holding capture buffers. Those should use
-	 * v4l2_m2m_buf_done_and_job_finish() instead.
-	 */
-	WARN_ON(m2m_ctx->out_q_ctx.q.subsystem_flags &
-		VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
 	schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);

-- 
2.53.0

