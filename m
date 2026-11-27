Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788001;
	b=ip5fX/9Bo+C4HXFGpGTqQSE8ZOcb/mB7mXlSunn+465VUoEsqg+Pz4T9Uj2iXK28lXvK
	 G1Zj9F035s26JAzaj3y5N2UhVWRi8AZmCJ2oanSawQksjljuCcPfnaxTHE23Zvm6r4k8r
	 0fNc0t7yF4ZwPle03db1tmxisSXonL5P0BAhI0N/j+5tIxjzgnt0HuHg4jr7AuxGhuaGY
	 NYktJjB+53gPJxxqQuO4HQXtyCqw40hGGOLIL5rOUEmg+DG6GDpQ3V3N+GcAaaDU1Kmfz
	 ZFcd5iHCkDh2MtP+u6hFOAjfhQHEOuQ1oSz1XCCXBojnAL12g/fzh7WZQ3tJwhd9Gng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788001;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TVJ7FGwJvzojmK8u57f7Bta3j/u3dqWpXMiIY6IlGEU=;
	b=lCI1oPDXFdRp5oTsxKjlOo2tuRnQpbCcnZRiKto5IIaOqq0bRdb9uy5d4rrK5DHREqAS
	 fUp1V+IcgFC1SDeMhhYpy7B4h/mhpC5lAlzfSZDvghdiNxlrxS+8uk54Y9mqnl8K62QUY
	 JNIlHJfdwM2rjzOSfpJ0jKTFpORHaiU0d9NNCxm7l4RKHbYunW/l4dckbyVhEASm7iBG8
	 Aw3GSt0a8oEEBtid+8UnmToE+ME79ntmSf7QlZTF+n32o4T3KwYXZGUh+1Gl4xx8wRfY6
	 5ddCBjjG3gRqYa+uuTVGeebTz63TWwU91PrFlWaOOOcsKyauo9fR/taO0dBVylCWqcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m17uSs+h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ed7OU8m7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262A8606A32D
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 14:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 262A8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m17uSs+h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ed7OU8m7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARDtuma2460806
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 14:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVJ7FGwJvzojmK8u57f7Bta3j/u3dqWpXMiIY6IlGEU=; b=m17uSs+hA0uwBeDk
	n3jh1uZfvCrEpejAAyvlQ63wlxqQ5XKm8xdCHnd3XFmt45enERsJ99BwC/IlJMw2
	pylSEyf1DibOMz5GKQQC+Dkim/U06eg8hyFKM0gswpsYhSQX8yGmXlXrEOjclq2F
	YJ+InFFuUXy00Dv2ky05IsODF1m9ANOuFp/GJ0Y+nbuCzcvB73BWHrmxTj6V2wm2
	eWcxnecgKD/gP2bHYg5VRVBq4zeKgY7uuGGIXLSBuvdPSxWoFDtZzHkjymxnYnHr
	N8hkQxtCGGO76ws/8H30acpnjbHfLNzaFMMK6LT5eim115BRu/gCIkXwDvWBXKXs
	zYTDZg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gasqxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:59:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386b8624cf7so7166407eec.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787999; x=1796392799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TVJ7FGwJvzojmK8u57f7Bta3j/u3dqWpXMiIY6IlGEU=;
        b=Ed7OU8m7Ok1Ap60daYNVpX+Pvgb8EiMGxgN9mEvEBT6vdEsrNIDCNZlqKp3XIA90O9
         n0qAh1HDWwXp0RKIxA5h5VimOg1VKmqJh0uu29uOWvpER/NJaeRcTdQX/oit/ouQ7U+D
         tdBTYRVc61Ut1puD5INnbhWfOs/oL/uLbndPOCrogbNKmLfMz4LtAxm1HJ/l8TcGsKng
         /HvSfc4Wz0B5aBOG+fMko+qH/xZ42+C5Rr2ki/qlmE7Vv3uOVhmpIFuZlpe2SRNRX8PZ
         xd5g8vjenagAQuqYL0hhI8cG6dWOCzsWQH00k4VNnYdcERtMGs4sKMnlo+K+XD2nBvz5
         Rm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787999; x=1796392799;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVJ7FGwJvzojmK8u57f7Bta3j/u3dqWpXMiIY6IlGEU=;
        b=GWcSC7u4l3XYcYrcgdvlbsBxQxNopV2PGlY6n0L9XAkd2tNxHxTxfeM4nn4q7Neycz
         6+zN/6Qs9BJSHhutTueo1W04vWbCKFFS66NkSR7pr7lTHLKWzzGdaZ9a1ZuVessbraeG
         emHQhx9cMHkad/CqB9yPtZ4roM/B+KpevuNSpqxEuxMi6YdUEZbC3wMv9SYOB0xFrBWT
         EDoGo06FDoAnRLVIY3Q6bN5DMBWA5OBXgZKAVqn2QtrxXJj3xKWoVB4BHl845AefnZhD
         CV3kWtGy6fTAETVv8ijZZ/KFNZXpGnA2FfhIfyb3d6Akgdw5kDbOCdqKqR0ZqUe/AqiJ
         nB/A==
X-Forwarded-Encrypted: i=1; AL+hErHxbM7WEpVOgGOPzny+lY6IkmlpRqYtB6InglRpthoc8jHhOlX0FZRt9MAK1R3j7/lc0/6oIYn00yfpPw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8e6iI3weBNmvkK2eBcU7QcX+2kVINoTuYkddoDGlxp6NDu3jnI
	+tuT/NCR5JGBmZ64Vq/Jzfh13k65Wd30/qxk3QCsnyHjVpCJzmczlpwAXVaReD6yXShXQ+THxVs
	D9k5+kjHQF9CPqSzZ1g88sOrdqe6e3y1aqxc0cB1BpG/kPnhtvQfT1CoepujTQwzoXA==
X-Gm-Gg: AZFdTZfhGuuACeSXoTQu4WsbbwLBUX7BME8brVPm6nTZbiLAxY1w/2Ljy/+rhARggGC
	mMNMrZ+mrI0JEeeHqrMYAKArKvD/2aI6IaakpuFZKw2SVGrqdn6u7cSsdUei0hxhduDd9RTRO8w
	68P9Vd7gHOvojvfeFcSWh7PwHjHIOS36g6YOaVfw6hRw0gBz67UJ+TPvj9fnQyKCOYGGkoj+bD2
	9sIjiWPKp8Gnuqvf5f/uB8KaCblNCu2Kxlrvw0m7lJeRzK7NBcgZ3Y9/+IE4eSaZIQLUKCgzpKS
	V3vbHmvXKVYiwJNy+EcT8krvXEaw/esD+w0X5iehNZcv8kGNDMOxpnyK42UjCOKTDF6hX55L0/V
	cGFhEtiffdf0+oGHwxMjm8CAT+W6oRnoK+2abhTEZk50p+FQNy625+HckrGzIsmF8/utFW/oEFb
	tyKvnv
X-Received: by 2002:a05:7301:fe91:b0:386:e392:5031 with SMTP id 5a478bee46e88-386e3925531mr4757481eec.14.1795787998862;
        Fri, 27 Nov 2026 05:59:58 -0800 (PST)
X-Received: by 2002:a05:7301:fe91:b0:386:e392:5031 with SMTP id 5a478bee46e88-386e3925531mr4757444eec.14.1795787998322;
        Fri, 27 Nov 2026 05:59:58 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm64939202eec.8.2026.11.27.05.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:59:58 -0800 (PST)
Message-ID: <72ae56fc-41ea-4088-8daf-3d9535de97f9@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:29:49 +0530
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
Subject: Re: [PATCH v3 3/3] media: qcom: iris: Skip register access in IRQ
 handler after power-off
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
 <20261120-fix-disable-irq-safely-v3-3-82f9561394cb@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-3-82f9561394cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: --SM1pRSbjqj5Jrge-ULmLlNbig7TZo5
X-Proofpoint-GUID: --SM1pRSbjqj5Jrge-ULmLlNbig7TZo5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX+f33n/qCMl5X
 WbZ5E2nHPrpy/iTFBZ6jJbJbqayX96InPU5mNjIaivHqacLLTjB6NXYROIs9ObQAE8wfCqzoiEq
 lD9+uDokEPTsZhFzZtwNgNnHaTGyLAXSX/nO1MNHJpkdhHT2Efqf9gTKHuY4a9RbjESmF448P1h
 z2xZGPTxS5xGBEiobn4JTb5XxjB8ygf80niWsX0WM9Eq4AqrQZWlPEKZCjnXfWPcXbUte0yIa05
 YaP0DCmgDgi9V69oXQwZ529ahmtJJ7Lk9IK5oe9YrtIrC6ovFhJGHGS5WLbFUR8fsCCZIEbYWMP
 DzYd+7lqmR0zpXe25SI5M8/Z2rRd1sjPm1kpFim/VCXb3RASXtNZTDST+CTOwhAlobCeEN78cYX
 YQV0ZDqvt3GtRMDhF8m9l+pHuKTxyth+eVqoqU8c1IEc4eyTz3srnDWyt7ojVXemcaSmm8ELX/K
 IVIk+0+PWzNxvRE/6tg==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b098ce0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EUGQh4eoQUa4RnJZeMsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX/Tpxkj8yE+os
 ZCTcDvsYG1ufeejpkgKbtf0zHTmhsKiHUzEBKBe5cvqjnC8caVonuTx7qxpOGWO4vVRNVJg1ozH
 WSZpiRE9iQInaVohlIYhj5lslwF9F3E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055


On 11/20/2026 1:12 PM, Vishnu Reddy wrote:
> The threaded IRQ handler reads and clears the interrupt registers
> under core->lock. Power-off disables the IRQ without waiting for a
> queued handler. If the handler is woken and queued around the same
> time power-off is entered, it runs after the VPU is powered down and
> accesses the registers of powered-off hardware.
> 
> disable_irq() cannot be used to wait for the handler. The caller of
> power-off holds core->lock and blocks in disable_irq() waiting for the
> handler, while the handler blocks waiting for core->lock.
> 
> Track the power state in core->powered, which power-on and power-off
> change under core->lock. The handler checks it after taking the lock
> and returns without touching the hardware when the VPU is off.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h       | 2 ++
>   drivers/media/platform/qcom/iris/iris_hfi_common.c | 6 ++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 ++
>   3 files changed, 10 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
