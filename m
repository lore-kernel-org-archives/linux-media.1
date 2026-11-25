Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597757;
	b=LK4+d530+AJnMRgxL8PE/GAtKlrjns8rRUdSI642PPd7o2m3JUxSdZHGpEGRjmAZkQMZ
	 txQHHOrNlg1ecwMMT2kGFTC2AkdD2h0zVro7JRNxQ//TBh8AcKKghE+Xkxo8NhuEApbNR
	 w4HnZnjsEG/4xwMpGS9FIk0jqVmWLrBAYy5evX+SVuwSY8g9a0gajZED3Yz87wInpHgBX
	 o3kMH6GxRyYYKsCLJasG6uUl3SaDlOIILrua7+wPYW78aRZJ/TxQBKEOtzeVzA4mfbE3Y
	 j8s/0o9f8U7dWXaI00yDKsz+1uR+YFFF57Ys0rOzkhecAUBEO8FuRdQAOIPf11usvlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VTGamPuekzux5hFeH9dv3N/BCyf5kNpAzusBnN/5ynE=;
	b=DpJkSzOa6HI769u5wLY9zKUl0SVW97I1N0hhN/AS16Cmoh0dFL4tqqs9G6nF/YyO3mLi
	 WD/VjbJu2Vk3Iug3YOs0SoR/RenLtjmMvlTnvGNPw3bYepRx7+zzMoW4E7TCdrEHZrg7j
	 6ViRCPVFvQm6j/WUecD2OFZEbfkdRLJ95f8Xyiwr9hZ1VSlAWs6qTwhOpef7nV9lpWsAS
	 yBy6ei0y6n4kiMA/NcaLDvEzug0lum5uk9dwwEzrgPGBVoeuArAVfi+09CTCnezkl8PU4
	 p4LUPRKjEGLAyUV/Qnat4m8o71WJt20/1K+r0HFIUUrQhS++miKRqo5gGU5mLaCVNiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ptgPhzTf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESFkDNQ9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FF9606A326
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54FF9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ptgPhzTf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESFkDNQ9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68dS73142874
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VTGamPuekzux5hFeH9dv3N/BCyf5kNpAzusBnN/5ynE=; b=ptgPhzTfBdA1WjiH
	Pk945kJFPGKY8t6fLHQqZOj09ia1wvJSzsW5kcyGjotfcl6fiqXUFlNPxGLtONLF
	fFvyTm0X0idOFkYXlj4CIYoSBd17G7Rwis0dk+mhvefrZSd6kqaE35/0hDYkjH68
	9RF57mbM1DNTexFowjXSOkGnXX66vZb1HJ2PvCk9Pu/DJeWXXgWr37mAP6riv58O
	+eF4n6bOcHRu3qzzilOX8xtpRHLpqGfPPwRgdDm+qDZopN99V0AbUcidzuFaRJjE
	WPnUScolK+TP7oXLVLgICnvhCnUMpu6Sn7Oc3c0h3tZTniOvtqX1EOhgzJMmeHCS
	StKXuQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc29ywy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:09:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so5884031eec.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 01:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597755; x=1796202555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTGamPuekzux5hFeH9dv3N/BCyf5kNpAzusBnN/5ynE=;
        b=ESFkDNQ9cjD1XCVsbdlfRhUrO9Q6bAjhcAlQqjzNC33mUNe9/b/ov/MoV1AUQzMR9V
         eYhBDv/MQ1qUEnZBpuR5XEX+9LVpjMCeowsLyKt/iin0Q1tjFB9eS33SpebazQC7z4AO
         PYqBV8Y8BBT4Uj5dmPuBDCtJT/8uVz7UqI8JMb5KSCrIWRbC581Dm2lLa5cj7JYWVYRb
         ruunTpIZqzB4cVNu7w2aUmQ8lUEKrNmxqTiemgSfRKDZZKw7E5ZEjQKwFVkdmagin6De
         klng5DChSOWsEkcpqRcowiKM5cpi0p1kW54Ys3pOJJ32EQ1aHppck36N3yWiDqtFnjgS
         yLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597755; x=1796202555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTGamPuekzux5hFeH9dv3N/BCyf5kNpAzusBnN/5ynE=;
        b=h9xbxUjq0bAh3PiaM/ZtH0rcNl0cEBUNdHK8yZAUqa7v93S5PyXJ7SVORDPgMBqukF
         Uw8hzLb4zPQgBQoSKaoB+n2DuMkuSJqdXQgQ11vwECkFW2x0Vrwknqh1H3GFh9Ho76a8
         opNfRMoihoWgFhIof8ZWMt3EmHZN0XpvG1o0SBfpECTrCgQ5kEn2JNcuHXEmKp/Yjbc7
         k5JOT3Oo2t6thd622jqRhaM64b9LD7iRCn6nd4hQ6b6/OrgvhcJ7TZPSpcgeU1H/qnFK
         TIE7D03xZ4Fwdr2fFt2RrBJUz3yUgYHLHuKa+B50+KhzmjewkC+9AMJP2DyjwnsKkYQi
         fnZg==
X-Forwarded-Encrypted: i=1; AL+hErHZTzX3G/Y0wnOk5eONSjT5SV7ADN68JN9ifg3T64lZ0pVdGMCVWDJ4i+VAy3TJiOYuIRIJarAF7dzPEA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9JDvtAEjMcpYqAgq2WUxI8dnz8md17fFv+McTJeyyiqosqLwrp
	B7Cp76LmVRVS4j4oY7Tjy8yt032e2ZTpNPWBIt7IHZz2G/rYCnqYrucsHdkyyRZUG32y+FnoBUz
	Uu0/aY1VFs3+uF8N8wh/Xa0gusrN25tD0VWy66f6pcJAPRkXidC9h8EJp1XbikEAOpw==
X-Gm-Gg: AZFdTZe/D1tMkRQKdpa7ccST91Szs30oqAoVFikzReciZu+RT7NbXHNeL3koPLowmJ7
	bx/E69AbiZ4xm3aqk461HBCn1mzVZseqwnjMIKayU3/KTxO6iNpBT7pJ1M0QBPY68hu7iCRu6ZQ
	4Y41L8+tfTTlZCfPvnaTHt9HtytbKEwUemRid2Kqydd4KYu1eJQw3WLw6Lv+5vK62a3bywWPeTJ
	sBBSEW8YnPIgotp2CBnIxnpdbNhuNnqZCli790Wye03ImdGr8IwAlMdwHPQtrOjaurbqsAqkDzu
	m1NqDJquw02zw3I0MfDwXjMqEQ5GXeWYv3exVI3dZO4Ax5/Aem0/WDUBC6+5R3ZgT4amm8foysT
	N81LOSJ4p6vK16PvAhwRIZD7ARlScMAk93htWNnEfm9YHCPI1hVRyrSZR76Pn+rNaIjGMEW2TS0
	WfFDFFjw==
X-Received: by 2002:a05:701b:2810:b0:159:f192:5290 with SMTP id a92af1059eb24-1b5524b591cmr16136810c88.13.1795597754981;
        Wed, 25 Nov 2026 01:09:14 -0800 (PST)
X-Received: by 2002:a05:701b:2810:b0:159:f192:5290 with SMTP id a92af1059eb24-1b5524b591cmr16136787c88.13.1795597754388;
        Wed, 25 Nov 2026 01:09:14 -0800 (PST)
Received: from [10.204.100.88] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm39505827c88.3.2026.11.25.01.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:09:13 -0800 (PST)
Message-ID: <8d988822-aa70-402c-bf87-83a4403136f3@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:39:07 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix deadlock in iris_pm_suspend() with
 threaded IRQ handler
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20261124-disable_irq_fix-v1-1-d27f44f7eacf@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261124-disable_irq_fix-v1-1-d27f44f7eacf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06a5bc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Wii44K86_fOECA-UWJUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: aUtgpOoUntQe1piuhDOEtomhZca5g2--
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfXxi650O4VNoZD
 /nAK2IiCVCXuVhl6ehxsMxBP1ybvLGao5PBr2y88JB5K+6XdsRrviSx9wYUULZS2WkOax61B42t
 fpasolvwoUWIste9aoUTUzXxii8jmSNw3MQvrpoZbL5JHBfHLK+NatgnbTZS1nKgqjK3BFlnxXH
 9SbOEAMbubM3VnPojG2p2Jh/SAh1VhEi48ZCajvsvLeKWEB8O5nEAzEA47IZbULLxLlYrr+MCFw
 BieSSBU4IUPDOOtERKbeo6p4/PA/yJS5m1X6+XaNdVPxJ0EPnMdwzXSvTaKc3m3Qiy9d+aBk59d
 V7RAra/K92McZw2qzdfDbeMSCsZtGGRT7Q91Wqg5lh/xfUoNgs52Vg6SWFRSz9CZBt+qC1gFHxi
 Ec81+/xvTuxpktbPBg2prvvopPapcjEGro3Kl3rIdhLyX2pMJ5LysfrD9jhP2StSYbNIpcflcO5
 ZrL56BorKh5e6sEkReQ==
X-Proofpoint-ORIG-GUID: aUtgpOoUntQe1piuhDOEtomhZca5g2--
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX6czRb2xRzYVf
 Dic2rP5fpEqXSpS14opsGkZXSwHj7ATW3eGblYg7NGWH1cBlc62O3VFxAGV5lsl6I8/3AUmadVU
 W5JMuMjT4dO3rMDWCPCXEBxjbi/2Rpg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250036



On 11/24/2026 1:30 PM, Wangao Wang wrote:
> Commit b9c2215bdedc ("media: qcom: iris: use disable_irq() during
> power-off") replaced disable_irq_nosync() with disable_irq() in
> iris_vpu_power_off() to ensure the threaded IRQ handler completes
> before the VPU is powered down.
> 
> However, this introduced a deadlock. iris_pm_suspend() holds core->lock
> across the entire suspend sequence, and iris_hfi_isr_handler() must
> acquire the same lock before it can complete. Since disable_irq() blocks
> until the threaded handler finishes, the two contexts wait on each other
> indefinitely:
> 
>    kworker (pm_runtime_work)         iris_hfi_isr_handler (kthread)
>    -------------------------         ------------------------------
>    mutex_lock(&core->lock)
>      iris_hfi_pm_suspend()
>        iris_vpu_power_off()
>          disable_irq()                 mutex_lock(&core->lock)
>            __synchronize_irq()         [blocked: core->lock held
>              schedule()                 by kworker]
>              [blocked: waiting
>                for handler to finish]
> 
> This manifests as a hung task with kworker stuck in D state:
> 
>    INFO: task kworker/u33:8:178 blocked for more than 122 seconds.
>    Call trace:
>      __synchronize_irq+0xb8/0xf8
>      disable_irq+0x60/0x88
>      iris_vpu_power_off+0x6c/0xb0 [qcom_iris]
>      iris_hfi_pm_suspend+0x44/0xa0 [qcom_iris]
>      iris_pm_suspend+0x6c/0xa0 [qcom_iris]
>      pm_generic_runtime_suspend+0x38/0x80
>      rpm_suspend+0xec/0x6b8
>      pm_runtime_work+0x118/0x128

This is fixed with, pls apply the same for your issue.

https://lore.kernel.org/all/3d04aa51-7301-4d8b-93d4-1a7d28e6c614@oss.qualcomm.com/
