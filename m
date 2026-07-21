Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5100F396B70
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600448; cv=none; b=kJmqPHDy1PSiZzdWxWGR02Ubz3hfihC69qetlwQ0if3YWgI9aYNvra1Ev+qZm682h35BCmTtSW41vKZ6kD2Mti/aGxQwUoJKoL6fpAg+j92YK3/3EnF5SUQuAn1FT8U7frYHFihtVX5aiiMIx8BNv9YMv0ST/4KrDDHjr1RfmSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600448; c=relaxed/simple;
	bh=WdDHQBHuwkLWrlKd7BdIFCJ9Zvz/3V41vXnTS77goz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mta62JirHMLnLxdUTRYGwl3lUyANfVO9xO5CMAzvuMzlfYFauNUyGsulpHjq4S7Z1AWIS5seECEXK2wPyKcoAeNijN9kA9uUkfuWhc89xi+u3pRnYp4l+ezS5FpskqRsyBKhNYeRuooEN98yBVWsuuuxbVbBlXHhPSB8AX3Q0uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiqYmcQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMqsIy0I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiqYmcQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMqsIy0I"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCWUQ3769149
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRo02vRtcTIm7JokNSrJVFoyheWv3tJmPNHxvoGvNbE=; b=GiqYmcQ7Ngxq96h1
	Jk4VZJnv0UqWGF+6NeywAd/gp/bFfUpRUsdYYpp4IruoqHdBVpSP/VZsY1xOOfYN
	DsWpBwE89KwWN/WJowNOs6GUgFdlH0a9rIMEqZ72CYISoMNbBWhgGHj6j47lbIuX
	JcOq50lkxRmtNuj7Th58yXD7hFz6yve77lelu7zrGyImnrRj1zVqriPnCqstYGin
	iVwzJhrLkMMBVZ2T70alztaJV1kO411t4S3DV2TcdSYRKWyKNE5ef/Z9sqiwJlIj
	ykNx4TIFkYRIVVJgKgCNz6A5KBveMbdfLyjpr8nNCFelQyfgXOfdQdQZuntTnYeR
	3F0ESA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y3ur0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:20:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca860baea9fso18172680a12.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 19:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784600446; x=1785205246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRo02vRtcTIm7JokNSrJVFoyheWv3tJmPNHxvoGvNbE=;
        b=bMqsIy0I7/kizkIPYKVEm8QHZrlZVjdhB3YkRx59dWiZDxNWJ51yX5AlESSQelrxaf
         PaNyqHvtVzfIE9+//t5ztmJ/CavY9qVTR9HwKtOyOYE5RXI1KeLSbM0tDwS9l/2eZikZ
         vNiqezB44/HiXuR5M5pcfdohhGt2K5u3msafqkl4N1TFgYItrRsliEwwj/cyu1qA6Lm2
         1x+U0FUDB7N8qslDKiZl/J3oOloHnjso4nYK2uVD6lwdzHapYPCyymfZpVI2WlhkD0gs
         p8Xx0Wpbc7QDeHg0iQkkaas78TzbznRN4WT+YjN654z8OBFtO8trF60yIeM+JjYXxu6o
         6MUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600446; x=1785205246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRo02vRtcTIm7JokNSrJVFoyheWv3tJmPNHxvoGvNbE=;
        b=eirYkEuEg3wz/AO2Jqk4w4IyIsyoPC4PCqg3riB+LzntDkt4eoC0A8DDiruX9kDPFE
         1ZdBCajEoohcJxqMcRkNk9tVv/drPOsjMBD8nK770odjAy15nGH7X+V+zyS7+drHwmHu
         T0imauaiUb/jNknAEq76E4UWFx60t4Z/poYCV1p95Wa4sA5h8rDmB723oLcGInXpdiuY
         1GLMML4tln6fKNFSYvMCIU2AqYWpEZKcmUpwa35PPxoB2DmNmFUoDzpEH7AlxmjoGcv0
         CjBimUoOZo5DQC1ITS/LZ7w7iYZ8oi3slTZq5PsyfTjGOcUlWI9I+fQg5M+fjdNb5FOX
         zAqw==
X-Forwarded-Encrypted: i=1; AHgh+RpNcqMXQBQs3YLE++E97n0JfctRIDKRHZCkMkJ8bvcSN6G9oFNBBHk9xv3t/TgZ3B6csiTqcZG6JImj7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5vhVZ+X3ul0SJ0ZKxOOshwQaekRfRabHaRMgUpPy3Udetn9ms
	pauj4Gi1kWrNfjQLA+1dqZ2K2HkZ7HfMImNcZyp7lahMAj8uauzfYiVCj0N2F+nRxJWJi5+8zno
	x5RRDN/4UWGpfV12rkHQZn578SZILIdNGHu26R+0L7uvi2VhVaBCqKxBSCst+JTzCMA==
X-Gm-Gg: AfdE7clsAEkpaKSIHKCGYj+iaEQTbbcuaciE+6I9seuGm7n+9WTJBtzv2e64sD4A17Q
	BUx+lUhqPyCilkgBGJXd7X4uwqXhFV++yOU16TxKeJVFEU4TVYo0Uo2jt2iiThXMEbuA+IjrGIy
	5yK+zxLMpXfvwBwOjmRlrlDJl+hGlhsYTVBDk8ljTbbKmgrTONSzKTijstyX9cRUa/982Iw9M5R
	90DKvUuKYhv5yazkHfDtkToWhZcFu1R+erqf+qxIl0Uht7YU5xNPZb43yPceMgYqSuLf9ZYqwWI
	naTFar/AbL9b1QiyF8u0Yknd3yXtu753ZCSSTmUEHiT5QNfhC27Og9C5RErCk2bJp3Xw26tbsBo
	EVtEiYixVi08n94N/IGHs+J+uOUhUcxMLMQ==
X-Received: by 2002:a05:6a21:a382:b0:3c3:89ce:b5bc with SMTP id adf61e73a8af0-3c3ad5f063bmr18226124637.15.1784600445951;
        Mon, 20 Jul 2026 19:20:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:a382:b0:3c3:89ce:b5bc with SMTP id adf61e73a8af0-3c3ad5f063bmr18226085637.15.1784600445453;
        Mon, 20 Jul 2026 19:20:45 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41001457eec.24.2026.07.20.19.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:20:44 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:50:34 +0530
Subject: [PATCH v4 1/7] media: qcom: iris: Centralize internal buffer table
 selection
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-iris-code-improvement-v4-1-4395bd8acfbb@oss.qualcomm.com>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
In-Reply-To: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784600434; l=8143;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=iZ/+ncvk74wDUkoCuXp/2kLnY5XWoLUzy0kpESV6G+c=;
 b=laF+pI3Nipf/g4iQ0DNSazcXVlt4MWqECvgCSp/dCafAfzoeag5XLy0YniDqWVjDzOe0MJWHH
 yOBQvljVkKhBhicDTe1KcRPxZyUvKATrE06SkS+H2HA0+G3djyQ2wMR
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX00C7KEdyUxxb
 S0L5nWTWHYTvrKThiq9q9BpqpZPlSUMtWPkIgantaNuBaGhChkEOi/ld6OjgB11PDbX6m+5pb51
 jgv+FYUfZkue20gWPyfNS4if7ItF7yA=
X-Proofpoint-GUID: NSH9-cNramRHbq1pe5kMrCywDKkD1HWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX44F8YrUMiRoq
 CPAEIlzKloqJlU8PyKEgi9QQvuQbC/FQIo/vRa6yjVy1mtSCOHt3QmYqzc/cRvyON7xrN67jtsX
 9spkkl3AcusL902D/0n6otHZfl0Ag+jFPMWVSog4YJpMRSRFKwaP6nEV54Bu1VVtHcqUH3s0zTP
 i2FoAbONIGIp7QGKLU0UR9vWkURMrhL03x1f64yZwByetljLlh+zoEPn9pp5GhF7p0iEDxTKMt/
 38v3TXox8Q/VEcFeXnBpTnRhHaku65AELz+vB8a8yqSRXQWYCUwWuS7iMOPmh4y4/Tb9pY61ePM
 GKp6pXMHbBQBs9Vs41IZbhJ6pv7Bkg2gyYrKUXk0xQnEGJZ9cyVaR1/R+3xqYvzfAR23um7uzJT
 nLuYivC4hA7E2VXFes/cVF/L9JlI0N5/DqDJ1l07WegxrripsnuKWW6ivKmHn9pUPlgNSnYkFNN
 8rmDZQigHRkpcaXLe6g==
X-Proofpoint-ORIG-GUID: NSH9-cNramRHbq1pe5kMrCywDKkD1HWp
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5ed77e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=22hBRqbxvLe5Obw_dBcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210020

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Internal buffer table dispatch is duplicated across multiple Iris code
paths, which is error‑prone and makes future changes harder to reason
about.

Consolidate the buffer dispatch logic into a single helper so that table
selection is defined in exactly one place and keep call sites minimal.
No functional change intended.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 107 ++++++-------------------
 1 file changed, 26 insertions(+), 81 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 246ad0abbac3..bd922a12045c 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -492,39 +492,41 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
 	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
 }
 
-void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
+static void iris_get_int_buf_tbl(struct iris_inst *inst, u32 plane,
+				 const u32 **internal_buf_type, u32 *internal_buffer_count)
 {
 	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
-	const u32 *internal_buf_type;
-	u32 internal_buffer_count, i;
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+			*internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = firmware_data->dec_op_int_buf_tbl;
+			*internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
+			*internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = firmware_data->enc_op_int_buf_tbl;
+			*internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
 		}
 	}
 }
 
+void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
+{
+	const u32 *internal_buf_type;
+	u32 internal_buffer_count, i;
+
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &internal_buffer_count);
+
+	for (i = 0; i < internal_buffer_count; i++)
+		iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+}
+
 static int iris_create_internal_buffer(struct iris_inst *inst,
 				       enum iris_buffer_type buffer_type, u32 index)
 {
@@ -559,29 +561,12 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	u32 internal_buffer_count, i, j;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
-		}
-	} else {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
-		}
-	}
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &internal_buffer_count);
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
@@ -635,30 +620,13 @@ int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffe
 
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	struct iris_buffer *buffer, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	u32 internal_buffer_count, i;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
-		}
-	} else {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
-		}
-	}
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &internal_buffer_count);
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
@@ -694,30 +662,13 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 
 static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
 {
-	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	struct iris_buffer *buf, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	u32 i, len;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-			len = firmware_data->dec_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
-			len = firmware_data->dec_op_int_buf_tbl_size;
-		}
-	} else {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-			len = firmware_data->enc_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
-			len = firmware_data->enc_op_int_buf_tbl_size;
-		}
-	}
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &len);
 
 	for (i = 0; i < len; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
@@ -788,18 +739,12 @@ static int iris_release_internal_buffers(struct iris_inst *inst,
 
 static int iris_release_input_internal_buffers(struct iris_inst *inst)
 {
-	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	const u32 *internal_buf_type;
 	u32 internal_buffer_count, i;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-		internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
-	} else {
-		internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-		internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
-	}
+	iris_get_int_buf_tbl(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+			     &internal_buf_type, &internal_buffer_count);
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		ret = iris_release_internal_buffers(inst, internal_buf_type[i]);

-- 
2.34.1

