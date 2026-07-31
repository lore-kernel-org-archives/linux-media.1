Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23963E3DA4
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501867; cv=none; b=HastbWC/2eZbc5RlGmykgoUNUYnm4H4b4bklZ82V2+ub7lV4X70id3e4xOrzEs8NL1VH/FgDu199hZjSppOQZRz1TAH275CNZjNutUbdLa69amw/dx1UXDydGXvkOOOO5xDi1FCMIOodJNnqrmYOQ4zixS8iSnkQ9Ikt9ZmPqxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501867; c=relaxed/simple;
	bh=buwbiU/QnDmVP3ZSgK9+kJtoUmj1QC201dBWdkmBAfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpZVYIm/gZE2Xq+AgR5/xpszeKMVa71Ed67iF80rUAdxgKou8g+fsC8vW5ePMcx4o1lGC4tJWpSuiy03s5B0WxmwQi1nSo0Za+KrNWnMHgEtB8GEXjJMS+6UrLRiLvOCVYIWu4qmZj7jDHIpHYoB3qtSLeC6xZf7VuhgGzVC3WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXuxWgBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8p1yZDB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXuxWgBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8p1yZDB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VCGt3e3978407
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 12:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	adV90e68ZwaEoo0CTXVs/OkTtap6iN8ZseHU3dWUaqU=; b=BXuxWgBKwhRdidSz
	TlCcIF8k4sVcBeWUovBIRFLcPhU0CtE/eLc/gQInUKdpFfNzArIB4mxuVsy3U5pm
	aa9YAOmpWFkPF7/ed9+udgO8KrizqM1Vi7hRO2B1hcIKu8WB6NvHndGOWvsNoEIH
	ule/qr8mr4oF0sdKo4wnMe6p+AMib8a+tbIkR12WIadDTq4zBatfHe2J0YVkVCJq
	BUGa3eYjrkNb9QhLhFFl8UeGnUSHu9PrnY4d8nFSZHVogW70reAthMjXKkXFVEUW
	m7V9gpUxilWnFPbKwzQyzlLnmvD8JT76tH3VHg2iZXvttU36NeDSmnH/3L2K7K2A
	U/F9gw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frujur395-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 12:44:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so752605a12.0
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785501863; x=1786106663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=adV90e68ZwaEoo0CTXVs/OkTtap6iN8ZseHU3dWUaqU=;
        b=c8p1yZDBQd4pJJdUZyruHUIDj7QM3t7g6G3ArfHEr7Dv0oTmKc1U2X/MXoP+NzH3Rn
         Hx0XxRSRQHlC8s+jUk+Va/B0uLguJR7HcCtMSd5JIYp4w8dEVOZgbI/tSVBB0fw3iDXB
         QwOTsu1UdS02TCGEyteHD1LUUI0lYS8AGVEvsrVV8FSxV6f2UDWRvPCbweMOfeSmsB5F
         fPPAjN8yO66BiTCvKtHIAeoiGoaWgeulruwJNIB+pDNjMQvd3EW3cFFk8AsgjvOiSWd+
         xG8pMU1eZ6gEyQNypHaGOZOVFzjAub7o184Ja/Loe6OMp6qG5dbhYCjSgB74o1LMUjVe
         DWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501863; x=1786106663;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adV90e68ZwaEoo0CTXVs/OkTtap6iN8ZseHU3dWUaqU=;
        b=GYbHliTiexjOMZWp5CsUfBeksald15jsa25OSQV14WmYjFcZtPXnPQGbdawf9V/T0W
         O9uSYOwVX+2hhMvj0Dmo8QnJr/SGRmDjujVKgxQT8Z06KPuXFbrgIRD9sTSgwzE7+JY/
         tWqdrMy5vasaZnUYHPqzbPENn+GHMmhHcYI98LZi2zfLNq4vX3K4Xp4ZZ0yewf3FG1MC
         dddpFtChTXxVT2RrBhRW9L+TIXITjCR9OaIshMqWio8Rvl2b8eTe6SfQofXZePZb+9re
         lqMAZ7rjQG57yXQeLd6oRQ7mVaTrXh7vCIRDubj9y6NUZzDpg6W1WcvdWwxwKj0EY/wO
         /RYg==
X-Forwarded-Encrypted: i=1; AHgh+RoX7+TsAC9AqeBCUK6RtwmRDFumGJQorO94aTwmorjwyIgGyWan/0OfiTp6PXB9GKKQUPUWxtBi9j2CDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUSbCzOf1Bxee0CQfVVnrrLvZCWUkYGUFaZNSmYhGwr2Y8F1EX
	uwloBodqWF48dy2zaWS4QiR7IcvY/8ofMe5Kl3MRhNQ9Hs0uGj7ZfYXw+dIH5FDiLrlJr3FFxy0
	SQ3wLCFeBaLKRDcv5E3Be+/NvZXsQA8LGXnl/ZJM5GOu7qjsN1mBMzcGvMm60genzYQ==
X-Gm-Gg: AR+sD10OtxwOnCThpG2dZsfxsdm/JLQ1Evug35dWnRol6/6Lyf8w5oCFotAGzE3aJpG
	yq6qmP20eCEEbjaXqwbwB5Dk7xD1a2CqRoIqhxTB4h01e9JZKc5f5bG79JvuEa588yOz6IC8+yl
	G5Sq4JuzbDxvkytFemrMx2ttGL7+M9TJS3VHfU1dSo2M/TgbvPgK9qm270GkXvLSq/eFQDcBynn
	t+QdC7TappJBWyOTvUy57w1uIrTEXg/ay48x80Mx9voQnixNo9rVm6AXtOPtN32orzv3Sz2tA68
	Qe6MB2n+rssZyRmRNnNv+qMzn9qgw4yCYk+k0u6eHoZeEd9/FTAuqNVo/rWmv8yEboZnIQbxgh+
	01EZelnBlKbxJUVLZstYzoq3K8IEvqdKR
X-Received: by 2002:a17:90b:538e:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-38fb1127fecmr1723572a91.5.1785501863262;
        Fri, 31 Jul 2026 05:44:23 -0700 (PDT)
X-Received: by 2002:a17:90b:538e:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-38fb1127fecmr1723540a91.5.1785501862822;
        Fri, 31 Jul 2026 05:44:22 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e47dsm8878628eec.3.2026.07.31.05.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:44:22 -0700 (PDT)
Message-ID: <4e948116-98fb-4814-9262-94161925a349@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 18:14:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
 <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
 <tsxthwcohhrmwvgzg54drdrfu6tzjeszvpsvkpstocxqr2smkf@j3w5qeo4t5y5>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <tsxthwcohhrmwvgzg54drdrfu6tzjeszvpsvkpstocxqr2smkf@j3w5qeo4t5y5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U6Giy+ru c=1 sm=1 tr=0 ts=6a6c98a8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wH_4JSXJLmvH2XmrYx8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: XlooqkjQuobpowUCMqA00PDlagwri1ri
X-Proofpoint-GUID: XlooqkjQuobpowUCMqA00PDlagwri1ri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5NSBTYWx0ZWRfX1E5pqX3ktuLa
 Z8Z5efIK2LsIHiEPDysKE/6Flwa2yydFSnN9OLgK8qVJ/uHs3TPVGfYOAjW5VPFPwEcadbtceCm
 i8/LrDGUInXZ5P7lkWb/+s+Phsoy+38RtXsbDaTU6vITo2tySaOq1Nla4gDkHZRZhBn/gJO4YQC
 G1zh9SigBmi90hd9osRGB+erbcihWT8qo0PEAswdZCWlb9diPuSE6L5sgQez8w5fcZHQjwfkZeq
 bEehRGweYSYhf7GRAdHXL/+8ZI2ydB+aaaFJ2ecd8wJWrMyt1K40UiQJJF67swkOPhgF0JYk8aB
 aiHXJiACfAzyLcry6hKAAq/70lMGE/Aqm9cmqagTzKIjnxSX3sUam+k+8583wYZohe113XNmsJn
 yb4FFwg2jRI37WiQtuN9ylLrWsnrRHe+wMcJRNGl+IQUMWymGlYTSCXLHKexpNOMjccwmC1U5Vt
 lDCcdjVL00jZoJ/dTBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5NSBTYWx0ZWRfX/1IPaKuRVi4n
 gHuP2bI4KMxjK9szmoroRmuMKjTz9+HCk32Xu1qpwyv/mGGHWp9xWHwVQYy3svtTTiWLAvtIwec
 adPjfnMw99tITXbUuAsNgkPd1zOTL9k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310095


On 7/31/2026 5:27 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 11:02:25PM +0530, Vikash Garodia wrote:
>> Document the iris video accelerator used on shikra platforms by adding
>> the qcom,shikra-iris compatible.
>>
>> Although QCM2290 and shikra share the same video hardware and overall
>> integration, their SMMU programming differs. QCM2290 exposes separate
>> stream IDs for the video hardware and the Xtensa path, requiring two
>> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
>> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
>> and Xtensa isolation requirements, such SMR masking is not applicable on
>> QCM2290 platforms.
> 
> This means that there are still two different streams, one for pixel and
> one for non-pixel data. Stop using the mask and describe them
> separately. One will go to the pixel node, another will go to the
> non-pixel node. As you wrote, the hardware is the same as QCM2290, which
> has two separate streams.

AFAIU, SMR mask is an optimization to reduce the stream id configuration 
to SMMU hardware registers, separating out is _not_ recommended which 
again brings in additional register for programming the additional stream.

Regards,
Vikash>
>> Since shikra uses the same video hardware as QCM2290 and shares the same
>> programming model and capabilities, it is added as a fallback compatible
>> to qcom,qcm2290-venus, with conditional handling to allow either one or
>> two IOMMU entries.
>> Common schema is updated to accommodate the iova restriction of 600MB.
>> VPU restricts usage of 600MB for specific streams, which could otherwise
>> lead to device crash.
>>
>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 

