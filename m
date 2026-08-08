Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F54A1C862F
	for <linux-media@vger.kernel.org>; Sat,  8 Aug 2026 04:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786163888; cv=none; b=Bfz3ZQijNMOCj+fS73u2yurFpVo3/ppj27qJODk0TI1sCXVrJtHPmHgDhGemDwEf1+cYCQttZjZJRKcQmByTFWN5sJ7svg6nU0sNORv0f6Ad8G+8HGGhPc5QKt+NkkHW78sZL+rlWOBnUtFvNJryohzdxdv11MAa3A3mkvDQXlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786163888; c=relaxed/simple;
	bh=Dc5ztGsIy0aJz9/GJTri7JwqP0wGVOI5md1RsmAa0Iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgt9J5vf8nIrNSYr94ngGYE5GaN9dkQfHP8pwOQm55i1Q2g3ABz/gAAnCbp+pVhHaMoxMuXqhsPZpfhQL7Lyil71b3d2dq/tt6DgZZdmWvELea9FB5/DKuXoVrFBbCK+sI20v/A76BwPw7y7lOktPUTtIcod9s3Tg6Y/9z8AQTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dd8mmTdT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rk35nnFb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dd8mmTdT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rk35nnFb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6783weP12967882
	for <linux-media@vger.kernel.org>; Sat, 8 Aug 2026 04:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PcfdXVqVda4nR+T+MGbj9iOc4TJuUh4We5btZ2d3Qbo=; b=dd8mmTdTegq4j4Qe
	Wm1sDnzLstxCwrLEa6jYFXDUqP1acQRWETn668FS+liOGJs2lPF2uregsYiKovMG
	BH5i53i1S0SAFjWjMfMkxLT4ng0vCOlGdsHitZDox6LM9cT3fKnH3q10IoCNWWBe
	TjYSGSezKClmtto3NEpUlmEQRVo6dQJzo0B3IVZm0Ux3qyUms6+47mI6/KUqmaix
	jJ5+DtbsuyhJ6ZM3q32FnoLrdnOn6xNGGuO5Q/09dQY/lc0q9s5A8ACJC1KL3Yl8
	dRhZtYUmYGBU2XKEYq2JJbyNnTJFqlT77j+ecIbt9rEHNwas7TUNOzr52vuTCxT1
	vSWM2A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhv83k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 08 Aug 2026 04:38:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso270423a12.0
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 21:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786163883; x=1786768683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcfdXVqVda4nR+T+MGbj9iOc4TJuUh4We5btZ2d3Qbo=;
        b=Rk35nnFbI4sY2wjxQCFBn0Q1b8ZP6g2Ky2q73ytzpBllcdnFEffKgiyXbthR39Vn3q
         MsXRYSE/GWbtpAEslUCkD2M9kvNVufObNnZdL+mKK9zJHXTNkhVW3EzMnnVdUeQ1gMjv
         o3geDTt87TYEosYaUp2BTHfT7tRCFM7EX28pEjJRdj8rmcjgX3UDe1vg/eJfBZmLTGaU
         bs28+w6rszD+/HnfOQo0lYkQD0OWe23ZAemWAMj96lbazQxGgK3IlY25nkvL3SM62c4/
         gW2QRnqkiXT0+unI1Ax70mTh41ES15UrHjcgGbDuYkGyzhMadL2XZFnzN9k3nyLVlKhQ
         eYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786163883; x=1786768683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PcfdXVqVda4nR+T+MGbj9iOc4TJuUh4We5btZ2d3Qbo=;
        b=alvXHrhLkYDUVJ+3U0U/nK3XlJ7jqL7SruSIA0PxytXDc/4TwG7WoghDL6it0cT99Q
         dYlMJgBZHbH/mZ1+qjKmgrCVW8Fg7bd32HEnXlvii9qffkTvtA7QopS4qtHlctIE7a0B
         ROvIW+mE8DkISeWIHviEmGoHkKlqD/wGJDyIFPQlN4R5pX/Si9MDd/u5q6TVHXrJdfOT
         XfZrKOktDgm/E+1U9LsHQ3zO8cuW6s1u8TuPXGQvwZJlYsKGc1AYmKPjjFQq9csEcU75
         GZ17ae+XIUKwt5ya8z8qVA4EFrF8pLXqUTJKDWndfJbvfpj3EZL5s67AmYb1te2oRHZ5
         5kWA==
X-Forwarded-Encrypted: i=1; AHgh+RrHrSt05ALieq7fjL0gISF7zYTxQ19zHjAnxUbmKq4NoCAO+iTsqiYQGkVEJpMTHiCXOUM9kGn23X/wug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyjIP9Uuvv+lFSF2SGY+S7kWl0n2QVqlyu/8QFFby349f74C3o
	+2tQ98tUD6n0eecpsq0ci8P4vnO9QdFSVi/WbArEEacSDg1NRaLzIbTr95gZX4dlOCp1WqU8i+R
	wxwLnqw9Ebuc129o6G4g5LpXQ6ohk4hvOEVns5fjln5zHbAvdXH8Eng8i+bLmg7GOOw==
X-Gm-Gg: AR+sD10aPLhaJq/UE8hD/+9BI9kpwEWe0U874kYQ+B3See2RPKPbgBloWc5so7I3yVl
	p5sCUK6zkMJG5m0MBxoaqaa6zZiHc+Lle+mrPTR8FHn7P8C/YOv9FrvCheXg54AdFIcqZ08723h
	EalugvcHjt8zlHfIcvZJEChZUflE0JdPWE/1xzI67Od82tmVsrMm9O8KoPFDQV1zPDwyA5fYy8T
	K0zAOkzOYMeY3PpuyxLxdyXpaAP4KDpcQ/ME0BIKkBSj4XicKTVXCmETU5PhSCVv48Rc/9vwkLf
	CQUF0h3tKffnAB6UXpZh9wcvVev0jOxC+HjWN/ysbjG3eN5amdYBEszhHAXk+F3MNMGnH4VP63X
	dn8LpRrvVxICVQNrhjM03o+yWE5bT9A==
X-Received: by 2002:a05:6a21:2293:b0:3c3:994f:b4f5 with SMTP id adf61e73a8af0-3cb85eefa11mr36524097637.28.1786163883110;
        Fri, 07 Aug 2026 21:38:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:2293:b0:3c3:994f:b4f5 with SMTP id adf61e73a8af0-3cb85eefa11mr36524024637.28.1786163882662;
        Fri, 07 Aug 2026 21:38:02 -0700 (PDT)
Received: from [10.84.15.18] ([106.195.78.83])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3d1sm14702970eec.2.2026.08.07.21.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 21:38:01 -0700 (PDT)
Message-ID: <6ee7f32e-eb6c-e264-6f0d-541555f8fd62@oss.qualcomm.com>
Date: Sat, 8 Aug 2026 10:07:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
To: Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
        Daniel J Blueman <daniel@quora.org>, stable@vger.kernel.org
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
 <ruow4uus64krlpy2gvm3g2d6rq5kgmgxnlhstmecil3gw7lhkd@2golvucd473l>
 <20260807162405.GA896590-robh@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260807162405.GA896590-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a76b2ac cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=KknAIj/64Ji5C9Eg1IdENQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=YG64nluAAAAA:20 a=t9ty7G3lAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aHi8tEQZ11PmSqT2gCsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=CsAS6f0m0zARWR-uHzm3:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: J6ob5TFqUhEFsWIJijPE-zqMjiZ_VlQt
X-Proofpoint-GUID: J6ob5TFqUhEFsWIJijPE-zqMjiZ_VlQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDAzMyBTYWx0ZWRfXxgsHgkBjHOsr
 danUAmmqx2IJe4Xu2aolZhXD6Qi3qerhyxAABrCLoinjR9i3pCftq3+nHVlPu0AIErkSY3M1/L/
 K8ek7DDCM9XHh1uKPnzjyCQGcqEeCvUWakmHCkwEZ+y/tf/Anz/irlpjbQAEghzBRhaziciJy3t
 M1NEr3DqRCG9pHovLO80U31YikRMTmeJ+w8y7uEWMT6crpKJFkLIUE3GP85Hg+2QLzWilzmwbho
 ff6CbP/muXJsAw23I5CcJbZFRiihnqK4ncl0K+i8fXsjka0Yj6lwYUEd6G0L2c6HyUSuCR/dQ7q
 HFB8pwP4iXf5q4I95PfOQcObpk5f1sir68DHBamvQDISqerdMcJYAj2gdDrrwxn+nnJgQLTzS+k
 6A//g7LvLz5RTglu40gB0MiyzFJvNG6Ep8c9YCfQWv41xsQGaepSRvGmTLboFkSd/TA8SBAQzej
 6FKfiFzDidoLjAGZXvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDAzMyBTYWx0ZWRfX0Bk3zMxmjaS5
 AiiB7FKQVlO4XRLqb0/f9Ccsnv6nUpwzwPfQXZiXQ9RgcN67LsDTRGyg9VCjXFSPffwzv4FJ945
 3xD/EKsU4Rm/jhklmJ95B7i1k0OL8rI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080033


On 8/7/2026 9:54 PM, Rob Herring wrote:
> On Fri, Aug 07, 2026 at 12:03:50PM +0300, Dmitry Baryshkov wrote:
>> On Fri, Aug 07, 2026 at 01:54:48PM +0530, Vikash Garodia wrote:
>>> From: Daniel J Blueman <daniel@quora.org>
>>>
>>> On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
>>> below 0x25800000 (600MB), primarily for secure non-pixel buffers. DMA
>>> into that range, from any other stream id would triggers unhandled SMMU
>>> page faults that cause spontaneous device reboots. This is readily
>>> reproduced with one or more browser tabs driving multiple concurrent
>>> video decode streams.
>>>
>>> Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
>>> and reference it from the Iris node so the IOMMU layer keeps DMA
>>> allocations above that boundary.
>>>
>>> Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
>>> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
>>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> index 8a96ea1bdb9c4c409b2af997680d8c13fed0643e..87f424765d513c97b06303bceb75ca9f176d2ace 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> @@ -666,6 +666,17 @@ smem_mem: smem@ffe00000 {
>>>  			hwlocks = <&tcsr_mutex 3>;
>>>  			no-map;
>>>  		};
>>> +
>>> +		/*
>>> +		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
>>> +		 * primarily for non-pixel buffers using different Stream IDs.
>>> +		 * DMA into that range triggers unhandled SMMU faults and
>>> +		 * spontaneous reboots, so reserve it to keep IOMMU
>>> +		 * allocations above this boundary.
>>> +		 */
>>> +		iris_iova: iris-iova {
>>> +			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
>>> +		};
>>>  	};
>>>  
>>>  	qup_opp_table_100mhz: opp-table-qup100mhz {
>>> @@ -5439,7 +5450,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>  			interconnect-names = "cpu-cfg",
>>>  					     "video-mem";
>>>  
>>> -			memory-region = <&video_mem>;
>>> +			memory-region = <&video_mem>, <&iris_iova>;
>> I don't like the idea of this series, because it _again_ doesn't tell us
>> the truth about the hardware. This typicall ends up with bigger problems
>> later on, when it starts to affect other bits and pieces.
>>
>> I don't want to NAK it, but I'd strongly ask to reconsider it.
> I think this is an abuse of /reserved-memory. reserved-memory is 
> reserved *physical* memory. Reserved IOVA is a property on top of that. 
> I'm surprised this passes validation. If it does, I may go fix that.

As per the reserved-memory.yaml schema document, the iommu-addresses
property for IOVA reservation into /reserved-memory is allowed — it's
documented for IOVA carveout reservations:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/reserved-memory/reserved-memory.yaml#L56

> Rob
>
