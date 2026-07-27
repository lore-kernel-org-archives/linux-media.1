Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8B140F8FC
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158124; cv=none; b=uaeGv1dhUOpZQmSrBAixLP8Ggz6biKuMtfpaPhLtzX17VJcFkhfl43lyws6di2bbD1JDSwypVdDsyOISIBbTfQV4fdGBQqcPSYZRC15H3TgeC8L2icpxeOne4ewnkyp9asyZ2xqc1vo6B5IYU2N1CqjERudwVzl0qqvPMvsjhsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158124; c=relaxed/simple;
	bh=9LPSi1MIsF6MNYAmfs/a74XRGkIeXiH8nurNaZM0kqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Miv4cEF4Ondk+ZG1+Jirv2XggGHijbyPFU8ILxuAzrw9fA7BI1EUgftggfgv0LerCTUOCI+mAUQaYf/+hpR5wDQS+/X9CKptxB5XISEX9KXOUWBGIfHjRQUJn3QQsQ2yzu6lMgrAcvUZ6S4jcqFRfqXyuI0qZ+mHG2893z5vmxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ec3hjKWB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ec3hjKWB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F031F00A3A;
	Mon, 27 Jul 2026 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158123;
	bh=Lzc0xl1aJywtDlbG6P4wQbMKMuK4UwM1Wb7EsU+rYp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ec3hjKWBVEXA1EUQxvTI6SNF8IDv68g+34z87YVtFM2+eTubkGvWlID5frTtcfBnT
	 IQs1pIgDnh01BS6VCz8/QssbhGZpWjhM7ATOg8Cq3nymfYkQZ4NQA4U6ZbhRgRlm7X
	 DY2N3UeLuOkkNB4N/AFNQBrA4d6cSyH2yZq1Pz8dosnFa/LXZU1m1NtSnjvX0JRqld
	 cQpIR1S8hz4iRvFhpbQtYAn+xpMfIxcKJuPEVBUJ74R5ZkIu71VElFqqd2M0GC3qV5
	 e7s7PiDeimFWA7TmJoyQS7BXtZg723vto7c3rL9O2cxzsRS5Hz82N92m5uQFM58+7L
	 JH30NCUo+8PBg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Ming Qian <ming.qian@nxp.com>
Subject: [PATCHv2 07/19] media: amphion: drop unnecessary vb2_queue_release call
Date: Mon, 27 Jul 2026 15:12:54 +0200
Message-ID: <ad98713850b578c4d304f2635a2c0a248a1ffb91.1785157986.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785157986.git.hverkuil+cisco@kernel.org>
References: <cover.1785157986.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If vb2_queue_init fails, then there is no need to call
vb2_queue_release.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Ming Qian <ming.qian@nxp.com>
---
 drivers/media/platform/amphion/vpu_v4l2.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 7cccc994fc50..af03cb82e9d5 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -684,13 +684,7 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
 	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
 	dst_vq->dev = inst->vpu->dev;
 	dst_vq->lock = &inst->lock;
-	ret = vb2_queue_init(dst_vq);
-	if (ret) {
-		vb2_queue_release(src_vq);
-		return ret;
-	}
-
-	return 0;
+	return vb2_queue_init(dst_vq);
 }
 
 static int vpu_v4l2_release(struct vpu_inst *inst)
-- 
2.53.0

