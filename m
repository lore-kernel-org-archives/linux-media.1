Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6F93C8C60
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093551; cv=none; b=QwvylTXnxyu/5IlTdpm0x/8S46WTlAqG7wTQ+YQwVzBP3A/0V2UOXe5Yl/k6hI95LBtmGfQECyDCC+xEttWEDf8mDO4+IImvweDTw8tGdc0Degn1QUQ8VmaAx7Yo1Bs04o1HQtumf+Lfnyl12rG5c54OLvR4oPO48aBx9uI+qsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093551; c=relaxed/simple;
	bh=mGv92fPDKTDgi/M1tLT70EngJtlD2QV5OTlgO3iQp98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFj2HjUszZbQ4JHeiEpC97DU4LAI7/8/75RrjZzV/PYoiN+a8xLNw66m3Wc1D36IoQY9lThxOMdmAqvkrcBJji2K2VzoVLfRmjt7o1Cz6ROxUJ4P1Q4K3HbSQdUh3qbl+NMB7YhB46lfopjXi/f0srqxECmyK+qEc74NDbx5bwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5hsLqOk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXV3Z1yu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5hsLqOk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXV3Z1yu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777r0Xr3822442
	for <linux-media@vger.kernel.org>; Fri, 7 Aug 2026 09:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4sMy9lKdqb+KnOmevtsdmhiZovlqPN/jquIBmM3Sjng=; b=D5hsLqOkLmOcfch+
	/R+z92Z9TjUz7IuofH55zEL12WUu4g+vdyZH7e9s6PvUzdREE2mW4FLedJk6t4DH
	9j4ZWWnSL+7a/JFH5jjOjTZdzQSwJr8GVIrRf8FREJBiLdRW1U+Cr5UlJyS+L52I
	0dL0lDNijmvoIX7Cp17SzUIpVf/BA6LqTpU41hW0UyjS2SRIhEoT8XoL2Fz9bnPX
	xWpIV7Tdh1lA3FYqOSQpXQMxGsBgTWP2mdUK18Uz/VmC9RQlBootvHuctIAjmjbO
	u2Jip0xCAx5x4PJVL5c88t+1qcadZ4QtJTPld5EV4KMDNaIfzQLF6jbdPhCFadF+
	fbwLiA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gu6t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 09:05:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso2496757a12.2
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 02:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786093546; x=1786698346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sMy9lKdqb+KnOmevtsdmhiZovlqPN/jquIBmM3Sjng=;
        b=TXV3Z1yurrScqn7ZYxWpZ6LkWaFaoKjRljL8qDl0FiTG2Vb2qD4AyN+GhGF6CHlSKE
         KSCu9Ep313NifakyfBfp0WYx1ux7+0V0s9rdVayjLqOjhtssjcyBw5+pkScSb9eujQFC
         3psE6NUhPUMyO8qy7PgsHcCIxS/mTESu0IprFdy9udGyPtmtPuSbGurPoXPxKDUiWOzZ
         2nTBduXGSpP5bSauGsXSwUNmqCCXWMjVvyW2LGKeo083NR2AC8DcfRMN7i9MHeK1xF6i
         52VuA0YeB/DxXft0ccOMeFmNWaA6U2n8jTSUlumhHjyPdYqk255i2NbDDjYV5zd29oUw
         J8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093546; x=1786698346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4sMy9lKdqb+KnOmevtsdmhiZovlqPN/jquIBmM3Sjng=;
        b=VbJvxz5BC3hXU4D7TVXl2hZACVj1lT1oKQ9c/Hijt319UINaPOIiGxj2WogkMKbrKK
         L6Awm7iyfWpZGquCKEpWUN4gEHQHu/a0i55OVHFnUB7iS/iMXCAErkJ7pq24M818e20X
         7E60lprNujsIB5runBJzjoVFMq7KLhv9XWJ2V23qVccAYsWoKGmdR3mk2eM110pUkmLX
         ZCbDDxZPAZU36qewftWv0JOY2lOCvj8SY7KUqWP4q6Blv0uI7FZ+SPKCcuisK9NuP8Li
         Irg/O/x3zqWDP/g+LZ49micAVSIPQ33G4456TrptdJPICCwfRnQAgCYQNDTOn3RQ1Lba
         E9VA==
X-Forwarded-Encrypted: i=1; AHgh+RpsiV15/U4EEBG3jJqdlsqzrZiZDFLlGRZGhF5v/OYBmb0iwjBV/hOkukaYrGeWYcH5/+cGU+mq/XVmrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOQyTGO6G++48H2+KTT4Z3dFJwKr+Z/r8Jw5GTr/cZUqSiCrLu
	EQoVGlgr9ZN77vqqoGZtuXcczrTJPXdsI1DKd0uSpCi3q8YDd7fOoLfIaZw4bGC309TN5XUQpBd
	uuOL5tGdC6uTptMI9Jz5EG6d55z9rO3ZQ8TD8i84vOdq/X2lPgYjBdpeE6nWXs50esw==
X-Gm-Gg: AR+sD13FO+9tU5fFTqSNIPYsRk2ohcNYtZTavZb/SyG7Q3Igr+c0KqHbUYZqAM97RsC
	awCL8Gyoc/kYhJT3gEIUe/ZtoraoJ17quudBx8F7q5dOUofLA3MZNGqv8Hvc1W0kDFmmEp7qxpG
	O3DVnzS+MmeFY/JStgztjSMK2oq6IP380bfhCQCyyT7jhVZQKd7XL5h6v0xG1MMLtsafc41pJta
	QTJdeov56r0lS5CC2D1JQb8xx3zP6tUAYZSf6AKvw73Q9IfGvKjeqF0tIWZz4ftrhSGxVGlrkMq
	9UFR1+5fZyhnbtTtGDSMc36EzQYpxFpB9fFTVPR0bV4Wdm9rMfJGfgZXp8tPMkF1Kls9z0VO9ZJ
	9A4WacudEDwsnLTocsrBuf/guWJk9Wu9qm18=
X-Received: by 2002:a05:6a21:4c0f:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3cb85ded9cbmr27306331637.12.1786093545888;
        Fri, 07 Aug 2026 02:05:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c0f:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3cb85ded9cbmr27306225637.12.1786093545435;
        Fri, 07 Aug 2026 02:05:45 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.142.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm7785014eec.18.2026.08.07.02.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 02:05:44 -0700 (PDT)
Message-ID: <a3856ad7-f522-44af-828d-eaa1cc91484f@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:35:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] media: iris: Restrict lower IOVA range for Venus
 and Iris VPUs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek
 <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <5pnnu5nc6tpptw2wriq7r7mxcjvn3kvi5auz4vqffdent5bxiu@k5pbypgpgexl>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <5pnnu5nc6tpptw2wriq7r7mxcjvn3kvi5auz4vqffdent5bxiu@k5pbypgpgexl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EYH4hvmC c=1 sm=1 tr=0 ts=6a759fec cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=eVbXwf39F0J6/s7D6zfB/A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LEUcfjZBBKQ5YW9IAxkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: n3v24rUVWTAHl4wZHQNHmiQx1_MIqqPh
X-Proofpoint-GUID: n3v24rUVWTAHl4wZHQNHmiQx1_MIqqPh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NyBTYWx0ZWRfX0oziVtpNaXnZ
 zy/jkE7qgluMFLVejR/Ay+L+/tiOAISFfy4q16L0vWwlej5P8roLLEBY1XfA3AOQ8STG7zlmAYI
 uIfayAfcEHsIjC7yfFN/gSvdPxMSVDg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NyBTYWx0ZWRfX5Wk/4S2TnFJY
 59KyxuPPQhEPMZmYuGHp7GXxn80kZ6Y98pmAXxbcxPgGV07sIwSRywG+RPxm+HGFwjQEBsw6HxQ
 s/0nJHeb2zXwKV+THrVzwkGhHxmVvof+r5uMol7hd71ECZKnyb7167VXS1QSktznjWMzZS50XYK
 eNzsf7tyl3JUB0cjg35WBPvYbq/6BxjNO48GaMXYuUqOtmuGvDAuq9ucq9kKDz1fSdy4p9RR4JP
 8XGDcQA/651j+E9hcZ0aILVTpjDENv+QaPz83+/wxDs6LKksRX2TqjP2EIzeibAiERyhmidSzQN
 1GcfOrVISLuvMLXwMKoNQM8OLiQjLcu84q3W3ufffr9np44py7XgkageGlfGYvZYtIrzfFnPn3Y
 nfWR234kFvp1mv0BB24e9+G7AwCek8XZCpLbzxYXlTkaiiqhSUiHDTh/hjeY60S31TlUgcux/kZ
 5iUJzcK8h85rElbQmzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070067


On 8/7/2026 2:29 PM, Dmitry Baryshkov wrote:
> On Fri, Aug 07, 2026 at 01:54:44PM +0530, Vikash Garodia wrote:
>> Qualcomm venus and iris VPUs reserve IOVA addresses below 0x25800000
>> (600MB) for non-pixel stream ID in secure mode. When the kernel
>> allocates DMA mappings from this restricted range, the VPU generate
>> unhandled SMMU page faults, leading to video failures and, in some
>> cases, spontaneous system reboots.
>>   
>> The issue is readily reproducible on affected platforms by running
>> multiple concurrent video decode workloads, such as opening several
>> browser tabs containing video streams.
>>
>> To prevent allocations in the restricted region, this series introduces
>> support for an IOMMU IOVA reserve memory-region in the Venus and Iris
>> bindings and updates all affected device trees to reserve the low IOVA
>> range [0, 0x25800000]. The memory-region is referenced by the video codec
>> node, allowing the IOMMU layer to keep DMA allocations above the reserved
>> boundary.
>>   
>> The series consists of:
>>   
>>    * Binding updates for Venus and Iris schemas to permit an additional
>>      memory-region phandle describing the IOVA reservation.
>>    * DTS updates for all affected Venus platforms.
>>    * DTS updates for all affected Iris platforms.
>>   
>> This ensures that DMA allocations do not overlap restricted IOVA
>> mappings for non-pixel stream IDs and prevents the resulting SMMU
>> faults.
> Some of these patches have been sent already. Why is it again at v1?

By some, i assume you are referring to the 2 patches from Daniel. Kept 
it as part of this series to maintain the continuity with patches across 
other socs, other option would be to bring them as dependency and drop 
them from here.

> 
>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>> ---
>> Daniel J Blueman (2):
>>        dt-bindings: media: qcom,sm8550-iris: Allow IOVA reservation memory-region
>>        arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
>>
>> Vikash Garodia (20):
>>        dt-bindings: media: qcom,venus-common: Allow IOVA reservation memory-region

