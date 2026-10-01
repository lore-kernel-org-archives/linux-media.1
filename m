Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820F552CCD6
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867882; cv=none; b=gjVqYQA/KSjFuIxPikj/39gmWwTLeJDpTI/VC7IvNBNLVYQYS4BsXWu9N0e10fedqbLr9z/YzYw+1fplgsp8bGZX6sR4RBMtk75/qnLRJdI8uChY5qjdJzmDQ5Kmc7v7N+sltsU+XIyjmYTXSqCqte8pl8Ab8zanih4cY0F6VwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867882; c=relaxed/simple;
	bh=tPPHUwHHX/OafuDCROjZxTGu8vj6Vjkt0HYVBYYbz8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcJmswIXLKOIV/h5r875lE0TkgoMewuM+mYq95Bu+4Vw5IfIgb5q2uxm4NJoG6uFwRR5jSOAb4fnf3gvvx+yZtpCOQ/5P+WoBv7iCMt4gnZNNhY6b53oPat/Ki6WDOlVI9BMu9kw/vcGakYZ/WGVzuEdnGWUbDL+Mk4N/YFcFa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQYuw4V1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SMBCSDUu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQYuw4V1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SMBCSDUu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjKJ92825868
	for <linux-media@vger.kernel.org>; Thu, 1 Oct 2026 15:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLmJE0DDChv5rfubAsvD/8Fv46x8jbAyJKqtR/5CyPw=; b=MQYuw4V1LbV30dUo
	/WefhWEcZ8qicDp7kllnACFyGz35J5rUNtNHBQ1WnJ2WTtYYQujJyXc0CMx51Gcj
	ahskhjVybtmBIgJq2D0ib072PPNuzfd7aru+TSV85gqlW0uIWi4S+TXqOr2kXE9R
	M5InItqrL01f38ocyTVyQ7Cgf56e2caSHj+DgMGzm3i40HMWotfesFsxjnRcrZ0Q
	B8RBnw2PDftxETyqlwxwC0AqNeSIZWnvCvYZA9J9gNi7UtshzEAKQeIqV9F7vxto
	/6c5wZKOtVMzSZxdnD+K1tArZjpWP7QIQkODQZI8jvGN7qyo5c3N2CipvyQ7NeW2
	6kvKww==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcft8px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 15:17:59 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-144d4ba280aso603493c88.1
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867878; x=1791472678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLmJE0DDChv5rfubAsvD/8Fv46x8jbAyJKqtR/5CyPw=;
        b=SMBCSDUuSHKDtyXVrHLX/1P+oy3x+Zl6zFYdvgUIzwO5Bmznh9FAbrFbXsmXLL46v3
         Qy1UjLS6+RiHopyLq8WOIYAbtSL7GbYLHOuJVieLLiYQcXl+QXekXBDUPGHA9IowZuxA
         ia26qfwJ77IQzVQqXdM6yIGusorHZTTR1qpTMVKtfz4EeDJWkUJZ6VT539aWiFPdfpza
         OAYzzKRFXtU7fu2+ozCgLeBe2nFwEKvfBjDqV08NmDhWNPdv2LPtDuj8paOYmBltDEul
         LZDNMZoF3DdOENFm7Bvdgzjd5ToGqINqpmoR6hvgr57es3d4Z+OBKfYwbPV9GyfFqNef
         MdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867878; x=1791472678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLmJE0DDChv5rfubAsvD/8Fv46x8jbAyJKqtR/5CyPw=;
        b=f1J813I4GUO3JlLdsj9A3uMRdIubq1WpK07xl46SZ61JSOwnRFaVYPffb+glvwnbGd
         7SaTmvFdaarM/zn7gIXdgBeECD47tUGqEzgEwoMRV2rFOLz4M1SCz2XPWWGg0wwQdDOK
         ZGxT/Rj/QRRC8X5NeMUOxfXLEb0M5jb8/c2HlLiBdMIWmkQSxnsN9A/1J9PNlW87FWJq
         BpW+u/smQQzPveQ5WWGR7Nlb+Dt6PsLc9XrhfJlN6uhRPn2wm0XwREuke177FhuVJ9it
         qeJ3seab6rkQnOfG8Z9p+CTWBz6B0E+4tMrlEYAPIw+LWoaUvJ6fIf1trXg/Tl88Ji62
         M/nw==
X-Gm-Message-State: AFuF++mFUaURIG7AKi4AA3bIuv8OaUXEz7Q11N3qSyX7KfdMYhMtWlNa
	JOp1PxlORREsTHNMmZM907oIo2JXkqWM1/Zq0i+TLyUFB20YmMFHa5PaMFhKaGX0ZIhhYozM1nG
	DuBeka7jKSpMRIdKQdF4Jo6WZVDyRVm9qwZFEhd7AxZ5HRQ1vyKdj2IDeYaGfWJbUmw==
X-Gm-Gg: AYBFou3vKHqlCliA3saTmfIlS8u33Clzuybi22WXN0hoaJCNNbQjROO7Wh1cTkoGeMV
	gqQwjTPkzb9HwQCjVbnFTXb5y18To7qL6tyGTAgM0RLyLg1V6xKBUh2DVAj8T2KZgFF0kCkqF6t
	yIYUPU+OZ1yfFarGbMTP05gaqRCOISAOX2PKaIBm3O6cLssQ0o2H5aaJBOCGR6Jv3YfOLSZRGyD
	ipIj0fGwJ5GzmMY92ayB1tTqKXsItH9tUxaC/Lghiadft6jdXM8DfR6BuR8pEwhmYo7/W0UdObs
	Fzmvlc60Kut4y5wHn8IMJekESQjMv4zmPYv7SArzrWEYCOv9WKKHlYuFqOjtKZ8tECdUT0pDIYp
	K0nKnqcTWeLnKWXwg9uaXDo5eMOyhdnzBZg==
X-Received: by 2002:a05:701b:428a:10b0:143:f79:f662 with SMTP id a92af1059eb24-14dce22d73emr3187356c88.1.1790867878180;
        Thu, 01 Oct 2026 08:17:58 -0700 (PDT)
X-Received: by 2002:a05:701b:428a:10b0:143:f79:f662 with SMTP id a92af1059eb24-14dce22d73emr3187321c88.1.1790867877437;
        Thu, 01 Oct 2026 08:17:57 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f246d32d2sm115700c88.1.2026.10.01.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:17:56 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:47:23 +0530
Subject: [PATCH v4 3/6] media: iris: add iris4 specific H265 line buffer
 calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-kaanapali-iris-v4-3-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867851; l=6110;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=tPPHUwHHX/OafuDCROjZxTGu8vj6Vjkt0HYVBYYbz8g=;
 b=4GwYGn2JD+UI2iKHlin08jXTJrFEZZHKCh1LxQXWM4wFUOHK5y4XiEbaCpeJnT6FpDDTnYpO0
 g6D2PI2hTRvCP2zpXZzoOkVeGlsC1Rj2zq93FB4GekMrpFOkcoi0FWu
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX8stZYn3ZXioI
 5Ox6o+1Lu6NRAv7PGS+eQf8u3kjRzoiFZm5PCtfyFS80aZ3StinoB7o3axEKVnruR94ljubiS9x
 uxtnfhogM3CtDktiDzE0AVoCS9bTIQ4=
X-Proofpoint-GUID: Mq8QUy6UXkBHdIRKqBI3KuMFXhchapYF
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe79a7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=d6GF_uUdWyttvh-A5ooA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: Mq8QUy6UXkBHdIRKqBI3KuMFXhchapYF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXwzOmhQ+GyYmQ
 IihDoTMvatsr5o2k7oFs6vIBp+yhq4xuqWvKC63NdsbQZVOsLb59vriIg38faXM04pUSWKtztu8
 3hIpmJklorLiPe+T16hSl0rSQvc2CmH39dXMTVNM3N7N58aggR/8P4WZ6c8YzSFPUi2V0fvFm6O
 pP2Cn/6ZqYkkLdb5hS8LN9eFb/temKRDqTIG4mNEnVr+hgCrKIFe8N5yKpMXlNxMLpcR0sMO8ad
 32YUa8yj3U+p8HcV5pMBMsXqB97Oaai8g+hjytIfKHOAuNP+VeUIN+vhIaA3Hnm50KuJhAnCERH
 YmJFlgtCVs8rllyMF+abz9YKGQ1MKBtZNwrVAp+gsAsO0zyWgiOF9Yf6gdb4RiKc/7i9be5ihKP
 5gaec77x1h+RDVRdfe3NAN5+zJQikQivP2KwYRGbjSvHKuJExxHdCl+YTT0XTY2B8JgLLP6p4Fw
 E+9FTM8j5tSJFV8jy9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

The H265 decoder line buffer size calculation for iris4 (VPU4) was
previously reusing the iris3 formula. While this works for most
resolutions, certain configurations require a larger buffer size on
iris4, causing firmware errors during decode. This resolves firmware
failures seen with specific test vectors on kaanapali (iris4), and fixes
the following failing fluster tests
- PICSIZE_C_Bossen_1
- WPP_E_ericsson_MAIN_2

10bit tests
- DBLK_A_MAIN10_VIXS_4
- INITQP_B_Main10_Sony_1
- WP_A_MAIN10_Toshiba_3
- WP_MAIN10_B_Toshiba_3
- WPP_A_ericsson_MAIN10_2
- WPP_B_ericsson_MAIN10_2
- WPP_C_ericsson_MAIN10_2
- WPP_E_ericsson_MAIN10_2
- WPP_F_ericsson_MAIN10_2

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 59 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 16 ++++++
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index faebb54728660cc621f8822dabf2e44ce8c55c58..a99b8030e3dd052da1b7f70b9701f88c8ae50e74 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1814,6 +1814,63 @@ static u32 hfi_vpu4x_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yu
 	return lb_size + dpb_obp_size;
 }
 
+static u32 hfi_vpu4x_buffer_line_h265d(u32 frame_width, u32 frame_height, bool is_opb,
+				       u32 num_vpp_pipes)
+{
+	u32 num_lcu_per_pipe, se_left_lb, vsp_left_lb, top_lb, qp_size;
+	u32 fe_left_lb = 0, dpb_obp = 0, lcu_size = LCU_SIZE_16;
+	int i;
+
+	for (i = 0; i < num_vpp_pipes; i++) {
+		num_lcu_per_pipe = (DIV_ROUND_UP(frame_height, lcu_size) / num_vpp_pipes);
+		if (i == 0)
+			num_lcu_per_pipe += (DIV_ROUND_UP(frame_height, lcu_size) % num_vpp_pipes);
+
+		fe_left_lb += DMA_ALIGNMENT * FE_LFT_CTRL_BYTES_PER_PACKETS * num_lcu_per_pipe *
+			      FE_LFT_CTRL_LINE_NUMBERS;
+		fe_left_lb += DMA_ALIGNMENT * FE_LFT_DB_LUMA_CHROMA_BYTES_PER_PACKETS *
+			      num_lcu_per_pipe * FE_LFT_DB_DATA_LINE_NUMBERS;
+		fe_left_lb += DMA_ALIGNMENT * FE_LFT_SAO_LUMA_BYTES_PER_PACKETS *
+			      num_lcu_per_pipe;
+		fe_left_lb += DMA_ALIGNMENT * FE_LFT_SAO_CHROMA_BYTES_PER_PACKETS *
+			      num_lcu_per_pipe;
+		fe_left_lb += DMA_ALIGNMENT * FE_LFT_LR_LUMA_CHROMA_BYTES_PER_PACKETS *
+			      num_lcu_per_pipe * FE_LFT_LR_DATA_LINE_NUMBERS;
+	}
+
+	if (is_opb)
+		dpb_obp = size_dpb_opb(frame_height, lcu_size) * num_vpp_pipes;
+
+	se_left_lb = max3(((frame_height + LCU_SIZE_16 - 1) / H265_MIN_SE_CTRL_BLOCK_SIZE) *
+			  MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE,
+			  ((frame_height + LCU_SIZE_32 - 1) / H265_MIN_SE_CTRL_BLOCK_SIZE) *
+			  MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE,
+			  ((frame_height + LCU_SIZE_64 - 1) / H265_MIN_SE_CTRL_BLOCK_SIZE) *
+			  MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE);
+
+	vsp_left_lb = ALIGN(DIV_ROUND_UP(frame_height, LCU_SIZE_64) *
+			    H265_NUM_TILE_ROW, DMA_ALIGNMENT);
+
+	top_lb = DMA_ALIGNMENT * FE_TOP_CTRL_BYTES_PER_PACKETS *
+		 DIV_ROUND_UP(frame_width, lcu_size) * FE_TOP_CTRL_LINE_NUMBERS;
+	top_lb += DMA_ALIGNMENT * FE_TOP_LUMA_BYTES_PER_PACKETS *
+		  DIV_ROUND_UP(frame_width, lcu_size) * FE_TOP_DATA_LUMA_LINE_NUMBERS;
+	top_lb += DMA_ALIGNMENT * FE_TOP_CHROMA_BYTES_PER_PACKETS *
+		  (DIV_ROUND_UP(frame_width, lcu_size) + 1) * FE_TOP_DATA_CHROMA_LINE_NUMBERS;
+	top_lb += ALIGN(((frame_width + LCU_SIZE_64 - 1) / H265_MIN_SE_CTRL_BLOCK_SIZE) *
+			MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE, DMA_ALIGNMENT);
+	top_lb += ALIGN(ALIGN(frame_width, LCU_SIZE_64) * PE_TOP_RECON_DATA_BYTES_PER_PACKETS,
+			DMA_ALIGNMENT);
+	top_lb += size_h265d_lb_vsp_top(frame_width, frame_height);
+
+	qp_size = size_h265d_qp(frame_width, frame_height);
+
+	return ((ALIGN(dpb_obp, DMA_ALIGNMENT) + ALIGN(se_left_lb, DMA_ALIGNMENT) +
+		ALIGN(vsp_left_lb, DMA_ALIGNMENT)) * num_vpp_pipes) +
+		ALIGN(fe_left_lb, DMA_ALIGNMENT) + ALIGN(top_lb, DMA_ALIGNMENT) +
+		ALIGN(qp_size, DMA_ALIGNMENT);
+}
+
 static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
@@ -1829,7 +1886,7 @@ static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
 	if (inst->codec == V4L2_PIX_FMT_H264)
 		return hfi_buffer_line_h264d(width, height, is_opb, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)
-		return hfi_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
+		return hfi_vpu4x_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
 						  num_vpp_pipes);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 8c0d6b7b5de85f7d7aaa8fc36218e8d095419569..d482906712243ecb8b5478a4419fc16cb9efd6ce 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -150,6 +150,22 @@ struct iris_inst;
 #define BITS_PER_CTRL_PACK             128
 #define NUM_CTRL_PACK_LCU              10
 
+#define LCU_SIZE_16 16
+#define LCU_SIZE_32 32
+#define LCU_SIZE_64 64
+
+#define H265_MIN_SE_CTRL_BLOCK_SIZE		8
+#define FE_LFT_CTRL_BYTES_PER_PACKETS		1
+#define FE_LFT_DB_LUMA_CHROMA_BYTES_PER_PACKETS	2
+#define FE_LFT_SAO_LUMA_BYTES_PER_PACKETS	1
+#define FE_LFT_SAO_CHROMA_BYTES_PER_PACKETS	2
+#define FE_LFT_LR_LUMA_CHROMA_BYTES_PER_PACKETS	8
+
+#define FE_TOP_CTRL_BYTES_PER_PACKETS	    1
+#define FE_TOP_LUMA_BYTES_PER_PACKETS	    2
+#define FE_TOP_CHROMA_BYTES_PER_PACKETS	    2
+#define PE_TOP_RECON_DATA_BYTES_PER_PACKETS 6
+
 static inline u32 size_h264d_lb_fe_top_data(u32 frame_width)
 {
 	return MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE * ALIGN(frame_width, 16) * 3;

-- 
2.34.1

