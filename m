Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489EA481A94
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390859; cv=none; b=liWx7dxrKt4Rl7KNH/c+OZCEPlsYcC2FhLto45+DD5dQ4EGy54fvlKi44oEZ0GQF2GFiAiGk8yUhntKReEw2f9ZjNMOvs5dNPpK44eLR6RQFrgwXbzHQJ+QbriycYm7dg5aqozr9uNquE8BriGKqSvxctbs0z6e9zHO7YI9tleM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390859; c=relaxed/simple;
	bh=ZQPDrh9thPcyLrmqNlOQ6RFqySGwD+JqOk2p02qve6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gl3E5B/6MiFoTFlAOwGZ4knmml9mOKZso4P1JStIz/AY48zcUPEpz7o9OAXkRWc6r20q8joJpIQFQBaNaqlNU2NJrjvwVEnDtYnDsgZB8TOzlBRbqWcOYJ74R9xj6zTfb7L1AFpNd3SEJxYP1fyBgOB08wvpm5sofOQn8XWcPbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiZHWsdX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Euod0mPz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiZHWsdX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Euod0mPz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0aJd830774
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJa3QlB9XmcdOuaIJqjt5TDlCsx8pLSmc7Zf1x/8FoI=; b=NiZHWsdXKbVBosxS
	8KB3Z/7Gd/cPOVdCppJ+rRJZlUxLp8kISurN0arImT5SWrYsiQU1DYNQKfLFFqNY
	BBKHUf30FYbYVjWg2ouuw/j1OZzeJkPZr51OCE/AxHmGQ7PlR0pb3+nLRx54NfGZ
	hnWdC3RtRPzOz5kvKQHnXMmYJLM1xRdi/DrgUpQE8IaxjL1ebp18GFcmKL+7pib+
	e5JAEFzrZ5esXpxAq1W5haW4wBV+FUskTcZhPvcoBpasmYG0dm61kKZxMlR4SBCq
	7htM3j87WQChvxRIebg30x5rR8uRWOQlygPPsIH1vvHDUpAEP+filQc/PGeb8FYP
	fb6AIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstgvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:00:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dc92350888so55290615ad.3
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 06:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390856; x=1789995656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJa3QlB9XmcdOuaIJqjt5TDlCsx8pLSmc7Zf1x/8FoI=;
        b=Euod0mPzgDHxV55Y/JVibGw5mhu9piTbhLRLzG4nxOtXZ90E1EOr64yNJ5qPiMPnzd
         A0Tiw7hxTAoNcE9a3zVYdU/Yehqay4nY4R3e1PyDkcQ02goRhj+rxApKx4cCyVvBP8XG
         5fQpS0MCNzvS+csVMNG9NzYdnDO/My4+zcLeBZRGUpVHi0Hl/y4Ko+WuEgDsKaqxiDc4
         K5M8Nukrp2vyYF5C624A1as46ldcTFJEskqtcJrPOlgoUU2OtQ1YjfEdupw+3hvJu+D8
         p8tgOWfhWxabSDqY+eaMIC80r+VEt52mwEm9/ncbipX1g1Oqun4IfbIx353OCgsbIdlT
         lCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390856; x=1789995656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJa3QlB9XmcdOuaIJqjt5TDlCsx8pLSmc7Zf1x/8FoI=;
        b=Fha9/Kf2Y2x6hK0jEIOhSXSBUKoZ6kpsKSt8BaaBAfZGAEujI7oVYNJPqKm7LJMhgd
         33tznmJDeo/XRgHN68GfSf3dDdeh0MtjZvgvUz7WtNL/pbn5BrLu/Bhg9KOY5OnmZSv1
         VtSnZl1vi6ibWlRLZD/yY2Ms2nJ/j7QPKSqkWp7puC8Uvm/VNxIOZ1Pwxy++AIQdhQ5P
         tjWs9DHt3dRe5IGZhNkxqzvmuFppogkB+lJ464SHjTyQbkbpEAqm2RGxMVmVsyihJHUz
         BLTl+V/3CTsB+m/855LEFSZh42yB4XJ0gnEVnU+k/45ftKPla6aLLcB1RZiOVNmM4reg
         Y72Q==
X-Gm-Message-State: AFuF++nVu8bb0gdc2Bv7+4ZgxCcT6QNGuEbfnkyOTr7A6RlduwUANuIP
	F+HxrcbB1F6VieDZcFRY449cjGH+HzwzSXOND72SfGFdw2cjrGAWUfdXdlUc/RzM5Ademmw/cq3
	XbmleiAg4bGS8ULJpLZqJg2g4tC7hUVhRc4rfhsAVBl8EAnpaceNtblMZOnElGAgt4w==
X-Gm-Gg: AYBFou27bOm15F0DL8+1G1SeF5SaEaR9Rnjo2oZWXE7h1LK9I8RLsbBqUvDVJ1NYbcb
	E+pFfRv+Sx2pxkJzbWx+ZkIVvDYOCWI7y1IJa+p4XQXQAQsx9JosUuYLVteMys+UReVMva23GNO
	Z6w5XBDz7WQ1xjE15eWUXrki1h1khARPg7pj9HpTMCODsuBf+uO2H5Tf/SK54T1TmF+vWvktooK
	ptVCMKg9BVSTwgfsr/tYw3Vz8y2b4cV2E9tYjyzlaQnfeB/ZUbHBv8BUn/3RLEsNH5ospPlWmPV
	NuvJU8EBOI6AINs8Z8haf4Qs9WnxpeVnkjSRPu81JTjPRDatvhkU4CDdO9ikPehcBwvJ9BGKYAj
	1R6fAo0R107coFP0zLKvqZBhJLQAIB5mZ95dkD4Lb2HzCnRjzbE9FSiOTc6PK12Wthsp69oLYp0
	s=
X-Received: by 2002:a17:903:3c67:b0:2dd:68a4:16f1 with SMTP id d9443c01a7336-2dd6c6c0cd4mr51435035ad.11.1789390855601;
        Mon, 14 Sep 2026 06:00:55 -0700 (PDT)
X-Received: by 2002:a17:903:3c67:b0:2dd:68a4:16f1 with SMTP id d9443c01a7336-2dd6c6c0cd4mr51433935ad.11.1789390855017;
        Mon, 14 Sep 2026 06:00:55 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:00:54 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 21:00:26 +0800
Subject: [PATCH 3/5] media: iris: add AV1 decode buffer size support for
 vpu4x
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_maili-v1-3-09df2b54c317@oss.qualcomm.com>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=3944;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=ZQPDrh9thPcyLrmqNlOQ6RFqySGwD+JqOk2p02qve6c=;
 b=uJCJSwmIGwwKDGY/2h/wf770NfbU3rfE+TQVzwqN/JLn2p1VWUxfwkVY6tMIms7NNf3hLstM8
 TS5jQbh+ZrGBeu54LmH3Ni6wju91LnEq5ahvPThQK0F8Sjf5f4lVuFa
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX9aEb/4WRE9hd
 tLo6yR1MWCDd6rgUbCjRM10eQpXVkYKn70SDAf86un32wSFIac8aYi2UjYQpvJ+7k+Xxx02x6hW
 48ddicdCXaQVyumw8HtFu7w8FUb6Y563wQCxHkPU8Pg7/3sGnd9jTSewobi+jNAKSQDlTeVIEAq
 YwfPPs5aqioCHUquslzrk7omkjkcMOF5GZIy3z/9wnrCkov80DXBoXr+AI2QbvUaAPrMSXFbnUI
 glpeNmx5KLWPp4y+trOYACLWq1Ufz80Kp2zymhoIqOD8nOUvndHypwFpjqt+rvT5gCHOsdlhcj4
 ISc2WuIMl1r/CHpPoPvzTFgMet9jhUBdLRTgEfV5ZWXi0g+NmQxRISPF1mz/WygMx/JMaL77Sfu
 jrmbiSF52JgrCmZTO816Hu0IyNBGHlJdvV/xhhgPYIgdhJsCV0Q+uaZFv+uhuYG1I33sjQHkTAN
 Ei86/adkdpnqU+GC36Q==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7f008 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vsqskg4-7OKJpdbeU5sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: N__vRfVy2ZYceK5gYrDIjQtwPSAsllSu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX1g4sClP915dF
 w1HEdUjFJyjJhg/4tb4F4EmN+uvQZAhsDeFADtxq3M/EB/tkJ469KAoHYYy+HdDBgYFY4q34cx/
 x3rCuNQ6ivBlorPcS69R6efEve068Ls=
X-Proofpoint-ORIG-GUID: N__vRfVy2ZYceK5gYrDIjQtwPSAsllSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140186

Add necessary buffer size calculation to support AV1 decode for vpu4x

- wire AV1 into iris_vpu4x_dec_line_size() via hfi_buffer_line_av1d()
- add hfi_vpu4x_buffer_persist_av1d() for the vpu4x's persist buffer
  size calculation
- add BUF_PARTIAL to the vpu4x decoder dispatch table, which AV1D
  requires

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 35 ++++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index faebb54728660cc621f8822dabf2e44ce8c55c58..55996fd0d14c385ee63d2577b3e6d71b51d9e541 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1833,6 +1833,8 @@ static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
 						  num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		return hfi_buffer_line_av1d(width, height, is_opb, num_vpp_pipes);
 
 	return 0;
 }
@@ -1856,14 +1858,40 @@ static u32 hfi_vpu4x_buffer_persist_vp9d(void)
 		HDR10_HIST_EXTRADATA_SIZE;
 }
 
+static u32 hfi_vpu4x_buffer_persist_av1d(u32 max_width, u32 max_height,
+					 u32 total_ref_count, u32 rpu_enabled)
+{
+	u32 comv_size, size;
+
+	comv_size =  hfi_buffer_comv_av1d(max_width, max_height, total_ref_count);
+	size = (SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA +
+	AV1D_NUM_HW_PIC_BUF * (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM + SIZE_AV1D_ARP) +
+	AV1D_NUM_FRAME_HEADERS * (SIZE_AV1D_FRAME_HEADER +
+	2 * SIZE_AV1D_PROB_TABLE) + comv_size + HDR10_HIST_EXTRADATA_SIZE +
+	SIZE_AV1D_METADATA * AV1D_NUM_HW_PIC_BUF) +
+	rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA;
+
+	return ALIGN(size, DMA_ALIGNMENT);
+}
+
 static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
 {
-	if (inst->codec == V4L2_PIX_FMT_H264)
+	struct platform_inst_caps *caps;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
 		return hfi_buffer_persist_h264d();
-	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
 		return hfi_vpu4x_buffer_persist_h265d(0);
-	else if (inst->codec == V4L2_PIX_FMT_VP9)
+	} else if (inst->codec == V4L2_PIX_FMT_VP9) {
 		return hfi_vpu4x_buffer_persist_vp9d();
+	} else if (inst->codec == V4L2_PIX_FMT_AV1) {
+		caps = inst->core->iris_platform_data->inst_caps;
+		if (inst->fw_caps[DRAP].value)
+			return hfi_vpu4x_buffer_persist_av1d(caps->max_frame_width,
+			caps->max_frame_height, 16, 0);
+		else
+			return hfi_vpu4x_buffer_persist_av1d(0, 0, 0, 0);
+	}
 
 	return 0;
 }
@@ -2163,6 +2191,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 		{BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
 		{BUF_DPB,         iris_vpu_dec_dpb_size         },
 		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size    },
+		{BUF_PARTIAL,     iris_vpu_dec_partial_size     },
 	};
 
 	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 8c0d6b7b5de85f7d7aaa8fc36218e8d095419569..c7020931a642f0484b6f84af7ab51242e1845458 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -116,6 +116,7 @@ struct iris_inst;
 #define SIZE_AV1D_TILE_OFFSET     65536
 #define SIZE_AV1D_QM              3328
 #define SIZE_AV1D_PROB_TABLE      22784
+#define SIZE_AV1D_ARP             9728
 
 #define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
 #define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)

-- 
2.43.0

