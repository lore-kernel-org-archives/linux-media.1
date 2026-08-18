Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889E7456E00
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068496; cv=none; b=omAkGj76d/B0OJBIEdFZyueON8EUTwlD4ld70FUjGPdJekFHmS3TgY9svKYj0EZsqmdEFTMyyjTs4/coQwZNbvI36MrUd3fMIlkdH2qrvTH7+Rd1gbbUsHFJ25qWxkQ8Hv1r4rkTC4uV+nzx04KtYoc99o10i5wVxtwMTOudeUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068496; c=relaxed/simple;
	bh=N8g+DXNfDRJOD41XTpggaSV1LHWFsbXlVA7q2pwOZdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q8Tj/MMW55+DYEQ9iINIVEFbSN9oNG627XUdQSNuLrJ/kS3ITTR8CXxk/8H4cax2kZYdepxveEx7Vh7UOt9CE/izPi9/hOxYWdcLj9Vm4M8iSOXTf4qktbgttazrCsUsCPil1k/fDr1Svm5f50Gayj+0X9Hq9U5MUZJ2VmGy7+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoL6cXfT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYALFQNT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoL6cXfT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYALFQNT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0dlC1502675
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E3jglw0Wq9Oscb5y0P5uqnvM312XMF7ZNYTvPJQRdZA=; b=OoL6cXfTsJI5mELS
	/S6bfnV2UhT5L8ox5PRSWYxVFmVzjn5LqOOE0/jsanWsgjYK8GKvliH+14RrdUIs
	KAoHM+kJFDyU2GWXCcaEiHdUOoRHpbl8d6b71NtY4AJcl+xrQ9XSRKeuLdZ+mELa
	3Kbuy18Rp01j3+GlYteXqmvXr8iAzFHbxz4UP9YG5HDP0DkaonRwWZnwFBNOeU2Q
	nZAav2bSE+EgDdgOIbc2pHo22hIpoKyryR/oxKCF/CiIOWY24qH2qbfgKhTHEi1Y
	ZmyWBsG27ngab+YAbAleKKOjavvNTToVqg58QS6vK7QsJmTeuaE5/Dnda34Y5tXk
	a6oMwQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4prn17mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:54:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca124bf0189so944242a12.0
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787068494; x=1787673294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3jglw0Wq9Oscb5y0P5uqnvM312XMF7ZNYTvPJQRdZA=;
        b=CYALFQNTcd3PqNdlRO5VikxIAZTkGmIAtkreZywiV/BWql7IhJwh/QuurA5zjmwpfQ
         n4Jd5hL66gWKT9icQdbvmwgiSUsgwj5it4MRTppA1Ar7vNLizxOkHxkYm6LMokiUXtFo
         e8puIRemYOTBt/Q/bj27QzQZ/1qagoS95sDnUBga3cEGAxvnIx9fBkCW0Be/UcPB3JEp
         ey2tp1GcUO6HXQJ35zImGJ5xA3Xuw1vOyA/W5J91kSGsjDoYh12a7R+okC0jGq0TqShu
         gB2pULINnjeVAxYlym+yHZ+8FSrcIrq4gFQFIspwBgEHIiKvNaVHdMc5zdaROj7Lmo3r
         48Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068494; x=1787673294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3jglw0Wq9Oscb5y0P5uqnvM312XMF7ZNYTvPJQRdZA=;
        b=QzzeTMs1xJwQi2xbNuKoiPpYnYTP7x3zeEFNYsN48rocc3l75MkT3dhzmGcO61nbgL
         QbMUomyiL7/LI88OKObsvrut8unUFlAJYrnKahKyEHDu3KrJEvOXAEpS4gZbgJObQIJY
         l5Bbu6Z5voHlikE4tsbpQCDH897FRE6fko5/W6wNNzRibNoFXmhZFj7Siu8dejJpGxWp
         Lia1J16564bmDhgLpctkeyVtWKVuZ5wYl92hQcR5V+ib2IsmyYjORzcv15L141o8QpSj
         h9+vNkGr0oYtwfOLFnSTzvUdURbAuhDwplOPDV5EfMLBZHcRhP40FHADH+bXsJJZWXxy
         4Pqw==
X-Gm-Message-State: AOJu0Yxqi2juMyuBxfqLkzUUGEKNEnMeH6z2a7Y+3vkklL0viwljL/Z4
	T2OKO3mMVFHvgDz/Qp2zLEtXyhyFDuB6EG2lsZc10JBW8JVsHSFK//AOMxKOYATJg9WtA36yKQf
	Hh/W0QZK2ENvnkUDaPopOXjXi6/v8aT+H9hgjCrWSTDtbeOEJwN+xIMxFuYtGQQuKQw==
X-Gm-Gg: AR+sD124jGWL+xsj/f1ZCJGhWjMkL81iy6vi6yXxosVMhkBUaB0LJYNXbbtZn9Wy7hR
	whwmKSvDNJ+h/tQZCdm2o45a6u20iwi3MbpJ+fQ5WG7EwEJd4fFDNDFF6332SyoKolCqQ4vAuS1
	weEDKScE8adoOGteu9yOro6VepuydAiJ1VTF2ucb4O6wIyb+izoMxX4EH1e4z2qjLK0oIlq6qc6
	AbpdZJ/vc0nyAle0rQQ2GSZ5ygY9XBw/RhkM2x6jFs7ijgoMN6WSaV2kNsVVtr8hJNnmgIV21OW
	3Whdcw4IPjHDB9EoSd/CBqcvOqQsa9cvNZ1ybgmJLFY+4L8siv/kCm+Zc2zlyrrUwMv6eUrFt4Y
	QnK24IrdQq3LwyxLKhyipwWGvkX6LlGn2pg==
X-Received: by 2002:a17:90b:3d92:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-39563854dadmr5435294a91.1.1787068493909;
        Tue, 18 Aug 2026 08:54:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3d92:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-39563854dadmr5435258a91.1.1787068493455;
        Tue, 18 Aug 2026 08:54:53 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm8877721a91.10.2026.08.18.08.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:54:53 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 21:24:17 +0530
Subject: [PATCH v2 4/5] media: iris: Fix power-off ordering to disable
 power domain after clocks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-iris-fixes-dma-pseq-fint-v2-4-8dc8c4b3880e@oss.qualcomm.com>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787068461; l=1899;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=N8g+DXNfDRJOD41XTpggaSV1LHWFsbXlVA7q2pwOZdk=;
 b=YS4oHlm8T8nCDzMMg9SyTy5BQFzxnfosvqqjBnu1xiAUXnPBIKNHNGhgZMbqLDDNVQ2jWNqek
 okaZrqlPtpPBpf8eVhlWHydpoSkCSt0g/tuoP5IqMhkuugyWG3CcTq+
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfXwsLiU0NvkxZZ
 mSWpy2w7/yz5HBxGwAjk/WkEPML4IDcY+9K0o0Ev/J7rYBEyX6fodaxmMa0stGvUUKzA/ns6Sh6
 aTqW6oTGs9aJb64fpZEn8zCjNb/pzms=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfXzA5Dfxvloryk
 kp1HMWuCiqQsKGbWDwEtKUFsENF+GxWN1WmUC1w3glh4SzKLcZILkwpiUbL17Ec358AS3p10RCC
 02Kd87gpBqs6j1omfwsDEUD5QB2Ap6mGs6fdtjCusaQuatGTiBvxH7MSjc+p//c4D+m3B8DJ2To
 gVGUvH/3bg+TI9IITRVbraPhz7CIMWn6s589aH+6410ZrQU0zZAJhZAoxL1aVyFzgrORXjvF/dX
 6gTDCyveyd18p7zXcK+DdAzghQIFuf8h6anZin5z88HhTT5Ya77ONWVm3RRwPULLWQ5/lZtYN5E
 DVpQccjMIZSTVRuD/aApCy8ZOzT8i9KO2M/LiBYK6Y4S6Ojjzx0/Un/SAbuoccf248/O77XZ05o
 Can+BRkDtZ9SkRQBDAXg9m9cpNVct/LaCK71wlPHbR/fAaiF0kKuf3A6Y9Ut3eq+/TxkTJhXuTw
 yLOi7p7ZvyJBpCCqF6A==
X-Proofpoint-ORIG-GUID: Xb4WzJFmkjpmtsXGtB2uNUaOUIvcnoGa
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=6a84804e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ou1eOjPKtcA3bHzkrowA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Xb4WzJFmkjpmtsXGtB2uNUaOUIvcnoGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180117

In iris_vpu_power_off_hw(), iris_disable_power_domains() was called
before the associated clocks (IRIS_BSE_HW_CLK, IRIS_HW_AHB_CLK,
IRIS_HW_CLK) were disabled and unprepared. This reverses the correct
power-down sequence: with the power domain already removed, the
subsequent clk_disable_unprepare() calls end up operating on
clock-controller hardware that is no longer powered, which can hang
or behave unpredictably.

Reorder the calls so iris_disable_power_domains() runs after all
three clocks are disabled, ensuring clocks are always turned off
while their power domain is still active, and mirroring the reverse
of the power-on sequence.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e4847c107709..3cd493b06d84 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -223,10 +223,10 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 }
 
 void iris_vpu_power_off(struct iris_core *core)

-- 
2.34.1

