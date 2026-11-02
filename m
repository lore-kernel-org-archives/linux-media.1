Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616916;
	b=c6JGQ1kUufDzRvJ3RdxUOOn0XKXAybYOAyuKhhG2jB6YcxpiwXaNDvuj8HIFlR+JLTF4
	 /CZU2BE2Bl3VwZHnxf4eoqmyJSU6J9lzYy6lV948joAvCo4K42mpYnrwEK3Afzdfs2bXN
	 zOg+BHQIX08PotSSRJSc81HF7ha5YSIplZa9CkdP8Mfl4nIU3Yh0erjjQGJCjPUfFerq9
	 n/i7mVIM+xthtZgJ3rxEJ+R7FEOc9YGnn4BSjoRMSFYioMl7s+duf80+zPi+oaOsd7rj/
	 3Z6QqkBFkNKSj09+rhSEHv/spIb5a0Y8Uk/eXXisIMadEey60kEIPfQqJJ3uRnM4UYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616916;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0uC1lw4qr5rkQj5pdgH8BUM79En1tPMCwDHsh7HKEYI=;
	b=mZTI1NQqmdFmNht8BWyLPmKuOuWHQmBnWM250L5fynwpjNAL4Hm3Hu0OasN7ydnFLmnJ
	 xLPC42O8y3yddH86OCtm43Ft373AYRN9yOkxO9VTHO01+p1IkStsRgSyV7Pyu3WhZHr80
	 OOdw364S2b3sz/w80PyzC14cmFBZdFvGQiUeODjeb92dXscbgR7HbDQ3Ap+mqOnKPG45h
	 nwro9G1oKxuD/w9dFbzJHf9MOU6XNt/YjKZWT9FTtbrXTmyYGtzxBZbozp+ban4HbHoMt
	 HpB5vfeF8y9L4uOyMgvQRufaFcVURCiTwd7SZJT1IzIzBU/CGP0nU+tLuD4W3UAAKqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D6tQtiEC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856E8606A33B
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D6tQtiEC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5745F1F00A16;
	Mon,  2 Nov 2026 10:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616916;
	bh=0uC1lw4qr5rkQj5pdgH8BUM79En1tPMCwDHsh7HKEYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D6tQtiECwkCpSN4Q3tG38NPQNWg52qzMDiQ+k4OoBUGPOdDwYCOJbmUI8KzcVeAU7
	 ORcMpwNHWuqd5Q/a8YVRX/lAOM2FeU8QfZsaD8vstUMzjE9K736EUbi3iXDjeSwHYP
	 lDksV9+f9POLC88Hz16ZEMML4S4ObCz/gT23+JqpmDGh18g4W6zQM+hSR11ZB5eW91
	 c5qJmmqs+cGbAmxO3VTbAYrwpi0Pnk14VIEf2zF3MyTl2Bp6HiijqfWY7zMjnNXdLr
	 WaiAhA3q1UMTV4+lLTolWzDTNemmQiMPntCGYdY1jY/7O+GB0iQJt+L0eCio2hWKtT
	 BhrOluUo+sOfg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 13/13] Documentation: media: document cec_phys_addr_invalidate
Date: Mon,  2 Nov 2026 11:37:04 +0100
Message-ID: <37bdf75bef53988d3cfdd2caebe9cbb8b6eeb59c.1793615824.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793615824.git.hverkuil+cisco@kernel.org>
References: <cover.1793615824.git.hverkuil+cisco@kernel.org>
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

