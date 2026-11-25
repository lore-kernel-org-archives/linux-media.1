Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577150;
	b=3yFGFpkwsOw934pkvob2Aij0fRa5URpsCWn8NSDO1V0bn+mnCj48yEnFPvsQ082fUsNh
	 DZzVVJtnfi4/YRDSMnQQ4N84fSZu9/BBS87SFlANXK/AjYssCHUfJ27otk0raKFzN3Kdm
	 OaXjbuoONjjubCWh6YRSbalam7Np3E9k/od2P2k/QQAPnB8mlSRsQUtt0/0aJk9kJEz/W
	 gUQ2W7PjaL/ByKIM5nw227ubV0KGJjGDK2AdaGhh+x6PV4jHzJIvcQooEtIHP6yzcYM09
	 g4aQG1t7R4tTAA+UammyS7hDKUeEa7Ykqf/ejZS13oiZxhg99sJ1UKBjsWGICz1HNPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577150;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=;
	b=K/ajFRglTz2QRIBTYzNxiD26QvFoVb0e0jiPZNftp0aNSbu+GjVqvn3R8wUgoAeQF5CX
	 FSJENPTxFyLsNigGJ0GRu0bt1sVhhQLqe7jipIB2LyQoC8Go0rWbXpU1yfvPZe7XU2KyU
	 w7LAL9VzHxxLcPMfP9XRBNHUxAdo6B3/piDmdzWFTgN9FKqXseG4IyIVKYuAHaZ/tuinO
	 2RKv4/d721NGZwOjL///3I18m7B3Zmyr3p/CZ21eqXSr76BtSr+puTLRdBrFUPtRVvDhX
	 gwpKS94fv6Z2n0gbYa2bQQYQfjJAURJdDEhLcggxgcR4LzKW5sq80nP/T+lo3Bbd8BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=disey++d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hhnj4dgv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B20606A326
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50B20606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=disey++d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hhnj4dgv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2AsiX2109358
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=; b=disey++dQOdh5OZp
	Oq4VJ08I7p7VCR9MX0DTRk9XRQSwk44yzOTh6QARQlpMtUBZwGovX33z1xOMWntq
	2z6hcTnzKfDJSWpj04ZH6sVVaxg5azsnZ9zhKHw68ZNqA7tA05CD12d7tkU7LLmE
	2kZqo/VwQeOVQ5NBT/9/d/3GCyvq/6tqcGGiNNsysXoOigxY3j3Gp9Wsan6eyDjD
	Pl+aFq0rSXtZ/SXt4+eJ5OPfyTharw5PDY6ndx2cLpJf3nO+u19lxtMF1merU5Hu
	ExhTjwpLG6wmHtMAGWXmE/C3COFWm8JDr2wg5lZ/TLkNsD+M52x5csOt7vyxvQRE
	w9Y1GQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eyda003-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b203b0c139so3864105b3a.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 19:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577148; x=1796181948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=;
        b=Hhnj4dgvNbMIK0LAs0Oh/XOACn++U00OD3fEVstyHcQQ/pFytKnhIdIB0o9qJ0eJ2K
         TFGI/oAJuWKjluNraPcIgRQ6WnuUA33BwXK3SHhEzsoblMnfXanVKAq2jJlSEXmPV8gc
         0aUMO2upMPSNuMpl47vXtNvudCupk3dg52TrxNA4h6U//3YmUOEXwFIUmHcK8+GIgnGQ
         JrioF8VPd/+vhOeuLkp/N83dKi9lpNL+PMG5mrS/k6RkRwD7ib4Qy8mHC6nMoZJ9pBb4
         2vBfDob+v+GErh/AUloDL55uXpzKpG6LcCIjUPmoaZ9F+W3s/BCXn2vLrIXnev91U1Ns
         pYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577148; x=1796181948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=;
        b=iuOhVVTBBp7VRDBG02hzQe2RgZ3weCaaQ2Dtlll46uepaWsPwRckBNCCnpeSd9TM36
         phMuOeSzT+nLG1htrETHM5fugNYTXAp/UpIueV3O02eECN1vdoL5bSEEr/o3jVtbWu9n
         wD+rHBD+qsBQogb9vaWBGlMdIcI+M/s9YsbBRVBDYymfrzNBOO8M+HlZknHSicdUFW98
         UkgS4hsszaC8CWeKDG/VbGq59Yjmm5iJTuHx5UEA97ZpqpWU8xzZDms5KYwRiu0yveNd
         urFdWwftgFQEMtZe+cksvfzQXoUBuBmyua28vvxMRgE3rL4IcjjnIEhGKdILb6n3v4HC
         ZYwA==
X-Forwarded-Encrypted: i=1; AL+hErEJhSCtiDcaqPUoZVHJw7R7bNbbh2DgV75NK7x+McMx5nSrqtgkedw5eQKDnHPUcrdzTp8UaZD/ol4wUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/WoCW9qaEZOAFTNtj2daRrvT1QWSHsBfqMIQDdcnugo+SzkVYI
	HmpSixoUsLH7jbJ90PQHIDrnBCWrC3KL+FzQWpF5Dz1/2dAohKH7PxeB9m3zCh8QX8xIz6Txts9
	128uit9/WZMMQmFtK39vmOVE0NJuDZtp2NxUq9+caxzn9A5b+kIkOROTHfdjHItguNg==
X-Gm-Gg: AZFdTZdijzxbewH6Q5DsCd0cEx2efcw9guq3ZNWO6+toxkr16+GzxsZkqE8P/98ydEX
	saeX5TCh18Lb4HAfImqOiPIhFE+i4HV05I7t37C5kruPgWGmeI2y32EJvpO5LvQzbrYLZk68w/D
	B13k1MROuXUSPTKS6wu7oTcM410MzY2rsv5OfyMox2BkJ7hCnPEVPA0YIELb5YAVork6OAhEuXs
	z7KAXn+E004/7B02Rg7DYJ81qWNP67HKl1GitGUlrpVaQ8JLvYeHgaSGr34wzWrGHV44J1rVbPo
	bzrP5sx3PebUGMWwU0B6AdYb++uVZGc+lm3nKyfzfnEXNLJgJocqrK91bsx8rsSWomApMXstADX
	GihO2gKpTNLz31pMuVU5H4TH0wEfScVI1Y/3krUYIk5N37cXgY/cD6jx4FlUomjbmDrYgizAmZT
	J9kmG/mzs=
X-Received: by 2002:a05:6a20:3ca5:b0:3de:46cc:b641 with SMTP id adf61e73a8af0-401493a6d0emr21051793637.8.1795577147892;
        Tue, 24 Nov 2026 19:25:47 -0800 (PST)
X-Received: by 2002:a05:6a20:3ca5:b0:3de:46cc:b641 with SMTP id adf61e73a8af0-401493a6d0emr21051761637.8.1795577147412;
        Tue, 24 Nov 2026 19:25:47 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:47 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:16 +0530
Subject: [PATCH v12 9/9] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
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
Message-Id: <20261125-glymur-v12-9-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=1036;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=DbPABSYVkpMlvsV5R4AOmReFgmMQAmLdU68WF9AOk7s=;
 b=1+q+G9l1KysEPxNfsT3JDoeLn4WSzohIQEvczL3tRSUJ2wuxSCNIIFZEg9yJPvbeW6cWOMwZv
 j29tQo5lDfrA+/fxKyUQtotFR9C/tob5keXfp/2MJdJx/iRFs6kiK1i
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfXy1/FOANI51Yp
 gOSTmr+HgMwAFAQBbYubF1Oxvv/yKHLptInqCxaFM45GkOCiQQ+4zhEM+6bMlRPKQBZDw5jHJ4o
 IPS0jotJUOXjQZq1ypdrMG/Ce9FSzPQ=
X-Proofpoint-ORIG-GUID: qERq45FuBzeLREtFeRf8n28vAkFggs2P
X-Proofpoint-GUID: qERq45FuBzeLREtFeRf8n28vAkFggs2P
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06553c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AZ0k4gBlmfIc1QQ3fuQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX3eKTa3KLwQrm
 ZOLE5iJUvHS5c44+GhREfTVAlZvoooRLrS91eWi8lY1aWViKo27bG9aEDL7lXm89Wlcb2VpB2K6
 51BJ/+yZnLWxeYLBSSCRCaL2jFCeM+SMmWZpYHXsH9nzeH8T3gfzsFsjHbR3ZnwYrfUH2Yta4Qs
 Bs1Olb5ZMsNShKb58unLB/B+gRJLBG/otwsoSiPkHeq6mPOhvb55b6YsVru/JXtb7zNUQOPT7JH
 Zze7fKrbb7XTffImR4AObLENV28Z2xYdOSPvelUZektc+h82z4uwReAnt945DhWVy8So8kvapna
 jcI8jcRlSc8ma0OdVIqUDI+gNldStvBxCZh1Oi9CUKNLXkBHnFpe5A9PtQPTQOrsmTkS4IAS/jN
 VaXJVDY5VXrzlezhmC4lz8iaSIaO0YUZRBqzLOkO2ASq0V4Om/PAT+uwupE6TZiLEqNd6gObgvZ
 z2Q2gjthVOzBUG62Yvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b..17947e7bd6d5 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -521,6 +521,16 @@ touchscreen@38 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+
+	video-firmware {
+		iommus = <&apps_smmu 0x19e2 0x0>;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&dmic45_default>;
 	pinctrl-names = "default";

-- 
2.34.1

