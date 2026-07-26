Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBB8346A08
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045112; cv=none; b=Dmio2EQMZKNuxNT1p6tkuVjncEBW9Qwjk6dx3CbcTwJrMUXkWLT+p9LmJVtw7s5h8ogdSIkxKpicQX5OpPRDb0QCnOBuqr1GL33n0R3RhGvus1zizzmaVrWvtFCHkez4vjCqOXXqe2aZM+QHCp+evS3cYq8F8+ck0O+dmSYPeZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045112; c=relaxed/simple;
	bh=yra52VS1O1qkG1I7l9t/y7AcQSQcWu6Jk16V4XVt4/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GpwmRY7s7g/JVMvpNOS8Gx0NCnelfwPktJb31xCqNT7f28irVhRgIE2ND+wY5AupUjVMtZTymXNuE++5IFOmqTr751t6Ho0cBkBgzQCFVLy95hX/OLnGOUovNB8AqbCsTDJ5gzyik7JMpd79VgVjwyBhhUfEkMwJqGvdrNZHvOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UH5n4LdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KuYQgCgW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UH5n4LdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KuYQgCgW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5RQWA3959308
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SQUs4I5qKKfvh/7mjQaJqAnzd6s/3FVrnUtL0k1BpU=; b=UH5n4LdV6KVVWStU
	P7NWziaXQ1dzAiR5rezhpD2Mfgy5JRT4eVdzmIt42A3YKzrMtblvwywBKsTIpZlP
	WqeZThHffgU1gNNNeDSLqehF5RTm6ov3lqKLDrawvMNkErAiT/0rqv/wSfRtLIE0
	2zvgd78ZXgkmg59ujMxMQQ6l9E0HOjzmvLOHoo9HHMeM0eQ+0HxdSIgO8kpNroSy
	98oDR7FPR1ST1Okefkpku2UV7ZI39GrAQPvsEUcq7Ygxp9VGZ1TYLlrH9pWei/Mp
	n8gmZoG0vfmv+iFFBQmQG9/N6OjoQucjMP7RqNRewLz0EGl+wSrZ+1dILmDqSMLA
	Hs3u+Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjgn2q0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:51:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso1691468a12.1
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 22:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045109; x=1785649909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SQUs4I5qKKfvh/7mjQaJqAnzd6s/3FVrnUtL0k1BpU=;
        b=KuYQgCgWyHaHQjjjqHNyFcktydHcSLrSEApWBi2oeCX7oGLVLrfi0i235sZL+GdTxD
         UCQlgJyrP6wcROgLXkJBaxiqq2Dj97y4qPeMbiJASO5kRLipqiDAu5/qGJMx45/ajh0f
         5QLBFh7sx2sD8F8qe9cMk+0p2awswzl9lOiODxQdT1gVdQo6URZLBEoxlJ/wsrUMAziW
         x3zbqZ08uUqj7rMWRyL5UYgXGI/m+i8xmEQ9KCJeY1whm1/6ehDV1Mtoly23qpyGXeDl
         pcvuXPaCLD8UHimmEKzcxowRLSYYitPRNeizDQYD7+S9q4WShlrWmj/nJhq8/RSjIbin
         jZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045109; x=1785649909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SQUs4I5qKKfvh/7mjQaJqAnzd6s/3FVrnUtL0k1BpU=;
        b=VdagQLeQ7zBug3N+BY8Eb3gO9drlnKHl54WH3xlDJIyCNcuW4IjdWgvEyCFRiIK0j3
         1+Im7WPrtME8moj19YvHzHaSThyb9FMMwB1TdhyjsKlVvBOURzs+MrwE6HRx17n2Rmfn
         Vqx4fYTO9jk3tQChhBhN4/Aeun8kbo4sKMWEWDW9amqZm3CTsCMT88wwRX02o4avAtDo
         SiuFkxOClQRqiiNbDY6cGPlAJF9Qvo5PdCPX+NB0/x7OjeB7lRd4yGRcaHDMjCjMCVKc
         EI10yqNbarsBo7SeGOWThUwRHEC0Rnvg2RUu3xgqqEDt8yGv8RFwW2CfgqtztnfwDMU3
         yuvw==
X-Forwarded-Encrypted: i=1; AHgh+RqQ0hcGA+7k4X0PmiaqCvzAJ4JAI2IBabhJ6Epvxb3bmZ07lXEMbO9WMcKtDuWByG1MWJjJoSLRe7wSTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAuTs2DV9layKm8/aaflIVJ59OnAHZCxos4YLpv4yKZOmhdVjU
	5gMRi6N19J8WXsYUNJKv0eakFTrJVyTT27RrxlDDuI3jXC9ejiHkbYgARaLHlqHHh7gbKlxAYcC
	WdsmV9YBf5c2uxGaJOahrQW2q5ILC9T2dCpKkG14Oq7m7EAV5RD+O1yKk2/sQLtnHAg==
X-Gm-Gg: AR+sD104HTMyFXng83KiK0ho1oqxOBNE+lyH2WvJumQIYM7yHnlRILC0bzDoacBruiV
	8DIvu2G+SDzJ+IZ/Ht2HNewgY+L4/+kRDTC6hEIWyWeFGiJFP0MMcnkfdFiO/bq1g0eZK1BSgs8
	ST34xjFnBf/Oc+Hmj1Sj8QehaRqatfQiIxJjrNK2UdpDN6M2qST69EryugYaUubaWvx0pocG1I2
	8ZWv2zO1P0se2ZddgnhKG6QrFdJDgP6iTBBIbfcunyalGjcpAtamrYuRaFyse0jTHWsMBuFt2RI
	Ej+sXcHTvwc1dX+J+8BTO46UF4U6S8TCTHy2zL9nLxlXiEzFP4zZ21JO7QGaFf9bncwoF2+uP+O
	8LVz/uPoTeVW1yrMh/dOGsKbf3CRv8R1Qlg==
X-Received: by 2002:a05:6a21:389:b0:3c3:812a:2198 with SMTP id adf61e73a8af0-3c67d9b3db0mr4004709637.4.1785045108978;
        Sat, 25 Jul 2026 22:51:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:389:b0:3c3:812a:2198 with SMTP id adf61e73a8af0-3c67d9b3db0mr4004694637.4.1785045108571;
        Sat, 25 Jul 2026 22:51:48 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:51:48 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:41 +0530
Subject: [PATCH v10 11/14] media: iris: Add hooks for pixel and non-pixel
 context banks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-11-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045024; l=2514;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=vjoXIXSIylRH2fiaYGsEYPpNKIneMt8pHF7X283MGzM=;
 b=mPYkk58CGSOUSQzXB3LCiBnaFBZA8JRcjBwQ0JXCIyx3uG5uj554SAFqQjcitU9HqICilzkoJ
 PMFhWSnbbR6C2pdLIHxZH4TYsmdGLz/WRrEIx38ZnC1r3F2ykCmLOEu
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 4yu5ily4Iz--peqE9s8DrRoh0SbF9TBv
X-Authority-Analysis: v=2.4 cv=HMHz0Itv c=1 sm=1 tr=0 ts=6a65a076 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=Ysd7Cdeu6pd1DDnCSN4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX+ooj3RfZky4l
 wg3mEbjAmNpBYJcujhjdOlO3qECpa2VpzVs6ie8AhMwkdlKMrbkBQEwV9BljnOFP+OxHHcrGHle
 dNBC/tjDBLD/M0gElN0eK5K7E6w4AfliGNt9iUSqPGSGaCSIKYu0PvTf42FgHbTOyCWyff2uQDE
 oRxZKfCumiXw/gJ33i7MqbaMyTh+ANWsTy6n8PJqwdXwqbuJQRKEOLibHkQuVTD6LTInUf/G5O7
 3U6I9qPH4HB4Ggwe9/9nnRqKa2nh5ceFdov8mFsklfiOyXZkznjY8z6SzZll5m3NB9swJqOPVvN
 /X32b5IRHk1zD4FvrqLkDnt4UVuAX3TUmZnpKOed2GrIgGn6PcY1xZr0eLBoSywQtB5rnf51wTM
 1f3BVsXOMKdfIF/WiRSKqaf8JcH0m1hsVfpKmFnAMl9OZhtW7mt6QxXb/BIaql1tuTPLELx7R0E
 fIUg0Ch1wwtpE38LQrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX4JakHrnWuIYa
 aqJz3/8K3dXcjNDYH857O1J2f3oVZLDu8E8/WD9WCcN7+Pjmfg/zPM1Dvv5QMIHO5CzZrXAr2Pc
 pO/vK0mW5Sdp+nTIMZipl9AmkfhQPtc=
X-Proofpoint-ORIG-GUID: 4yu5ily4Iz--peqE9s8DrRoh0SbF9TBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260055

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Iris platforms use separate context-bank devices for the pixel, non-pixel
firmware domains. Add platform hooks to create and destroy those
subdevices, providing a interface for their lifecycle management across
platforms.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c | 48 +++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index ec35ad4f8610..bc95be22ed96 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -397,6 +397,52 @@ static u64 iris_vpu36_get_required_freq(struct iris_inst *inst)
 	return max(vcodec0_freq, vcodec1_freq);
 }
 
+static int iris_vpu3x_init_cb_devs(struct iris_core *core)
+{
+	struct device *dev;
+
+	dev = iris_create_cb_dev(core, "non-pixel");
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	core->np_dev = dev;
+
+	dev = iris_create_cb_dev(core, "pixel");
+	if (IS_ERR(dev))
+		goto unreg_np_dev;
+
+	core->p_dev = dev;
+
+	dev = iris_create_cb_dev(core, "video-firmware");
+	if (IS_ERR(dev))
+		goto unreg_p_dev;
+
+	core->fw_dev = dev;
+
+	return 0;
+
+unreg_p_dev:
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	core->p_dev = NULL;
+unreg_np_dev:
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+	core->np_dev = NULL;
+
+	return PTR_ERR(dev);
+}
+
+static void iris_vpu3x_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->fw_dev)
+		platform_device_unregister(to_platform_device(core->fw_dev));
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -435,4 +481,6 @@ const struct vpu_ops iris_vpu36_ops = {
 	.set_hwmode = iris_vpu36_set_hwmode,
 	.check_core_load = iris_vpu36_check_core_load,
 	.get_required_freq = iris_vpu36_get_required_freq,
+	.init_cb_devs = iris_vpu3x_init_cb_devs,
+	.deinit_cb_devs = iris_vpu3x_deinit_cb_devs,
 };

-- 
2.34.1

