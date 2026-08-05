Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64CE3D349E
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 18:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954218; cv=none; b=OOElZ2yBjp/grMqeojrhUX44H1ioOv9Pyuq+cc7zXuJ0kLET4/S9JuJ6Bx1sdWeQOOT7VuLb4PuprokeLit31/lgU1rsVOqg8+KQrQ33osjXn2eO6nuuU9cTmAud07uF5rinQY0aXGHXH4er9lKKfPZs6JF46qYWn/54pR5oqPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954218; c=relaxed/simple;
	bh=G+WX7CtesiRe4DTj7Tlv8U8LdjJ4Jmxn7ClKoT6FFH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2A4Xkl+I8ysTntr8AWDeP/bhbU3CDxotRnifM4F5D7jSV/Tb9hD93Uuu8D8Su2dU7EMeFxTCEYWClSkQL8SBk+7Uj8YdFUhFKPu6y2/8SsHnkGKws1gKomYepGzi4OG3MhmyzNCqE6rePTjTC9YRrXpdRE490R7Cet5bdXqaHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqc5ulDr; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqc5ulDr"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aec6360133so1190458e87.1
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 11:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785954213; x=1786559013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THhDdldiuemutk8N2Fd3TSyJfgkNcZYGTnH4JKvIOFs=;
        b=lqc5ulDrEN3q8DrtU8nKYIUPSgwemzriDsJaU2b3vLoVgY0SvgJMabk1bccb2JK0h9
         12WtT6Hra4JN2+B7tEbX9r4X0MTW6tQlefLRDu/IkH2YxrvZiO2eNeLY4Bv9ZdJN5eQl
         rIm8ThRHe0qrw+1DRWWtJCuLfRCw1eYcCdChNSSft2fbAWjREWhzWf1bT76V5K/FY77r
         mCJs68usHV7fPg1OdinTgtlRCXL5yUfLWE23WKtOmLlAm36gxXAnqAPo8F6tPzc4qVH0
         DjKgQK8Mu72Co5mFyiY3gtugq5vkXHpRt6j9fGJ3ydFOKgN3HB/IVr9VvbfPN/NTFyoi
         FoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785954213; x=1786559013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THhDdldiuemutk8N2Fd3TSyJfgkNcZYGTnH4JKvIOFs=;
        b=VgW/QqppGOeJjmSo/cqqJyZL8CZu3Z8vk+T6UvLaGWvBSbUseYI7t/plbUztAff76D
         gSYQw3ra7roBMPynka4ChQ/n/T7dC+CxxOodWmbgssiBAtiJ8tWoG2aWdG3EJTKRlYHm
         efKOpwR4Y0vMZn6zPqlGuK7BOStdxccMUlHgoY/Lvxvs52k4Go+DqU+YrILyXzBYN+0h
         Hcb8daSBDWnrRGJkXyLgk9fGAa+er6KnBGzy21VWkLHnnBgxjzY94u6nIt47PAMoiHDp
         Jai+0eTHkbJWZqbcyol5EKjDMYeWCog1aNIXWmi9zdGsIqs5Tc00tqestyggPg2rISPB
         ln6w==
X-Forwarded-Encrypted: i=1; AHgh+RqUe6sSxJ5LyqZmEEQtMoVogdHuq+Ngzj9O5E5lG6whd1J71oNfv8ReW8uIRScFFnHvWDvTgivX+wMrNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGh7aszb5gqSYJKAYN8cEqFltBQ6/+AhxqGk/nHXi9l1DMezaD
	T1yvAzwvGQWz9ZPPTcHOTB0ci1Y0cP+4JLvvBwJS6j2Yxb3cpsA04wbl
X-Gm-Gg: AR+sD13NqMIr45lZvFearVnO5WZuIKktnkC2Zfsl8+iz0GYuO9VHeuIwfCnmGWFYPvO
	8Wq+9STyG2Yg6tlxrYLc3fYI5/2IQ88YS4AG1toIr+fZ1WeMBkuAo6Dh6Dj7feyWZJack5CHhYZ
	oOwkDp77ZxMn/je0auHb7siDOcpek7DF00Zd67+nIHOX6tI8w4SwfP7ehVXU95HvyN94ysOYAOT
	ZwJ3Ar8/DOzLpYoG1HPd2cj+9EbkNaxMcpMY9QTryKs215/nAdZhw2bWoWR11AeIiJrNtc3L/5k
	wP/Zla8Cy0832IEiqq+RUHGqyy2biOg7jUSdMe88kTd7K+ORtbqR//S6q/u80f9pUoDMN6nq8Dv
	Q5v8DbIPOueFugdsb+bwsZC4SdF9T6awYgXNTVCWgYodUkacxxRSYUc9Sz+51YgTFnjzn2Hi92y
	A6NVR9w0ZqhhArlX7Rh4zklg0JxaSAkNTOIYkDDkkxhkEAWO782eifLHMqjYHfNdNjHwUQKg==
X-Received: by 2002:a05:6512:1319:b0:5ae:c48a:1dc6 with SMTP id 2adb3069b0e04-5b2f4cd8c72mr1344590e87.48.1785954213255;
        Wed, 05 Aug 2026 11:23:33 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb9a32bb7sm11954811fa.29.2026.08.05.11.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:23:32 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Wed, 05 Aug 2026 21:23:05 +0300
Subject: [PATCH 1/4] staging: media: ipu7: remove unused structures from
 abi/ headers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ipu7_abi-v1-1-46d420cef267@gmail.com>
References: <20260805-ipu7_abi-v1-0-46d420cef267@gmail.com>
In-Reply-To: <20260805-ipu7_abi-v1-0-46d420cef267@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785954209; l=10885;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=G+WX7CtesiRe4DTj7Tlv8U8LdjJ4Jmxn7ClKoT6FFH4=;
 b=Hr/abx6q0S1pDt+qFpYox79lkubPlGIwPHz+89Mf8LJjwJNAD7P0yz2smvOgvFFEb/Fx/oQl5
 3/AKH8CExErB486zPFLqUSoLz3d4jLmfXnNWchIsrE7CGMByG0LhNiP
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

Remove the declarations of these structures, as they are not used in the
driver code.
Remove the abi/ipu7_fw_psys_config_abi.h file because it contains
nothing but an unused structure and is not included anywhere.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h  |  11 --
 .../staging/media/ipu7/abi/ipu7_fw_common_abi.h    |  37 -----
 drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h  |   4 -
 drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h   | 172 ---------------------
 .../media/ipu7/abi/ipu7_fw_psys_config_abi.h       |  24 ---
 5 files changed, 248 deletions(-)

diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
index 56b90aab83ea..8d5c9b06d158 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
@@ -91,17 +91,6 @@ struct ia_gofo_boot_config {
 	struct syscom_config_s syscom_context_config;
 };
 
-struct ia_gofo_secondary_boot_config {
-	u32 length;
-	struct ia_gofo_version_s config_version;
-	struct ia_gofo_msg_version_list client_version_support;
-	u8 reserved1[IA_GOFO_BOOT_SECONDARY_RESERVED_FIELDS];
-	u16 checksum;
-	u8 padding[2];
-	u32 reserved2[IA_GOFO_BOOT_SECONDARY_RESERVED_SIZE];
-	struct syscom_config_s syscom_context_config;
-};
-
 #pragma pack(pop)
 
 #define IA_GOFO_WDT_TIMEOUT_ERR			0xdead0401
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
index 398a13350480..c50b355b04d8 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
@@ -41,16 +41,6 @@ struct ia_gofo_msg_version_list {
 
 #define IA_GOFO_ABI_BITS_PER_BYTE	(8U)
 
-struct ia_gofo_tlv_header {
-	u16 tlv_type;
-	u16 tlv_len32;
-};
-
-struct ia_gofo_tlv_list {
-	u16 num_elems;
-	u16 head_offset;
-};
-
 #define TLV_ITEM_ALIGNMENT	((u32)sizeof(u32))
 #define TLV_MSG_ALIGNMENT	((u32)sizeof(u64))
 #define TLV_LIST_ALIGNMENT	TLV_ITEM_ALIGNMENT
@@ -97,22 +87,6 @@ enum ia_gofo_msg_err_general {
 #define IA_GOFO_MSG_TYPE_LOG		2
 #define IA_GOFO_MSG_TYPE_GENERAL_ERR	3
 
-struct ia_gofo_msg_header {
-	struct ia_gofo_tlv_header tlv_header;
-	struct ia_gofo_tlv_list msg_options;
-	u64 user_token;
-};
-
-struct ia_gofo_msg_header_ack {
-	struct ia_gofo_msg_header header;
-	struct ia_gofo_msg_err err;
-
-};
-
-struct ia_gofo_msg_general_err {
-	struct ia_gofo_msg_header_ack header;
-};
-
 #pragma pack(pop)
 
 #pragma pack(push, 1)
@@ -132,12 +106,6 @@ enum ia_gofo_soc_pbk_instance_id {
 
 #define IA_GOFO_MSG_LINK_PBK_MAX_SLOTS	(2U)
 
-struct ia_gofo_msg_indirect {
-	struct ia_gofo_msg_header header;
-	struct ia_gofo_tlv_header ref_header;
-	ia_gofo_addr_t ref_msg_ptr;
-};
-
 #pragma pack(pop)
 
 #pragma pack(push, 1)
@@ -161,11 +129,6 @@ struct ia_gofo_msg_log_info_ts {
 	struct ia_gofo_msg_log_info log_info;
 };
 
-struct ia_gofo_msg_log {
-	struct ia_gofo_msg_header header;
-	struct ia_gofo_msg_log_info_ts log_info_ts;
-};
-
 #pragma pack(pop)
 
 #define IA_GOFO_MSG_ABI_OUT_ACK_QUEUE_ID	(0U)
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
index c42d0b7a2627..87bf2bd5576c 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
@@ -315,10 +315,6 @@ struct ipu7_insys_resp {
 	u8 pad[2];
 };
 
-struct ipu7_insys_resp_queue_token {
-	struct ipu7_insys_resp resp_info;
-};
-
 struct ipu7_insys_send_queue_token {
 	u64 buf_handle;
 	ia_gofo_addr_t addr;
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
index 311248385993..1d0541b1ae9d 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
@@ -55,18 +55,6 @@ enum ipu7_msg_node_profile_type {
 	IPU_MSG_NODE_PROFILE_TYPE_N
 };
 
-struct ipu7_msg_node_profile {
-	struct ia_gofo_tlv_header tlv_header;
-	ipu7_msg_teb_t teb;
-};
-
-struct ipu7_msg_cb_profile {
-	struct ipu7_msg_node_profile profile_base;
-	ipu7_msg_deb_t deb;
-	ipu7_msg_rbm_t rbm;
-	ipu7_msg_rbm_t reb;
-};
-
 #define IPU_MSG_NODE_MAX_PROFILES	(2U)
 #define IPU_MSG_NODE_DEF_PROFILE_IDX	(0U)
 #define IPU_MSG_NODE_RSRC_ID_EXT_IP	(0xff)
@@ -75,17 +63,6 @@ struct ipu7_msg_cb_profile {
 #define IPU_MSG_NODE_DONT_CARE_TEB_LO	(0xffffffff)
 #define IPU_MSG_NODE_RSRC_ID_IS		(0xfe)
 
-struct ipu7_msg_node {
-	struct ia_gofo_tlv_header tlv_header;
-	u8 node_rsrc_id;
-	u8 node_ctx_id;
-	u8 num_frags;
-	u8 reserved[1];
-	struct ia_gofo_tlv_list profiles_list;
-	struct ia_gofo_tlv_list terms_list;
-	struct ia_gofo_tlv_list node_options;
-};
-
 enum ipu7_msg_node_option_types {
 	IPU_MSG_NODE_OPTION_TYPES_PADDING = 0,
 	IPU_MSG_NODE_OPTION_TYPES_N
@@ -118,62 +95,16 @@ enum ipu7_msg_link_cmprs_option_bit_depth {
 #define IPU_MSG_LINK_CMPRS_SPACE_SAVING_NUM_MAX \
 	(IPU_MSG_LINK_CMPRS_SPACE_SAVING_DENOM - 1U)
 
-struct ipu7_msg_link_cmprs_plane_desc {
-	u8 plane_enable;
-	u8 cmprs_enable;
-	u8 encoder_plane_id;
-	u8 decoder_plane_id;
-	u8 cmprs_is_lossy;
-	u8 cmprs_is_footprint;
-	u8 bit_depth;
-	u8 space_saving_numerator;
-	u32 pixels_offset;
-	u32 ts_offset;
-	u32 tile_row_to_tile_row_stride;
-	u32 rows_of_tiles;
-	u32 lossy_cfg[IPU_MSG_LINK_CMPRS_LOSSY_CFG_PAYLOAD_SIZE];
-};
-
 #define IPU_MSG_LINK_CMPRS_MAX_PLANES		(2U)
 #define IPU_MSG_LINK_CMPRS_NO_ALIGN_INTERVAL	(0U)
 #define IPU_MSG_LINK_CMPRS_MIN_ALIGN_INTERVAL	(16U)
 #define IPU_MSG_LINK_CMPRS_MAX_ALIGN_INTERVAL	(1024U)
-struct ipu7_msg_link_cmprs_option {
-	struct ia_gofo_tlv_header header;
-	u32 cmprs_buf_size;
-	u16 align_interval;
-	u8 reserved[2];
-	struct ipu7_msg_link_cmprs_plane_desc plane_descs[2];
-};
-
-struct ipu7_msg_link_ep {
-	u8 node_ctx_id;
-	u8 term_id;
-};
-
-struct ipu7_msg_link_ep_pair {
-	struct ipu7_msg_link_ep ep_src;
-	struct ipu7_msg_link_ep ep_dst;
-};
-
 #define IPU_MSG_LINK_FOREIGN_KEY_NONE		(65535U)
 #define IPU_MSG_LINK_FOREIGN_KEY_MAX		(64U)
 #define IPU_MSG_LINK_PBK_ID_DONT_CARE		(255U)
 #define IPU_MSG_LINK_PBK_SLOT_ID_DONT_CARE	(255U)
 #define IPU_MSG_LINK_TERM_ID_DONT_CARE		(0xff)
 
-struct ipu7_msg_link {
-	struct ia_gofo_tlv_header tlv_header;
-	struct ipu7_msg_link_ep_pair endpoints;
-	u16 foreign_key;
-	u8 streaming_mode;
-	u8 pbk_id;
-	u8 pbk_slot_id;
-	u8 delayed_link;
-	u8 reserved[2];
-	struct ia_gofo_tlv_list link_options;
-};
-
 #pragma pack(pop)
 
 enum ipu7_msg_dev_state {
@@ -208,30 +139,6 @@ enum ipu7_msg_err_groups {
 };
 
 #pragma pack(push, 1)
-struct ipu7_msg_task {
-	struct ia_gofo_msg_header header;
-	u8 graph_id;
-	u8 profile_idx;
-	u8 node_ctx_id;
-	u8 frame_id;
-	u8 frag_id;
-	u8 req_done_msg;
-	u8 req_done_irq;
-	u8 reserved[1];
-	ipu7_msg_teb_t payload_reuse_bm;
-	ia_gofo_addr_t term_buffers[IPU_MSG_MAX_NODE_TERMS];
-};
-
-struct ipu7_msg_task_done {
-	struct ia_gofo_msg_header_ack header;
-	u8 graph_id;
-	u8 frame_id;
-	u8 node_ctx_id;
-	u8 profile_idx;
-	u8 frag_id;
-	u8 reserved[3];
-};
-
 enum ipu7_msg_err_task {
 	IPU_MSG_ERR_TASK_OK = IA_GOFO_MSG_ERR_OK,
 	IPU_MSG_ERR_TASK_GRAPH_ID = 1,
@@ -262,33 +169,11 @@ enum ipu7_msg_term_type {
 #define IPU_MSG_TERM_EVENT_TYPE_PROGRESS	1U
 #define IPU_MSG_TERM_EVENT_TYPE_N	(IPU_MSG_TERM_EVENT_TYPE_PROGRESS + 1U)
 
-struct ipu7_msg_term {
-	struct ia_gofo_tlv_header tlv_header;
-	u8 term_id;
-	u8 event_req_bm;
-	u8 reserved[2];
-	u32 payload_size;
-	struct ia_gofo_tlv_list term_options;
-};
-
 enum ipu7_msg_term_option_types {
 	IPU_MSG_TERM_OPTION_TYPES_PADDING = 0,
 	IPU_MSG_TERM_OPTION_TYPES_N
 };
 
-struct ipu7_msg_term_event {
-	struct ia_gofo_msg_header header;
-	u8 graph_id;
-	u8 frame_id;
-	u8 node_ctx_id;
-	u8 profile_idx;
-	u8 frag_id;
-	u8 term_id;
-	u8 event_type;
-	u8 reserved[1];
-	u64 event_ts;
-};
-
 #pragma pack(pop)
 
 #pragma pack(push, 1)
@@ -301,28 +186,6 @@ struct ipu7_msg_term_event {
 #define IPU_MSG_DEVICE_CLOSE_SEND_RESP		BIT(0)
 #define IPU_MSG_DEVICE_CLOSE_SEND_IRQ		BIT(1)
 
-struct ipu7_msg_dev_open {
-	struct ia_gofo_msg_header header;
-	u32 max_graphs;
-	u8 dev_msg_map;
-	u8 enable_power_gating;
-	u8 reserved[2];
-};
-
-struct ipu7_msg_dev_open_ack {
-	struct ia_gofo_msg_header_ack header;
-};
-
-struct ipu7_msg_dev_close {
-	struct ia_gofo_msg_header header;
-	u8 dev_msg_map;
-	u8 reserved[7];
-};
-
-struct ipu7_msg_dev_close_ack {
-	struct ia_gofo_msg_header_ack header;
-};
-
 enum ipu7_msg_err_device {
 	IPU_MSG_ERR_DEVICE_OK = IA_GOFO_MSG_ERR_OK,
 	IPU_MSG_ERR_DEVICE_MAX_GRAPHS = 1,
@@ -343,47 +206,12 @@ enum ipu7_msg_err_device {
 #define IPU_MSG_GRAPH_CLOSE_SEND_RESP	BIT(0)
 #define IPU_MSG_GRAPH_CLOSE_SEND_IRQ	BIT(1)
 
-struct ipu7_msg_graph_open {
-	struct ia_gofo_msg_header header;
-	struct ia_gofo_tlv_list nodes;
-	struct ia_gofo_tlv_list links;
-	u8 graph_id;
-	u8 graph_msg_map;
-	u8 reserved[6];
-};
-
 enum ipu7_msg_graph_ack_option_types {
 	IPU_MSG_GRAPH_ACK_OPTION_TYPES_PADDING = 0,
 	IPU_MSG_GRAPH_ACK_TASK_Q_INFO,
 	IPU_MSG_GRAPH_ACK_OPTION_TYPES_N
 };
 
-struct ipu7_msg_graph_open_ack_task_q_info {
-	struct ia_gofo_tlv_header header;
-	u8 node_ctx_id;
-	u8 q_id;
-	u8 reserved[2];
-};
-
-struct ipu7_msg_graph_open_ack {
-	struct ia_gofo_msg_header_ack header;
-	u8 graph_id;
-	u8 reserved[7];
-};
-
-struct ipu7_msg_graph_close {
-	struct ia_gofo_msg_header header;
-	u8 graph_id;
-	u8 graph_msg_map;
-	u8 reserved[6];
-};
-
-struct ipu7_msg_graph_close_ack {
-	struct ia_gofo_msg_header_ack header;
-	u8 graph_id;
-	u8 reserved[7];
-};
-
 enum ipu7_msg_err_graph {
 	IPU_MSG_ERR_GRAPH_OK = IA_GOFO_MSG_ERR_OK,
 	IPU_MSG_ERR_GRAPH_GRAPH_STATE = 1,
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_psys_config_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_psys_config_abi.h
deleted file mode 100644
index 0af04c8c6a88..000000000000
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_psys_config_abi.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2020 - 2025 Intel Corporation
- */
-
-#ifndef IPU7_PSYS_CONFIG_ABI_H_INCLUDED__
-#define IPU7_PSYS_CONFIG_ABI_H_INCLUDED__
-
-#include <linux/types.h>
-
-#include "ipu7_fw_boot_abi.h"
-#include "ipu7_fw_config_abi.h"
-
-struct ipu7_psys_config {
-	u32 use_debug_manifest;
-	u32 timeout_val_ms;
-	u32 compression_support_enabled;
-	struct ia_gofo_logger_config logger_config;
-	struct ipu7_wdt_abi wdt_config;
-	u8 ipu_psys_debug_bitmask;
-	u8 padding[3];
-};
-
-#endif

-- 
2.55.0

