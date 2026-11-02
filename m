Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616915;
	b=c3GTYIhu8pVaoybY7gE3NQJhI96jrhLqiC8DsktSDFDVtOLFkXcsob2PyR/yDI+4qyx2
	 0qJ+zybCPUcVP5no8AfSzcD/f9SbPsAUnaLD5HKPZCkBkD9FA3Nq0I1q2xF+GadXfsFP/
	 Vd3qYElIWZ10manrMVwh67TynEhGrhfvURWGMuDl6x4c3NoJC3dDpgXNaTLSdFZJWAfHy
	 B2eKAIPse507lxr/sNaTfgl1UI5umhmIanzZaZUhZs9yfQ45zsPbOX2vPFoisqALLo4Wr
	 pxGhUQm3Ujo/z6hYZR7CQRjQJSy7jpCICZWYIRtZiN82Yij55ELmAKZRdeATB6b1BoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616915;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uIr8Q+u/xMDGvcYtw+4rXJj39qZiWFTAoKVdJbKlz2s=;
	b=3ong9pp2t9ItFvrbt7J4xfEj/2q097dH+LsQOA2yTil83ctT2DG+jzXFuhItcoJpM2gH
	 I4grhy4dH/oc3+pbkt6ELKGCMZCq191zw+dzd33esc1mGjNP9CrBvjeWbnspTFRVPiLmu
	 B0BOLMzGmLvbu+5tt+G2C7YkmvEr7uOlB4zhib7Jelgg+NLyYfMVIhTw2rj5JY8BG+OP+
	 vRkHbKKnpGEGpro/OzHZUatL9lsbhidJQqdT8QiZSDSw/swfN+mwJQ+Ob+IWYuHq8eBHz
	 O1/VxYX4V8Y5XAeFZLQOIfeVoTqQO74HxfM/m3J2vEhGd2J/6GXBWLc22H+mzKrsnXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DeA7nlh9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458BF606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DeA7nlh9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C716D1F00A1C;
	Mon,  2 Nov 2026 10:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616914;
	bh=uIr8Q+u/xMDGvcYtw+4rXJj39qZiWFTAoKVdJbKlz2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DeA7nlh9nKn3AxA/TxulLpW4WNmGqUnkqcRUtBuE1lAmkiDotU1rha1k5fDh63vQP
	 2Y+gAwCqr9qZnmSAiGtQktMItdnYoceDG0X7fLGgx6qjUyDA8AeCLXPVfhnkA1TAGN
	 TqNcya+hKlLxBC0LTkOTMymGeD5RkrkflEnlOAmx+FF5YM3hrgXTOShZDzz3PlUidq
	 iObRUZ4uV7A9nmfU6E7nRF6MUGDQdNnYyB08uhqfCU2oj1/oPR6hQf+XLcG+zCPCwn
	 5AxTaggEaOvfQc4yQlhQHTw5h/99gU3i94RSXRD24KbdSH4bj7eeUxyClQF2Un927y
	 fJX91iQSjQb0Q==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 12/13] media: cec: core: implement CEC_EVENT_FL_STATE_EDID_PRESENT
Date: Mon,  2 Nov 2026 11:37:03 +0100
Message-ID: <e5ad86f5e6a33e6b9c1b930a00c984f49eb316eb.1793615824.git.hverkuil+cisco@kernel.org>
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

Set CEC_EVENT_FL_STATE_EDID_PRESENT if needed when posting the state
change event.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-adap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 06a596a0ede3..c0de5835fea0 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -323,6 +323,8 @@ static void cec_post_state_event(struct cec_adapter *adap)
 	ev.state_change.log_addr_mask = adap->log_addrs.log_addr_mask;
 	ev.state_change.have_conn_info =
 		adap->conn_info.type != CEC_CONNECTOR_TYPE_NO_CONNECTOR;
+	if (adap->log_addrs.flags & CEC_LOG_ADDRS_FL_EDID_PRESENT)
+		ev.flags |= CEC_EVENT_FL_STATE_EDID_PRESENT;
 	cec_queue_event(adap, &ev);
 }
 
-- 
2.53.0

