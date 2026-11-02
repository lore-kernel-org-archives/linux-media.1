Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616900;
	b=K3D7fICrhLINn6cHqYReUN5yZoQ2XcC4Ta5+wSSwFgRNs8A0F6THFF2rPoHY8z3jYzlj
	 5BWdbqQ0caHS3yPoUbHNKfAUfTVkWX7qqc1Rh8bBYST3t8rLu6DieXiX1W9dNFqdBXZYY
	 NHzREWnmmeW4FCO7HMK62CGWezQu4xM6dyuVvK1Qtp3cRIfAwTxS6eLeYYPmwxj+VEgIz
	 opSnUPaNzYYpg+XtktbhxiUTpg4fcBZ8I1aOinvNk8LaahuTr2bpJOoEJ85EWsHEKN/XR
	 9bzfIbSQtmT4KKGSec23ERnYdvwAClz8YaktpBCelE+EgqnY5xbUjDlsXm31SNuE6Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616900;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=c8V9WqB9aQgta0XAH5FjnMzK6loax9fei5rQGTIoZqw=;
	b=slDW4usBRNxFxiZSakhsNvBpOm2hC/UPCtmMlvXl87ZQ1DzAi3ounbrPNoLAvl0KeXLq
	 ifhfeS+WdGNv2Tl2PJ9a7LcpmcfZQfMR1nL/uG+i55CG+WxvW20WV0KM1mP3vxXdtSVYc
	 awbuY9EoWlaO73Qmc3VGSyLyva152WRdR2UqN1SKZDwA7n2Jv87clHqNfSlqxX9ML0GwF
	 T5K52lDJhq8g7ZREgfAsxQVnO3GcY0GTq/D5zKylJ76y+54q4etTF0VPn7T46zAPfffPu
	 H+fnOZkkwn4q3b3fL1AErRKnFY8Rjfw4VSm6V0DMPmwjpDhFmXKKT90BOz3hOPiF59A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Abl25Kjt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8D1606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Abl25Kjt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221961F00A16;
	Mon,  2 Nov 2026 10:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616899;
	bh=c8V9WqB9aQgta0XAH5FjnMzK6loax9fei5rQGTIoZqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Abl25KjtgjcLbxgCMDYwxSKbDp1Acm6tPfXYKPEMlRJsIsGzlfjMlNRXlzIw9KzS9
	 SVEiIrtXM5xbw/gZHRah5Hg9e4XIcitJxeYwv63nQAQnGWwdhNPt4HHYweaw7vEW3g
	 zPhzoEqAjnpll7goi4EV+DOibE7PPx8yaHNo0QfQe3bu8hDIo6ajjUzxeG1czVvsOZ
	 jwxQFOU2EctyF0jKeUAW+aiS1vsOM98A/xkjt03ZmYQFAsRnnw6s9H0MK/+4zp/UUq
	 0ynYQRogVEXFKWPxSVITCCO+SRbfecRhqImKUSA4LTuICek5h2hOTzd4eOdxEnZgtP
	 VKsqoCH9+27yQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Inki Dae <inki.dae@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 02/13] gpu: drm: exynos: call cec_notifier_phys_addr_invalidate if no EDID
Date: Mon,  2 Nov 2026 11:36:53 +0100
Message-ID: <727792a5e9eb05c3c0abd5930bb53ed8cd7d3724.1793615824.git.hverkuil+cisco@kernel.org>
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

