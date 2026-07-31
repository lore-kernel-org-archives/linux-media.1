Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50359282F18
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457925; cv=none; b=pXMgG2e5UKPO7n61Dwk9SXVxq4nVhNqKUuPXFatHwLEeYH2cG/2mr7dz3oY9X7JbQs0OvDovxldSQXL7T9hjg9lgs3O25H0Vk9nmmxYf+d90s7jcAzxXUO5+StGlgmP/l+I+qwnPwQHHnHCrI5aBSFmHEn/7QrphliYwZlE11Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457925; c=relaxed/simple;
	bh=zgD959mMF/8ySbeK+HmCfcXDYm53NBUcMxUwd7KZ7mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dt8coIG7wFbDS7GBiFWgCle433IjH+lFbLUD9w3TTkY5qTmEcvZWBUe4Fk6FtMda0ZFqcuhgm0CSC+oKrnQ8SDWvLERd2rYFk9yI9Zr6oItFKVO+8aB/+p0vAruiUYvI5j2SgQvnMOX79GKaZknRrU+hhegiSI0wj6JuZgvbSnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEJsOyxU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpY6g7df; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEJsOyxU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpY6g7df"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V0Ip5v3564189
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hgdfzEGCpIZsxITOSxtWVRvSfeRmupU6X1LTU4J1VNs=; b=IEJsOyxUbmNiStSv
	W9s9IysgKx9DAFOW6QJNgVpJNb5hoqfWGN2DCdNTd8daHE0nETo/i1p0+wku0vld
	VjpqHcKo1rK80GouOLXSrg3HmCKFdJbUlsFJd89a+G4FklE//Y+XIbKV3O0OGGFK
	2mKkdZ+ZUK4AhOsYYjlRCNRDH4OMrVYFN26PjAI8erli6nxgNokV+9iYOpKfUo2q
	Es3UMNiWLYroXBALy90EZYPIbNFeHVZXZrCxDCMANlGjCDHicS/3UcYKUt1BBGtG
	nYvDhB/YbnQX3HKudF7ChqjjmCxaXeiynW5HfdhRDSIO2KjvfUDGfoGRYFMu/RlL
	h6Kl6Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frh29010w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21c01cf3so6745031cf.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 17:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785457922; x=1786062722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgdfzEGCpIZsxITOSxtWVRvSfeRmupU6X1LTU4J1VNs=;
        b=KpY6g7df7vKe8D7mqyad7wmQm0liiF7sIzaz5DGfkBA5v1GqDKn324S3oK3BW5r3nI
         6TrAbphdrasV/gYJjvUxRBLUMuQcA9ObVJ3IEpoZfXcaD/tsNID7eocCnpBrgY0YmQM0
         Yqv5RjUxU7VA/i1MtDFc+daxWQURuCFPDQVdIqFv/KKQYqOxz1NIHO6QDwb5tIuTlRkZ
         XKAjTGuP8NEBFEJwFgxwdHl/VwMiHwQDb5bvj1TUhrqc4S5UhJ5OVKIPPIeAQ2AdU/cU
         MoXXnZvcX6ZOuvrumwtmPdhJfzMwKe9HJi6cG7enzlWFH3CENtyKlSK4QNTYBaWfzCPh
         Kl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457922; x=1786062722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hgdfzEGCpIZsxITOSxtWVRvSfeRmupU6X1LTU4J1VNs=;
        b=skY14Nm+G3q7kpvh/aRXYzEKi1dOldxsjXGqsNrtIRqQIQWhDphgmhU6BPKCvFBmJ9
         S3QInl/qZEaV2DOzJQefiwuaKHmd1Kjl6nds1j6rLFIktDWXW+G0vSa+HeYPEiTpuQxT
         2dxtOURz0yyZ5FDuoE3q0V20PpeCnktYOWk+XzvXwksv3pIDPvzUdHFdkkCjPNzpbtH7
         D76C65AZ+SNxQs/gFBzTwfP/6nfFAagYrfPQa0UvJO3PBotvA5Mimr6vGRi2KtHJaD4R
         ieVIB5Uhz2Wpl4qsEsvmACUU59COFy+a/safOz57UwGZwz5/xe8/L4+3LKxjXxY46f8D
         yYZQ==
X-Gm-Message-State: AOJu0Yz1g/INLHly+hs0h8qv3q9vrUDUm+S2Qq75gnVelGfLNB00qTdK
	vyshK2fWmjkGX/O0AZp2Il2meLhDmVFkgpyeF3yG16Ly3GXQuRmLtVN/F6r8bDbRQTubg8kuztG
	/0t6EwNmIzQPQMUMDtyqWI2y5U2tGZeBGmJF1hC7cfSteCw5QAuHUmGDiE6cZI696WhPEdWayvQ
	==
X-Gm-Gg: AR+sD11hd7iVX4XsFejpeMNVUWPTC1MN+oFE4DQtv70wN77OMnxkaO0lVxkSOfLkb4/
	xLsQ6+IYvmvOGSLwhSal/aB5qzrW91LdiHCH57Y8btgC6PeAfprlw2wF01Z31013tLIvM2D8HIQ
	wjweNFo/YWqmPd+D2WBKZb9tEFhYp7MOMuhqSCmwStjNXHwLX0xA4wtwER7UpyGknPACEYgP/Ee
	OuvBMtXuTZgx7bG4iUCDBZyPlFDqS/xyb6oNq4P21srJZZRBXrsRzGWecn2TJIUJMWQ68W73lBV
	Kmaz1nngpFQcEx913vBzFZ7ybrO80ILLm34xHK3O9JFMQijf8p33+e7bbPllCm0xIUpoz5vCstk
	l+FXRWXqkXVoaF6JsjSPwgBQYT0YQuwRaoGHYAyXu7pK/RJrHGt8wIKHPxwT70wL5py6BDfun2h
	kVLloV2N9/zRGIWQ==
X-Received: by 2002:a05:622a:1249:b0:516:ed02:c85d with SMTP id d75a77b69052e-52b4af3e4d3mr1379751cf.3.1785457922358;
        Thu, 30 Jul 2026 17:32:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1249:b0:516:ed02:c85d with SMTP id d75a77b69052e-52b4af3e4d3mr1379401cf.3.1785457921908;
        Thu, 30 Jul 2026 17:32:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9d2688sm620538e87.57.2026.07.30.17.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:31:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 03:31:40 +0300
Subject: [PATCH v2 1/5] media: iris: fail firmware boot on invalid
 uc_region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-fixes-v2-1-94c002016a09@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zgD959mMF/8ySbeK+HmCfcXDYm53NBUcMxUwd7KZ7mw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1b2m995a5lVprBelxTwCNrQvsHY9b672R5p6+dnXPuT9
 od5/trUyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJlJxn/8PP1PHHpVNum2Fx
 efevv+VXVm54byD9ysE8XsLu7TLh1wEZW+KniaYwlfE/N7cT3LhmV7HT+w8NF5mX5thu9E/Kfvy
 /+tHB7/bs668oRrrYPoi44iG6K01zdR0n2/rft6VjuI9/ViiuTZKcmLBx7aV993gK+cMfvguczV
 g1yfGB8Mk7uhfzzzq0Gf/hOTHJJKBeII4zpEqFgVN8Ftt1ucK5ya8WaGb8n650fmnXnd1T30oKp
 S+/5GvNdF994uSrXKF5TytjYycnaWprSfgpsnzWS+oqfhKwL0392/YNXJtLHKWLt+r4TN/pHLRt
 0u9uCQ+Rt++rPH1Wpqid1+79zfjibui+fue9HnaecXsSAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfXwIMzBtJZb3vo
 K8OOsBeewSexY/T1on7U6MPO2HxevJvQ/w/Yes8qxSEe05yG/3o/vHbfnEoE8qIBqTT3g3xRQDU
 GAWwHLHyFJqbgI8AKZptW1+tvAngqAo=
X-Proofpoint-ORIG-GUID: aJgIfnYfKLDtYx63zPCYbAMTIKdYzI9g
X-Proofpoint-GUID: aJgIfnYfKLDtYx63zPCYbAMTIKdYzI9g
X-Authority-Analysis: v=2.4 cv=c8Sbhx9l c=1 sm=1 tr=0 ts=6a6bed03 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=bM5zmIW2MuzvGEp2F_gA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfXxosrYbjhpVtB
 VtwsVGd+PV9KxnkDkKQ4UgC3r+Wj5JbcuNNfo3Mq0z+mUfCKn8l+QnKHtuO03J2L/Rm/YaZ+5Sl
 /HYsPMHXpUO7FoZsZaQKv39/Lf+VC8FePEuZMbOU+E8QoLG4hXBglIk6exQp29hKbK0iEyIgIsc
 hBnyWUNgcK3JUY/LaP/U4tguatK/kGH7kEiz2DyGevgtUJz3VrEBxagi8pAW/brWDwJnIpgzkYW
 jsFrtnKbcpzLbSKRZg6wiT7xCcLOAdyTer1lD0aJMynqlP9LUHXdEFvhtZFcXzjaXsEEgsKyBz8
 ZjXhROz/vCxwr04FbzmDIrdXRe9SsG+pf5YydhIWSBFW1mKqXs5+crgRaUs+uqDemz2579rLudl
 2W9xZ1IGSW++m+d+RBGUN9V0uzBp97jy9vkxS/1UIdfyhnjDOa2hWP2juaY08JkNYe53eZmORCO
 5epqXKXuTaaenZE6qJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310002

iris_vpu_boot_firmware() polls CTRL_STATUS while the firmware boots. When
the hardware reports an invalid uc_region setting, the poll loop breaks
early with count still below max_tries. The following timeout check
(count >= max_tries) is therefore false, so the function skips the error
return and falls through to return 0, reporting a successful boot. The
caller then enables host interrupts and proceeds to use firmware that
never came up, which can lead to unhandled timeouts or hardware hangs.

Return an error directly from the uc_region error path instead of breaking
out of the loop and reporting success.

Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e4847c107709..819db7569524 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -84,7 +84,7 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);
 		if ((ctrl_status & CTRL_ERROR_STATUS__M) == 0x4) {
 			dev_err(core->dev, "invalid setting for uc_region\n");
-			break;
+			return -EINVAL;
 		}
 
 		usleep_range(50, 100);

-- 
2.47.3

