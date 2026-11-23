Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795477440;
	b=ibRjY64BM7XUgApfqoh46WlS39UIYEFMCu+fJoYBW1aa+HoHYpOBMHYIvX3zP6SvjH8q
	 gEdPEvglToFL6kxFbmQxmH7KxWSPIu+7ifXYNYSK3VcUoeEeCGA0tW2tf/ZFZIXwPcWsU
	 JiTRS6OPzvIvukmfoFke9IhsFkF73AWSvRak0ndVRYWBREh81iyAH9ix5nQf5V0luZsL1
	 fYkSi8A7pYhfrerkIONATtFYWSboOwF7QlL/IIUMX0xDraCKew678p+fIIXLgNE8aUqAn
	 a7lK2X87su12ELgfn3H02KfS8bM1xC/SDOd+rUhIgtPpd643jLX9TmyVNWNnJUZq4ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477440;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fW2PbtR6vWsLKKn+6aeXG+mIk5+WO5RaNTszcSjQREo=;
	b=MSXetEuG+k1SCYt+cbeFPu++TfQetokeu7lcS9D5nvDOURt3r86iY0V4Fqz9kuV/H25y
	 F8PLb6yRBknPMBUGgmdIWehx6gvP3EdMmaBRWQLaV20OMvMcM7ylKh4D0+VgCgedRUzjX
	 Q3NCbYvHBzPcdxpNVsk2RjM6LruLS9CRweX3s6or75YPQIE1wQu0tKWVD2RFJkiR/3RA+
	 yanYIwEzns/1r43WTq7hluSxXn7SWuTUTIuv7zahAiQ/+UWPfhXVbx0iu3kq+WgRq3e+l
	 PTagYBKAF1C8oC7gb3mZcObRo5sYD1z5gFf4NOJiUCHzybTO+C/UFNYzaDPeZHyL7iA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MUckeh0u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57348606A31E;
	Mon, 23 Nov 2026 23:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MUckeh0u
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795477439;
	b=SL/+oyl4Q1wT+HpAu+aHDbIqigLyqNMmgjlHZRI91NM6Ft0z4M2nX+DumzarUA8Vr2cb
	 XSSxJ/1DL8G1/eGUMINXXX77hFOWIeYUc9kJzz3vUS3GlwqTDarH9yHuUG7Yk+RHdXyVQ
	 BHH0uNOXWGYOd0MeKSxUuCOdyot8F4dIYfTI9N2e+6ZWxq6yvpbBvr0WupiBmS0jVmnxO
	 tWugRDPwR0BpgsNd9cahkSqPHGalF9u4QDbYbX0NgiMQuzQMONwVzVizKFwNL4ETwNLbj
	 i3aKh4k1rPgamoEVO/NDTGkmt33801k4JIymV51suHejxeYmGjOIr9gjM1APrF4djsQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795477439;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fW2PbtR6vWsLKKn+6aeXG+mIk5+WO5RaNTszcSjQREo=;
	b=h2nkzvT1kWrFF9fkK7kNu+1BTIHb0RvDmVNXgHns/IMY2HV6wD7R1an7k743j4RnKD4F
	 fDfk/y54ijJpKJw0wRhguzO5GktKsC0jUO+h1vqyDQPPUD2SfpPgizqVCCfry8tGZKsnW
	 l3Rl6599gPMaJEcGSVK1a4WZyDatFqDHTgC9yJwP2iFbVXoCPy8M6VELv3r99O7kLT98w
	 b/7CvjD5H/fwWxPlmHYvzABCpKEPGviWSaZiGcFaSHOl9s7ZcAnx25R6fGcGPzFS2w2Yr
	 N6d8V3s6BYjM8Uyb8f+U7lpQDaAqQk8miCj0Ll3YHmOvcQ230DcUw27+CV/+8fcWI0Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A1651F000CF;
	Mon, 23 Nov 2026 23:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795477439;
	bh=fW2PbtR6vWsLKKn+6aeXG+mIk5+WO5RaNTszcSjQREo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MUckeh0uAd3+1qOKkaWhNfEsswuhE6k7UnNiSj2ELCDX95c41gixaPLyRQUxPqqy4
	 xYiDlNAPszq26bU2LiZfrWMpxpStUjO9KAcz0OYZg2df/r9vsIERc+braEDYtGL+aw
	 3kpkfANI+zYMEwkN9QB8LFIvtB10GAdi/HhaPKrT7c/PwylyXCHSLoCHE7sbHpOyLm
	 LG7WTbbKtFyzN3kNtM3aQlI64Eh3CM1YGgdOc6zwaOf9p9VHLWE0nseTi5jg1LfrxZ
	 4z/dzgCpDsnYepbKTt9oLwwkpjKy8aoWWTi3Btb752e7SdxYPQA+SS0wQnSFZTyVK5
	 +ZNEfZPOFSkBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 81AD74C7D5;
	Mon, 23 Nov 2026 23:43:55 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 00:43:53 +0100
Subject: [PATCH v2 1/5] media: qcom: camss: vfe-17x: check status1 for RDI
 SOF interrupts
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
Message-Id: <20261124-camss-fixes-v2-1-231a5523cd59@gmail.com>
References: <20261124-camss-fixes-v2-0-231a5523cd59@gmail.com>
In-Reply-To: <20261124-camss-fixes-v2-0-231a5523cd59@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795477434; l=1156;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=cOiMu0UC5T4AI1Z+1+u5gsRxJCQQU4nb1DclNNfn4hU=;
 b=mp2gnYCC0fI/ea3Kxfoad5BV516b2ZdYsi6fZHTwz29ZKP9gKAPTVj1UyvKjEZ77UOJxm8FJ3
 u6/G9VLQ4HiCoaZjWJNHpJ4doT++GDmcH5wy3V/cxK5m2TAAcYs0eAv
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

In vfe_isr(), STATUS_1_RDI_SOF(i) is a bitmask for VFE_IRQ_STATUS_1
(status1), not VFE_IRQ_STATUS_0 (status0). Checking status0 instead
tests the unrelated STATUS_0_IMAGE_COMPOSITE_DONE bits (27..30).

Check status1 against STATUS_1_RDI_SOF(i) as intended.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index 62c2405..502a0d4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -356,7 +356,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 			vfe->isr_ops.reg_update(vfe, i);
 
 	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++)
-		if (status0 & STATUS_1_RDI_SOF(i))
+		if (status1 & STATUS_1_RDI_SOF(i))
 			vfe->isr_ops.sof(vfe, i);
 
 	for (i = 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)

-- 
2.56.0


