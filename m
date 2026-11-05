Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863636;
	b=FOGHs5H8yEPnEfK4LAm5IicmW0mQ4vH0qVrObFXGebG4bERf7OtSdQLTQwqoclBt/Vwl
	 4lT/h8FwVcNT1E1jeEUsMbPctIeb5lQOLe5rdDIpgO/VfE7UNLKodYNiKfQBAw6oY8SVT
	 cUcVTnD+lwHZGytV+K2bblZe7wwpoPo3YsPxqcDaibQ0IlwY0xJ13iDhqrmzbmeey23gn
	 ysmWU8o8o7XIdVbaap+a56szGboxnh9eGj50Hnp9BIETEAbsW4yx1KMMbzL/pNmd0gTl8
	 ApEFNDXcno6aS/bdeDkaI79Rv4Lq4rlz8u5nx5wREl3HqWaqC4pXS7I7g8BpZNEG6fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863636;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HoQSRqfIYqOgLi8XZHfv0mjjaYOJ1yDtBes6djU885c=;
	b=l6dXyYeQZhgIuK1pF1EvxstrA0xEZCDAObGp1QlOyJeWGVSF2bxHrTAwhcskvpBFp5UM
	 QMJy5sOUG1tCEFkP+B7zXdqcrr/GwhDLFAYqD6XZKJiZ4KbLlL7/udxb6l4NM3UluXc6O
	 DJ06JfeQe0JOYPR3nurUuPpUntEDjSb9AZyfpJ130TmpjnC2UflmYjyRbi9EPQx0+U1+t
	 sTSsT6/mjSaIcVzp+yE6U2+Bk6yfEtWhsRGDO+j3mLJ6j+btr0tDchHmFY+ysWsTTmyDn
	 xqflgoWpWy89C8e/z+hhpubpdE3vjmVlMGx/ymYJ+iRq4EzOBBemyEg0CQnv+kX/Zng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CW03zdj8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C0606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CW03zdj8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C2E1F00A15;
	Thu,  5 Nov 2026 07:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863636;
	bh=HoQSRqfIYqOgLi8XZHfv0mjjaYOJ1yDtBes6djU885c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CW03zdj8MeEJIWWk1xlof4nIHkkGPw1ul6DVk4+mqlHQ/GKPe+u9wFStzAJaWXXlK
	 mLLFTPBkyxYd+nG2eztJhQPDf8CD/3do7DMqJUEVIv+OwseNXvaTJCfc0nsl+mmn7l
	 Ob0ZjL4WJ7sKnDtxd4uZk+caYGmykcogtO85X5H8dT4PwVYU22z1IVoKzevyJy38OX
	 PZ8m1VB7klgLjqzOYgsTt3RLdPBJSJw67OIfgRFvPcy/Sa1qOLN2AfV1HK5XfSsJxS
	 j9H/apafPegn7I/sWd7NuWJpPKqIKOnAT3KnwiWIV/rNxnpoStS7DnFHzSVE2Vvgq5
	 Kmh7i+i1d2mRQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Inki Dae <inki.dae@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCHv3 02/13] gpu: drm: exynos: call cec_notifier_phys_addr_invalidate if no HPD
Date: Thu,  5 Nov 2026 08:22:16 +0100
Message-ID: <5ee88620981fe6e99d6a512c6d7491093f3da2ae.1793863347.git.hverkuil+cisco@kernel.org>
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

If a HPD is present, then call cec_notifier_set_phys_addr. If not, then
call cec_notifier_phys_addr_invalidate. This helps the CEC framework
differentiate between CEC_PHYS_ADDR_INVALID due to no Hotplug Detect, or
due to an EDID without a Physical Address.

This driver is one of the few that was using cec_notifier_set_phys_addr
on disconnect instead of cec_notifier_phys_addr_invalidate.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 055dc04f9b3e..d03f4e531e05 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -857,7 +857,7 @@ static enum drm_connector_status hdmi_detect(struct drm_connector *connector,
 	if (gpiod_get_value(hdata->hpd_gpio))
 		return connector_status_connected;
 
-	cec_notifier_set_phys_addr(hdata->notifier, CEC_PHYS_ADDR_INVALID);
+	cec_notifier_phys_addr_invalidate(hdata->notifier);
 	return connector_status_disconnected;
 }
 
-- 
2.53.0

