Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AA3453A3C
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425184; cv=none; b=GAegYKbWWa2+3jrIVp/B9FUruUlPv5jECWSPeXIJH9lxeFGh+EPAjhVq2hWWofCWL8gyQ1k9gmP71Ljn2DwiTERkq0u4yosph/DVMcHh7xzbaGJ1xRxT8wAcBOuO0e53JwPCHQscZi/FI61HtSyIoIBSWS0Xb12A9PcDlVoghwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425184; c=relaxed/simple;
	bh=I67VC/gNY4kHE+svCnNw4PCoBcF9qC5mK1lQvEAVgpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5eMjj8jJmSQb02SIFpzJ0N4heRicNNSO3gPGZOZeweJNUWQoj7o/RoIk8cc9zXxrpo8KaRInoZNSqQ9NJM37ZhOUuitJ1tfYPttQPhAquPOb7iYLZJ/D5h8J6p1WdnKunEjJfhJshC65WjC48PCnGgWK2GIMaIwywZMFIAYYJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9HO1M7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kOAk19S1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9HO1M7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kOAk19S1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEcjt8615535
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zWxLXLsdWznvcrvfCxX1Ci+cwsfTdfGwDo+TIIWlD4=; b=c9HO1M7dfbR7kVCm
	nJJK/A2Lg55Ulld2VGFo9LMLB8gLsZct9r8pZa/8BoNj0sR0qUyisXtH3iTQZZnL
	03g5Ztw1wcJWy+t+5h3IpQ2D3jTQYj7EnkpI3gBl0K+Iovq7e8JTZ3mggGIlpyWY
	SPecu84c5IhgNuL1yIVL/LSKLmRVF1Cny0Xfls+QueFPhfJopVb8pgaOod1hXZHH
	TIiPe/SR/ZdOz4TUU9DfVr/a9v8tV0dWZv37XnpcEJluAd48LWVy51vB9AGqHPZ0
	bdqHqBjqDrwNXXtrduQ1KBYonhSDmK/9tkNyG5w5GUm81UYZzFUAIlXCoZ49K1e7
	Hpye6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8j7r900-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so43624751cf.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785425180; x=1786029980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zWxLXLsdWznvcrvfCxX1Ci+cwsfTdfGwDo+TIIWlD4=;
        b=kOAk19S13qfjFAbe8GQdSMp6a7qqBbzaRql/XeYwHFbVbjwoBIlNeKZmh1xUuNDu2i
         Qdx/2Tte8Bz7DMk0jyiC+peOVtIhcQzFmb9EEnaGp9ZaGBHm+jbJkwbXfdtTIH5iJuk7
         ANUrWVjf9uniwuj9vWaS0ArdofoypDPJhifXe0l4Vesm9poTv2/W1YaJ8tt3x0dngAe6
         mywkthHQYu3tmp6NqB4qeUQRv3M/BlgX7d/iMWfY8W/pH6dHCen5kM/Vu6l+C1XLHvzA
         fyzQOGrlrbbdPMLirJ51jGbnRLIY9AX98VSqRZ85x5GBFduHENq1pBKN0/loP5CfnvYJ
         RkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425180; x=1786029980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zWxLXLsdWznvcrvfCxX1Ci+cwsfTdfGwDo+TIIWlD4=;
        b=j1zcOD4Oi4YRnxc+ohykezp3Ii+aiHkr/3OL7I/oU99IxQASxosHnyzSSPNgFIkgOE
         slN1Ui6fWT8swlcS8dxIrEvnxYJR1y/sphpJsqQI/FftVU1epuEstyKYvQadk7PyXZFu
         fCE0axH798blmnlCYs0qzEIz2XEaGL/lZyVPoSxyIunLTsRwCeRJD7cZrUZj1sKJGfRd
         zO8M5qG+otWwavWjvsZmb9tvgfTzRAitPbK23agflbuWzrpmwLb8nLMuB6nI0m6AagwF
         smXGDknrKItY5AvT/urqwJybXHjo8vBAudES1VfXgM4i6AFqLOWE30jo/a4o6J8Eedbt
         sJFw==
X-Gm-Message-State: AOJu0YxkMxBfE438wgwT5E4Qyib0bklXKGCZ7HS1P4q6PKuBUTNIR2BE
	TMzdw7wMyPxdOIU/P643en70AAuqiOPIGz3/OfJn+e9nXGZRSu3suF5482ekxHz5i7fVT9mQ1p0
	7r2r9eCb/+tm2+hl6PVvNZX7tjlsGPgShoYZu8hyX0ETN+LIuy072HoevbTnYso7S/A==
X-Gm-Gg: AR+sD115XmaZ6BwLt5/QCHVkWPp5+Vz1dTgScnZwaIKEK+FXbrgpxUis4RFl7H9WK6j
	EwZ0Ne4tKlhwZmuxX7yLKm3kKAK+00fFfWqKrzFrSZo1CqhRpXhix4mvDpaUu5cc/aLhw2uWg+r
	Xr95jfCu72smtYizCtiugYzWVzzutaG51JqGKOd2i+YwhjkTSDxm1yPmoJmitO4BxPQObseqgcu
	whR7e5glQ9a17zjtQQyyNqgKZwrWbAGctoWG4pKU43VekyxV7BAc5A/7dp34GSrdsbTvpXTK+uW
	HBtpf0LazkpCxf2hsJWQSyJF7Xx89nV++mwxqt6e/p+lPyXPA8EkGrvWbIXey6gMFPs767/dkyl
	olhA4GbBF5f/u4YxHXpWcgTsYvMH7xknC1s9ubFmw4O+L1nGmVVEtk5lQXJdhpu0hE/FbOW3JI4
	UZwuAiz/OH2ZUDLA==
X-Received: by 2002:ac8:5d90:0:b0:528:2e9:c0e8 with SMTP id d75a77b69052e-52b3873ff8emr32335951cf.79.1785425180321;
        Thu, 30 Jul 2026 08:26:20 -0700 (PDT)
X-Received: by 2002:ac8:5d90:0:b0:528:2e9:c0e8 with SMTP id d75a77b69052e-52b3873ff8emr32335531cf.79.1785425179809;
        Thu, 30 Jul 2026 08:26:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ed57asm443160e87.69.2026.07.30.08.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:26:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:26:10 +0300
Subject: [PATCH 3/5] media: iris: guard against a NULL hfi_sys_ops in the
 interrupt handler
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-fixes-v1-3-413d6cfaa8ca@oss.qualcomm.com>
References: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
In-Reply-To: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=I67VC/gNY4kHE+svCnNw4PCoBcF9qC5mK1lQvEAVgpk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa20SrDvstLbw7Mf9CxtJErd/Oh65L+TfXTq0W
 egaO4kEU0WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamttEgAKCRCLPIo+Aiko
 1d1OB/9oegYLMgquODc4uGEhDiGnKCNPlYqZnWKy+/DJmdjqRQn+jzTwou+/AF7pLt7YsjSjPZq
 w5+dzlGMn8mZoMzu3p+jK3pyIMNdmpP4idsc/v3TE8ssFofKqdY7h8/2QkgoztxEgQdWIUErGDl
 PSfh0So7kwaUEojlFbrml7/YSWA/337Vyt3Th3ZV+O9x2jOfwFRlct56JaIhLAOIlm9Hk5u0JJR
 icUSkXN6NEoJZ0qM99DmLZb2a2TNaiZykvI+LfRMgklbCyF8uKIJq0i3CaMm+ziUp70xsGosxHS
 pqBZNpZv/HwfESkPJ3ODjgI+o41DE/pMSyvm04oeOfmcpcre
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX+y8i3dQc/YBG
 DaThGboVqeyPrAsPcWY/yj05yXFr0ZumjRKj9NGTUzEo4mNI8epfrPt52pJnoZ0F1TIV/5OsMrR
 1TNl85WDEn7BhThsb7UjlFGeLlWpKj9kennkMtTdDtwSBk3c5wKv0oAzkEfGLq9yvkyp+WLlbeK
 5UYm+fU0jHRyTXa/4IBG3STcsk7rw5eoAE/GbrfDRQRVsy/tBK5oGcw+ng+vdjCsFtvrR0gwyzG
 k5L7qmHG7wNoOLR7wkPdjV7+o1vkx6B9bE+ZP4XsTvN4YOEWKzz+g62FanNRu0ZaxUocXHvo4yg
 1ISbDpbmC+R7Jls0wFPGxVxg8sG93iQRd2PhhU8vGIEhvrYugSd77nC27rr9Cx1rQx8EEiO7wlT
 cVaSsoVO3x0CWldNkaYRmEKyfLmUxfadUyRiPJRWyrrr1yzXeCewK085M9CS24bjDax8oZ1BbOx
 G+7zGz9s6Ubl6m8vSyg==
X-Proofpoint-GUID: Ub3BVfESACIODePqQDXUIZd2hX4SfHoi
X-Proofpoint-ORIG-GUID: Ub3BVfESACIODePqQDXUIZd2hX4SfHoi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfXzocCOrIPHgTV
 wxxVOJeiZQTrMQqZQNwOqlIOMbPPE7Up0xRhJWe91hG2ys4ysdLRvJMIKdKGjlBp6oOB1PYNlBL
 Lt0PlMIbGREIQP3Ome48eI6Hziv44js=
X-Authority-Analysis: v=2.4 cv=LraiDHdc c=1 sm=1 tr=0 ts=6a6b6d1d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gNVOA7K2X4zeF1vqfc8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300117

core->hfi_sys_ops is populated only during core bring-up, once the
firmware generation has been detected. iris_vpu_power_on() enables
interrupts earlier than that, so an interrupt (for instance a spurious
one) that fires in this window makes iris_hfi_isr_handler()
unconditionally dereference a NULL core->hfi_sys_ops and panic.

Skip the response handler when hfi_sys_ops has not been set up yet; the
interrupt is still acknowledged and the line re-enabled.

Fixes: d8a6a63372b8 ("media: qcom: iris: merge hfi_response_ops and hfi_command_ops")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..36fcac4b40f1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -109,7 +109,9 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 	iris_vpu_clear_interrupt(core);
 	mutex_unlock(&core->lock);
 
-	core->hfi_sys_ops->sys_hfi_response_handler(core);
+	/* An early (e.g. spurious) interrupt can arrive before hfi_sys_ops is set. */
+	if (core->hfi_sys_ops)
+		core->hfi_sys_ops->sys_hfi_response_handler(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
 		enable_irq(irq);

-- 
2.47.3

