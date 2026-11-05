Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863640;
	b=aHpV3j9iJjhZq4mk9ab/vyTZjms3aNXO0LK40xtyBmBk0ie8Zg8nxLE4n2n2oEcS2nw9
	 djqjAndQZ+iGrE0NMLW1JuVIcJ20k5FrlgyE0DAcaIA3+1Bf23iP11ScyGFp5RyoWB6bq
	 x6geKu5MWE7ygk9fkzyMpaSYpn6XsjcwbwmkF82nmbeKRl8jXXzXyCyf6L7HZwlbn2qcV
	 j/jg+IJDfifAI7ku2q7aswC51Or7ZEelgtdMnp/LigmV9/pWEtM8pp77qkCtz5ZZ8aV6Y
	 dxvjwMBAR8o50M+i6zi9ELLXOYq3OdxIZGJW55zD+dBDJv6+rB4lc5l9Wrzu8CpUxqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863640;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XW1hfOBekE3EcvxrQhE+hUzj/mrekKHKJO0G8mpW/os=;
	b=zHevFlMmy7ifqOcLKp+guechI64sCucuyWivW7QMIVi6EYME0AGYAsJjPYMFCxYcwhWf
	 alnw1Gu+uXkjVpq+QUQX6HI/W8/i4ruwBi3r9S+KB9J8LqKPj5pvwVjJidu0rbPh6hjnl
	 AjwK33UOJ98XvdOeJrZGKL7AM3IoZAN6W/XrMTroa2WGspFS40H8gYsxpmn9jNsFck73k
	 41BCXSlGg+u4qig6TMnmSg29YKSnNJEqwrJF06O8SJwzZObi0S0Qq/67sgce/pZ2zv89F
	 ZWgraiXoVzdKD99rxD7eBcePzEV2F4+e22r2aaUlPq4TXaERkDzTaUTFApQCLfywSTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bj1lIcs9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5F5606A32F
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bj1lIcs9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6281F000C1;
	Thu,  5 Nov 2026 07:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863639;
	bh=XW1hfOBekE3EcvxrQhE+hUzj/mrekKHKJO0G8mpW/os=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bj1lIcs92E2A8VTpK7ETE9rlJ0QrLsGfGa9iBxrVsj+nFO2s0jakXufBRr+M93c53
	 3DgkTnPMKI2FwIcItpeYaZZ7NsdxBwt87N5jqJzBdG0tdbAIeUWfibYVtYaS9MQVCW
	 /SFWQR0Ot8idOyRIgeK644qInlOsmPc5drUg0sreZzT77rByK0u0ozMv17dcG0cSj0
	 rSKvGwOuUcEo9ClFAEFdVfTYCwIKsR8ttzfM9vVoflg0dRDOh8xT3ObkMEZs8SGFiw
	 fsOubT8Remdq+fW4NNJatRJ4kIIPzDQhb9Zrk2lWvFgJ07Y+zCbgoXsuesORPlhOvj
	 P5zgp944ky6iA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 04/13] media: i2c: adv7511-v4l2: call cec_s_phys_addr only if HPD is high
Date: Thu,  5 Nov 2026 08:22:18 +0100
Message-ID: <5abd97090aae61138be64e923c92364ab0927470.1793863347.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793863347.git.hverkuil+cisco@kernel.org>
References: <cover.1793863347.git.hverkuil+cisco@kernel.org>
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

If the HPD is high, then call cec_s_phys_addr. If not, then call
cec_phys_addr_invalidate. This helps the CEC framework differentiate
between CEC_PHYS_ADDR_INVALID due to no HPD/EDID, or due to an EDID without
a Physical Address.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/adv7511-v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 27e0e2c31dbd..1cc87049c6be 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1466,7 +1466,7 @@ static void adv7511_notify_no_edid(struct v4l2_subdev *sd)
 	ed.present = false;
 	ed.segment = adv7511_rd(sd, 0xc4);
 	ed.phys_addr = CEC_PHYS_ADDR_INVALID;
-	cec_s_phys_addr(state->cec_adap, ed.phys_addr, false);
+	cec_phys_addr_invalidate(state->cec_adap);
 	v4l2_subdev_notify(sd, ADV7511_EDID_DETECT, (void *)&ed);
 	v4l2_ctrl_s_ctrl(state->have_edid0_ctrl, 0x0);
 }
-- 
2.53.0

