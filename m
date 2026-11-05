Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863645;
	b=So4REYvtZOlsPyms8yGFhhjI1D2ywbT3/pTMRlZgbXejBXLGXqXKcbYROfg0c44CIC4r
	 UFt9ibbSg9P70cdzWmPj0mXZ8FvJj7JWMcjsBzVW2WmlaKXFglKpJsgaShGMRruAc17Rx
	 Q4ly8wGN/LxAef6eV5lUDksihskGTI1+7noXQ99GR9pK0pddQSX6tDnumP/YVrbcIg1Wv
	 j8ouEpWCRZo2+fuodlzTB+LFfgBr0HifMBV9LESwfJ8NqHaIhX1ApI8WDiwgDT16El7jv
	 wbCvVU2g4RopeR2L6pKYzhiXj+TDds+MU1s2qCyqXv6Xx1A4Gj+QF0AMUAsSjJjZDcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863645;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1wL2C8lLkT2+LNaIQ0sG3zz4OSwom1IYWg/GVJ3Rsjs=;
	b=O2tRLocy7Ll/B+McymBxlgkba/FpLXg23pJadpr4euYQs+0Rqh5HotuVXj8izR5md9+c
	 N26Jef38QU5pBIHO6VqaksNtpew3fQVf9iNM6pQkK1zq7s99iGgsvMgY5WfJik2jSkhV9
	 +XFlomIClgLKuUUd/5PN8hSj0CowawBzCEEbT1WboBx//Y4QLh4Qd/9wcmx1YPudRCtpV
	 s9iA7vYbIdF6wxnKmrwpEc0AMQfH9phtHTWD7dsCBtiTPbGqbXgW2aiC1YbBd1EXEoFoR
	 hZggt375x4+q8rZFuk8fvTkz/JL99dc20N791cptYfKBQAbvhjUw2llHqeHWThdyVGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=anMOUYEj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1F3606A332
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=anMOUYEj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7113A1F00A16;
	Thu,  5 Nov 2026 07:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863644;
	bh=1wL2C8lLkT2+LNaIQ0sG3zz4OSwom1IYWg/GVJ3Rsjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=anMOUYEjDqyCyFniCG9cJM6i2vG+DE7K40WUD1RHxdEbeIdDpX6zMnJXE3JNeBW0A
	 scNeWoYAnA76WTreg3BgziqInSBuzQGFCnCnMxLGAqQsyyXQLKmqYGyjQVQJ/fQFJm
	 cc7R4TOtrTtMVgi15g3ar+cZVUaVpBnx6zhsyYG7Z9rb3uGmnO7rZ6QA9UR3yeBPr+
	 /rde+o5B/BiEE6CBXfXNwsZZpxzEDsFehVWGeQTVj1jONO8w3tP9LN2gdZR/T3s+60
	 Q3FmgrVEJWnzl4sMisShf4gd/jsnRLCuj7Ia8vZHYvUVNGZKbudsFpYVl39ZoyrqUP
	 jlmzN6AHaqUWQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 07/13] media: uapi: cec.h: add CEC_CAP_HAS_HPD_PRESENT/CEC_LOG_ADDRS_FL_HPD_PRESENT
Date: Thu,  5 Nov 2026 08:22:21 +0100
Message-ID: <4cd2dd652db11b7410a6f9608c5c15bef45f5df5.1793863347.git.hverkuil+cisco@kernel.org>
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

Add a capability and a new flag that is used to indicate if a
HPD is present.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 include/uapi/linux/cec.h | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index fdfc97a6e4ec..b1b5f4748583 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -325,27 +325,27 @@ static inline int cec_is_unconfigured(__u16 log_addr_mask)
 #define CEC_MODE_FOLLOWER_MSK		0xf0
 
 /* Userspace has to configure the physical address */
-#define CEC_CAP_PHYS_ADDR	(1 << 0)
+#define CEC_CAP_PHYS_ADDR		(1 << 0)
 /* Userspace has to configure the logical addresses */
-#define CEC_CAP_LOG_ADDRS	(1 << 1)
+#define CEC_CAP_LOG_ADDRS		(1 << 1)
 /* Userspace can transmit messages (and thus become follower as well) */
-#define CEC_CAP_TRANSMIT	(1 << 2)
-/*
- * Passthrough all messages instead of processing them.
- */
-#define CEC_CAP_PASSTHROUGH	(1 << 3)
+#define CEC_CAP_TRANSMIT		(1 << 2)
+/* Passthrough all messages instead of processing them. */
+#define CEC_CAP_PASSTHROUGH		(1 << 3)
 /* Supports remote control */
-#define CEC_CAP_RC		(1 << 4)
+#define CEC_CAP_RC			(1 << 4)
 /* Hardware can monitor all messages, not just directed and broadcast. */
-#define CEC_CAP_MONITOR_ALL	(1 << 5)
+#define CEC_CAP_MONITOR_ALL		(1 << 5)
 /* Hardware can use CEC only if the HDMI HPD pin is high. */
-#define CEC_CAP_NEEDS_HPD	(1 << 6)
+#define CEC_CAP_NEEDS_HPD		(1 << 6)
 /* Hardware can monitor CEC pin transitions */
-#define CEC_CAP_MONITOR_PIN	(1 << 7)
+#define CEC_CAP_MONITOR_PIN		(1 << 7)
 /* CEC_ADAP_G_CONNECTOR_INFO is available */
-#define CEC_CAP_CONNECTOR_INFO	(1 << 8)
+#define CEC_CAP_CONNECTOR_INFO		(1 << 8)
 /* CEC_MSG_FL_REPLY_VENDOR_ID is available */
-#define CEC_CAP_REPLY_VENDOR_ID	(1 << 9)
+#define CEC_CAP_REPLY_VENDOR_ID		(1 << 9)
+/* CEC_LOG_ADDRS_FL_HPD_PRESENT is available */
+#define CEC_CAP_HAS_HPD_PRESENT	(1 << 10)
 
 /**
  * struct cec_caps - CEC capabilities structure.
@@ -405,6 +405,8 @@ struct cec_log_addrs {
 #define CEC_LOG_ADDRS_FL_CDC_ONLY		(1 << 2)
 /* Configuration failed */
 #define CEC_LOG_ADDRS_FL_CONFIG_FAILED		(1 << 3)
+/* EDID is present */
+#define CEC_LOG_ADDRS_FL_HPD_PRESENT		(1 << 4)
 
 /**
  * struct cec_drm_connector_info - tells which drm connector is
-- 
2.53.0

