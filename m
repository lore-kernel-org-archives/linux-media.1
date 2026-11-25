Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586823;
	b=X/BnGsBHNolnOtBy4v7E0P0HOlNvRza0XMJAzpHk9zHUlnbHHr960PpQuPxgLglM2gFj
	 IbryhxpKZzd2SWrihFmJ52ozpBSzo7f/nnfTlfy4WHe/vxinuX9bjMX1Ue7DA4TZ1iVL+
	 EUvGhcB9YFcz7Vh4C6SnSMz4TBn2BN320zjQn0Wa6ndk/RueRSN4qwdwJn6HFgaTqjmPw
	 GdrKhwZ763Osjl1LRQ/v6jZb8D0V81eCMv1+9gh9Tn0wk0EImC4R5zocNkluLG10ZWNWo
	 +u76Twz/z1OBBbNwOIdmABGSEzWsYfMKU+Mnq8IXIasKkI59KDqacsu54MEJEtNszTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Cc:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S/j/fokvVKGClygxW4zKgxB1rxF0i22APYl8+ucIMeU=;
	b=pHxNQ7J8YSZsCwFyD+lyTx6yRmTFnV97OY1VsupRTNuEKYwy6ciyxOg6FelA8JvwTBxu
	 gjnnCz5eSLhrCS5VUBC6vXAvF8dAEb9i/16djgJI+CdwLuxWdthzgNtvLIRAKjCzqamYC
	 a/gjHgx0KMHIAkWNBMQo5YZIbn4+80rWqYRjuMvyFst4jX4tY9qSyQQHzD45VU+roIUnZ
	 edsx0A1NaZiyjQUx1tjNZXoZGOpX4/h9VrSyTpQno20CiHXm1Nq1E1vfE60O2oNu91QmA
	 YEShfJIbG9KObyMQQLbML0sgeUX71ru4vrgZincaBFxL5zKa1RPmllLvzSY8XpT2zLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=el3yKmm8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e0sMkvGd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3653606A32C
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3653606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=el3yKmm8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e0sMkvGd
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2BREV3112080
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/j/fokvVKGClygxW4zKgxB1rxF0i22APYl8+ucIMeU=; b=el3yKmm8H366C4vQ
	rbSTnJzefuOqwWPVz5gQaLQhXIKkLk3c0+5JKspHcJoYLuTCB/NBQbYvQn4+0/6t
	BSF1A0V1niV45qBCBmOu5K8Npg/MDQ8HPQavJnSLmDpAC3LGxJxlvni819Go97qI
	CKs2NXaiCaBKP1ux3ylCV4YsthF99ql6WvNoGlSp90abEyeJmA93ag1W4x3B2234
	u79gpEjnr+6kO+dafaCmTooT/Rn2BR8ldaM53ka+mGE/n0BlIyJ0G8G7WyGALF4x
	LNMDgnAnFStmRmjpH5Ts7SVBVShtt1IMkIB2MjR1f2+H6GndQW8x8sBUsqoNdV3e
	jLLmyg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b803sj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:06:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f0291cc0f2so67927145ad.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 22:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795586815; x=1796191615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/j/fokvVKGClygxW4zKgxB1rxF0i22APYl8+ucIMeU=;
        b=e0sMkvGdF62FIMQTPgeATiDrrJ76NDm+eBbg+4knWqnRzIlrm9L2aXr429xsroNTDK
         jhJcdhqYLVZR9OUYlI+3BQSl6xI6BlcTXKCSLrjHPE7xYtmAWfMNlOes5S41mdBJljIJ
         83LPwEK6Wgdh5dOGTpJLSWBv2SZpfkJ2hWr7WrWBtxD+J2ajFOmVPdPD9RT0Gj6rYgqf
         gN1U2juqhLxauMqBtHbRAPdcWAVbEFZukgFeK7PkJHRjPFo+ik6+oWODNjjMc4F6mF9T
         qYNtyePPbGoKZkwD+ocACFe9qhWzskWNpCGFf1xks0xvklmS+F99dK/eHv0ZkL+bBwtI
         qzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795586815; x=1796191615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/j/fokvVKGClygxW4zKgxB1rxF0i22APYl8+ucIMeU=;
        b=pMme6mHDbVF75/LI1i6Vw9q4NFQHlknHwl5t6ocsZHjXcuVXMO5sOXkpbrSulygHBv
         32Z0+uvwsFMx2t6UZKG1KeYgpcfK5cASSz52pr9wPDrEfsBQTk9jZx1CP35MoS/gLAHU
         yDDflVyi5VdzgU02IMx4PpFgOyv7adIpft8+Vt/5OMyuE4HNQxpKZ6lw4GxmvCPg8wYB
         5i+kIE9Vqjzt9rrljeDtTlyrQoTMdmNq5EzbgcKmmjkMWuq5ZBNpDneXy0ygl3JxHm9a
         fF4L6gNKcGKvlQ4QWPdOZkExBOghkMgJnymf8oKVXnrB+46EV97zUTIfFRExxHbfvjuP
         EbYg==
X-Forwarded-Encrypted: i=1; AL+hErH1eDyAINZdj1hx3sDKBU/r+AnqWLLRRhZluwW6WYCby6ZgCmHDdLt8bn5hbUDM+locbzowFKxpvLTaEA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Tob4tIjONQPVKM+iO1+VVHppP5J3znzEBvZgGvX7VCCeD/gZc
	XpgAlIx/E+DGIdUhxSFJPgC/YbJGk6w+r21TWEFhZgA7RSJJ4cGUA8Pu11oz5Z0bGXdQOJRtiXz
	pTv3ZZu/YiM5FUmENndgtXjGCZREQx7MXpsnfPtWf/jOP84RAv3/hVqjFQUNA7LJ77Q==
X-Gm-Gg: AZFdTZdH8B77U5HlxgV8uWs7Y/n2Y8WJyI4lrwggVq5HBe0lDDi7HEES2QaLUphIU6j
	+xKmgs/651YiPu96DWxtmjkO9MbTvqTLopM0RWF8AiPVvLCURJRCbd6ASpkYAS0PZmm/iGXLxDv
	e18P+LZQO2iDX0yjjx31U+gZ5LN0NPPCz8dYwJX2MxBfJ+8BhTvr/mnflusoGWF2BfBf9sn5TnG
	r66LKSyM6e6tfeKOTX+Vk5IPwTwzAOuHga+NhYxisEOZqdPBR8KyOfe8bWO1LQyahKFPKwEQd06
	h5bgcfsgCuXfX5wuLoYCjRO+CxsVfAKlYm1K/QgBXVtCqX2ZUI+ozCDE479TO9TgPJCxJCwapuF
	INgAC+cEdU8+1zHgpTms4t3FMTDXPGL1U3rgUyABwWyPbVsZmzGyNhcMXySi2Ax+TYDBFP/NRd6
	yeNLDb7+5yXgwInd4klVTP73BSFnxvI3M+jkPlzfzjUag=
X-Received: by 2002:a17:903:b4f:b0:2ed:3c61:bb83 with SMTP id d9443c01a7336-2f03f1cee2amr178125105ad.16.1795586814768;
        Tue, 24 Nov 2026 22:06:54 -0800 (PST)
X-Received: by 2002:a17:903:b4f:b0:2ed:3c61:bb83 with SMTP id d9443c01a7336-2f03f1cee2amr178124855ad.16.1795586814357;
        Tue, 24 Nov 2026 22:06:54 -0800 (PST)
Received: from [10.249.29.132] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c6e50sm79782845ad.13.2026.11.24.22.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 22:06:53 -0800 (PST)
Message-ID: <3d04aa51-7301-4d8b-93d4-1a7d28e6c614@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:06:47 +0800
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
Cc: wangao.wang@oss.qualcomm.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 0/3] media: qcom: iris: Fix IRQ synchronization during
 power-off
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMyBTYWx0ZWRfX/DmWNBGw//KS
 k9N6SelHnE7FEXmIFUcHbHIC6aorH+DFYxf9hdas+POtCu/+yulTyOpp+GxUzCSFOTJrliGRjLK
 mujKUnRDLLuUQayABREuVQBh5CqKcMQ38TN2kVZMfEMiYsDDVgAEFS9SDHvWNSjVmZ8yr6HMoaV
 ZDM6EqNpQNsDJBuYYTuWOfQayD+su//44Eodicq/l4MXoQT/Ja4iamFcuuyoHp4CD+OLzDVcrb+
 xUmF5qQN/Xgi7pcgblq6p2w2o092LK05V2L5Wqwo4VtHm49YlULXxHqpE/OYNkEB23AA2aRqSMM
 5fqm78sX3vfj7KMS6LJ0cIJkmTy09f9obV7kz334rvRjL2/KB+k1AjaGbN6MWCPfrIzb3YiCT44
 BMsGZ6J+DE9raGiOapwQtaQKos/2O52WcrJJ+del3L51v1h+pyuacpsLDT+H6pp5IlagGGB1a40
 MY0PcuBCOJgbTrTLCZg==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b067aff cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=F58wanNFIcC05fkyUe0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: M_SlOniUSYtOWJIi_SNW0dxwXeUpC9TD
X-Proofpoint-GUID: M_SlOniUSYtOWJIi_SNW0dxwXeUpC9TD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMyBTYWx0ZWRfX2tm57mIWAMRi
 HMRYjm0gCQusOnZWm9Ww4hoC5RTWRFkO0ISFqJlpOOloOnsey22H6vPEtF36jcUCLAjwOqG4YKO
 ZWq9biffAisPPcFqSvPxmPou82Cpoyw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250023

On 2026/11/20 15:42, Vishnu Reddy wrote:
> Commit b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during
> power-off") changed the VPU power-off sequence to use disable_irq()
> instead of disable_irq_nosync(). This was intended to stop a queued
> threaded IRQ handler from accessing the hardware after power-off.
> 
> However, iris_vpu_power_off() is called with core->lock held, and the
> threaded IRQ handler (iris_hfi_isr_handler()) takes this same lock. If
> the handler is queued when power-off begins, disable_irq() blocks
> waiting for the handler, while the handler blocks waiting for
> core->lock. This results in a deadlock.
> 
> This series reverts the commit that introduced the deadlock and fixes
> the IRQ handling around power-off. It keeps the IRQ disable depth
> balanced across power-off and power-on, and makes sure a handler queued
> around power-off does not access the registers of powered-off hardware.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v3:
> - Used IRQF_ONESHOT and dropped the manual IRQ disable/enable (Bryan)
> - Avoided the irq_disabling flag, waitqueue and unlock of core->lock during power-off
> - Skipped the register access once the hardware is powered off
> - Link to v2: https://patch.msgid.link/20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com
> 
> Changes in v2:
> - Added new patch to handle the irq depth
> - Link to v1: https://patch.msgid.link/20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com
> 
> ---
> Vishnu Reddy (3):
>        Revert "media: qcom: iris: use disable_irq() during power-off"
>        media: qcom: iris: Fix IRQ disable depth imbalance on watchdog interrupt
>        media: qcom: iris: Skip register access in IRQ handler after power-off
> 
>   drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
>   drivers/media/platform/qcom/iris/iris_hfi_common.c | 20 ++++++++++----------
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 -
>   drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++--
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  9 +++++++--
>   5 files changed, 24 insertions(+), 15 deletions(-)
> ---
> base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
> change-id: 20261004-fix-disable-irq-safely-15b2f712800b
> 
> Best regards,
> --
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

-- 
Best Regards,
Wangao

