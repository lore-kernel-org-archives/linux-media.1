Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7109D3AD524
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931363; cv=none; b=Nk6F4X1fDxTqe0idrRLzJyJj3Z/lz4yWflYiD2IsPQfVpf7y1G0QHLv3pHYs8iMykUN0KEEshuBv/JNteHCyWmLxntdv5r6MO4jvWzmNAICfJI+sNBB1nFAbmGVGzwi4SRU1zlWm+B0nGw9OiXHZLTHIU87GKizuRaO9dgADCPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931363; c=relaxed/simple;
	bh=09gwAOIvWrUT011HK0YUkRTcGAOOHymVhnDkjMFHaLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibIQ8/stn7JA9FsNjTmWJuQKciIT6piVuteWmuwJN/MjyrBGvHTgtCmANq4kGrnMhqxGBR/GV/HR6XUQFY0x94aBWp7rQ6JWOCCxa1kAbplT2IJa4zrbtCtP76NK6+LAI/rZu6xsaac+BY6WTnziN+nMepot6FBBqvXbjfBnBqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVzQgizB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOpkLbxo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVzQgizB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOpkLbxo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nh2N507024
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPu99KlXeshTai9DWwRSdh62GROPGEcOid9sYlTAh90=; b=dVzQgizB32zWhKwK
	hZbpSd4oEZlXQA3pVEtGUfO+Yq9I+p3ry/wNnGhmPPWZ+TdlYEo6DfMvisyUpTI9
	Ohb0pUbUJMIPB68IoUXxTyxZ8pOSEi2rlu5ehjfgRz9aX/vsZw7m7zBm/WqAa5KM
	OdpQ/ZjFFYZxFNrLiyviIO3nqESO1MQ1MyO7cmBspePJQctiHi9waC1MWB3k49my
	+PCa1xypPHGr2MiZ+vwUUOmUY4Azyi98A5eofmfQQ2uMnoH3nzV5/koxMleXoE7K
	ZvfhLeALmghy64gPV7lJnwPN8TExBupdkKBzqlkI2BPNmLZRYMm9CPkzLj5rP7CF
	TJwqUw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8gkqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:29:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso29383341cf.3
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 01:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931361; x=1784536161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPu99KlXeshTai9DWwRSdh62GROPGEcOid9sYlTAh90=;
        b=fOpkLbxongQJXeK4K6roDStnUIvQ/Y/rDHLDUylHenmGCcxueoRGReFvMcdelc48AK
         5uBzsCffn3j2tP9BNSNjO3g6eGvEPzFM7NHqqwD27waHuF/wJSCqtULSkgMbbhHFXyxl
         O0k+Bxl783nl8EapIyuiAleNV//43rTEdjFPVbPaL1E47PRxlMrrhwr5XcH8m/YKp386
         6kpgtsqXQuyKVILujgaigW4rNl3MXwv4e340Nvn4J5b4lTSLtOizmCmd3nc8ckaE3I1c
         mEtx13SAPFtIRsU1hd6b76jClbZIcYyyghjOy4ZLy8voKEcEThTTrxDupQZ9YtQDKi6D
         ++Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931361; x=1784536161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPu99KlXeshTai9DWwRSdh62GROPGEcOid9sYlTAh90=;
        b=DQrZHKMpyAL3+EjNP106+kfPyXgkC7pgANUpltBfKMTuyHSTfWBKPmvXpB0L1E01Ow
         ThiuxfIlltDz9BirYWRF3XKM0zr+cXg0tI/mHbg3swGhxuG2b6TPx4ieEKaStXtEko+z
         hni2r4nGqMMpZeK38WPB2JOy3P5NXTVXzbAXSBLCXnISv6R88/SS/kC65JWRvZ6bKmA/
         DOsjQT+Q65b4dpK7kxY5Lxr25lE3MikVJdhHvvwqQ+kjm97C7UWm742pJsPoRPlODx6Z
         9d5x+oA5sAXWIc+GzybiKvemsjaLGpQT27MkECaB0puqu2Z+h1KIIFYsfPX9uaRXhJWF
         wq5A==
X-Forwarded-Encrypted: i=1; AHgh+Ro57w6PT5OCdjufoJSpU+YTIOcYKnYc++EY+mKz9ISH66ucTkHpxMyZK7IiTAfG7PeZv6rSwcNBnGCYMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5p43lxGd1FRJwcLtAZhVPKTPmiqhtWG3VwNLfeUPrBvCYixo5
	+gb0+8vxaKBHlBvLT64Unzu82y9j95kWrZFetB93uH+wI20WZDKZKTEBOqdOmb9ibceA7KhI+x7
	naxEBu4nrXUrVZCuN6upUcx092NjLfh8FO3z7ROyPL3OWYbm8a7cXMS05+/6TObFsmQ==
X-Gm-Gg: AfdE7cknU52rzpfDhTAhIFTzBZ+0VhTEd3VZF1TyPunYnHXFy0ki5JZ56FRnDfZ+6yR
	+nJ+5D0v1sOPep/YkR0/KYBNeVjGLc+oI0QaUfGnI/tJFi5uKDcGtqsfzHLN+s7wXxZ+hIfZNUT
	ZwVuXNaJtVnI1+aMNeVxO8j+82pC2bcR8R4eSJZuWo9arTmfkfRdiYHSMkvMYwjtetJQBr+iJ5q
	RKibgc3pEnsBA0T+9ILkcipxG06IAeDonn0s1byxW2zaYuyHUkFrVTD5nBi/ABLMF/Jlca+R4I/
	cDQsVvyJOsOPoQYdlcgtsuoiQ8+MHNfSvfhXk3/l+CJOalPBuKkYx1+XY3gTtx3aKPO6bsKtbSa
	q50Lgggq6F4PJ2bB+dxOXn8YdNqacla4V6O6pFhZiKAY=
X-Received: by 2002:a05:622a:420b:b0:51c:7b12:1208 with SMTP id d75a77b69052e-51cbf3040f3mr83363401cf.86.1783931360772;
        Mon, 13 Jul 2026 01:29:20 -0700 (PDT)
X-Received: by 2002:a05:622a:420b:b0:51c:7b12:1208 with SMTP id d75a77b69052e-51cbf3040f3mr83363311cf.86.1783931360349;
        Mon, 13 Jul 2026 01:29:20 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d81bbceesm704212666b.41.2026.07.13.01.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:29:19 -0700 (PDT)
Message-ID: <86624fe6-b2fe-49e2-9980-0ae2fbebf108@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:29:18 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
 <7f0c7e6b-e92e-4058-8662-52004625eebf@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <7f0c7e6b-e92e-4058-8662-52004625eebf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cvGYqmaom4yL1FwbBnFbV2U37KBf-hGb
X-Proofpoint-ORIG-GUID: cvGYqmaom4yL1FwbBnFbV2U37KBf-hGb
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54a1e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=giEypKqMxUzoDvydzB8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX1DaR6z9CHft1
 kVrTpgXMf4yPHXsqvWKE1XB1IeA94v3NbtUaLiCbMT5FvfQVhKfZuc8u58RT5ScC6NxfkGYbOMP
 2Q5erYT5zhFqTp900z43dkIXNGS8KY8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX5N/4EVqHn9Cf
 wyMNms5tZ0DG8NvL9fA+vKi33Wwwc2nmzGxd2Nq/jaN28an416NrSgwmG1cimj+tR7HIM3EcbY4
 PwCWJDTQ3PmxrQqzhjuYqfq9hN8n+FgQJ4eyAySmqPanFwRmzbsVbonf+3bXKatN6atAQHlrQVi
 SgmBYAF2WuuEzuTw2Oxe2UeHsUXE7kfixfCBVJVH/7Bg6aGTJcKDj6CfHfEc2rB2HbVRT+ACpjG
 qu2TUxq/iM6qwAny5c7W9fOQLqh5+qzp9ZLGBx/MXdUM4q1w9tmb549KG1tVZCWasTYSB/WxGHI
 SA+RUE5kW6duNxL1Sai/sT58zkqVtpBw8aNA3ExVcqf9Mtl0nglWww/DlKHfhP9nQxjmxnaG6Zw
 uXOg3Yx9X144Zx4L42ciKVMzEAIqijpBImOh+/2+BFmAUIQNmTWTLWCUgMYDBtuxW/wz5q40Dkk
 4zzsFzEZQvbaG+R3vfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130087

On 7/6/2026 3:18 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> Add the JPEG encoder hardware node to the SM8250 device tree so the
>> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 81 ++++++++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
> 
> Why is DTS patch before driver? Driver CANNOT depend on this.
> 
> Please organize your work correctly, see submitting patches in DT
> explaining how this should be done.
> 
> Best regards,
> Krzysztof

Acknowledged. v5 will have the correct order: binding → driver → DTS.

Best regards,
Atanas
