Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948596;
	b=G/KRl9QdT0sRqXFS4xGb/HDYiB84LQukhdYejPrvu/R2Prsm6up5Ee6pgnRCmyAnCRCf
	 9k2Gjwnlo0cLJ5zy+kzo+IFdvD8/cbVVIUVzSU7O28WkB59B8dRbcoeYctjx2uUR7bLQF
	 sFvK/9UpDezBu1pcxAVyQ+ncZa+Idy7cj+YOSQYuGeJFSOGJMDloPeNMSf8KhG2LKEkhr
	 8dMeOG1mIE9XRhfRco33HjJloCjmArdB5Uv3Ic5IWgoeEUZ7aT8LXlQGHLmTUaUxlCbGN
	 dNbMCwMBrI7t6nHxG/PDy8WPmH06Pdpy7CHhBV7rhuWvTzZ2KiI2VVkPQWzQB5vmLAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hEM7O+SfQ/P5il8iwTrMriaGVNGLOg5byRDEqHK9yNo=;
	b=goSO4Tppoyhvd5oYmbb9gBSfT3vjzFmZ3BlmluKkM9r1wNqQd4eLa4iZm6U7xp4lk1L6
	 9GkytQGSh1Iv6e7jQbkizVHVZ+qsxHztseigPsjnRNpcCs9r7qoWWkIphA/ID+YVMHJWJ
	 PXYySid6EVwR8tACIx+Koc2CO89wXBpXLCVU3912eFsuCltRcnXrNYwUkiNnIxK94liuD
	 8FhnMSBdY/LP2MgICbjJKjoV1DGq0PlEYhfugcIdp5YrbJEl3kzovhYFKvk6ch2GR8MUY
	 oouVVMEuqZgFBuJLSzWG3g3W9J7APmSPbdpHBp6BXpxyaeTKOcwzFmnSLG40H5U3UOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLNQ5nfb;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910FA606A89D
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 20:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 910FA606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLNQ5nfb
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso152185c88.1
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 12:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948595; x=1795553395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEM7O+SfQ/P5il8iwTrMriaGVNGLOg5byRDEqHK9yNo=;
        b=lLNQ5nfbKi8F59LyfWYawqhvhrT2KprwXCQRkhMPXDLJdENW/tW7ZQjjPSDpSx06hw
         8QpJnHYOngvA5o3KG5KlQjgG7pdVtWanlvysavS6SdD3FpGCkg0aDZvPKXXKMFU1pERD
         cX/IfWPbFmxt7IL7GGNmVyY2sl4+8ok8syOrNTZyY92iJpPqLfU9nYgDOQAC45arAbdX
         OiXBsQ22BUqrgo/q5kockOLIWa8XjE9WUgMACGDvIZDaplH7SbMqhHH5nDRBiW+/fp8O
         4wzuGJDIPeo6AykG0NWXNGe9eZdDX29QEuZkPCHoel5XTLml4RgIiY2OCjDNPHtpbUVJ
         2Oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948595; x=1795553395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEM7O+SfQ/P5il8iwTrMriaGVNGLOg5byRDEqHK9yNo=;
        b=Ru72TQ5yS6dljUMLZ6dC8vaLVYgxSWYMWSpCJ64tFigjPZVQb3mXKxQahlMW07HK4l
         GdsPMfGh/txMjDg8PxhoN6UhkgkYW+aoaDyPhBZQDRFqHvzSgtf1vi2yJnkmlAfKblcM
         8cultqHteSyeVGfItUUMWbKJvTxxK4bCkUL1SXwGWZJorrPUXLIU3F40lixKOValqp5R
         Zx2Pm2k/fRDLIN4G2N91P+GIM5QVXxsuzwdLlm6Z+IUvgQW7/qOCEDviZOSvpInNfhIt
         eJFWxP7MZ/Gsku+tiKtD/VaLpuZtWDRdeeODLSbyScU8M5eVzOsmfTo0hAb98wOMeS/y
         X83A==
X-Forwarded-Encrypted: i=1; AL+hErGto2ChQS1SJ/U2ZeUX1Yq+K2e9piX1fzY+9DSvOSwFIbxQ0+OGlmJO/UFcHUTQPlaML/qiB5mU7zMHMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bpys5CrCOEz6YVT2DPTpEVfKwg+HMKjF/jwOCSgU3bFW4531k
	tIyMHwokMUMqVqa401aJIjrfYUHtv709oqI4SWz3yBOtAEnS6Jf6CFFz
X-Gm-Gg: AYBFou09jhH/3JoHOaP4wNkHQ2xRSM9Q0tiPDgsq5+voBxQx4Jzv8a6kzMtqQmUznAt
	kJtwCRrPfvXC2oCKXc8MR9ykQq5ct/CR4CI13dib7J1Ftws/Im69sL5Y+FaY25Onf7UywRZuw4Q
	8LVivxcwHd1doZTCFx0lKKPW8YbLVUimV6/Y7d8MzSwQ4foliUhXe/4ypHuqKRsdCYYv6A6Saqn
	wnpoinYi9bMhw14KaBpZm4nCjZdcauLGieCCQqsXJ0Oxe+8UL1Y25s1ttlAdieIxGLESFaJhPOb
	pVGosuAx+x9Z7wUSAHabDa2vQpdGq5FkU0gEmwzMl4F4q+rJwDombXTDZi4mjO2at+oNvjYpy06
	PRVnMmO8NbhDSsb0C8Iad5uwfQTyOFrWSOOvC88ODDdaxAmyJotoBZrrU/5dCHJDzIonA0/NdGR
	1v892kdALDpwG1C4yv7i6pGPct4Ci/wIHwpZ+pjGeeJCRf7iemD6Z+O0Aca6asopw4W+7SYLUTM
	T/PsATznVvrljtVUIXSI8RL8wwm6jpTSzWqtxSTjSf6kQ4VHYpghiJAZiQ5qea/28N+dCwooyvW
	zC/WaRxEjwgJCbOPNXl20TNyJBeoLePiA0aFEv07K795y+SrWhfjchVcS3zsihkWe1iRxRLNFLB
	yEX/HU2/XqLNhvo1MWqXjjClI7fLGgEkTPktc93A9fTE9+z5XI2H7ltCoua4=
X-Received: by 2002:a05:701b:424d:20b0:199:7dff:f9cc with SMTP id a92af1059eb24-1b543c4406fmr654577c88.42.1794948594727;
        Tue, 17 Nov 2026 12:49:54 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm989029c88.11.2026.11.17.12.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:49:54 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH 2/2] media: iris: fix out-of-bounds read in gen1 sequence change event
Date: Tue, 17 Nov 2026 20:49:45 +0000
Message-ID: <20261117204946.21359-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117204946.21359-1-dennylin0707@gmail.com>
References: <20261117204946.21359-1-dennylin0707@gmail.com>
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

iris_hfi_gen1_read_changed_params() walks the properties of a
HFI_EVENT_SESSION_SEQUENCE_CHANGED event. The number of properties comes
from the firmware in event_data2 and the payload is never checked against
the size of the packet. A count that is larger than what the packet holds
makes the loop read past the end of the packet and, if it is large enough,
past the end of the response buffer. The values that are read end up in
the formats and in the crop rectangle that user space can query.

The same code in venus was fixed by commit 06d6770ff0d8 ("media: venus:
Fix OOB read due to missing payload bound check"). Do the same here: keep
track of the bytes that are left in the packet and put the instance into
the error state when a property does not fit.

Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 .../qcom/iris/iris_hfi_gen1_response.c        | 73 ++++++++++++++-----
 1 file changed, 54 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index ffa98139f0eb..a5b43a408e55 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -34,72 +34,102 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 	struct hfi_framesize *frame_sz;
 	struct vb2_queue *dst_q;
 	struct v4l2_ctrl *ctrl;
-	u32 full_range, ptype;
+	u32 full_range, ptype, rem_bytes;
+	u32 size_read = 0;
+
+	rem_bytes = pkt->shdr.hdr.size - sizeof(*pkt);
 
 	do {
+		if (rem_bytes < sizeof(u32))
+			goto error;
 		ptype = *((u32 *)data_ptr);
+
+		data_ptr += sizeof(u32);
+		rem_bytes -= sizeof(u32);
+
 		switch (ptype) {
 		case HFI_PROPERTY_PARAM_FRAME_SIZE:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_framesize))
+				goto error;
+
 			frame_sz = (struct hfi_framesize *)data_ptr;
 			event.width = frame_sz->width;
 			event.height = frame_sz->height;
-			data_ptr += sizeof(*frame_sz);
+			size_read = sizeof(struct hfi_framesize);
 			break;
 		case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_profile_level))
+				goto error;
+
 			profile_level = (struct hfi_profile_level *)data_ptr;
 			event.profile = profile_level->profile;
 			event.level = profile_level->level;
-			data_ptr += sizeof(*profile_level);
+			size_read = sizeof(struct hfi_profile_level);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_PIXEL_BITDEPTH:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_bit_depth))
+				goto error;
+
 			pixel_depth = (struct hfi_bit_depth *)data_ptr;
 			event.bit_depth = pixel_depth->bit_depth;
-			data_ptr += sizeof(*pixel_depth);
+			size_read = sizeof(struct hfi_bit_depth);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_PIC_STRUCT:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_pic_struct))
+				goto error;
+
 			pic_struct = (struct hfi_pic_struct *)data_ptr;
 			event.pic_struct = pic_struct->progressive_only;
-			data_ptr += sizeof(*pic_struct);
+			size_read = sizeof(struct hfi_pic_struct);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_COLOUR_SPACE:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_colour_space))
+				goto error;
+
 			colour_info = (struct hfi_colour_space *)data_ptr;
 			event.colour_space = colour_info->colour_space;
-			data_ptr += sizeof(*colour_info);
+			size_read = sizeof(struct hfi_colour_space);
 			break;
 		case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(u32))
+				goto error;
+
 			event.entropy_mode = *(u32 *)data_ptr;
-			data_ptr += sizeof(u32);
+			size_read = sizeof(u32);
 			break;
 		case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_buffer_requirements))
+				goto error;
+
 			bufreq = (struct hfi_buffer_requirements *)data_ptr;
 			event.buf_count = bufreq->count_min;
-			data_ptr += sizeof(*bufreq);
+			size_read = sizeof(struct hfi_buffer_requirements);
 			break;
 		case HFI_INDEX_EXTRADATA_INPUT_CROP:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_extradata_input_crop))
+				goto error;
+
 			crop = (struct hfi_extradata_input_crop *)data_ptr;
 			event.input_crop.left = crop->left;
 			event.input_crop.top = crop->top;
 			event.input_crop.width = crop->width;
 			event.input_crop.height = crop->height;
-			data_ptr += sizeof(*crop);
+			size_read = sizeof(struct hfi_extradata_input_crop);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_dpb_counts))
+				goto error;
+
 			iris_vpu_dpb_count = (struct hfi_dpb_counts *)data_ptr;
 			event.buf_count = iris_vpu_dpb_count->fw_min_count;
-			data_ptr += sizeof(*iris_vpu_dpb_count);
+			size_read = sizeof(struct hfi_dpb_counts);
 			break;
 		default:
+			size_read = 0;
 			break;
 		}
+		data_ptr += size_read;
+		rem_bytes -= size_read;
 		num_properties_changed--;
 	} while (num_properties_changed > 0);
 
@@ -170,6 +200,11 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 			event.bit_depth, event.pic_struct);
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
 	}
+
+	return;
+
+error:
+	iris_inst_change_state(inst, IRIS_INST_ERROR);
 }
 
 static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
-- 
2.43.0

