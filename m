Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691623;
	b=STfS66xSeotCNAshItYKRAfWJ9ZaoJpFNVeXu0q934eEvi+XpFPvdvJxRGlcLv+NamHg
	 WjkC+fFrMdsDEBU2YwcUo38TyV6DPp87L3115ceDsjeenHIe/x9PHvmlCbmD0u/rhJg4A
	 RCEAlj8Tz4HWXjRkqaJEOeQInwN3cBOHg1qov9iaLJaquSNDxXpcojW/xqtHcr3ydyikT
	 C2ibagSd/KgyM6si3Lw9NkOINDt/LnU3cjV9Xc+0hylyem/TNfEry9GR1u9KLEa8+9bit
	 +celEPTl46SPLFkY/qYXsINA7mKn9itiAP+yMLFwJc8ou4dXa7LBojwaaJ+lIVv+pEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691623;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ULjdA9wzSU2kw+awG6ZtiJyO3lhT38uTwMSGCOJzZFU=;
	b=bZJ9FsupkDB9x9JjfoUt20eyxbXJipTq1KFrAqKWOf+5pZWK3DJJyDuhGzoB6ZA0wvs1
	 Ymqdt0ky8gVO8ROSYDrcWu1AObSyPRwZt/PdmW5cRXetRUqVpEpqizBqXsEjXI7g/zORP
	 uLovSlYVAzMgMSJTntoNbQBqZeIxS/iLjVJrlayM3tsG/tHKZZ1fQl4RdjK7gchPr9PXV
	 0DCPe7mkK/Se0mxPNUF4CRuQtjIMrZa5XLFHpCdnolfuwvLC2g7WCfRSJEFRk5RWWUnFC
	 Sl+KuJnIYq6MI++Zckaaoi3TIkcCFuyTdER9gDtlJw1M16VG4hpRf5ZiEm0ZEml2rGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Cc3/tB1U";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66925606A32C
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cc3/tB1U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6751F00A02;
	Tue,  3 Nov 2026 07:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793691623;
	bh=ULjdA9wzSU2kw+awG6ZtiJyO3lhT38uTwMSGCOJzZFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cc3/tB1Udx63fMwXJzTEZ3epE88HM20y6rglVAHnkzdQgOZ+92RXaxfZTKQbYmyc3
	 qI6TMGKp2sILn/6yWQNRGdOgZ1ZC3FHDPW9C8KD+9XlPB+Wi9bNYE5SZ8owQen4eMD
	 8CXq0t2e0qehR/+8KuMLwqlMSPjiDyKQ5EcYCOwxSREAAWFaFgt2DO31V7jFkA/IEk
	 z4aON0pDK7wF4tqMIYZFSvzdzPQP5v67JJtUkb/QXP9thyJj1znHt9YzlfXwUrv4GT
	 9W0a93vmhq2Yv+MVFJT/tliAVb6pJmMVK2EigjNDf/GhImLg2oBgFXUHuDZ127LuE6
	 WYpo6rw15Z5Dg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCHv2 01/13] gpu: drm: sti: call cec_notifier_phys_addr_invalidate if no EDID
Date: Tue,  3 Nov 2026 08:31:52 +0100
Message-ID: <5dd7ac527b4d3143fea73bf93c60b22a66d16d3d.1793691124.git.hverkuil+cisco@kernel.org>
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
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 7ba9e0b7ba6c..12e05505bbde 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -790,7 +790,7 @@ static void sti_hdmi_disable(struct drm_bridge *bridge,
 
 	hdmi->enabled = false;
 
-	cec_notifier_set_phys_addr(hdmi->notifier, CEC_PHYS_ADDR_INVALID);
+	cec_notifier_phys_addr_invalidate(hdmi->notifier);
 }
 
 /*
@@ -1068,7 +1068,7 @@ sti_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	}
 
 	DRM_DEBUG_DRIVER("hdmi cable disconnected\n");
-	cec_notifier_set_phys_addr(hdmi->notifier, CEC_PHYS_ADDR_INVALID);
+	cec_notifier_phys_addr_invalidate(hdmi->notifier);
 	return connector_status_disconnected;
 }
 
-- 
2.53.0

