Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218315;
	b=4CXmmyJFre2bvM9nCX85Ic/q7PFoGjH4VI9xFiY++lbi3HSUcdFL5OULOoInUCad+Gf5
	 KH/j5j0Qe5jEBCy90appDx0InGFm02tq/edeQdHHSinyQaKUAL4KUJikmIb27D2hfkH4O
	 MCaL1zvBFhVH1+1h3AGMs49lKprwr9ehAvGNHtP4ZDHH0Wmhv/UnbynJmEfQgaRZiDnA4
	 oHgfajcmVHGc6GbaaBF8EA1rSXMHZEa/ygQ94trIuOr73kHKa1pTCvkVebqWHHJM1LCnM
	 FMzBx8lGoX5vRNtgFwGA3DwcfQfKIDJ/chZXRAfnvz6ou57AiRI7wHuX0I0fzuSP3QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218315;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HZQl25QBfHrWlaHnQRvuEPlBQka6aLRHrtCHmoqQjZs=;
	b=zZwPbrdoJMEQPPWcU7UKmEhAWJtsKHzYfOokIO6YyVuEI08NXF/KPayhhxSfWbO1LAqa
	 dosc3wP3npM2FtNm45DH95UHuxoQ+18NBz1/+qasIL5DuvfQQ4OhiNZmGzXpRqRonIgMu
	 Iga60anzoZq2c8gO7kBiOMdPYY+zbSYKgmu4Y1xre0hFXhT5RJWlOoBljPyzo1SsErX2P
	 NaEhEs4BW/hL8SHfd9JLChy71JQBFybCtyxTh44EcnJLfeicQ3Hekj7d7KWnVPuwsGYVg
	 lEsi5+f6+RwWAP/wI6aXXC57oTi8fSJBWcYf2OgWpNGYi7C6LSMZyzGH9NTPUbbNgSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="La/LgAdA";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="S4ca/rG9";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57FD606A6A1
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57FD606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=La/LgAdA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S4ca/rG9
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKMUAiY3058667
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZQl25QBfHrWlaHnQRvuEPlBQka6aLRHrtCHmoqQjZs=; b=La/LgAdAGBhSMAjk
	ZSR4fm2aYRfhNURTwMg+6TUgi0Vm92BCldJfk4/vrP5ygk9xfw+72VQW4yymCHjJ
	V3MYvqYI3QiangWAqZ9IaVj9s5TOTuigU3hZ1weZMt63lWOZVULiYn3ZNxoDWFc6
	AM92zJh+TyPdIVGVG+UeySeGgM0qlHi3kfqGW2pyHWJ6sgmUCwTzCcBvjVwhXeA4
	N1JI7qBlYnQhrH49jCAoeOt8uzkHudt1m+M555+pI5vH1mE6O7tVFnqAcWkrez01
	jPs/8DWNBQI1WD/z6udgwli3IjnewxXnFGziSya4+HHembJPZ3zNyeTHE8xmpBSw
	c+LMYg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2y2986fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33bf1d17dfeso177980eec.2
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 15:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795218311; x=1795823111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZQl25QBfHrWlaHnQRvuEPlBQka6aLRHrtCHmoqQjZs=;
        b=S4ca/rG95NhaJ7pYL/iLFkv6mFrlr4gZ0IteUgP7zkniA6E+PydbYi8A85yLfLYXPh
         PyoJTSFvnbILTc+DcxfelTzRRgNSEgoqSEbEy0u93/hMhwCl8VdkPjnv1wwcSRKJpdLc
         rDQfkj0rjsbBtgmgCQbDsa0xcBpEu+AIiPra0uaPCEbzUTvay+1bykPAMVmdVlgSGCwz
         Ao7Okb/wxq52kLmchcgzD2M9+jyl7vWs+4VZDcTb+mojsz0ID5uK6NvbezGYnNAxnWGM
         oYs4xuqsQo1feWPpoEOD/HtpXS+xfO2i5CMq1Xx2j4GXOEZMWjaaZiYxp05tNd66TnQC
         EIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218311; x=1795823111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZQl25QBfHrWlaHnQRvuEPlBQka6aLRHrtCHmoqQjZs=;
        b=q6xghoq3+Fn/XsNI5M2U5oVW+toUy6yQF6yWAff+OtkDlDIQpfxQm1vaCDwaHILV1i
         2QfEzp7X6O2CqyDgAfRLFTcP8hAMp2cx5wO9ba21lzahrVAHSNB7qZWla33SaRebsoZj
         GnWgoEfs5qjquQDg/wLtXGOZtwSbruE4JvvylntPEg4wmz+IIuiFveN/JvO1JLzwyMZl
         wWzRuLa0KP+BQEm6XWTjiv4Jq+j769Vl7H1PYdAXlEVoy+GKqzejc0tD7qtWSm7ItE0s
         fdjK29hnhCuCujZV2+aFsxdM3KCVIIKzdtAqaByfEvuI8bB3bqw1rSKGNLSHjjIb9SvC
         RS4w==
X-Gm-Message-State: APuU4Z+qxBXs7ycgI/xipK0xix7wszTDwGXo3BIEETEcgOnubSC3IWRs
	C9zujhKgF71RVuKVJkYkyrvmpFjlyIaY4S8TRgj35Tv3u9LiSU7BN0IYC+QjwZY92AZDIunhSvM
	0uyxhj/6ydo6tThqxz1qWGlaPj8pAOhlSJldEGaXL8VZcsW0IxEXWgWU+wTPlYILjtQ==
X-Gm-Gg: AZFdTZcPVqnrTGfTr5fsas4qgE4u+IWVEqV6Iy1tYhHUu4zY7r6odjUCW+hULGn4qj8
	tIbWmCj0QmEFjXvGw6QJ0sef+ZUvgq5gWhBRnq68oTE+U/Fb7jefNUZcAUo8sf2s35OdCczM5zx
	E+rhN+xuUw/5LTBHgW4D06eOEoqpvgS9M1OJc0cJbrgG1Q32yV9q/aE5UGhuSr1kHWiLBmHE/nv
	NkqDTSGJ8NXnAoSOiCxt0f+S2V8Vi9kXfEJi1VkszWmKCiwH9XCnIlpV4rq7D0NNBaGF6Ol2bqc
	tEIgPI7xObgcirnThK+V3iqTQdqQapfW6eCxaDK7qW40a6HGLRdqoqwWIHEUgww8ZT7P2C9wDUq
	sTbeac5BAb75PoCGgNQdCc6ZI41Q8XCpL9tHqqoPkG4AUy+CGIupXmIJgSJurarK2WHDoVPOWrf
	e52t00RFGi1KxnZ9jieLVTadEWb00jTYBfOA==
X-Received: by 2002:a05:7300:caa:b0:385:4627:bd5e with SMTP id 5a478bee46e88-3856ec46bccmr9235001eec.2.1795218310185;
        Fri, 20 Nov 2026 15:45:10 -0800 (PST)
X-Received: by 2002:a05:7300:caa:b0:385:4627:bd5e with SMTP id 5a478bee46e88-3856ec46bccmr9234930eec.2.1795218309555;
        Fri, 20 Nov 2026 15:45:09 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm14669862eec.4.2026.11.20.15.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:45:09 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 15:45:05 -0800
Subject: [PATCH v11 4/5] media: iris: Add HFI metadata buffer delivery
 support for Gen2 encoders
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-enc_roi_enable-v11-4-c00b95ea1b81@oss.qualcomm.com>
References: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
In-Reply-To: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795218304; l=13274;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=YkCjaquAte0VLzglQ3NO5EoJSjxWWEQHhIqWUhdS0Zo=;
 b=jsCY4Hv+eoVZ/Gno0S1BET9l2SSqQtOI+gpXTqHVR3MBv37FHvAIrJhVWNvMzbZ2Rw8DWqs4X
 C7A0OHERRatCu5/ow/sVQAjduGjorTUm6jgfs2AMLfPNg2cu+V5EL4H
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfX49klh/TWUKCk
 iAtnBQx2Lyh7lN8BngCU03Tz1c+H0bHrz6qaErVK8uwWXM7MLSSTxABVE66Tm6ufC8eqH0e1736
 rFHXKn8GzEtLBPazufxIR9HjHY+cxdo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfX6xFbx8ayxm5g
 vJSThn+gbxYIcKwybnQLQGVKR7otetVhXxdT/XzLcu1qENxcAOmzJucAtquOFu2DhO9WbOLRXm8
 AKf8e/I29IsiBU4bPfbrlkfGphxjz2ERBdyd8/r9H1kEdBuptfspIf8wMhfH4Zl/AZlxcn5v2Gn
 bsJhvFrzlc3cIhBYmOjMyGKbJrw2VO1TTGQYDAQjuNkH3aGIxG241Q9ewKDBc2m+uJfe5BazTJD
 itEWleaitueNfbfvpYByYZk3xHo+x/23j3BJtX3JmVn1C0fouiF6m12v+GgLubMQZDRqpGBB8mx
 Z9o492EuudUEXdPMZnaljS+k/JqBYeog9ekcfckj1bNdOL9zJfbJVd7z3xir4yiVwgTr5S5rydZ
 BYTHIHJe/Gsj3Dr4XtzJCcQFEppc7+CCXK8EogJ3N2UmQ5WcOL2Ja7xL83VNe+p1HlkjY8ZhpeB
 ZdfJbtPDniuDi5zQkFQ==
X-Proofpoint-GUID: 4FyV6L6OTp35Q1iutxsPLvlzkncRRd-q
X-Proofpoint-ORIG-GUID: 4FyV6L6OTp35Q1iutxsPLvlzkncRRd-q
X-Authority-Analysis: v=2.4 cv=Z/J5j3RA c=1 sm=1 tr=0 ts=6b00db87 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gkYz9yhuOFcMo22kqTsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200094

Add the infrastructure to deliver metadata buffers to the HFI firmware
on HFI Gen2 based encoders, used to carry per-frame ROI delta QP data.

Metadata buffer structures (iris_buffer.h):
- Add metabuf_header and metapayload_header structs describing the
  metadata buffer layout as expected by the firmware.
  HFI defines (iris_hfi_gen2_defines.h):
- Add HFI_CMD_DELIVERY_MODE (0x0100000A).
- Add HFI_MODE_METADATA (0x00000004) to hfi_property_mode_type.
  HFI command side (iris_hfi_gen2_command.c):
- In iris_hfi_gen2_session_queue_buffer(), after queuing a RAW
  (input) buffer, check for an available BUF_ROIMB_DELTAQP metadata
  buffer and, if found, append a second HFI_CMD_BUFFER packet for
  the metadata buffer in the same command, tagged with the same
  buffer index.
- Add iris_hfi_gen2_subscribe_metadata_delivery(): sends
  HFI_CMD_DELIVERY_MODE with HFI_MODE_METADATA and HFI_PROP_ROI_INFO
  to instruct the firmware to expect metadata on the input port.
  HFI response side (iris_hfi_gen2_response.c):
- Add iris_hfi_gen2_handle_output_metadata_buffer(): locate the
  metadata buffer by device address and transition it from
  QUEUED to DEQUEUED so it can be reused.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.h     | 18 ++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 16 +++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 39 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |  6 ++--
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  3 ++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 27 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.c       |  4 +++
 10 files changed, 114 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index ab8e5d953101a786ade20540ee3c3ed226160cbe..ee2d24bb69c57220b0a735d9b4aae4434a33daf6 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -107,6 +107,24 @@ struct iris_buffers {
 	u32			size;
 };
 
+/* Metadata buffer header */
+struct metabuf_header {
+	u32 count;
+	u32 size;
+	u32 version;
+	u32 reserved[5];
+};
+
+/* Metadata buffer payload header */
+struct metapayload_header {
+	u32 type;
+	u32 size;
+	u32 version;
+	u32 offset;
+	u32 flags;
+	u32 reserved[3];
+};
+
 int iris_get_buffer_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index d97fe50d48860b0f26b71d328a704f3804b1d93d..8c02b4fec93b511d1d9bdd71a9038a7f7be5404f 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1704,3 +1704,19 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
 
 	return 0;
 }
+
+int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	int ret = 0;
+
+	/*subscribe to metadata delivery only if ROI is enabled */
+	if (!inst->fw_caps[ROI_PARAMS].p_array)
+		return ret;
+
+	/*ROI should not be enabled without metadata delivery support */
+	if (hfi_ops->session_subscribe_metadata_delivery(inst, plane))
+		return -EINVAL;
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 08db807444203ef02f83008fc311cad20ea79f44..ef2c09485ad93719e4acc7f395899d7f67cb5b2d 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -51,5 +51,6 @@ int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
+int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 16099f9a25b65e2e4556d54499e2c2a4cc4e22fc..79b276cc64f656c387dab5994d844bc9a9c9e624 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -132,6 +132,7 @@ struct iris_hfi_session_ops {
 	int (*session_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_close)(struct iris_inst *inst);
+	int (*session_subscribe_metadata_delivery)(struct iris_inst *inst, u32 plane);
 };
 
 struct hfi_subscription_params {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07b7bcd8db21d4345bc900356b4ec3..cf88dbe11e8e9faef826e661d8e9909fd7f16b94 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1307,6 +1307,24 @@ static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
 	buf->timestamp = buffer->timestamp;
 }
 
+static struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
+						       enum iris_buffer_type buffer_type, u32 index)
+{
+	struct iris_buffers *buffers = &inst->buffers[buffer_type];
+	struct iris_buffer *buffer = NULL;
+
+	if (list_empty(&buffers->list))
+		return NULL;
+
+	buffer = list_first_entry(&buffers->list, typeof(*buffer), list);
+	if ((buffer->attr & BUF_ATTR_QUEUED) || (buffer->attr & BUF_ATTR_DEQUEUED))
+		return NULL;
+
+	buffer->index = index;
+
+	return buffer;
+}
+
 static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
@@ -1359,6 +1377,26 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 					inst_hfi_gen2->packet->size);
 }
 
+static int iris_hfi_gen2_subscribe_metadata_delivery(struct iris_inst *inst, u32 plane)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	u32 payload[2] = {HFI_MODE_METADATA, HFI_PROP_ROI_INFO};
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_CMD_DELIVERY_MODE,
+					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+					      HFI_HOST_FLAGS_INTR_REQUIRED),
+					     port,
+					     inst->session_id,
+					     HFI_PAYLOAD_U32_ARRAY,
+					     &payload,
+					     sizeof(u32) * 2);
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_open = iris_hfi_gen2_session_open,
 	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
@@ -1372,6 +1410,7 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_drain = iris_hfi_gen2_session_drain,
 	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
 	.session_close = iris_hfi_gen2_session_close,
+	.session_subscribe_metadata_delivery = iris_hfi_gen2_subscribe_metadata_delivery,
 };
 
 static struct iris_inst *iris_hfi_gen2_get_instance(void)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 2394213d8272b53bf6a1cff9574dc93f6830fc8c..746d7c1aad52cd87c55a7ad71fcf9560881dfce6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -20,6 +20,7 @@
 #define HFI_CMD_DRAIN				0x01000007
 #define HFI_CMD_RESUME				0x01000008
 #define HFI_CMD_BUFFER				0x01000009
+#define HFI_CMD_DELIVERY_MODE		        0x0100000A
 #define HFI_CMD_SUBSCRIBE_MODE			0x0100000B
 #define HFI_CMD_SETTINGS_CHANGE			0x0100000C
 #define HFI_CMD_PAUSE				0x01000011
@@ -177,6 +178,7 @@ enum hfi_flip {
 enum hfi_property_mode_type {
 	HFI_MODE_PORT_SETTINGS_CHANGE		= 0x00000001,
 	HFI_MODE_PROPERTY			= 0x00000002,
+	HFI_MODE_METADATA			= 0x00000004,
 };
 
 enum hfi_color_format {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 6e04175eb904b494309a38eece41213600f93a88..655f4c2fcdd5b89624887807f4fa17a645fac803 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -100,9 +100,9 @@ static void iris_hfi_gen2_create_header(struct iris_hfi_header *hdr,
 	hdr->num_packets = 0;
 }
 
-static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
-					u32 pkt_flags, u32 payload_type, u32 port,
-					u32 packet_id, void *payload, u32 payload_size)
+void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
+				 u32 pkt_flags, u32 payload_type, u32 port,
+				 u32 packet_id, void *payload, u32 payload_size)
 {
 	struct iris_hfi_packet *pkt = (struct iris_hfi_packet *)((u8 *)hdr + hdr->size);
 	u32 pkt_size = sizeof(*pkt) + payload_size;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
index 25b9582349ca1a0ce6efc0b146a3abb798485c45..613eb500609f745daebdcbdf9a25b85cb9465a79 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
@@ -121,5 +121,8 @@ void iris_hfi_gen2_packet_session_property(struct iris_inst *inst,
 void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
 						       struct iris_hfi_header *hdr);
 void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct iris_hfi_header *hdr);
+void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
+				 u32 pkt_flags, u32 payload_type, u32 port,
+				 u32 packet_id, void *payload, u32 payload_size);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index f0782c4b1e6e88d06cb4bd18f0210c105ae2acf8..ea1fc96077fdce83db9c6a6c1f753ec7978b0673 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -77,6 +77,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
 	case HFI_BUFFER_PERSIST:
 	case HFI_BUFFER_VPSS:
 	case HFI_BUFFER_PARTIAL_DATA:
+	case HFI_BUFFER_METADATA:
 		return true;
 	default:
 		return false;
@@ -452,6 +453,30 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 	return 0;
 }
 
+static int iris_hfi_gen2_handle_output_metadata_buffer(struct iris_inst *inst,
+						       struct iris_hfi_buffer *buffer)
+{
+	u32 buf_type = iris_hfi_gen2_buf_type_to_driver(inst, HFI_BUFFER_METADATA);
+	struct iris_buffers *buffers = &inst->buffers[buf_type];
+	struct iris_buffer *buf, *iter;
+	bool found = false;
+
+	list_for_each_entry(iter, &buffers->list, list) {
+		if (iter->device_addr == buffer->base_address) {
+			found = true;
+			buf = iter;
+			break;
+		}
+	}
+	if (!found)
+		return -EINVAL;
+
+	buf->attr &= ~BUF_ATTR_QUEUED;
+	buf->attr |= BUF_ATTR_DEQUEUED;
+
+	return 0;
+}
+
 static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,
 					     struct iris_hfi_packet *pkt)
 {
@@ -499,6 +524,8 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
 			return iris_hfi_gen2_handle_input_buffer(inst, buffer);
 		else if (buffer->type == HFI_BUFFER_BITSTREAM)
 			return iris_hfi_gen2_handle_output_buffer(inst, buffer);
+		else if (buffer->type == HFI_BUFFER_METADATA)
+			return iris_hfi_gen2_handle_output_metadata_buffer(inst, buffer);
 		else
 			return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 2f2c56bf9122c73e10e86815b1aa5fad99b0fb42..08353a8895b0e5d8769c2deb137a4fffcbc3108d 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -515,6 +515,10 @@ int iris_venc_streamon_output(struct iris_inst *inst)
 	if (ret)
 		goto error;
 
+	ret = iris_set_metadata_delivery(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		goto error;
+
 	ret = iris_alloc_and_queue_persist_bufs(inst, BUF_ARP);
 	if (ret)
 		return ret;

-- 
2.34.1

