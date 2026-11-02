Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616912;
	b=UvI3INelM9wEaFFoxcQLhkWS+u5DvKze3F8fxxADKDfG86MHNp+JNILcIDQEnqtKqHVe
	 y01Uk3oiE5DIrqdamb249yxj+UMHbPCiT3ggELrV/3muoWQtmRD/phUnvz4BwGEUgeGZ7
	 rRltf2zPenW4ljSk6HpYTZ87ZzCSZ8RdmvpvEpRE+FANDyyZnFsb44jj8n7WpYi7TJSK+
	 TvsQwFVTR0m/zKx7AyBQ2JtUK2SjvSDEBk/n3o+NRMaEDnvRG5bDsFLXphLpDutVLBqfU
	 82LAOdfFNT4nytrkwNiwSLalS4g98FpFCzTAOYd3UYnJFXsFHxpsWUvq0ifweALuYQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616912;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Rabuf4op/XN5NP6YCfyGe/a7zJ5w3jeN4Y6eXAm5e00=;
	b=urlzWBAWTtbb50zUyJIi33iavZEf8wfhOYbXx+p1nD3GfAz+v2+RKTTFmd8Z0kar6nHC
	 yRTaPWJJ5Pg62XK/ZivwQURdY+92CuW+GkmLlMLT+s51JjtRf3/KkEXiwt//OrCtWHCjM
	 TWZkHOdjEcRyS8iUES/ui8xv7KndONDvWBhNKMkOk80fbgm//wmAilXV5aVHAFGICxNUt
	 Uk6uGxZOFQLcrDUs2nAO8ujR39ofMHeLUeZHZNeGAArpnzFA8+zUZFHjO3rsXuqblsgUO
	 JDcIQ2ycVztwec44AwgOs/Nfaal/6Cgfnx86qFyQGX1LO4OsNDZPfnkiC8aq5/oTVZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O6J6rzFU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44054606A329
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O6J6rzFU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE361F00A1A;
	Mon,  2 Nov 2026 10:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616911;
	bh=Rabuf4op/XN5NP6YCfyGe/a7zJ5w3jeN4Y6eXAm5e00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O6J6rzFUO9VSEeHmoo/qQcQJe0SNhcY1z9SDx/pDr8kDxeVfq/AiVNhtgv4KslX1q
	 mN9VHQM14KbIZ1DbSWWa4gNqHFECm46WDG+0zi7NdsB1xJJwHhqosEuwp5DIpsdO0Y
	 EiwuD/GwUZ9GBVnuL1fA5zugeY7jzAifBw4GZ4elopTo66AOY2y2aQUVK7UY2E/3l2
	 vWuievc0ax8I3R4xKpnt7IkMPLU8xz2Mt6mYkH7s9oY4YFOjdMl/qxEW7fskLKM0WI
	 XACUhTqd8S/uWytF5CRpiHhiX85bqPFILEEu1M9UVBbCCrFwLqkfd8XQfhTQHfc2vJ
	 3DpUeDY4DYbSQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 10/13] media: uapi: cec.h: add CEC_EVENT_FL_STATE_EDID_PRESENT flag
Date: Mon,  2 Nov 2026 11:37:01 +0100
Message-ID: <2d129152e4cf0f3653f17c91efc3ae780031dde4.1793615824.git.hverkuil+cisco@kernel.org>
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

The CEC_EVENT_FL_STATE_EDID_PRESENT will report whether the EDID is
present or not.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 include/uapi/linux/cec.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 8f7c7a4cb505..8324d208c1d5 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -455,6 +455,7 @@ struct cec_connector_info {
 
 #define CEC_EVENT_FL_INITIAL_STATE	(1 << 0)
 #define CEC_EVENT_FL_DROPPED_EVENTS	(1 << 1)
+#define CEC_EVENT_FL_STATE_EDID_PRESENT	(1 << 2)
 
 /**
  * struct cec_event_state_change - used when the CEC adapter changes state.
-- 
2.53.0

