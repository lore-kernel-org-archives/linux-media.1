Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCBF3F076C
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 09:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145697; cv=none; b=TzK00NO2wuuLycgRQBdZWf3mOfn3sEeVNOtXPGysSooUtPvzN7cTzPWycGBQP9tAxFhhZAYoU4hvRW6NmsUQwdIdy1y091eXqiT3/owBPdqSKdGfY5QdsypTqADNgs3A48JeytgHhZVq2jHSjZ0Ms7fhwv5DXnjG32SMCH87jfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145697; c=relaxed/simple;
	bh=eLqlD3qtchjlF0KD/n6EcQg2eMk66Ov9q2QT5k6bvTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sgc/Npni3EXwk65doa/guYj5hm3NTzQo/Hn0LdDmL6gHJPqBKQW8ZFbFxNfV2Uy8U5danP6pRUqEQBxmSou+mvAetdsN+X8BJZ50dG3gfmLOFCF9h00Sm3qzI/bgHmTHPS5DQ0C9B2h4w9KgW+dpCMzb+TUW9fw27HLzzMnr5ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uSPx68SM; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uSPx68SM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785145681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MAOX3PBa+I96kbghJeJUrurVPdcWbzZeK6vFgNO5e7Y=;
	b=uSPx68SMsOVazSGRSiD+ehwfwYfpFEOWV/C2ZLEdBNfCBoeHGQnhNounN7UcFH99vSSbwB
	xHKtfbGLitiwknJKAG6gawjtr2wfemQ6LYb+dWIO/IvsfedG5AO2dCHmTfrvka43tJubQf
	rITMy2Z+5mBTZhta9Wp+02G3qG94DUk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Devarsh Thakkar <devarsht@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	David Huang <d-huang@ti.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] media: imagination: Fix value clamping in calculate_qp_tables()
Date: Mon, 27 Jul 2026 11:47:30 +0200
Message-ID: <20260727094729.408762-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261; i=thorsten.blum@linux.dev; h=from:subject; bh=eLqlD3qtchjlF0KD/n6EcQg2eMk66Ov9q2QT5k6bvTo=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnpmobuLxT/zLAI36WwZb7sfc5UJtZJNVZuJWdPsvvd6 02IVNvUUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABPhOsDwzyrctN3u+Olp/bsZ UraZVdr1bJQwZbpYLvk73FlqW5HKMoZ/yha7tges9uOqyuSvbZ27/boMD8fzU2ecTn56ND8n62E pAwA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The local variable val was never clamped to 1 or 255 because the return
value of clamp() was not used. Fix this by assigning the clamped value
back to val.

Fixes: a1e294045885 ("media: imagination: Add E5010 JPEG Encoder driver")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/media/platform/imagination/e5010-jpeg-enc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 42ad9ee3993b..420cb8bfdb12 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -175,12 +175,12 @@ static void calculate_qp_tables(struct e5010_context *ctx)
 		long long delta = v4l2_jpeg_ref_table_chroma_qt[i] * contrast + luminosity;
 		int val = (int)(v4l2_jpeg_ref_table_chroma_qt[i] + delta);
 
-		clamp(val, 1, 255);
+		val = clamp(val, 1, 255);
 		ctx->chroma_qp[i] = quality == -50 ? 1 : val;
 
 		delta = v4l2_jpeg_ref_table_luma_qt[i] * contrast + luminosity;
 		val = (int)(v4l2_jpeg_ref_table_luma_qt[i] + delta);
-		clamp(val, 1, 255);
+		val = clamp(val, 1, 255);
 		ctx->luma_qp[i] = quality == -50 ? 1 : val;
 	}
 
