Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10683EF67D
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 04:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705769; cv=none; b=XxIZYyWOMbLgqu1fM9uPCASQEcCASZCZqGsy1x9oab3CUggrDuRIhBcFWduho5f5bFIwk1OltfqLmpgalNKHqibgEm2aQN+FhNXhtZwYqwWVMHOItbqJtck13CZSAm0v2xMUqBRQei5TtBBKcfl6z84sBiAEJVrMF3z7g5R5Las=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705769; c=relaxed/simple;
	bh=SLS2J/inJ/xz1uivwN9BV3DhzJjwQFdcgOgS4Ib0jys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PexD7rGIpxxZTt+IbT0r4+LuMyCfzOnKujb9xqPJeWI2+xJerM2KuX7DBW2dtPoGFdwMagX5pPygjpHg/iXAMwIwgkLW9pzeGUYtYzwqKzD6vX7gXqn9KFb2MWzwV8f/p/1nHq2SYcVDQ3d3bKiTu16Yfh0WdGoFLr85zPmf0p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMowxlnY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/iSWKam; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMowxlnY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/iSWKam"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2UZY42972589
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 04:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCIBXw9ShbhLlQUDUJ12iBhDL+xTV61EhMEc4eN+bNE=; b=aMowxlnYR9fTaDsA
	jufzVGOm1uR0zB2j4iiEi7CWN+TvHYejXlmo4rdacNy/i/gQS3lMDwRoi9aedD50
	SprOgAefz4wewZE77kmPcYqQ6R38O3gAkmXIaEZFSKOThD6CTqJ1BR9htbTaAX4k
	an3W4yI6JigdO8yzvTyexWXvRFYpUCulRVlKuprzSJ/DcPYhjVYgbZvRBS7le7x2
	feHQItIKeiKPvlPW9ijk3iGrbiqA0u/zyXoUwP3iRpFAdDkYOIzOTwojmuOfUKkk
	CIrH//pDD2WZ3yErL7uvNLt1zDbVSevcY/2jIBT5KX1zt7k44f0P7xb3AxpbmbiK
	wYo70g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdsa7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 04:29:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc489e7a701so412215a12.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 21:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789705766; x=1790310566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCIBXw9ShbhLlQUDUJ12iBhDL+xTV61EhMEc4eN+bNE=;
        b=a/iSWKamgm3zMCA7+XP1F+OfPQ8PkfJm80CIf1aI14/+uJTbFUJgCv3X9Hs4ejzugL
         rWkxsvM7c0laHUipX6sk1gxj21J/JFQ0WTG3bDJRA1E9kmB3IMiw36b/haC/bEK6mrth
         o2fJA51+l5pjQriNjwPCfc9SG/HCEZVIK0SVUXTtb6NSc/h63JtsFnv0cG4c1n8ujH5+
         Rggiy1WGI7FqLBUt0md2VCJTwc/b0xAkK4Z7pArQj/+JtHw17JH0FTRYzjdeSW5ig7Kg
         bDQSk+aqIPFPM/Ryii1DwgTuy9cgiNaFaC7vL/X3rB1ISLzjYlWzDl7S8wgERxL0GmCS
         pznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705766; x=1790310566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCIBXw9ShbhLlQUDUJ12iBhDL+xTV61EhMEc4eN+bNE=;
        b=jYH1YxLt/9OylUvttIpno7kahCtyOklFX61K7BxmweCfa81LRaWy+0aHz4ihBxgObW
         szqQj7fVAtcux9XC7CT9zqeQxWyxE5l1c4NiQt3ewQ9kpcbAd3OtwUtnX5EOQjq9JpaH
         DJfTOwmX6aephEbpmFRHBpkzDy1j4O+oYCeHHR9gRAgS3NZ2h9TSsCgdzYvteOK2rH/w
         1FmXPVwVqG6kmiNJG42tlGnV2q6rwvrcdByEkBXZIwDxRvbfhGhsXnpcjqCFfIZ3SW/z
         cu9PtggZt3hJuS13DLYj3VeaMYqELfm+X8RDi8CkO0a+v0D/HCydqe7HSOlJen8S+Bks
         JnQA==
X-Forwarded-Encrypted: i=1; AKwUvBwM2LdTxJ6zpgQ3X36blGV2tEmGVFBZWoDOE5BrU7j2LRW6DpVcyzA4YmM0H8xTVFsNqCawv8tmmvOKsA==@vger.kernel.org
X-Gm-Message-State: AFuF++lt5RSx+t/ZUcxCbDRoIr6jC3kRFNXVoeDJ+rQh/1ysZ79/L1qE
	+lxSqShMpw5FpaJW+E4i+v7P9pGPxw/a3fHwT+x9N8mjvPIFpqQNkeOBAsxb2bK5B2nfcwLfJsC
	jWIbb52TTQpcKeFQsXvBTZi8Y9CzwVOUEFQOsCvKENSgRyXJPWqEJqk3IMXx0i27kzQ==
X-Gm-Gg: AYBFou2deAmWjl218mjJeS0ITscq1ourvxXTg1F1zvQcMuMlB3UpDmIoiy0X0YVWlp6
	rpy+3REOQDMQj+Vt9OabOBcX0FZ2A81auwv3U7gfYXjxkKAE+Uz6qtzazYeouKf1rhvJ9tTzoTa
	72SXtw8hTDU2yyMkr6TCMLswF1Ld17YYEPCa+FN3IMRvih5ig9XPBE9OaGwj/+5Z52v1TilTWGZ
	PXvjQ0lWMtPJhvl1SXDhXyMVS+U6zhPtFt0pXvmW+eLhE+6K0/XPYAZyQV5bxRQBN+xqaFuK6Qb
	QUAjs+v5Rqdk1fPFzKy1Fc15wSynt/GJJVn6kPQJtt0eSCCpYaN0a8NhSy/BopHoVuDh6wcDCOa
	FjTPzxUBdx3uMomXZmvSY6VBX9vwOX5k=
X-Received: by 2002:a05:6a21:1f89:b0:398:8870:b58f with SMTP id adf61e73a8af0-3dd8c36b679mr2696754637.14.1789705766479;
        Thu, 17 Sep 2026 21:29:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f89:b0:398:8870:b58f with SMTP id adf61e73a8af0-3dd8c36b679mr2696723637.14.1789705766023;
        Thu, 17 Sep 2026 21:29:26 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c4dba322sm214595a12.10.2026.09.17.21.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:29:25 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:28:44 +0800
Subject: [PATCH 5/6] media: iris: add VPU5x internal buffer size
 calculations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-add_iris_for_hawi-v1-5-ac60fd15c98b@oss.qualcomm.com>
References: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
In-Reply-To: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789705735; l=6876;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=SLS2J/inJ/xz1uivwN9BV3DhzJjwQFdcgOgS4Ib0jys=;
 b=dtcoH7e8zZ8GVz2n+cLkdmEugNu5REVW8os+9FFJKtfpPcf4VYusV+gbNJW2n2XbDMx/RA+IH
 ECaaD+X0FC3CM5zEW9g1Wv2w1MQZRemJm804IkzkDdWL9YXURtQfcQl
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX/r8LYdZKwgvb
 c3tAynXB1X8EIW1f7xuSKmBunzAwYKt4veLg/J0C+pavhQoKLuywo5eY7L9gAoQYs4Hv8W+ozvQ
 MX1KEB2WEDyw9aq9S4bMKgQBblGv6mOCJt8uIinEel3ZHQCMGwRUzdFhq3hOWNEMH7DM0umHETt
 bbRRG5LCd7Ewzg3oqimQ0yK75iaceRDRYYmwFkmGtj56eywn9VmqptDAkEue53Zy0ETqYWgBK5A
 lgHB/ilznlL7MkRWXKVbqjMUjakjM7cZ81oTGSZ2pxWh6iEp156K0gotLN+wivusUICrUWcpz0U
 3qlEklc6pXyIjZtYmQUBbV1Fn+nFM45sALQ/y2cxvczBxw1tKyn+n20OSWr+o9mJqV4GzgpdoKM
 UAlUcQ+qsijfTq2hzFWZsa24qKFiAjMpJil1FXRaq87bozQfiL6rc11J000Jx4pW7M2ncQX2Uf5
 jhuunNqxbfQnCIOgzvw==
X-Proofpoint-ORIG-GUID: bx5h08ANlEhvkd_F79Zm73rP5x65H37R
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX9BOgGErG1Avo
 vteYn295nMKCgV5e1kvGcbgY6kRUOSQSENeK5PSNM4S2CRJntwRfEt/BSisCfTipUx9dnxTpBe2
 dO0BSUIDBDh9gFZkQxCFTRr0My99a5w=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aacbe27 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TQKVwlwO4xRIBFL53c4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: bx5h08ANlEhvkd_F79Zm73rP5x65H37R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180056

VPU5x firmware uses internal buffer formulas that differ from VPU4x. In
particular, the H.265 decoder persistent buffer needs space for SEI
unregistered userdata and three-dimensional userdata, and the encoder
calculations use a larger lambda LUT size.

Add a VPU5x buffer-size dispatcher and a VPU5x-specific H.265 persistent
buffer calculation while reusing the existing helpers for buffer types
whose formulas are unchanged.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 93 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  5 +-
 2 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index faebb54728660cc621f8822dabf2e44ce8c55c58..9a44d627b413fa61c7d97cad95d182d3107b9ee5 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1868,6 +1868,54 @@ static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
 	return 0;
 }
 
+static u32 hfi_vpu5x_buffer_persist_h265d(bool rpu_enabled)
+{
+	u32 slist_buf = SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265;
+	u32 frame_info = H265_NUM_FRM_INFO * H265_DISPLAY_BUF_SIZE;
+	u32 tile_info = H265_NUM_TILE * sizeof(u32);
+	u32 per_pic = NUM_HW_PIC_BUF *
+		      (SIZE_SEI_USERDATA + SIZE_SEI_USERDATA_UNREGISTERED + SIZE_H265D_ARP +
+		      SIZE_THREE_DIMENSION_USERDATA);
+	u32 dolby_rpu = rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA;
+
+	return ALIGN(slist_buf + frame_info + tile_info + per_pic + dolby_rpu, DMA_ALIGNMENT);
+}
+
+static u32 hfi_vpu5x_buffer_persist_av1d(u32 max_width, u32 max_height, u32 total_ref_count)
+{
+	u32 comv_size = hfi_buffer_comv_av1d(max_width, max_height, total_ref_count);
+	u32 seq_hdr = SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA;
+	u32 per_pic = AV1D_NUM_HW_PIC_BUF *
+		      (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM + SIZE_AV1D_ARP + SIZE_AV1D_METADATA);
+	u32 frame_hdr = AV1D_NUM_FRAME_HEADERS *
+			(SIZE_AV1D_FRAME_HEADER + 2 * SIZE_AV1D_PROB_TABLE);
+
+	return ALIGN(seq_hdr + per_pic + frame_hdr + comv_size + HDR10_HIST_EXTRADATA_SIZE,
+		     DMA_ALIGNMENT);
+}
+
+static u32 iris_vpu5x_dec_persist_size(struct iris_inst *inst)
+{
+	struct platform_inst_caps *caps;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		return hfi_buffer_persist_h264d();
+	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		return hfi_vpu5x_buffer_persist_h265d(0);
+	} else if (inst->codec == V4L2_PIX_FMT_VP9) {
+		return hfi_vpu4x_buffer_persist_vp9d();
+	} else if (inst->codec == V4L2_PIX_FMT_AV1) {
+		caps = inst->core->iris_platform_data->inst_caps;
+		if (inst->fw_caps[DRAP].value)
+			return hfi_vpu5x_buffer_persist_av1d(caps->max_frame_width,
+			caps->max_frame_height, 16);
+		else
+			return hfi_vpu5x_buffer_persist_av1d(0, 0, 0);
+	}
+
+	return 0;
+}
+
 static u32 size_se_lb(u32 standard, u32 num_vpp_pipes_enc,
 		      u32 frame_width_coded, u32 frame_height_coded)
 {
@@ -2194,6 +2242,51 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 	return size;
 }
 
+u32 iris_vpu5x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
+	u32 size = 0, buf_type_handle_size = 0, i;
+
+	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_dec_bin_size         },
+		{BUF_COMV,        iris_vpu3x_4x_dec_comv_size   },
+		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
+		{BUF_LINE,        iris_vpu4x_dec_line_size      },
+		{BUF_PERSIST,     iris_vpu5x_dec_persist_size   },
+		{BUF_DPB,         iris_vpu_dec_dpb_size         },
+		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size    },
+		{BUF_PARTIAL,     iris_vpu_dec_partial_size     },
+	};
+
+	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_enc_bin_size         },
+		{BUF_COMV,        iris_vpu_enc_comv_size        },
+		{BUF_NON_COMV,    iris_vpu_enc_non_comv_size    },
+		{BUF_LINE,        iris_vpu4x_enc_line_size      },
+		{BUF_ARP,         iris_vpu_enc_arp_size         },
+		{BUF_VPSS,        iris_vpu_enc_vpss_size        },
+		{BUF_SCRATCH_1,   iris_vpu_enc_scratch1_size    },
+		{BUF_SCRATCH_2,   iris_vpu_enc_scratch2_size    },
+	};
+
+	if (inst->domain == DECODER) {
+		buf_type_handle_size = ARRAY_SIZE(dec_internal_buf_type_handle);
+		buf_type_handle_arr = dec_internal_buf_type_handle;
+	} else if (inst->domain == ENCODER) {
+		buf_type_handle_size = ARRAY_SIZE(enc_internal_buf_type_handle);
+		buf_type_handle_arr = enc_internal_buf_type_handle;
+	}
+
+	for (i = 0; i < buf_type_handle_size; i++) {
+		if (buf_type_handle_arr[i].type == buffer_type) {
+			size = buf_type_handle_arr[i].handle(inst);
+			break;
+		}
+	}
+
+	return size;
+}
+
 static u32 internal_buffer_count(struct iris_inst *inst,
 				 enum iris_buffer_type buffer_type)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 8c0d6b7b5de85f7d7aaa8fc36218e8d095419569..46210a2ec4942642ef61fc09cb0cc414f109607f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -64,6 +64,7 @@ struct iris_inst;
 #define VP9_UDC_HEADER_BUF_SIZE	(3 * 128)
 
 #define SIZE_SEI_USERDATA			4096
+#define SIZE_SEI_USERDATA_UNREGISTERED		256
 #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
 #define H264_CABAC_HDR_RATIO_HD_TOT	1
 #define H264_CABAC_RES_RATIO_HD_TOT	3
@@ -116,11 +117,12 @@ struct iris_inst;
 #define SIZE_AV1D_TILE_OFFSET     65536
 #define SIZE_AV1D_QM              3328
 #define SIZE_AV1D_PROB_TABLE      22784
+#define SIZE_AV1D_ARP             9728
 
 #define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
 #define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)
 #define SIZE_BSE_SLICE_CMD_BUF ((((8192 << 2) + 7) & (~7)) * 3)
-#define SIZE_LAMBDA_LUT (256 * 11)
+#define SIZE_LAMBDA_LUT (256 * 13)
 
 #define HFI_COL_FMT_NV12C_Y_TILE_HEIGHT (8)
 #define HFI_COL_FMT_NV12C_Y_TILE_WIDTH (32)
@@ -288,6 +290,7 @@ static inline u32 size_av1d_qp(u32 frame_width, u32 frame_height)
 u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu5x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif

-- 
2.43.0

