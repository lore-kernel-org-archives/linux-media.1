Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC02A377EA2
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145482; cv=none; b=e+dfbPrzXVb3yZpYTlcL/WtFFvqHPeMZyMX9eEf4wz7Y5/xYiBV+zCfinPlddCNwlfJxtHNh5FDpAJ6x0uKOyBULboDtFvNbENHGrefaq3+yPKUbJAn1cHog0CIampFTdtrjzIwQgaMaJaH2t+hb90+eEu+1fzgMG6YRLLazGv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145482; c=relaxed/simple;
	bh=+dq/mMnDe9QFfq17yLaBK6nHu+80T6tyc8mfK+ZvPkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iolBcQJeIuMD35EdXxYFVzF6fRZh5n494jrqwzkkPd+071tRn7uvnBYr6kH5CR9O7jFYGT3TVko6u8FkFsItdp9GdIuGGgLwl+iEkOueXgbXqiL4M7yzQH2RRQPUneEjHos9EM4ZS8ceMcbI/fBUD+j+djXyaG7lyZDOSXZQm6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTR/FC8r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V9Cc00sj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTR/FC8r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V9Cc00sj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0P4H372634
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 13:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHcojprWwMclTR96W1Kcp7mAYQX7rnuvUTwbQrssUdg=; b=dTR/FC8rtsTF0qmw
	JN8frrhbf2bjGgTihPM4XakQB12zomE1VpKen0fOtSgG46aHEXyCWFOTuRZKS7Rs
	ErV6+SGTMSgG3cxaldLhHs3QGPdbiyn9rNpTe7JjLbSzMfqopRCRG987PZcfAFP3
	4RMg7P2JPaJrnnQ7ssoi1uBBUtLtsd+EBKmGH2JOp3iaFEp2xOORM+hyYlcjI+LN
	uVpR0jSaAvc19aIOHICGZ4lUAbji2Hanp3LjYjHTNKhVcpF/n17pggSk2jnYp/4E
	l5I7Lf5/9XTlCfsMkCZYDby3WDNf8pXxOLhPUtjSUGqljtRZ+UaznP0NSLi1KdVB
	2EiJDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkbc7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 13:17:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so1779450a91.1
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 06:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145475; x=1787750275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHcojprWwMclTR96W1Kcp7mAYQX7rnuvUTwbQrssUdg=;
        b=V9Cc00sjEz1amhk5EKNH2ih1GGZT2kn83EIPGk2ctlUMIqk2b7HgVxiDnvLmMm5M4S
         2+b5awUdf0kRXYQ1m3Tp9G8l4DlOGTIj/wEuo9N/w3IqvhG6kxcSu0uZaq991x3+aufP
         1VIZygFlCz4jnifTdtwGaGWT9ZxBymM5Veb8uykkmj7dfTA3wwBSlRAAE2MxE7vuM+QC
         mBZpJC5uoMQaroBbYUzpibafc0FFXA/TrTeOR19w9wMUR29o/NhsrZheTVzohqPY684Q
         +UV5tF6AbAD5vBt69n5yend2zAuv6xZZ3OH61PEuv2ZL4NYtmvrr/WGWjb3SlmPUC19v
         ZIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145475; x=1787750275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHcojprWwMclTR96W1Kcp7mAYQX7rnuvUTwbQrssUdg=;
        b=qQnhQP/MwC5mEX5m3oRl095RaxnVZ3JQJUadfZziv2NEnWTMmGyHLhNYRdoGFWGiMt
         JJiIihzX3WEPwnYBMLEhswg0rxSAdG5ot1A0BiBzDkek2/E3P3sz57bQTQ335FSFRs++
         DOQYUhtuJbXTAX1GkU+nLtKuxfxtnPfhPpPwvoV+kGXc3XR2i1sM/RTTl/vLVIGIk901
         gFxeGwOfXcTFU7iIctyoMH0gCtOjazESUyzQMIqy2WfaE//el5i+1pW8Bp9wUXwmxZhR
         g5iAiHc89IuI514Z7Wfa/p09owH2gzzRZnKdVsGXe2mkIQwxy+HbtdD2aE2aS+dBs8vj
         QAsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6JJIqpSYdvVSQ1VJVbX8Bs5U5M0h5VPNEPzzZsoL7dhWlaRK5hsBkkvBbTDuSihEC6KVvJ9gYOM0vvg==@vger.kernel.org
X-Gm-Message-State: AFuF++mOAMDDKilR8/D5y/yNtbeSk5w0FfjF7kFi/QmwOhZ9etiP6S3/
	3wZYg75MpDf/0/6UbMpWS/fRn94uCjD+Mm9hPc9ucBuCiomAj1QzLMCwFEtN4W2+f1Z43HGBIM1
	8cka753s6Tzqg+qzYYVXnWkD9n2Pf4G/Gvg4HtJPvpPVGrBrOc89DvRZhLOlBxsPSag==
X-Gm-Gg: AR+sD12hXW1SB5K3FaztRfVbe+5uS0kMHJf6VjwsPWyFzm9nlSW/50JZD3sARHmEzk/
	4yreCAtBJn2RW7IVkQmba5bjrq7r7XHbBMrNS/s+riNRU1hV8fB7RHBgTyO6DnE8uUEmIDOdKbU
	H8OP2RozV46u2FefCk1LMrE8GNJKuUxBhho3z7H4OYXnb4LxmY/dtwq+04uQAKR0cLdFBFnnat6
	oRwbB0x+ZQ7HMpENiXeASuZkSQQOg279njGGBXBZoNhyK59wYZvuTSqnViL82u9un+lb5gIAQZN
	KZMn5Ypz1wK3xu90NWWrM/Ua1coV/TS3gCAc3r+c5rlHj1gv7xaVR8F90997aSxxOERljCXTsVJ
	6LUsx1pqj2y9s5tMDqs1IDt+rY95lMw==
X-Received: by 2002:a17:90b:57cc:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-395810e93a0mr8967646a91.14.1787145475198;
        Wed, 19 Aug 2026 06:17:55 -0700 (PDT)
X-Received: by 2002:a17:90b:57cc:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-395810e93a0mr8967481a91.14.1787145474636;
        Wed, 19 Aug 2026 06:17:54 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f7c962csm2756751a91.0.2026.08.19.06.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:17:54 -0700 (PDT)
Message-ID: <3476b5c3-7983-4994-a901-3d7d8bd75255@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:47:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] accel/qda: Add initial QDA DRM accelerator
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-3-69a02e9090d4@oss.qualcomm.com>
 <81708487-89ce-4cd5-b39a-2989bdce6088@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <81708487-89ce-4cd5-b39a-2989bdce6088@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EiZruNX5RdBOvkLcHebgN6GVy22OukyO
X-Proofpoint-ORIG-GUID: EiZruNX5RdBOvkLcHebgN6GVy22OukyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMyBTYWx0ZWRfX3mQIUI9dPpoq
 g8uxfULTIRLaY5kGqz0vK8s0JRGVSGZ/bom/wDRRA8UjKVuNnyBQUU6RA9dC8+QX5J38Wm4l/xw
 jEZckBQhEZ2cAzCAF1l5FgtUhDCdlspZC+aNxCP3FxgbgI5YNCuexVW7bfJFdZxwuoyReJTbCjj
 Az4us8TRXlldjQ/LVQJT1P/Gf7FCBUN+ocCaAo/UZJBgeciYP3ziT3VH+TaT9D+1yqWXamQHGmx
 QwqHYHVhosr4yvScq7NpemtDuZeMjcr4JfnAKf+GbyFgW6RaAt/m5FDOXRO3J164avZHZBJioqD
 fReeyqfSEOmu4MlLB5nQ3S564MRBR8gwB5BHlkK6OAlt4YaWHDoOnn+hMecDB4wQq22rBqRRfME
 6T96RRxPWjcmgYTXAYAF+IK9+T+zBhFDX0UdAaAXcTsc5wZHR5SpuYxSn0wiJz+E6MxSrKFtKsx
 n09E7byaJENA28eMagA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMyBTYWx0ZWRfX9bhwX2jWJbhP
 Tnn8JfGavSb/UETN8PSojf1hUuIPWiabIlF+GZh8F6Ti2wFkyJrhHrSIp0NP4QgOYiNj+U30TU5
 eGBBG+bxVSvcmFNnVz+muNYxMvLQwjA=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a85ad04 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=D19gQVrFAAAA:8 a=EUspDBNiAAAA:8 a=fiCeWNywFvmbcpy1l9YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190103

On 19-08-2026 00:40, Krzysztof Kozlowski wrote:
> On 17/08/2026 06:47, Ekansh Gupta wrote:
>> Add the skeleton of the Qualcomm DSP Accelerator (QDA) driver, a DRM
>> accel driver for the Hexagon DSPs found on Qualcomm SoCs.
>>
>> This patch registers a DRM accel device, exposing a /dev/accel/accelN
>> character device node, and binds it to the RPMsg channel used to reach
>> the DSP. Buffer management, IOMMU context banks and the FastRPC
>> protocol are added by later patches in this series.
>>
>> qda_drv.c / qda_drv.h define the drm_driver ops table, the per-file
>> private state (qda_file_priv) and the main device structure (qda_dev),
>> which embeds drm_device so that it can be recovered with container_of().
>>
>> qda_rpmsg.c binds to the "qcom,fastrpc" compatible via
>> module_rpmsg_driver(), reads the DSP domain name from the "label"
>> device-tree property, and registers the DRM device.
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Use module_rpmsg_driver() and drop the qda_rpmsg_register()/
>>   _unregister() wrappers, module_init()/module_exit() and
>>   qda_rpmsg.h entirely (Dmitry Baryshkov)
>> - Read the "label" property directly into qdev->dsp_name (Dmitry Baryshkov)
>> - Drop the probe/remove/init log messages (Dmitry Baryshkov)
>> - Return the result of qda_register_device() directly (Dmitry Baryshkov)
>> - Clarify the Kconfig help text (Dmitry Baryshkov)
>> ---
>>  drivers/accel/Kconfig         |  1 +
>>  drivers/accel/Makefile        |  1 +
>>  drivers/accel/qda/Kconfig     | 30 ++++++++++++++++
>>  drivers/accel/qda/Makefile    | 10 ++++++
>>  drivers/accel/qda/qda_drv.c   | 71 ++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_drv.h   | 61 +++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_rpmsg.c | 79 +++++++++++++++++++++++++++++++++++++++++++
>>  7 files changed, 253 insertions(+)
>>
>> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
>> index bdf48ccafcf2..74ac0f71bc9d 100644
>> --- a/drivers/accel/Kconfig
>> +++ b/drivers/accel/Kconfig
>> @@ -29,6 +29,7 @@ source "drivers/accel/ethosu/Kconfig"
>>  source "drivers/accel/habanalabs/Kconfig"
>>  source "drivers/accel/ivpu/Kconfig"
>>  source "drivers/accel/qaic/Kconfig"
>> +source "drivers/accel/qda/Kconfig"
>>  source "drivers/accel/rocket/Kconfig"
>>  
>>  endif
>> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
>> index 1d3a7251b950..58c08dd5f389 100644
>> --- a/drivers/accel/Makefile
>> +++ b/drivers/accel/Makefile
>> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
>>  obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
>> +obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
>>  obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
>> \ No newline at end of file
> 
> You have trivial patch errors.
newline problem was already there, wasn't introduced as part of this
patch series, so I wasn't sure to fix it here. I can fix this in v3.>
> ...
> 
>> +}
>> +
>> +static const struct of_device_id qda_rpmsg_id_table[] = {
>> +	{ .compatible = "qcom,fastrpc" },
>> +	{},
> 
> Device node with this compatible is already populated, so this looks
> simply wrong or you are adding a duplicated driver.
> 
> That's a no-go, you are supposed to work with existing drivers and grow
> them.
I'll bring the discussion again here, there was a discussion to move the
driver to accel subsystem if we want to support new features/uAPI
changes. Please read [1],[2] threads. The intention is to replace
fastrpc driver with QDA eventually.

Do you suggest adding a different compatible, say "qcom,qda" for this
driver?

Let me know if you have a better suggestion to proceed here.

[1] https://lkml.org/lkml/2024/6/24/479
[2] https://lkml.org/lkml/2024/6/21/1252>
> 
> Best regards,
> Krzysztof

