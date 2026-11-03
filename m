Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691629;
	b=A4NUvKuc5JUqWkWIvmCOUtT4EVLzWHhMceKdjR35KZ/AdMxKsJtWLaUIOoEJ2UsLI5Ca
	 5Sfvx0LCsCtKFoedd4CLajfs4yJh1IT9b6/K8q2TZ3fqzgBHx6qevIiazghT2OfnS5P2k
	 /62oSCKxxZkZSdmTpKzlB0SfO4QEqY9i5NoufYSIWmyBu+gKqX/uit2yP1kt/ffEtGrG9
	 NexYcf4o/9f0dPVEQG9lZZNaPT2qR6jRV9G+dnS1OByXfc8hhXhNksLAqKJHJKPbHmKSp
	 PvbhqoxuJ/Q9CH/atLNboKzIyQnxnUMtHgQS900dEVS5S+V8XWGMkCl9zaImYeMSmZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691629;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uSesaCAY+uIr3oSTEUZtMDZF+TzayUSuf5NedXKeA8o=;
	b=3HSDfBPtzOxrtdWH0MNsM5lKSm2feWNwEsh8t+lXHsg/Qs5g3370ymIzsV9LznjV/AYH
	 MVuE1Z+9jUkZOpsU4dCxSUTkh5Jok1ny0WpTvEANjjQLrf3C7nA0+cbC154pMl1MHJgpf
	 vLsIkmDCkcLD59q1rBfiiWrrbwD9GK546DIfialGY0mL4xdjNcZXU1EVAyf7KeeioxnSi
	 AQ/VlWc7kqkujRG70DlUZjVTdjgCwIKvma8S1fIpMk8BoAszbPOVm7ISZrfMHnZ4QvzCU
	 qrAX4RYIzhTMJcl8t8/2ZDpA+VoP0efyTT30PEPG+cEuX7dP2lys5O+s0wrmJDjvQnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwLeFBYG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C42606A32D
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwLeFBYG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036D91F00A15;
	Tue,  3 Nov 2026 07:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793691629;
	bh=uSesaCAY+uIr3oSTEUZtMDZF+TzayUSuf5NedXKeA8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RwLeFBYGtodHHrUssFLZPMfSjbxexqX/akQK/ibN7zo66jtcJ1GYgcnYbq2UHB1fD
	 F5miYHH/RxHnYb6E99o7GMS1gBbe3wlwFBJhJ2kRBaXbdk1pYXXBYMvp1ym3ki1cm1
	 BV14JoD0CK1z12X00cuEaxaQpkuWR2KyoIiFXyQwm8swztCf+oE8Z1eRoAE4hNc0yi
	 68KvlLOVv+R9CbiIsYmlkkqgsD/jhJ7RQheJhhmjAdhevG2q++lecKR7qLmPFAxgKT
	 P8qYmZ7ecfxh+elPTxTSXGZxa8dartsUBVm3A9oNU7WIAPC+Yb+moq6CKCV5qHQxJj
	 DvG/mCaaPPiVQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 04/13] media: i2c: adv7511-v4l2: call cec_s_phys_addr only if EDID is present
Date: Tue,  3 Nov 2026 08:31:55 +0100
Message-ID: <96a98136443ef4d8b2f5ba0cf5c9c15be03e7015.1793691124.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793691124.git.hverkuil+cisco@kernel.org>
References: <cover.1793691124.git.hverkuil+cisco@kernel.org>
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

If an EDID is present, then call cec_s_phys_addr. If not, then
call cec_phys_addr_invalidate. This helps the CEC framework differentiate
between CEC_PHYS_ADDR_INVALID due to no EDID, or due to an EDID without
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

