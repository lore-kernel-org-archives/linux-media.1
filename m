Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09C224336D
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 22:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781215529; cv=none; b=PykNvI9lNd5t649Tqoe6qk+HLADpcK0cnwXvI2tijd7mt9iV0LEbUylVS7nZLbgroAyy5kFAWukqv8KodQ/BhD6RwPXPm8MHUkhpDw7J3aILGka63ghQd1rFBPYERLLtBQORotG/aH3JAcPqnrIvFNmYq5w/Z8nNSbS7R+Ms5YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781215529; c=relaxed/simple;
	bh=eLqlD3qtchjlF0KD/n6EcQg2eMk66Ov9q2QT5k6bvTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nlD/BNFOXmmYEs9dVEZ37q7Roe6wvXQJ0VwdpdHQO03fy7w6D5W2d7g3A6prEu93waHQ/wQNux+XFIgGZTxBIKP145wfLpCB+iR2oeSQFmCjzURBHBifGiDeZVaAmUZDP4ayEcD/swdB+tKRPb1PkJBmyphgKw8yM9T1GbFIBdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rBff7kUN; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rBff7kUN"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781215521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MAOX3PBa+I96kbghJeJUrurVPdcWbzZeK6vFgNO5e7Y=;
	b=rBff7kUNWg19032Zpec+Nb1boZ7zz16GIH1P+tLq+MQTcCt19pER/83Lvvpaa2oYwTl8C7
	6rokywzxrUTZ/9Ismnl4uy9YdG2OZXvS9022PaEBK5zEcVmhEzNMe9Cm6Y7D3SNoh7VTHj
	2pjTOoK+wcV3h0eorObCkHrLJBCMYYs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Devarsh Thakkar <devarsht@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	David Huang <d-huang@ti.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] media: imagination: fix value clamping in calculate_qp_tables
Date: Fri, 12 Jun 2026 00:04:58 +0200
Message-ID: <20260611220457.465319-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261; i=thorsten.blum@linux.dev; h=from:subject; bh=eLqlD3qtchjlF0KD/n6EcQg2eMk66Ov9q2QT5k6bvTo=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnahlz2Bvqn363Qig/RfOcVuvw62+VElWuHfpzPnHfaR ftOjkVJRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExkkQzD/8RoLb3KhuuTGsRm tNatWFrWJjF96bKnc04Y/ft1mYt9aSQjw3FuH5+CVuej87UvBnKuDZYRcHa1stHkknYT4fPxjCr lAAA=
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
 
