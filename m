Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2269643CEC8
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428104; cv=none; b=lH+hfUhyu0YAXzPh0TiCjO13rNv7BxllADuJKWsQC03tiMD54uTWaWLs+rclfPfaCflSKYCuoyfpWGPeRu5tn9KvTuv/xAWPesa2Fz0zMmELcimTOg7P9ac0lCM3vwyHWDkEOR/62U4fCx9weEnzloNhlpggFaqTwKt5/0IM0DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428104; c=relaxed/simple;
	bh=PEgIh4M/astScc84Iv6ct6kewphSkXqlkuVssPAXI9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T/gS4Cg4961Usj6DLKHYzxiI7quGC3ylXfK0oSlJl8XfedaPyQvG7ONFJdebIAsvLP6gPMACiq8EeXm07hmPM1zEGZheZO9/kMaBTNQTNf7jlB0fRjCuaOpDTyDFLXKdFaftF7ujKSdeMi19V9X9AQsAEqWxI0D8mGC3sSgLrKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHsNr42T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anI75ES6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHsNr42T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anI75ES6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QAodtd3749874
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 13:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=; b=lHsNr42Tw4Yf4LE2
	N1xU3kuQAZdEaTG4Cw/2oqWZszsxeXgNdU+2aMEWLLm/3jGdE5fmOR7s0u47J0we
	FZTpOzw+CcRw6vvCy2FzFYOQgqpK6tS9CVW3SdcBgtTd/EHMTFtGkQG0r3XMTQSy
	NqCweTRKEmOwhauacA/T4FhyvJEDrKabmG8orQt9EAkCgkvf4TOS9g9sKOj5Oz4L
	Rbf6YFxbGt0VQsg92/QnEEvVwdzAwEMrXJmTaKnc3EJmJQcqNDQCc5ywY/lUpcXU
	LEopOjeb51QPaRMjcOH5qt2lOLvHHVgX/n4SmlFsTL4IRXNPG+UsoQbGGONXdgZd
	PNi7Pw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp17yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 13:08:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2961640eec.0
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790428101; x=1791032901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=;
        b=anI75ES6EcMVxEQkOPIJHc8tN0lkzFrMeccjYLlXvFNfDkqKONDH64NFWGWGmkLmXJ
         u/8eAsqDg/LwlhYV86ezxv+nzg1C3NCkZg7/Zp94p2GLckcvAq67sRSOPtLX/LYaTb0P
         UfFdxCLmhZUpBjCAsijfgGzgxmd3OXwXlC+heS/Mxrm+FlEB97H/3erz06qacuBDT2El
         aKNocMoflihBffCdm9lMMACSD31E3Ow1scFXC15/NSBB5HOtCidVn4tSbY4rFd8aKtCa
         nW4DPK0/MZ7lT1n4N0SrMplo1yR8ex+/qVxD428RRbebzPWriY9MEo5CRfLrTCCJT5B2
         X3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790428101; x=1791032901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=;
        b=HGOmOkExD0cn7tYauOEwdNK9yOxR8boE/2OToaRn2CagSBMVhUQIuxKRdiZ6+yHhCE
         h777KFjGTiwbzTY+MXDDv6vtb8SstmjqZdLW35ZFc09fqIQRc/KZrhpf02tsK+958Go9
         ltni68Jci6lbISXRSB4SgoNuzc5GnIsvrsXVk+KJlnMQnNil8NK1UBnlbMcyoBPKk2lC
         eYiq14RBLsjEpIzgz5daHdVttNbhGPGeuyPJ8Xydn27Cz11zFif/+Tb21istflO4zv3y
         h8WZKRv6UfrtvTCu3dasQBEhjFawvKxkl/6FSRER1Jyq2zY6gQqvrgpb7qFdpeQP2tSf
         e3VA==
X-Gm-Message-State: AFq9FYL0VVSYVuWJIYQf96yUlk0rlQM2uidIBsNilYZDDeUyZ25/+jvg
	ELhR56dAacLl7RxcWCHvJdNPJueAp1C4yRlvJGFN2vJI627emJzP7lIrpurENykTJ6GeWu7V9yW
	UrVMmpd8eZW4pWxzbZ2QEAmDfa03GpZqhTbAWb8KQZuluGCe0iPWkPj2EtiOMSm23jII3jrk22g
	==
X-Gm-Gg: AYBFou0O8NJPuh8TZ8u/MHnFR31u5tWqImSkOECtBmCYS9xUsJifRF4wbGcfmau2XMe
	uxRDm6UOurDRyvEKOIRr/2xmhcJ49m5O+CBZ2ZbfL1LrGz4XAoBzrrNV7O73PC0M9SYnYJvXw4+
	4J67jG4yYKG81gcIhS1gDm1I/LasPDgkFudOwe9sP+sUyGXg1vfv4abktdwRFjxmBQxu5cd+UDZ
	uITzKdQIjvVU/F5e61dD6lkGuE6VWYCNz5y6op4aB7kgrra1vxyT3ePT3tmI0kNQpw/mPBg7C7T
	Uvuh7pxlcGEkEf3WfUFt3DWDe2GrRZVOUKI2vC704PN7gnbSC8AoEIaVRw1rQTdvViruRORTMDl
	kJaLRgNNC906I6nlkYRi8mELyy5ryHC0=
X-Received: by 2002:a05:693c:87d7:10b0:343:8685:d8f5 with SMTP id 5a478bee46e88-343868677bfmr1025483eec.29.1790428100789;
        Sat, 26 Sep 2026 06:08:20 -0700 (PDT)
X-Received: by 2002:a05:693c:87d7:10b0:343:8685:d8f5 with SMTP id 5a478bee46e88-343868677bfmr1025445eec.29.1790428100180;
        Sat, 26 Sep 2026 06:08:20 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341460f5166sm15356614eec.29.2026.09.26.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:08:19 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 18:38:06 +0530
Subject: [PATCH v2 1/2] media: iris: enable pipe for hfi gen2 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-iris_vbv_delay-v2-1-83dd80765dee@oss.qualcomm.com>
References: <20260926-iris_vbv_delay-v2-0-83dd80765dee@oss.qualcomm.com>
In-Reply-To: <20260926-iris_vbv_delay-v2-0-83dd80765dee@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790428092; l=2664;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=PEgIh4M/astScc84Iv6ct6kewphSkXqlkuVssPAXI9I=;
 b=AEdACCjyVfp+bw2inhvFvXZGAPJpY96uo6TSdMr8dHDcu0H8Z7vmVhV0mAYyZwvXUpnZKgUYN
 KOn2OBgrvEOAde/vNfcYaf4gC+QMLnTB9/5YEubHFi6MOptGuqyVf5w
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX5zUcJ3pk1ugW
 JvVh1BhLKNNT2N7DohuXww51ZyLXVaXIdlHcHfzOPPCEiW5UVdMcgTPOsHkLtCaOySpvJ4wIZJI
 nClrwGK6A8CddOtCyurn6y7XikJU1WSnyFkV26x8SxQLMD9BxZ6l1bwSTjmM80sUG7yaX6iB/Kz
 67Cxlm8RGYvaV7PHJeMi5kmJzZBdnAQPwJsxyvY/7CgD/DlWcQBfXS51YMzGU2fGAMHS7VipUaf
 HM/ugX5+I7eui1s6lap8FKSQEbUNE+oQBQAfPoespQWZ+RoPYDvCja5alkOXlN75Et/dgSJKDeP
 R6hu9d9U/R4XAcjxLGbSpUSikXK9aKsh7cJDktarQL3WbYmLTYzVQcCu/gCvWAdPfFXGYq9o04i
 oUaAYRVRS+crTpClHU8Auj4NfnOpPTdDv1+Cxy6z1CmN7Ax07Q2LtsXyG/Pju1sIkKSUkq3ybcs
 Mp955niUqUAhYZvu2FQ==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab7c3c5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=loXtWXkZPLyPDUeNfL4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Id4AgLsVuWBRabKyg9j-bCa8GqpTh1-M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX8TCd178cuBcm
 ldnaGYgkA4CAPSSCSe+XFyRSOJgNfEWl1oexAWwU6K4HFys8b1OM0Wl/s55JNlboKGo0o2L9tcE
 ctnxhN3c1NpIp+zRziBLTMAC7dX5h5M=
X-Proofpoint-ORIG-GUID: Id4AgLsVuWBRabKyg9j-bCa8GqpTh1-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260052

Currently the PIPE capability (HFI_PROP_PIPE / work-route) is only
wired up for the HFI Gen2 decoder. Add a PIPE entry to the HFI Gen2
encoder instance capability table, and extend the encoder
branch of iris_session_init_caps() to derive PIPE's min/max/value
from the platform's num_vpp_pipe, mirroring the existing decoder
handling.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c    | 16 +++++++++++++---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c |  7 +++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33114d80aa68 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -453,13 +453,23 @@ void iris_session_init_caps(struct iris_core *core)
 			continue;
 
 		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
-		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
 		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
-		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
 		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
 		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
 		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
+
+		if (cap_id == PIPE) {
+			core->inst_fw_caps_enc[cap_id].value =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_enc[cap_id].min =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_enc[cap_id].max =
+				core->iris_platform_data->num_vpp_pipe;
+		} else {
+			core->inst_fw_caps_enc[cap_id].min = caps[i].min;
+			core->inst_fw_caps_enc[cap_id].max = caps[i].max;
+			core->inst_fw_caps_enc[cap_id].value = caps[i].value;
+		}
 	}
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..45a418fde7e9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -365,6 +365,13 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_STAGE,
 		.set = iris_set_stage,
 	},
+	{
+		.cap_id = PIPE,
+		/* .max, .min and .value are set via platform data */
+		.step_or_mask = 1,
+		.hfi_id = HFI_PROP_PIPE,
+		.set = iris_set_pipe,
+	},
 	{
 		.cap_id = HEADER_MODE,
 		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,

-- 
2.34.1

