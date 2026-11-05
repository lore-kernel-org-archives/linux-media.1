Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863638;
	b=UoVj3h3DpsNVKab0MltHNamylwiRWQy9YULq4rkz2edx3OKxgRr8bgFFLHO1eahtYbIi
	 uKbOFlHbkR746wR11VeWhMOQdoQEpR3uzanWvaNyprlhceL28j4+OWHq5zSJLvIZ+Pv4Z
	 9V82QvJFWzOAczogMRIDvNqeFyFTPxErLm3VpbMl7zWWCerQYFbOoLVpfPEFQf7/Qa1DD
	 dagk/1Z36hpz3h/h4JZw05Gp+IUCAq53ck1QIj77TOiUhbqDbS1fLzvmyAMeG0R1W+uYo
	 Yvb2AlMsfaB9ALl27rFObo4TUroxC/VB1wujvSnMZlEGHhDVrAWch80SFHNfAd/UOWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863638;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=hsvuX03A9C+AkXZjmOY18e9qNzuQ4IJcqnpDipEwUsY=;
	b=zUg9CadI5OTIIVGBuwwZRQH09v6lM+GC+eYti5azPn/nT2vwKIDgNbeyWS15xS5OQ2Xj
	 rM91PyUyoTV7rmrDjMZWwrEjHFwH78dhcFWrQL8BNo+Jcz+QZ6S18luKhqD7nXgbMcfqQ
	 LYuoAiv5+y1WIfJVychRwhwyyIOBvXUmd22ugzuC60GFph/yMN2RpV2VRndbzaMzkuckN
	 zT7Dwo8dZ7A8iv3wE2mf3m2fPmbiPPadIf/lMAjPWJFBcp5BhILUMCfl5U+qCRU3IsW5M
	 7SR7PvR+763mbmGLSCwDxyFNAv1a3b7eW+1uRH1RbSUWZLCZbiCwNL2uBIZSicmOiYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVPq3Fu3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109C0606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVPq3Fu3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7F51F00919;
	Thu,  5 Nov 2026 07:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863637;
	bh=hsvuX03A9C+AkXZjmOY18e9qNzuQ4IJcqnpDipEwUsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YVPq3Fu3+3koKoCZNAKG8DGFYt/fjbRgd9yflXi76ay/AkeP4cMYWMnHpu7XQqgTi
	 U7h8IHTvPDdsiB82wunjxG7+bN9p24qhOl7COkbXE0dms5mwLuQBDzAtx1EneupdCP
	 njzICyG/KcAboZJkhWuVr5CiIjdGZ9Eapy9w5AE2L0pYQ3u9SSKPCn7gYz5sxbHDD3
	 a79e4DoP+KK2sNxKVYyl+036jlQn8DhpCHVhQHdbs+o7McVjAb2flXaF/A5Q0gByZr
	 gmuYWzIroxARAkqbigttMO/DxnvwSoMmly7JX4mssE79UGUEBRwReERv6GwZ4j3iB8
	 48mIXn1OFKwWQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCHv3 03/13] gpu: drm: omapdrm: call cec_s_phys_addr only if HPD is present
Date: Thu,  5 Nov 2026 08:22:17 +0100
Message-ID: <cd7cc227615fdf4b17e6f0eba13417ade7a8237d.1793863347.git.hverkuil+cisco@kernel.org>
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

If a HPD is present, then call cec_s_phys_addr. If not, then
call cec_phys_addr_invalidate. This helps the CEC framework differentiate
between CEC_PHYS_ADDR_INVALID due to no Hotplug Detect, or due to an EDID
without a Physical Address.

This driver is one of the few that was doing this inconsistently.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c     | 7 +++----
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c | 5 +++++
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h | 5 +++++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index bd6c4d2dcdc8..056bede2ec8a 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -439,7 +439,7 @@ static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 		if (hdmi_runtime_get(hdmi))
 			return;
 
-		hdmi4_cec_set_phys_addr(&hdmi->core, CEC_PHYS_ADDR_INVALID);
+		hdmi4_cec_phys_addr_invalidate(&hdmi->core);
 		hdmi_runtime_put(hdmi);
 	}
 }
@@ -487,12 +487,11 @@ static const struct drm_edid *hdmi4_bridge_edid_read(struct drm_bridge *bridge,
 		unsigned int len = (edid->extensions + 1) * EDID_LENGTH;
 
 		cec_addr = cec_get_edid_phys_addr((u8 *)edid, len, NULL);
+		hdmi4_cec_set_phys_addr(&hdmi->core, cec_addr);
 	} else {
-		cec_addr = CEC_PHYS_ADDR_INVALID;
+		hdmi4_cec_phys_addr_invalidate(&hdmi->core);
 	}
 
-	hdmi4_cec_set_phys_addr(&hdmi->core, cec_addr);
-
 	if (need_enable)
 		hdmi4_core_disable(&hdmi->core);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
index 852987e67e40..60d0d85dccad 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
@@ -322,6 +322,11 @@ void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
 	cec_s_phys_addr(core->adap, pa, false);
 }
 
+void hdmi4_cec_phys_addr_invalidate(struct hdmi_core_data *core)
+{
+	cec_phys_addr_invalidate(core->adap);
+}
+
 int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
 		  struct hdmi_wp_data *wp)
 {
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
index 1ca5b5ca8a99..234690dd3a1e 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
@@ -15,6 +15,7 @@ struct platform_device;
 /* HDMI CEC funcs */
 #ifdef CONFIG_OMAP4_DSS_HDMI_CEC
 void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa);
+void hdmi4_cec_phys_addr_invalidate(struct hdmi_core_data *core);
 void hdmi4_cec_irq(struct hdmi_core_data *core);
 int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
 		  struct hdmi_wp_data *wp);
@@ -24,6 +25,10 @@ static inline void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
 {
 }
 
+static inline void hdmi4_cec_phys_addr_invalidate(struct hdmi_core_data *core)
+{
+}
+
 static inline void hdmi4_cec_irq(struct hdmi_core_data *core)
 {
 }
-- 
2.53.0

