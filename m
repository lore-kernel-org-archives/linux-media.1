Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3034C3016E0
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115331; cv=none; b=k+DX3NOJOLp+LvoKoLzl3joeJIZbygSyQ7jSZPJOqgVwwwyq6tEq767Sq96fVGMnbgrpZOUdk1zH+1/wD+Jul3/Dm0SjNO5g1v8yPd6L1vfwRYU1zgePnRmeJqpwP4o0saQ8I5CMIpGs8zRofKGvm0wvnRfds6cWJEGQH0F85cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115331; c=relaxed/simple;
	bh=dwX8hqYPZLUMgxOxhufWFEMrEwq6t5n+J+cj39hBH8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/mWFA+YCNBKthvWw2xZ5wHkm3j+7L9JV3H4I2xxU2slV6FHXTX5QYg/g2pUOmU6INPEQFixh2Nn3fyT547J7Gc2iRX0TKV88FeTqT57h3Tl3dh5kOFWLRPZHq6k5xc3V/odJL5mNIj9p1fssA9JxQeSEhu0KLv50CRhSUswNfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLANxT8c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLANxT8c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CE5C2BCB7;
	Mon, 18 May 2026 14:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779115331;
	bh=dwX8hqYPZLUMgxOxhufWFEMrEwq6t5n+J+cj39hBH8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLANxT8cQnTgy4sNQTrrYPoqCXXm27yVwZZqexPYzPe1kOx7Xq30sRWTgocqRVFJ3
	 fZtjI9bxPTBT2ixhUxrgWLsI+IJ1oFNur/TbNI+jXSAunqaCI3GR1Ow+DxJb2V1Get
	 VoPo/iNxADVnHhznKaE0zIKGN12xTH0N4mKt3ny9NYblu68iYdHEielTqNkANyh/oT
	 yflTCN3TDSBbTrm0OMiGB6kgaA9550pRPJAhX6s3ao2m8GCbwqEV/rjVr/ouBXg+Il
	 x25OhBValDLjvvlWxn6jbvYVBO3xA0idecNd9eLHCNAog5dy7jpm6f1ucHoZvf7uZ5
	 JeJNy5OsHKsnA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 4/4] media: include/uapi/linux/cec*: clarify which msgs are CEC 2.0
Date: Mon, 18 May 2026 16:40:35 +0200
Message-ID: <098789ee233f777d5ad87a72f09a997373c98d25.1779115235.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779115235.git.hverkuil+cisco@kernel.org>
References: <cover.1779115235.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop comments about CEC 2.0 from cec-funcs.h.

In cec.h clearly comment messages that are CEC 2.0 specific
as such. Also rename references to HDMI 2.0 to CEC 2.0.

The <Request/Report Current Latency> messages were marked
as CEC 2.0 only. That is wrong, these messages are explicitly
allowed for any CEC version.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 include/uapi/linux/cec.h | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 75bc9e4e0350..81a05c9c0706 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -742,7 +742,7 @@ struct cec_event {
 #define CEC_OP_PRIM_DEVTYPE_PROCESSOR			7
 
 #define CEC_MSG_SET_MENU_LANGUAGE			0x32
-#define CEC_MSG_REPORT_FEATURES				0xa6	/* HDMI 2.0 */
+#define CEC_MSG_REPORT_FEATURES				0xa6	/* CEC 2.0 */
 /* All Device Types Operand (all_device_types) */
 #define CEC_OP_ALL_DEVTYPE_TV				0x80
 #define CEC_OP_ALL_DEVTYPE_RECORD			0x40
@@ -777,7 +777,7 @@ struct cec_event {
 #define CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX		0x02
 #define CEC_OP_FEAT_DEV_HAS_SET_AUDIO_VOLUME_LEVEL	0x01
 
-#define CEC_MSG_GIVE_FEATURES				0xa5	/* HDMI 2.0 */
+#define CEC_MSG_GIVE_FEATURES				0xa5	/* CEC 2.0 */
 
 
 /* Deck Control Feature */
@@ -1067,7 +1067,7 @@ struct cec_event {
 #define CEC_OP_AUD_FMT_ID_CEA861			0
 #define CEC_OP_AUD_FMT_ID_CEA861_CXT			1
 
-#define CEC_MSG_SET_AUDIO_VOLUME_LEVEL			0x73
+#define CEC_MSG_SET_AUDIO_VOLUME_LEVEL			0x73	/* CEC 2.0 */
 
 /* Audio Rate Control Feature */
 #define CEC_MSG_SET_AUDIO_RATE				0x9a
@@ -1091,7 +1091,6 @@ struct cec_event {
 
 
 /* Dynamic Audio Lipsync Feature */
-/* Only for CEC 2.0 and up */
 #define CEC_MSG_REQUEST_CURRENT_LATENCY			0xa7
 #define CEC_MSG_REPORT_CURRENT_LATENCY			0xa8
 /* Low Latency Mode Operand (low_latency_mode) */
@@ -1105,9 +1104,9 @@ struct cec_event {
 
 
 /* Latency Indication Protocol Feature */
-#define CEC_MSG_REQUEST_LIP_SUPPORT			0x50
-#define CEC_MSG_REPORT_LIP_SUPPORT			0x51
-#define CEC_MSG_REQUEST_AUDIO_AND_VIDEO_LATENCY		0x52
+#define CEC_MSG_REQUEST_LIP_SUPPORT			0x50	/* CEC 2.0 */
+#define CEC_MSG_REPORT_LIP_SUPPORT			0x51	/* CEC 2.0 */
+#define CEC_MSG_REQUEST_AUDIO_AND_VIDEO_LATENCY		0x52	/* CEC 2.0 */
 /* HDR Format Operand (hdr_format) */
 #define CEC_OP_HDR_FORMAT_GAMMA_SDR			0
 #define CEC_OP_HDR_FORMAT_GAMMA_HDR			1
@@ -1120,12 +1119,12 @@ struct cec_event {
 #define CEC_OP_HDR_FORMAT_DV_SOURCE_LED			17
 #define CEC_OP_HDR_FORMAT_HDR10PLUS			24
 #define CEC_OP_HDR_FORMAT_ETSI_TS_103_433		32
-#define CEC_MSG_REPORT_AUDIO_AND_VIDEO_LATENCY		0x53
-#define CEC_MSG_REQUEST_AUDIO_LATENCY			0x54
-#define CEC_MSG_REPORT_AUDIO_LATENCY			0x55
-#define CEC_MSG_REQUEST_VIDEO_LATENCY			0x56
-#define CEC_MSG_REPORT_VIDEO_LATENCY			0x57
-#define CEC_MSG_UPDATE_SQID				0x58
+#define CEC_MSG_REPORT_AUDIO_AND_VIDEO_LATENCY		0x53	/* CEC 2.0 */
+#define CEC_MSG_REQUEST_AUDIO_LATENCY			0x54	/* CEC 2.0 */
+#define CEC_MSG_REPORT_AUDIO_LATENCY			0x55	/* CEC 2.0 */
+#define CEC_MSG_REQUEST_VIDEO_LATENCY			0x56	/* CEC 2.0 */
+#define CEC_MSG_REPORT_VIDEO_LATENCY			0x57	/* CEC 2.0 */
+#define CEC_MSG_UPDATE_SQID				0x58	/* CEC 2.0 */
 
 
 /* Capability Discovery and Control Feature */
-- 
2.53.0

