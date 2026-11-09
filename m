Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196954;
	b=zuclvZir7uSgXG5C2daRimc38ZvaBt0opIBu3r4Gv7Fdz47qo4EqNvyOPGvmZRnxjtCC
	 YCjsV9Kr+HJoUOW6GFYLm3qUlwUZ3iWD+d72oQL9Rd7588Wh07j7Uq8I3Kga0Y5afVZ4m
	 9yJA+Q3//Jg/ispsU7PzRaak8I2Mv4vi14cRbKBZo8wK2ctkNxiF4LQXf5Q7sxKILyai8
	 n5hgtmCzvRbeSrryVGmBkO8I+gOaEs+YD+iz0EUGXaOc/3lb4KYhyLgTJD4ZQViOg4pbh
	 9U3XD7JauGSX3d7R8LPj28iFiXDuJjdiUC3VxSCjHUD7PvqHrJUS9vvva0T0FSs4L1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2rnCegKRImApbMspRVuqqVxA57iJ7+ZRMWkhIp4OERQ=;
	b=iJDNLvrhyN6sd8/8kwKlQMdosMVXn3xb5y+/BWh61NI77R6kNuWbqa+BT5fU4MnGrPJE
	 3no6/N4AjfEMYDKp2qKYyxVLfsS2UFTuiPBqNAIlv1Y0u6Ha+zWwC2Tvq6fHXYB6H9LzO
	 3dDqWNl5tW9aw3qqr4Jh1nOFESw2XiM1Wy4ZJIaj4PUln/dJFu0auTfIqJ2tFcVJtxTvo
	 1R26jIeL7TDj/yjW4zedNNrUXMDSwjPwn7AdUDa6WKEkACvR4C5yApmzlKdnHY9Tfcd7y
	 UPH6qd/7XHFwRnuxSVQ3GeUvJcF7P1KWcyZMda5AE+26d4YmV7mfgC8gN0cT9mNH0rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDOiTAdm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZwU4uHIJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA39E606A331
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 04:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA39E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDOiTAdm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZwU4uHIJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93KDI82309618
	for <linux-media@vger.kernel.org>; Mon, 9 Nov 2026 04:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2rnCegKRImApbMspRVuqqVxA57iJ7+ZRMWkhIp4OERQ=; b=pDOiTAdmr9cXisFc
	CXuOhoe5qaukEZgNK66jbOkle9aT1U1h4l2Ay2IvDH2NnK3zcdoi3Iv471yhaPAB
	RrqBjafzB0ddn/FVUfMLakALSpAZlbs/HgpZQSTKwpsoU1iLZTBf3AB9ZwnVzQFg
	tryyKmlp9JMx9Zczg2B24TDTK5fSWlq8BzAbElL+Jy33MmP+ImFb8Rwg3LrMzDjV
	gKCBYRBE7Yllg312MdeuzHX2E9+4DFeYB+ipaXZSyFow/a78+3wcP9ZONA15tCyl
	XRlRph99CPXWbMmRv3dzKeigsrPmn6ZB6D1pF0tGZWVgUQ4N3alpZ5u+Y71QRFds
	52pwKA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99md3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 04:02:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36fa5673fccso2419176eec.1
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 20:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794196951; x=1794801751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rnCegKRImApbMspRVuqqVxA57iJ7+ZRMWkhIp4OERQ=;
        b=ZwU4uHIJNiPy+lL5JIKl3QKEjV1BS/cuG9QGrGLUHw5Cs7aSVa/g1Y+CgoAjkTwv/L
         Cv2sDk9reYEAMC60TdTgiksf5cvoHt3zM0sCg0RKEl46OHCHUXtTzJUO+KNngX5LWmKq
         BLRPmWarL14GdOcbYqfVw04eLhumOoiXSPxZPaUCL/i7ALSg66zNrlcDu+y77bxwk8Xv
         Lp53yK36IsNjWmlUyjcasqvjbIIOeUL/cbduPyNMW2J7JgHBBHwZdoD5g1Lz754pR39M
         vC1OF3li/sTsa1pPA9DYzYByhLYA3wHhoQyF/L6Gh+YVHYmcjdkc8Ae1oBhPg2CDdnpx
         ZCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196951; x=1794801751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rnCegKRImApbMspRVuqqVxA57iJ7+ZRMWkhIp4OERQ=;
        b=R+pE9HXiOzMPDlyCxw52iaxIOVkv/vDFH6g6zGmxJXQ2+kwnzMHV6lRn70axTnri2c
         HimaGRObSlaoRRr/KQFIiRUm6q8iIotTlQBZM8BnRDiiGbhx82M8+qV2UyLs+/JrV4CE
         aA+xAbRZvB12fMeBMYc7O8E4/OgjsKIeiFGq1jb50dORwWstSg5rKpsIJwJQ0U8cYSU5
         VpuyWRtpnDjVyRC5Om8p6yuAmeU8xddwYa9oxj9oxiqK1pkgYfl7z08PUEjN8qiB4WKy
         12Ax9V5nth3Av4S/D7d2wRG6tA9OgnKfwyh61CYeIy/tDs+jN+vLo2WWKP/RTit1/jYL
         +Gjw==
X-Forwarded-Encrypted: i=1; AL+hErFojQ6EHKwfrP9/7c5C/g4GoNl7KZGsMj341OBvv2h/iCNMePidoochSlPlZY9ro3gwv/zC5icZ9y+4MA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ewLm3otoLFyXlt6bIKpD8A/+UByV4BLWOr37eSE8/jH7w5xX5
	EokA9jOgzyWM6s2bwBC1BrXTmMIGKCCySo3h3hVLo0swPN6IcTDbWxXdButxHr+pNMTezGRWFts
	FQXtg/Dfw4gBg3+51BD02qd/55BrJrrRTrxb8OgiEAebwia7b6teyCUycrPVztr7Dtw==
X-Gm-Gg: AYBFou3LrzPXC/urWZaUjdxrpmq6Fphb8ew0zVZbLEWrAZyfjAYHC66NisPT891MbhI
	UwWklqeyFErYg+tTsZlpKMtnYWOjH5+Adoed+tbcTE+nz6r/mEKTZsx8nkFsfZlt+d8b5EvC+lY
	3DjrOFWVexPcm/vHZw/s5amjAxXokWyYoespZTyKSc9qztcxdMXqeGh8DS1L7qXwRLykrWhMFCD
	xftoeSwoogwdRz4ibbw6O12/mryK4w98Px8y5BXSaxC0lZ4J9lee0IGGwIf9+35xTnF8UGyqVmO
	c0jJwXAG78lJ4JDI0D/oac0Bd2+ieDZXctRxwtglPeoLC28bX3MtMm7Z/laRSsR+jj3Sp+GmQoN
	lHVEVUc11jO5EbrTs+QU5GCTA2udTP9CfYO3mABEUFnqOPcz4wPEoPOejNdtuwZ5kJtNNhshx5u
	a2sjE=
X-Received: by 2002:a05:693c:62cc:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3725e829ec5mr5087170eec.30.1794196950913;
        Sun, 08 Nov 2026 20:02:30 -0800 (PST)
X-Received: by 2002:a05:693c:62cc:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3725e829ec5mr5087127eec.30.1794196950284;
        Sun, 08 Nov 2026 20:02:30 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff3415sm8823911eec.18.2026.11.08.20.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 20:02:29 -0800 (PST)
Message-ID: <d7940676-abee-89d6-5e2f-3e2a2c5b70c5@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:32:23 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] media: qcom: iris: Wait for threaded IRQ completion
 during power-off
To: Joonhoe Kim <26rote@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Birk Skyum
 <birk.skyum@pm.me>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
 <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
 <20261102220526.1755-1-26rote@gmail.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261102220526.1755-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AjJgu8vFrbEnv3vL_NN9jnVv8avROd6w
X-Proofpoint-GUID: AjJgu8vFrbEnv3vL_NN9jnVv8avROd6w
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af145d7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=btcJMxBC3-se3phSy3gA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAxNSBTYWx0ZWRfX/21YyibvQ+WF
 TGaUeZ5vm/PEmhaiILVihIKKmWGzxmJxtKjB4iwcZDUTSYfNmgW5mEYRPAZoAozStbKMbP1j993
 OHY97GVK+UOtpPgmPmpmFpjLwEH+NtBgUMO4JlOzeZlWbal4xyMOh/4BnXSCtO7R2k68ITNvUf3
 EFcAswaNq6CsGIjGX+jthC2C1wcBRpUQsXZz+n+hgRL0ct029uWt6+oU3iqQxD+A3rbrWIHZeOT
 IufmKNLLThEmtYZODE6NRuE39J7ygs55xMlNHEHtddxKTDiB72I9pgQs+7YywMvqL15spwMvhYK
 iRofIiAkuz1CNN5MlujF3lU2p1zlsUMZMDhyIBcVBx7hZJVHWMVC4qr3FexEZxRjcECo3X27/Wb
 trv9GZ/HfwCPaMPMzrSjfon5oFUUf/chDa1iYOpVlbP23yjwuTY13mjhPNOvNhkdyqVR+wejjh0
 CJOOU9WR10UbokqfG8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAxNSBTYWx0ZWRfX+eV2oLxANd2+
 4j8eF1ntluryOeJXHR/dSQqdvCPCZQxq8iLLrcvU6Jjzh6sEIhOm0srPJpCtbiTU5p8DFNhFbO6
 sh6BU7JhYYqjWbwIzkur9Ii74ut+y24=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090015


On 11/3/2026 3:35 AM, Joonhoe Kim wrote:
> Hi Vishnu,
>
> Without the series, I hit the same deadlock on a Lenovo Y700 Gen 5
> (TB323FU, Kaanapali, v7.3-rc). It happened when removing the module
> right after a decode session. rmmod waited in __synchronize_irq(),
> and the iris IRQ thread in iris_hfi_isr_handler() waited for
> core->lock. A loop of decode, rmmod and modprobe reproduced it in
> round 4 of 20.
>
> With both patches on v7.3 and out-of-tree Kaanapali support, the same
> loop passed 60 of 60 rounds. 2/2 needed context changes only. H.264,
> HEVC and VP9 decodes still matched software decoding.
>
> Tested-by: Joonhoe Kim <26rote@gmail.com> # Kaanapali
>
> One question. While core->lock is dropped around disable_irq(), some
> callers take core->lock directly rather than through
> iris_acquire_core_lock(): iris_hfi_queue_cmd_write(),
> iris_set_clocks() and iris_set_interconnects(). These are not held off
> by irq_disabling. Also, in iris_core_deinit() the firmware is already
> unloaded at that point, while core->state is still IRIS_CORE_INIT. Is
> that window meant to be safe?

Thank you for testing this on Kaanapali.

core->lock is dropped around disable_irq(), and all power-down steps run after
it is retaken, so the hardware is still powered on and queue memory stays valid
throughout. A command queued after the firmware unload in iris_core_deinit() is
dropped. I didn't see any problem there.

>
> Thanks,
> Joonhoe Kim
