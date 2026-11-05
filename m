Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863634;
	b=j9qMjmBXjn2OiH1DSknthi4MsLkxSwlltZS266cyD0Kkuf7yqAZr3xR3psYSINJNWYil
	 QULRZoGymrEDevcOqlL9LpVXQFZ+RtIsJ3EDiB2T+2e5Px5xclzwEcovcl9Dp3ywqhz6L
	 Ea2CRtT5UvjDX3+SXOi1NOYP9YhzTs6jOR9aoTLnF+fcmB4lgDJlwiV4JpYr7zaFVFoul
	 ssLYZxBtvDPf5GibJfL4IfB6hzO8MVn5zrkl5415OEJIHE32KXsVCScZ4Mo7289isbp7O
	 81czOPxHgqdArmfdqgirlz5qpiWGuGMs/CE5hV2u+jDywB0kkPgZRTnF5VkZ0K8kb8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863634;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ywPEyzaAYanE4W2VIIMG8Ajz8Cbe4AlS6X5FMdsMmzQ=;
	b=gd7RWmPLFVtKz6H5wHhd67QwBuFIV5x3ENejoWCFGFj24XQtrYBzyjOOAgYkWlRQ0MZt
	 qiqtWjE2VgaqGfLhjkr7FEssSGw4Gr71ho6DfTf6kPgecC3ZW4IcGWYhHhTUz3Dkrwqca
	 g9ICGFLieJMmx8gSMZDl/7Sp7WBlUqbjJlwIdMrzeuyb6dser8ZmsxAd/4lSdxmrV+swR
	 H6ca8ErhEnPILkwLsqFPg2BInGc3zyoaE4QY5rdTOBl3I/zd9J10HBLZElWM2RjoPScJX
	 xR38/Hlanahex0rnzrPRH4VK1ZEwglGcfhDIZuqYzFOxMrxNMDl17zT6gTSl9HkXlbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MGGk3smT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC14E606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MGGk3smT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C231F00919;
	Thu,  5 Nov 2026 07:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863633;
	bh=ywPEyzaAYanE4W2VIIMG8Ajz8Cbe4AlS6X5FMdsMmzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MGGk3smT9ryQqKn4GQMcFYoJv9pZEYX7B718/wD3OV8S9+fzdG/I55y5ifJpxLRTn
	 vJhb6EoKYw7FS2ZvxompjlCjrUDlSTELAu9cMHWjgQts7kXNpOI9n3z45zmFW0ASng
	 8LzBoml9xmQoi/S613SDHznsXN6c8M9HdmpZNsL7zgRe29VINmNLZfcINeeb1hDJtW
	 EoZGZt4kJKnn0Gw4288baCEnYhLI7uP40+ZbWjQDQbz5PMzlm+s7FJZRzlTzjpDqER
	 bU9O6mxIEIdVMkCMcUBsmQRCmFGCRuiIOt+QBdRFkCrzMvzPw8VxjLW6TruaptR0Lb
	 oDc81OsZWouCQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCHv3 01/13] gpu: drm: sti: call cec_notifier_phys_addr_invalidate if no HPD
Date: Thu,  5 Nov 2026 08:22:15 +0100
Message-ID: <bc93f90d0aa6fefcb37241a052c5e29dda2e4536.1793863347.git.hverkuil+cisco@kernel.org>
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

