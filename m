Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5360A40A93D
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 07:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787039516; cv=none; b=VMnsFpko6JLyOM/lgS7ZA/czkZcBMmRULRrN78GMa+LZ/k1GSpxrVVaBASTuQmHA0Gd5ffipd7+PQepeOzFXNiVx9zDjR5pEAqmFTvZZH+JTDWcF/DA4LQryChxQUxFJEDffRGNWgr/2ZaZRPRKKSs1ZcAVDhu4Do7YhVQoBxEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787039516; c=relaxed/simple;
	bh=TmGaE7Yr+lO6E81nhd+0RvEJq+y1eIn6o2N2sLX4rnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLtFrsgxVb1xqMd8ucynth+zIy77z4i53fR5MvwzRIVrEuHB5bcSCuT0GO7bGXbbeGehdmtfg4d8DVsqRHBhm6llfKECe8AMd4To+eXtTiLcpxBJb7Y1u/l8Lf+8O2XNhK9l7F4by5E832lOqJJJW3SAHrU4aZh4qtbiujECf+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Le2NbnaM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkUmBf4r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Le2NbnaM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkUmBf4r"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I7iwq4689922
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 07:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rf71kJKrU42wLc/SUwCao5tn70wkJox3ncGfFZq0o7M=; b=Le2NbnaMB/R8OgMV
	4Ay0qMR21sqAL1WqeVLG8qKTiI/ftGrno7b8j/qpEWpPmKJSr8u4jvYgEy/7paFQ
	BikSHQmdTeRYIT7Pm6Kp3rLsBiPXyYgJ3MTsKVrhj+MVFh8QRl8VDjauVb/n5RYw
	1div83HUOMfz09FaVlrChAsWbsnLajv7c5jVnaDbrGfxHG/xA8M8ttzOx7zy+Pvk
	Bj22Ca6efu7d0ZYTwjq3hI8alJlbaNIV8n/NUozGIRJWuOE/Gw5ZJNUoJKcxCWXL
	48cZFvZC3/ZYWU4a99C6zrbXzFkALGeSG9d/aDB/JRIcS0lPi8VjhxeoDLV//Yon
	xRxRzw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0tk6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 07:51:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so3047675a12.0
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 00:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787039513; x=1787644313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rf71kJKrU42wLc/SUwCao5tn70wkJox3ncGfFZq0o7M=;
        b=BkUmBf4rJn5G0eyQbjcN+8+4iLPcBfTfaiYUEeoQfip2xv9mE6lM5ESMz3kSJ+UWUm
         lZ7QoEuQZE5DDOrQCfgnmEutTqdP2nZ9ivVBIuBcpxfn44iqwZ6jR+zgS8TY9jdIcg6Q
         UcAXgpVmXafjic69wHu0DkxOoN0xqV7+Ak/e6KwwntwUeVQo2Khjhv95FC19Y+sLdHiW
         //9FGjie1xBtwAkoadbSKGJrAAXKgtVLTokz3EBFB0zoHXadyD8wSmEVvBp76fU5O3Nx
         i3n/0mViELpQaCDnQzqOUQDo/ZW5wWpBewZW98jpRPolmSZbNpEjiKRuHjQmgTffLcMz
         ibdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787039513; x=1787644313;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rf71kJKrU42wLc/SUwCao5tn70wkJox3ncGfFZq0o7M=;
        b=nVDYZLM1iRglBv7vAe3pJ4O6ZYBBEwbEQoNGYhp34B7xxOrfxD1ZMe+DyTbmsymi7u
         Stc6B6VmTPQKI6/EEEgFpFxQOyIwwCqm79wE2RS7G4z41PCcmMe1uOHvOxjoamZjyyY7
         Jq1z4lja4s8YJVAylDp5U3XTjGCyHkT74JTIGQtBxe7v2uW+LP+37XWfGdYJukCkQGHh
         meAszdFM8ztCotchqadw4mCUJ3J12KvDRw6L7PQZF1vEQXdEsvHbz5a+GRbNCyPVL2gL
         UUPjO5akqBvH79xnPIf3SRfoXExbkgJpCsLMHg/cgHFoc2jYlOVPIFJPLjbZDIxmV8nT
         q5wQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrmpb3S6IeWPOtmm4lcp1NyRzLUBm53gX6y4nftmmJacxdM6cbtSFFOeNC+nab15xbAiX2K0FeY4IUi7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOrpVHW0F6mgo9oqlUABwN0U/04MavVBSPn56p3jl8vcoc7IdI
	CaZ/ILZyUXO31B9VqbYeC3as7xenT9rxklMosEauO7TDV5GZZ8fFpUffpwyKkGRk1u3+LT7+EA2
	LZMHdg+okr8lTFBaqkqkUZxg23p8lfaE1hyOy1kfp0FNau6bnt5at9ep9J7WdsOY8pQ==
X-Gm-Gg: AR+sD10FhgTTEhTJoEb26RCLA/5FsOMwaRanjkU32URZ9MwBsxEpXgCE6e9JzDLxngU
	libzP0Lv2mpAjDm0Fu6AcDglAnRlzzrT2e5JYB2CKvK96kJtqu/qSJF9LeT62kQep59LcOrsLd5
	iAM9b5z+pTL1l6z2jYX+/vHuExoKR1dAit/O08LP59ufwJqJDuzvrDjW3Z/ERa4JjifNImKrezP
	uxT4lFTxwGY0+NhhwnMfip9+ikRvfJIR3dJlaeXLi3qG+ZcnOhFkQLkbqiLZfFaJMbyLnODl0Hy
	/Nmnq2NKYLwSSuPEDESc5/Vhjl553D06tLP+HXsdzGNxPx9HCtmIQJvBAszfCCuAQbGnksv2A4w
	euWWg+CTwa1MolflgQw8AUIjnY+fR7lsMkpM=
X-Received: by 2002:a05:6a20:6f04:b0:3c8:d3a4:7b40 with SMTP id adf61e73a8af0-3cc7196e6d2mr36208947637.2.1787039513118;
        Tue, 18 Aug 2026 00:51:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f04:b0:3c8:d3a4:7b40 with SMTP id adf61e73a8af0-3cc7196e6d2mr36208838637.2.1787039512618;
        Tue, 18 Aug 2026 00:51:52 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.138.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267ca93692sm12605456eec.30.2026.08.18.00.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 00:51:52 -0700 (PDT)
Message-ID: <0bccfd31-dbbd-4bc7-9d9d-be048ef22b04@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:21:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
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
 <c3hVumMy_QnRbUmbFTSWGjkfG7lPjGFEcZfPsZeGQ57nWKkhlBL3wgmcDcAgT9cNb8Ju3qZ_sSKgHk8vmow0xQ==@protonmail.internalid>
 <6ee7f32e-eb6c-e264-6f0d-541555f8fd62@oss.qualcomm.com>
 <56b3dfcf-b1ad-4192-8199-06c80cc5d124@kernel.org>
 <Gm8h4cjoxHsgA2enLuxEd_3c_3Nq_RVJ9PkosuciOEss5Bw-GbnVoJCzsc5ciseK-L6bnlf9dbkbbh4ui3PSOQ==@protonmail.internalid>
 <CAL_JsqLGOz7Fh=AsM+g84=Uko10YXU4QN1buApD3CJMkOmsebA@mail.gmail.com>
 <e5e2d588-cee0-4105-b34e-34d2718786ee@kernel.org>
 <xbzl4s37jr3uzsd23kvphiguxmq4ngkajju4ifg76kwqrs4xrg@2egp56nwrxgu>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <xbzl4s37jr3uzsd23kvphiguxmq4ngkajju4ifg76kwqrs4xrg@2egp56nwrxgu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA1NyBTYWx0ZWRfX7cmi+op5H3Wc
 nRPNNnVQoT4zYqZkZ4BXOZ7dyNtixqktFw4jfIfV7qo9emt415nh/+yr+sZ2ybaVTzTaHwkyrza
 QqbqCYSt7Ige5slj6ksSYIxaR3O/spI=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a840f1a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nRfyoPPwyR/Y6OrExC/i1g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=YG64nluAAAAA:20 a=mboc_azzA43ewT_2WAwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: kmQxY26-9UTqN5Ufc1g4dY4KSQVONqAa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA1NyBTYWx0ZWRfX/u//iuHaWre0
 Qwdc8tSrz7Nw+F4FO4/WR+VGmXHHjWAQGnDa23fYMSIwYCwnZOlNgqNcdlRc3AG1S8l9RlC1x/+
 qVMz90LUxwxP1B9X67kCLJLFiOUeLTgl/wye8gnel/XtontGZBDPGp4DTIsH7D5p5vSfnBLvgfw
 7/PwbR/RT/507rR5QSgzW6ty4MQZ4iuBXcSIcq12S7oQJBD0r2rBOLRuxIzRpDkhaQ+0PsQI+3w
 jRbt6YWRJPtJzt9LiKDNkzDgIjqNZNovMXVgXK/UQIIBprbAG0jTbBaB3e02FucjYfYevltKVTv
 CbgcGr06YLyCllFqogMHZqyjSiVwBRR2u6wMZuniZt+Kwlz/qfwZXhUduz+kLnHFw+cfrWZOEl6
 qJsYb+dw9nUF31eQK0clBKqOCPgZhRbhE5dmiOwy+/IoDSyCFuQTsx+fWBja1GBdRRfXD+b88ft
 zcHfnmGlQzEU0v0kkVQ==
X-Proofpoint-ORIG-GUID: kmQxY26-9UTqN5Ufc1g4dY4KSQVONqAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180057


On 8/18/2026 11:53 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:54:47AM +0100, Bryan O'Donoghue wrote:
>> On 10/08/2026 14:47, Rob Herring wrote:
>>>>> As per the reserved-memory.yaml schema document, the iommu-addresses
>>>>> property for IOVA reservation into /reserved-memory is allowed — it's
>>>>> documented for IOVA carveout reservations:
>>>>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/
>>>>> schemas/reserved-memory/reserved-memory.yaml#L56
>>>> I think that is an entirely reasonable reading of the text
>>>>
>>>> Quote:
>>>>
>>>> "If no "reg" property is specified, the "iommu-addresses" property
>>>>     defines carveout regions in the IOVA space for the given device. This
>>>>     can be useful if a certain memory region should not be mapped through
>>>>     the IOMMU."
>>>>
>>>> Which is exactly what this series does. Excludes a specific IOVA range
>>>> from being allocated for this device.
>>> But if "iommu-addresses" is the only property of the reserved memory,
>>> why put this property in reserved-memory rather than directly in the
>>> device's node? I'm only questioning where is the right place to
>>> describe a reserved IOVA.
>>>
>>> Rob
>>
>> Back from the eclipse, sorry for the delayed response.
>>
>> Ah I get you.
>>
>> Yes.
>>
>> I take your point. This is a property of the node itself; the IOVA < 600MB
>> only matters _if_ the venus or iris nodes are enabled - otherwise an IOVA <
>> 600MB is perfectly fine.
>>
>> So it follows its a property specific to this node not specific to the
>> overall system.
>>
>> Yep, I agree - its a device/node property, not a top-level property.
> 
> :-)
> 
> FWIW, I think it's a proper way to describe it too.
> 

 From my readings, a node defined under reserved-memory can have other 
properties like "reg" alongwith "iommu-addresses". Are we saying when 
*only* "iommu-addresses" is there, then move to the device and when 
other property is there, then move to individual device ?

Again the device may have the "reg" property already, in such case, 
moving the iommu-addresses + reg in corresponding device might not be 
feasible.

Regards,
Vikash
