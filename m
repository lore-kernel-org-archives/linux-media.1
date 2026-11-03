Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691626;
	b=BBgFZSXbYu09rObois/IYSSuH9GfJ6AuXEB7cXRVrBZ1BpWVkCKcVrHtFFUZ4OkMNkcY
	 TDT6YpPQVRVMPjdJVbWjxwkXK0Z3vgWiuWS2XlLKEVHv1Bs2n12HXis4BsCxy4ktE4Cpx
	 uswBabswG7mu0C+nR7le3HdDgE7sjPzyRAnTvqzFVjRRz8N6UgBL7YPZnIOW0z7a3ojI9
	 r/xQ7Yz4IoRedAn9wCl2rFAm2X6my2n6D/2ELhR/LULiuNSHYp0mU7jNwarFMnhJKAK16
	 jAdQzwo7BQCUuaeUthsIbdEOBOoREZsHpFYmCgSLlLijc+BErNAxD2sp6F8nk33zcdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691626;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=c8V9WqB9aQgta0XAH5FjnMzK6loax9fei5rQGTIoZqw=;
	b=m+jawX4kSDpL/WTq+7YBgXWeRmyniFYhTT2Pj5WtD6mgiile/Lu837OnMr346uF5Qbch
	 LTha9ejTxSACGoCcixRSY9e1dQn8TDurfQmJWiG2kWWEkB0WW+fEUh1rSuGHVDBQc4Hr2
	 ifCmW3c2YeuuuebbpSy/r8gzt30GnYjGcLpz7b7kJa7jyFpaR5sV6xAbMvzlZOiH7xLku
	 LKf07QGbHs606smaOy/ZytiHX9SgsefwbeRKTU7yeGfGn/eLAwvIn0/QNsrWiEsQOBiy9
	 nmp80IoDen1oNtAp6bmGCZXFja4HybruQf24k2XMK5YXqb9rvzuy7dQkBDnn9gKssCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n74+Xaes;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EFB606A32C
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n74+Xaes
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC741F0093A;
	Tue,  3 Nov 2026 07:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793691625;
	bh=c8V9WqB9aQgta0XAH5FjnMzK6loax9fei5rQGTIoZqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n74+XaesbQDDsHa8YCBq1ZMY4IJFf8ObGbvhX+84CI5nw2eZjOVNAjgwLAejpnmPM
	 h2aDWAVOgWkisvAcsw2xd1zCujRzOClY1J/RnRUZOzo+XbKxf4d8Goo8KAZGzYdHb4
	 9NnpJF0sSfCZo83g1yuTZo/89Rr+LZs3XTOTJdZjSRbXWb8EMSGe0FweswSQvL8dPG
	 4Mla0+sWJQT8ngFIDB/g/gqZgbg7tF+NzMXKAVF4nGs20QSIWnY1Ic6+ylSZPDw82E
	 kBjFifZ5pKrGbMHuAlorUjbc7yfZzp6944Wts9bIocV4d+PPa+lFT8Tv6vt08Qx/jj
	 4hv4/bqYqVCag==
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
Subject: [PATCHv2 02/13] gpu: drm: exynos: call cec_notifier_phys_addr_invalidate if no EDID
Date: Tue,  3 Nov 2026 08:31:53 +0100
Message-ID: <80b02c6057f32dd8be8b4de95d1cd27352cdddc8.1793691124.git.hverkuil+cisco@kernel.org>
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

