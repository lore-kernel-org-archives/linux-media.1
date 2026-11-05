Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863655;
	b=BGBR0fJP6jeq2vdtujLRZphSZmpsQieSs16Nsxrih9asOtkr9UgRB7FivLakA9Csc2mQ
	 JgPNlmF0YgAE5ZIuiLfY3VUQfzLehN8+nMdTKODQk/xvCsdvUpYRlZCiFeUPUWvhsr2Gp
	 3RppjGsXmeI+t7pLTIEV6POcfyPRFwF3JPpnKcFYE/R8KjjsKgwB5+HSvwBCOfHrVSzZL
	 pB7RUWDxgXt9LCQKda3c7jiKIAzK7LjO1BFiMaZItURTbpW7ZMrpFHW4fRI6cgoVMCi7J
	 lVFniSK3DjiBLYhdXHiwpQs7OYr3NRE7YMKr0nzaIlGKBHRzfOZ3L45BJlOs1q1jsxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863655;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0uC1lw4qr5rkQj5pdgH8BUM79En1tPMCwDHsh7HKEYI=;
	b=lIwG41wOAQeZQtMXR2rBeWM1Fw61ATkUbGr8SbMycz9HmQhuXDN9GrwZbObVU5IKTUnZ
	 yYeaPKeJWtZZnN+5tAnDoiJztI3YJWXfFLEdUiy0I29GyTQ4Fehq4e7DgZ35lNv84oczd
	 5HkUpes1T1IH+fa0do+imn0rt5ybzRe2if3XsMSX6MkdV5YwTlYoFwUd1Agb+rBJ5xu/S
	 k9w2zygLrAVcb+syhhRoHn5UsX493cRolc34yK53zy4vXzSv0JLOapRVMUhOSo8onNMcQ
	 DNLxMCTM0Qz8BP6hVlJQz+QhnjrczHGVMDlzrGsBfa+8XCyNgCZkokNUi48n/nGfPRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mdezJJ/1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096FE606A329
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mdezJJ/1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24DA1F000C1;
	Thu,  5 Nov 2026 07:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863654;
	bh=0uC1lw4qr5rkQj5pdgH8BUM79En1tPMCwDHsh7HKEYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mdezJJ/1/LD4WSb1FM7EtL6dQsGocjEwRqdDvbf2ZtPgsa95F08XN6FJmVaVq5Uf0
	 heMz0q8X/VJsNb0toW8sJAAhjuOj/8C4pAO0/sZCd3J0iWOYlfaMp1YLXI4z6bN8N5
	 kZEiiFPp0K9qXwun/6jM4u+x1t6ZjekMzcx0UbFTEjtqiQm3WDdrKCzu1xLwZ1nI4W
	 XCEjiynp9PhtT0ARbeenQii5Ni1D2GUsym9CujOf6/6bWKG0+Q6cPF/ak5dd1RZZmV
	 h1+Jynq86mpEbThUF4m1QsTz9q/8MoqYxEcUSZhPHzHeqT4E45tGEyMC8kaYujil3h
	 TX0FSENSHdYUw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 13/13] Documentation: media: document cec_phys_addr_invalidate
Date: Thu,  5 Nov 2026 08:22:27 +0100
Message-ID: <728f2d90942941cdf349f4ac39f16d512ba690c9.1793863347.git.hverkuil+cisco@kernel.org>
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

This function was not document, add it. Also clarify
cec_adap_s_phys_addr, explaining that the PA comes from the EDID.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 Documentation/driver-api/media/cec-core.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/cec-core.rst b/Documentation/driver-api/media/cec-core.rst
index f1ffdec388f3..10927833992c 100644
--- a/Documentation/driver-api/media/cec-core.rst
+++ b/Documentation/driver-api/media/cec-core.rst
@@ -437,7 +437,8 @@ transmitted, otherwise just queue it and return.
 .. c:function::
    void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block);
 
-Change the physical address. This function will set adap->phys_addr and
+Change the physical address. Use cec_s_phys_addr() to set the Physical Address
+as read from an EDID. This function will set adap->phys_addr and
 send an event if it has changed. If cec_s_log_addrs() has been called and
 the physical address has become valid, then the CEC framework will start
 claiming the logical addresses. If block is true, then this function won't
@@ -449,6 +450,13 @@ then the CEC adapter will be disabled. If you change a valid physical address
 to another valid physical address, then this function will first set the
 address to CEC_PHYS_ADDR_INVALID before enabling the new physical address.
 
+.. c:function::
+   void cec_phys_addr_invalidate(struct cec_adapter *adap);
+
+Invalidates the Physical Address when the EDID was lost, e.g. if the HDMI
+cable was unplugged. Do not use this to report an invalid Physical Address
+that you read from an EDID, use cec_s_phys_addr() for that.
+
 .. c:function::
    void cec_s_phys_addr_from_edid(struct cec_adapter *adap, \
 				  const struct edid *edid);
-- 
2.53.0

