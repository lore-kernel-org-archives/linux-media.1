Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691643;
	b=m2w17Fj2Ia+USMNqvsNqXBdybUfDtAR1PNlDrx6V3R1TqnGA8Gf6DjsaahA6csin9b8x
	 RWByYunsazwjhuxm9fdbEuFZKyiXoV1H971qZXTfH59KgJaa57DxZprUwYfeD2Sq7KpTE
	 JnHudUW8F3b5H9fR28yc730e6sBnrXpF6O85eWYmORPfyzc09RY6F7HMPPajIhPov6dul
	 w+pIUfZk7+KEExWdA0pksFPwrmAYLKOlvLzVjC/IYx6isLVB9ayOGN6zw2qjkSYVS1+nb
	 EnfPZN9Sh2EaXhwN/hxRI1sdbhRvw88bzwBz+rjwPiRA6cER5Ot/Ya9InTUE2XagdXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691643;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0uC1lw4qr5rkQj5pdgH8BUM79En1tPMCwDHsh7HKEYI=;
	b=RidG9mcEqzw2y4HD5Sm0MVyDxFLL0EFJ84yLVuLiRjM7jmJVYboDLHOJ2P2e68VREzLP
	 RBAbg2sGjT3Sjoedd8W4UcjD2zi5s/CZwZFzGEx5t9ImCgqkcxNs9S7ail+ogfBJqlcfi
	 cUqneWiz6W6NXYBn4wasqffPuKRPm8E30IflbtCfWaLuwWrzqK3e4pLk6JTWcK+Pf1nJu
	 q9PBxlhRiWu9Ruy4TolBb0VM0YR2IK1jPOyg+LmjA35vggPgNIOUoJv/51ZKYv7DLd4Kv
	 tqBil3TsoKiLi9xL1Urhoyve0lDcdTlfhFJyM4jy4mD2apEjlIdOkM2LWWzmSeZ2vhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NbZFgDaY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16781606A32D
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NbZFgDaY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0651F00A02;
	Tue,  3 Nov 2026 07:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793691642;
	bh=0uC1lw4qr5rkQj5pdgH8BUM79En1tPMCwDHsh7HKEYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NbZFgDaYblxoncw7GZCgAgcdTGR9tuzthhNgyced6kjtT+9BOeWz2Km9HF7YvdfBZ
	 vp/eGfsR9GJlMOKzBSVc/WsJIna4YeUouY7fntPuszMtCV0A5sbxs5dc27sdAVo4bB
	 OW2f33tkcbDnQZAqkVt1vT2gpfoSgI6rnGsYW7lpmwWlWGbH22YyUgR/0kM9XiSGAO
	 AGukes2pLmAwNWGQfLZVXvUgJ5vjL82DDLt3NVs6ZsA/gZOWtSnn4IZOR2mQcF6UYp
	 Nk9ICqJEmhEBfcvmWkzIqY7BOHSQNnYa25Yl+nvNbGtTEqiYmHMRos+sMsN0C48RnH
	 pw7PtHXOiPqow==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 13/13] Documentation: media: document cec_phys_addr_invalidate
Date: Tue,  3 Nov 2026 08:32:04 +0100
Message-ID: <bb29997e210d7b5d513c711437194ffaea6f4b3d.1793691124.git.hverkuil+cisco@kernel.org>
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

