Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616897;
	b=Hk7ffNmrbjCe6po4Vv5r7VVjqfsUcSpD3ztE6nXGu95EluvcIvRXfKrPcGmkJ1+RuX/g
	 BHwuyg2VF3F1f1txzwBWWZaufFznIlA6X8aO66btyH6dO8xpD7tTeFfYPESSH3nhQzLqd
	 jakRDXl4crnZCQdpNiwo88KX2k0nhz1NTgONmM7FjmBiGq6eWQKgDI2sEuN5+wRrevu3f
	 4nmdqNJK9Z2EWALhCBbDmdovIWMssju0dLiZ7QGdGHuRqB+HOC+i5ChdhN11bybYfk/Sv
	 0d7qB/dXvo3vFAeMNHM0J2Mxn01Vbo4B2JD0f4ex9h+Pp47tUGBaH1PjWDmCDoPUdoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616897;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=MT5gGcOgqmHPEsENGl4BnV4A39kHKd2FN1i2XY47bjs=;
	b=Gf0DbPZht87cPDP8UX/RjuK4xez0ufqnx4ZIAb5264U+cqe/xRtmrZzqJRcBQM/2LP76
	 BXqOT7v0NGbKYyee8HB9md/WnJKuR7N+WBw0pC3UtgDxaDfCuEkytvOpuqkGsGDRxVwNU
	 00VOg0qDaXicubmn6NlyQVaVTInCqIUW2EEsT4CGXKLO5mlZwoqW2ew1md7WePc05TxaL
	 1H7Tjc8rY2y7epfUo/RKdKsv9IHSoT8gDMY0y2yKPjvwRJFBDjekJgAZXckm0DE7Hm1PB
	 vKq84aZb+u91m1CcPZnVvsev+XUR/YTaCLe3D8wM+SV26YlCO5tO5qFWug/TQa8H7IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IlN54pZh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19136606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IlN54pZh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FFA1F00A17;
	Mon,  2 Nov 2026 10:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616896;
	bh=MT5gGcOgqmHPEsENGl4BnV4A39kHKd2FN1i2XY47bjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IlN54pZhbpUd7ne8nVZlAX2gx4Ftn0/XDNcAR1mA0yPcgYT5J2DsHM4LRWLNMuZkh
	 5jwDLja1z+YDjhryc24Z/HG0p8rNMy3+eu9yDc1mL9W/PwBFYG9Ihnco+uJF4TxDDx
	 vHYH6GfD8tTVBxTq7K4Hjbnb2l19kynleqRufZCJXaQQLxoehWXLafBRgXwbI6uv8F
	 ofSQOaYqKttGjOyfUKDNlU5O7uqhrZEF5ShySb+dyzGrMOEgMITuzd0oKH5aiwOZY+
	 lJ6ZXG/7rDyNrEAbNluKX+OuokpguL6r33FMJofAq91AMwB7dji/6sM3bDSrWEl+On
	 nF/XQWJJE6k3A==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 01/13] gpu: drm: sti: call cec_notifier_phys_addr_invalidate if no EDID
Date: Mon,  2 Nov 2026 11:36:52 +0100
Message-ID: <86d6a90ff5131a4f6a1edef1d4f1694e65c5b6e6.1793615824.git.hverkuil+cisco@kernel.org>
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

If an EDID is present, then call cec_notifier_set_phys_addr. If not, then
call cec_notifier_phys_addr_invalidate. This helps the CEC framework
differentiate between CEC_PHYS_ADDR_INVALID due to no EDID, or due to an
EDID without a Physical Address.

This driver is one of the few that was using cec_notifier_set_phys_addr
on disconnect instead of cec_notifier_phys_addr_invalidate.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 7ba9e0b7ba6c..d392140df235 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -790,7 +790,7 @@ static void sti_hdmi_disable(struct drm_bridge *bridge,
 
 	hdmi->enabled = false;
 
-	cec_notifier_set_phys_addr(hdmi->notifier, CEC_PHYS_ADDR_INVALID);
+	cec_notifier_phys_addr_invalidate(hdmi->notifier);
 }
 
 /*
-- 
2.53.0

