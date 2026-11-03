Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691628;
	b=hwhYA2yLv1uwANC7A6REX7o3k5aLwTQlCP/L1HeRMrAgdA7D+rk0Jtlts3DksUnq7rmh
	 aTyJqEz5NzOn4d0zBhZT8iC9pciQ4qoQykogWxA8PNOqpc/7nSWizwgJ1gOj22if5QGo8
	 oGzR2Ia8FUoeKGxP0qXu4l6YZ7oCtVFvZuLWhJ58AWUisaGMt5eBhV8k4hjNi32RTM517
	 R+i2O7KJyeuntmkEo9HHbAv9jaCM7R8HZYfBrl9rI1swajMpDtoKJKfR5SvZ6OifNzv1Z
	 DX1vcv9tMlu4JSm1iCqErRVtamYB/8roI2sjJoNtD7nSn+odnpti+9QFA/8/k+xs2Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691628;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UvuKznDDisWzpXJVj1vFfyQGluqPP7ZnNuIADfdvL1w=;
	b=d4TBvqd/msMWe79dczs0T/o7lZiwp0DLTvk0WorOJIsWrt5R+1ShdHo4VwHpeJZo/evL
	 TGe1LRcq7uIjew18JKOP29R4PWlhuXMGg6ziN8BjR1ThESQvGxokQH8PVpVyNt0YPPrPp
	 I3gmAx4TBLWZkUkqn+sRhL41gic00iNNywEV8NoDqJlAop+34ygnqP5Ro5UdJv0GfqJib
	 jo8ZPIbzyrSGrLDHTJehKUdzaA7Bt1rC6SuQ4J6iUj/RaPBtUekT58tgGiOS+5wOgYfda
	 EYP0yjvj8cf57bJaZkvs2FxDibnSkAngkeEsm/Y60s4r72C0gFrJeEYRghe9/+gwfAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCubU6AK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22FC606A324
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCubU6AK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212811F00A1C;
	Tue,  3 Nov 2026 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793691627;
	bh=UvuKznDDisWzpXJVj1vFfyQGluqPP7ZnNuIADfdvL1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BCubU6AKlyLKTmp2uR9hKcX3IMecOl8lvuaZUIqMTPn8V+I4RAB5tgH7dy0rSR/I5
	 9GgsiA4xkBJT/cVnWFY6dShwAMeoRFj5xDaVPFCuwGjfL04EejoxbXU6+hiA0SPY+x
	 Sd935UoagFp3O/3RO/0Pw9J5Y9f3fYpqxPOESBiylyZmzlqmMkj68joI3FwYO5gPT6
	 dr++e58z90P0lvm2On1UdGMVXgnu6EX+8llWznBhj149p90QjkiKoZjeIRqzcm1P0N
	 qC98e3d8DAK1xWMFMOgJAG6ey7GuK67XcHMqfBkJZ8rwG0r72BfPGQy7Ms0B8QACth
	 D65YgzaSe+1cw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCHv2 03/13] gpu: drm: omapdrm: call cec_s_phys_addr only if EDID is present
Date: Tue,  3 Nov 2026 08:31:54 +0100
Message-ID: <9637a39495312aed32e21407d9a3bd5b8b1a363e.1793691124.git.hverkuil+cisco@kernel.org>
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

