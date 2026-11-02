Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616907;
	b=twyxV7jU8g+/98imtzS9Ih4QdDq4Srj95lRNHvT8b7jZ7KDPe+q2UwGOU3lj+Yz7eMsg
	 wRt883Q/dl05oHWDD+aH+8T8dTtjk53+O1zL/ZSvhyN7dPE+gFDvAjBnb78FRzI0wWW99
	 vRGdNKjPkL5uCUeLK+FgwT15VMWfxs4+ybHCcKZ0MIK4kYgE57j+pnooIZKdTRQdwWy7k
	 nAQ/8Cgnv1GM8+nPAgCUvFxtqLZyZWkNHU1om65LSLinM5IMiD6ufylxGT0wGjcZW7Ob2
	 48mioqTYqKAcI4HVWPxzbwWjIV5x6SVcBH8IpTZdw60nj3wUuwXwYHpaC5Q3wrq9Kcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616907;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=q5D6NcSVIATB1SU1kSC859+uaa0n8diQ4fmz2USuJuI=;
	b=NM3pawawa5cyaIn56/kKsKyQvB8K6MgvKCkMdjWbgbZ3PobiVPuBtpdK146kXexH8rxY
	 BbIo1HjMUM17XLZxxV20G6LsG2vMXDl0fsJ++Tnlxj3QZNnPjRi4+C4ousOK4D0H2aYVy
	 mJym1hlBmeevLIZ7kc03R2vxzUOpktmVI8l59KIKFxlHNOmOzOxyd5XhpuyvPTZ6XjJvh
	 klbXdoE06Ewz6VuAvsa63/AHzDUZoV1ypH3ydZOgpw6A1+F00px7JMmRElhbQqI9ZiKO0
	 FTNSs7sttEWneV3oNHtk6Z8aPzfrhsuUUkjmzjIIphBrxYOyIvMSHzZLu4kj+lBQIwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W0dzZCbz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A193D606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W0dzZCbz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A2F1F00A1B;
	Mon,  2 Nov 2026 10:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616907;
	bh=q5D6NcSVIATB1SU1kSC859+uaa0n8diQ4fmz2USuJuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W0dzZCbzkn8EjKd3WjjdjOlgmbxw/iT8ok/RP7mASQ3gFv6LzXHHjqLzV6jmTEFIH
	 GI1pdRCPFuTub/C62Wq50GHRHxkyQfbabp2D/DWw9OrPCdarA+4HoTemap/jj47L08
	 QRC+wITTMb1Ja7mSZgbzrmNqfl8M591o6GIogomGwfbzKw7ShcBwiibZzZevN0gNfS
	 vFZz+M6XV/e2Xzc0/oUPW8T0gR+rwnVYb1zO8PoD8YpTCw3wzSJ56gN5HAzNIkP6EE
	 dQfWasTdowKLPkOZWYScu03hPgTApQHYIaareRff+827/CV+rjvnl4QEtmE4ueAuDZ
	 6PmJDILxBz0ew==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 07/13] media: uapi: cec.h: add CEC_CAP_HAS_EDID_PRESENT/CEC_LOG_ADDRS_FL_EDID_PRESENT
Date: Mon,  2 Nov 2026 11:36:58 +0100
Message-ID: <399072ca2a74db139b50502ff644834ea79eb829.1793615824.git.hverkuil+cisco@kernel.org>
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

Add a capability and a new flag that is used to indicate if an
EDID is present.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 include/uapi/linux/cec.h | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index fdfc97a6e4ec..8f7c7a4cb505 100644
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
+/* CEC_LOG_ADDRS_FL_EDID_PRESENT is available */
+#define CEC_CAP_HAS_EDID_PRESENT	(1 << 10)
 
 /**
  * struct cec_caps - CEC capabilities structure.
@@ -405,6 +405,8 @@ struct cec_log_addrs {
 #define CEC_LOG_ADDRS_FL_CDC_ONLY		(1 << 2)
 /* Configuration failed */
 #define CEC_LOG_ADDRS_FL_CONFIG_FAILED		(1 << 3)
+/* EDID is present */
+#define CEC_LOG_ADDRS_FL_EDID_PRESENT		(1 << 4)
 
 /**
  * struct cec_drm_connector_info - tells which drm connector is
-- 
2.53.0

