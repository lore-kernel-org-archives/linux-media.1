Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923C83F075A;
	Wed, 18 Mar 2026 19:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773862081; cv=pass; b=Ijl/4FUvr+own4kyH0YkYluO0GPWBJCEztq8CV96whE4S8zYU7aC2qbWwy+UR2DnWEr3Q9ISU2zEaGgzRmHclDPCQ5eUpJ+JbJRJ66r3CULWZ26VM8hGwbXYHFEFvoZrgCiWaIbLVR9ctfTn1ldmNIyF1xBaeJQd1Ei8PdD2aUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773862081; c=relaxed/simple;
	bh=STUvD6DjsCOPnQxbElaSrn9NpjCWuKGcVpKLKOQK/Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I+91B/SevWTRAgPwVxoxoEe8y8+ZG+mMeOuvBf9Ti18/IQYZCFQU22gbZqgTIt657h2+jVurD04oqlcv7pVZT+HcbCr1J+Ix4jgWPJ/bUn+NC283lTJW5oFi50nC9SWFLzFncSzvLl1D1anDyntrRt6C+oxzA8aeB4iP8Ub65vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=kvs9wvrW; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="kvs9wvrW"
ARC-Seal: i=1; a=rsa-sha256; t=1773862053; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iWK+i0c17wLCOKhHxbI2RyYm/jaxXIP40XRUvxVREGb2MIpYbzUeX3si69kTlyqdmkWuc6/5IyTHe4fhGAGpavtxVaaIdpuEpLce2D/x1SniFki3SHMbqpLLozbNQDyZxCWb8qFRD5oSrhWlGGvKKSMPnzSOgGGIDKf1HS8hOhA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773862053; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4kzMTYxGhMKT838ZBrXjecyIPcUoh9EELyeEubeom1A=; 
	b=J7lJcO2NJEGWaQO+HxpgcGkNrCt6paSmqb7OcL2CoxszKs1bg+LYr3Ksp2X0Fql45tbiSCk6wDAszKXQ0/6VOjzxgGtDhL+OlMc+H4kpV9gcgOim1mNVUuAV6LjcXx0Graso0nacIJYE/knbrThpUDTSpb7x2B7FiTeWo37g1b8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773862053;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4kzMTYxGhMKT838ZBrXjecyIPcUoh9EELyeEubeom1A=;
	b=kvs9wvrWtwMePB5FLrs7sDGk2mJh72KBRJoUAEcRgP8hMlhMx6eQjkWUoKE3Fivr
	1OP7gTtTptfMqEYzaPsD9t12AF6zLmMLDNd9vItvG9r840yu0eeaY9dlonxnOrrUm27
	RRFgUpbZ6/KaRcQ+JQXRCDoihmjRICRUDs3ZitxE=
Received: by mx.zohomail.com with SMTPS id 1773862051538654.731684847297;
	Wed, 18 Mar 2026 12:27:31 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ross Cawston <ross@r-sc.ca>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1] media: hdmirx: snps, rk: Fix HPD hold time
Date: Wed, 18 Mar 2026 22:26:19 +0300
Message-ID: <20260318192619.3910060-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Increase time of holding HPD pin low by 50ms. This fixes EDID change not
detected by sink/display side.

Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
Reported-by: Ross Cawston <ross@r-sc.ca>
Closes: https://lore.kernel.org/linux-rockchip/20260209061654.54757-1-ross@r-sc.ca/
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 61ad20b18b8d..4c8957505a50 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -506,9 +506,9 @@ static void hdmirx_hpd_ctrl(struct snps_hdmirx_dev *hdmirx_dev, bool en)
 	hdmirx_writel(hdmirx_dev, CORE_CONFIG,
 		      hdmirx_dev->hpd_trigger_level_high ? en : !en);
 
-	/* 100ms delay as per HDMI spec */
+	/* 100ms delay as per HDMI spec + extra 50ms to cover internal delay */
 	if (!en)
-		msleep(100);
+		msleep(100 + 50);
 }
 
 static void hdmirx_write_edid_data(struct snps_hdmirx_dev *hdmirx_dev,
-- 
2.52.0

