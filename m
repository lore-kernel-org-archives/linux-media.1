Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E32BE05A
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457933; cv=none; b=NvOocb2v1th4u1XqddcczpfgJXqcQC3NYy//9JRU6BdCDvgP5CSzDmWbb9yHven1kkwx6sIMebt/ivcmsXrJRGZq4fSKQD1S94ywdZVjQbRNJkdYSpWmtc/huKAx8wefDsbFxPUcV7717UoMRlTOMaxJXrpANctgdyOM+LQVTPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457933; c=relaxed/simple;
	bh=88z5nx8vnFxzRCkkWynqATznmifWM76c1v/eINoop54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CGoprhugFZaBLgETHW2Ku/fv8dSmA/cg1fW1+a+JEXpxkqf1l8nurGTphXm8Sy4ajVFGZKyx5lMz4DJONVcWuPmreWcRMFQTODL0wywF30StI6vMAj4MXYUE7WWUptCAiKf1jEP77a8LFCZEIpLU2Knqa0UDZn9x2gZr4/a/o6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZQso/E3L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/h/A0h1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQso/E3L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/h/A0h1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMxkC32683587
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L/TwLWtG06x2BbiNOlF/3UZu3lQuv4b0JIWImEHpR30=; b=ZQso/E3LBPr1ONYa
	0OYbuXaRY1oXoWNZj082/SsYCp8oCqP5lmiqFnqIqZ4W4sTobc/oM3y4gvWmpxTw
	qgf7rsLPbZNrhG50yTl7C40NWQSM9hKFcZXnD0hPbrsvILhA9k46PIG4DwXAkvrI
	XSJbdgD0B+gf9w5ZYZLQJ8aMRHgO4wgPRekY+LA450sDd8M/IctKxhqlNPlW+7pH
	TVnPk3+juyDuk7qLAHPWBfOKHYr8lDnyrtP8voCuoIk/xQniLNzsF53PaHeZc2KY
	hd9j1WPFsfoHOPBjaDOs19838d1ILt7emHWvj6d8b1p0hqtlu8xgOpOfMQEOjdKE
	XcgOPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfw5r7nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-529ae8e96e8so3703471cf.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 17:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785457930; x=1786062730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/TwLWtG06x2BbiNOlF/3UZu3lQuv4b0JIWImEHpR30=;
        b=P/h/A0h1XA8wjRv7mnHvxUoY1xQQznz48b7rHnNEOj6yXMNhfcG34rpEyz31y9u8RC
         LK1ZXazfMbYUXa/bBPcE/XAHhfuH12S3SwHqlmvbAFvSavc2+WE3X/O+aPtWcq1qkkA+
         eu77VOpSM1RpKI5EKBVhEbo0/E4KmC2QRTJqSbY+qKqJmQf4K9hF/xaPDgxeDVtOQu5D
         qYlFdGnQkKp99+mdYioHdGKSRZQS7VaByX7D34htjGlWrlvSQpqyZo4fjQTFCg6hmDGL
         WFqf9Yrhbikga9HfnqGQOAa2ApYlNFtC0hoXpqyUOcJ7RhWSzltFFhfVHPuTyHaqVxpF
         DIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457930; x=1786062730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/TwLWtG06x2BbiNOlF/3UZu3lQuv4b0JIWImEHpR30=;
        b=B8pHYJq+yEqIfyjwMEFlQBSVaAnKqmUpujCQAm3syE9U7twkiERxRaFg37PhhZZPhs
         KO8qfBGk2U7sShpRLnQzpxp4Dh8So6b/MKfJUw19IlLtJFVkp6yolPA9eP5saNJguvUN
         x0gOdTgsqwSgVgupgH6yPddaalqbC/9Gp+iGmE+MLYWHvistvz7tfQ9etwzU9d148+bw
         RguzAFga9+tFkIp6lzThcu9VMvCUg/10bEy1VcijRXIH2UvF76T/KQOBsk/RnH3DPLw9
         SYoN1yIizSi78LjbPaf3KQtph4NxmFOC7mslCCOLnzIA59ts6/jImrIBO291fmST9jv2
         sYVg==
X-Gm-Message-State: AOJu0YxCHba93V4nxEmRLe6THQCsAe3rzKSIhTnH4wxSuVe6wWhWAUWP
	ZT4r9ja6yRGbWaEWB9+ODqcMOFbVAqi5uY2QKMuBp6t9eOEqKzPTdall+bpWs6aREqs1o1jUa/I
	tfdGftWnXd4I8XLeg11+GT4hCHqABcLKfdzsSFyCmwDmaem0WgmQo/rY3pMI+gqI0lg==
X-Gm-Gg: AR+sD13RGWhAHbWJjWqpwQBU671Zz7cbCDbtzDSBuMpC0hGklt7imFVerz/PZEyFErC
	IxMM0VH9AcRNKqB5Geqn8HWe8nGQgP4QLAImWmCQ++g/tsECLnqWcHncWmpy+9lzQWVjOcQH8F+
	dhIVR6A9mbQy/JoFAcmFxtIA8K9MZvaNSmwzEbifWMdo4MNvnOLR8WP5mwrxnNkEwIE7jOviBfy
	lxP9u2mV2cB8MD1vJA+1BTHhxBjyS3sIPs9U0pDL04/wbqukg6LCVTE5NutFahuyCbqGKKKbKS5
	ID9/Bp8FNSTLV2pd4vxvAqLZlpuo4EP6VTclEx8PLhd2iXV5zndCbgOxoQx+dnkgXWM1NzsbnhM
	9xwHxDiSg2JTZynzr67s6hmStj5AEPdHgU8dB8Cr0JG7KYX33sAEe5j4NVP4Q6SUUWQuGuyddbb
	WM5TsME6HHdIzdgw==
X-Received: by 2002:ac8:5aca:0:b0:517:9095:c329 with SMTP id d75a77b69052e-52b4b04ec02mr861601cf.45.1785457930162;
        Thu, 30 Jul 2026 17:32:10 -0700 (PDT)
X-Received: by 2002:ac8:5aca:0:b0:517:9095:c329 with SMTP id d75a77b69052e-52b4b04ec02mr861191cf.45.1785457929603;
        Thu, 30 Jul 2026 17:32:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9d2688sm620538e87.57.2026.07.30.17.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:32:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 03:31:42 +0300
Subject: [PATCH v2 3/5] media: iris: guard against a NULL hfi_sys_ops in
 the interrupt handler
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-fixes-v2-3-94c002016a09@oss.qualcomm.com>
References: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
In-Reply-To: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=88z5nx8vnFxzRCkkWynqATznmifWM76c1v/eINoop54=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+z80NSccOHSvCFa+lWguNSgcv7XcJiPt2XHi
 8+ptf8lnSGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvs/AAKCRCLPIo+Aiko
 1cIcCACVPeNiauf0KRevIRsTh3xRlagTJP0YxD5EUkQodHPaBAUo1Fbm1F+h0k4nBjV0ThdUlcX
 +BMtn2YK2d8poz9FDCvE6h22DlRmvk2GGjYP1/WIab64IH1p4djcQgFcGsXpdTs2kFgycmSJwoU
 mO3WjZFpWELBNpc7Wgj1b93C1J/YGwJHtyS7ipDqogTvRm6pt6tT6eS4S0K/neGVuDE4vmyV1TL
 9sMO37hJXXHLtyRcwqunpyq10yFZULeXSZAezXv7OkoLNlz88iQoiLPn4YJcjJxpNU68WWU+1G7
 feFFoEq54cnTI7wd6/Iq6u/a5RqdBv48MNm2wVhd5perQv+d
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: dF7-VZtffbFePqf5Ak-Vd7Iw0PguB00t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX7GHey20Jph3F
 +e6JQ2sejBpJ0mxER06NS/I2I+3U0Ui94CIql7ZhrwYGMTimv1YR0fviPfS4uGOcs8tgGvn0OP3
 FbX7IelEd//Lb/F0Aqp59NsUNH3+zKo=
X-Proofpoint-ORIG-GUID: dF7-VZtffbFePqf5Ak-Vd7Iw0PguB00t
X-Authority-Analysis: v=2.4 cv=DconbPtW c=1 sm=1 tr=0 ts=6a6bed0b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gNVOA7K2X4zeF1vqfc8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX3cHPYwt5/nuT
 +dcUgLIuJ5cBy3oav52q3prd1fE23DvvpwKaeSXu6SoeafVMGer8PvkvpNaeN6+ntbtibxQyB71
 FZutAnogxN0IAVKdezprKuJ5E2Qdnq276ii/5ehNS8LN3ygASs5S/CU7yWmA8z5uKss8TNpZR5h
 MPL6rQBPukcqUPNRRSef4yk/4BzeN/V8JslNcSSQHOorLDcrtCfLfLDoxF41/tVmrNs5yrOwly7
 ow1cleGu0FfjBMuMNTL4nNPbOmBJ2Ivq2PvLRzowq9gIk6wXPWbw3xM/sH6QmklEV4lU8jQDHO9
 Yx46hSZZpOyviolN+eBf0/X6YGuWH9H1NdutbiYaYSw35ZfeHgUn3DvvYXHC3LKacH0Ffcj/GIH
 km2uu29V8USzHqr0AhgLP6+ovb88Xe9l8fNeBMX+u5hCnqaM2LXQyt5BbMrPhNcmYlnjLxlNeDZ
 J+tkc/sf9Io77/HMkyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310002

core->hfi_sys_ops is populated only during core bring-up, once the
firmware generation has been detected. iris_vpu_power_on() enables
interrupts earlier than that, so an interrupt (for instance a spurious
one) that fires in this window makes iris_hfi_isr_handler()
unconditionally dereference a NULL core->hfi_sys_ops and panic.

Skip the response handler when hfi_sys_ops has not been set up yet; the
interrupt is still acknowledged and the line re-enabled.

Fixes: d8a6a63372b8 ("media: qcom: iris: merge hfi_response_ops and hfi_command_ops")
Assisted-by: Claude:claude-opus-4-8
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..42fc854d4c05 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -109,7 +109,8 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 	iris_vpu_clear_interrupt(core);
 	mutex_unlock(&core->lock);
 
-	core->hfi_sys_ops->sys_hfi_response_handler(core);
+	if (core->hfi_sys_ops)
+		core->hfi_sys_ops->sys_hfi_response_handler(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
 		enable_irq(irq);

-- 
2.47.3

