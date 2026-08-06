Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0897387375
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 05:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993683; cv=none; b=sbosZtRpsEkFa/nOuwT9osfvVUDtYe7wUpJMZZ1GATZD+t5QyVMl2jgJixjdeeNHMcYnRejE/HynkixQPZAZ/PejgzNR1+Eu2V5lwqFxb3ULtLujLHOGr0iaUoLXOjYwulS+Ntf76//Jc2ZPtNJxDlDfRF5eI9Ehjv7rdcCxNkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993683; c=relaxed/simple;
	bh=amCW11XtA716wXJvoqPzrYwHUQN6Kiaou/zuF4QKbq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2lGdZLc0VjFlTayHHV4S+DHX+uqb97tTY/rROFkOc+zZshNkWZRB+E4T0v9qPsY1F8Z2TyItVl/DomvXtA32wmnlY6Ozzmvaj1eudrwNr3IT90FgVrz/RAmPLSJjgxNf1QsKP3KxvmEMHgpe0ehcVDxYu8Ct+UM+gi76tXzqj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KezrMOOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b45z88+e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KezrMOOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b45z88+e"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wlbF1070545
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 05:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZBs9/Bh2UiS1MjiVD9vmB4pwQGN/Wapz7YLt4/PsfvE=; b=KezrMOOHyLrZ1+HV
	ozLsA45ouP8xW06m4hHMETw1HvuEKHNKwXx7kQ3QSLX5KAVnHROBYIhj29m3f1YZ
	ftfkd7zlA+rYAtNM9FjIrfkAp6JlVLeHPgeE7tr/1VTboMOyWdsNyHAG0vqczxFz
	742YsKC/5kVBSPXqQfRr4weQgtQIw+b+3UNEIWSh52ZcjrjFoqVEduluhg9x/SMJ
	qSdA+IeeLDpuYuMIfVX11aSH/0SJMBPiZbo1RNctAsZEMV03hhjFLd6Bn05rWBlK
	Jqa9Rbnyv3vxr/g04GH7un1R5U4fDR8J94WZc5G6SiuUd3IS4HIWdCOztlribRqe
	y2SX8Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud084b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 05:21:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1589507a12.0
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 22:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785993680; x=1786598480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBs9/Bh2UiS1MjiVD9vmB4pwQGN/Wapz7YLt4/PsfvE=;
        b=b45z88+eNUvgKHzo4jZsZCk3f0XFpeBOaPKAGvLhSD20wDQJ7VZT24dVMU9AP95bi8
         p1uQbk1jUs16MtJ08pBj33owGDH9UIukVsYjrnyPDkWsZFxtwxr8mWVrU/8HouWoi0Ak
         zGPknTHwON4/Tzg1rNyEe0rsdexLU/3C7rhRETX6YfQT/dNZc4upApLWPKe6SXTQlPUr
         YWqQ+QTHdRGgEUyZ/+JJNGizSzkQ5pcWioUk4qN/eHIxMI53Ap8rSkKihVJAPFw7+R78
         75UJkm/ItqGXQyfZ8oaFc2j1UAfddzlGvygagp6MryTECoPMrldurXwBhTNHoNmrUs5c
         gBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993680; x=1786598480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZBs9/Bh2UiS1MjiVD9vmB4pwQGN/Wapz7YLt4/PsfvE=;
        b=blEoa4bQU8pLxogarm8Dy1eoY2EPCmsGRbkiClsN3Bu5xEm9rpA6bdXlOZDd+7GtaX
         Sz8L4KEpi/62gYFW70y2Aed6al+6LbOTwRm9P1ijQUpj/Jqb+qKqo0UMRhK1aKQI16gO
         YQWgh5gTP3MMUJjVIofb17kQLRkoxx5db9Sy0Cq1mPElWwbXo4Azh1xtYnUIcovvj7gH
         NF9bv1ZWuldv/lwLZKqTYZ1B5bGAJqQbdwxEcf9qbjYoF5WfEYP8Utebpv0kJ73Xp6cK
         TqNvc+hW4Ss2o+VE9sNKz3ixffJ935qbSzqIFZdTR2iUGWg0U2TsVqaQWaqCxEBOKKo3
         3U9g==
X-Gm-Message-State: AOJu0YwRgcqhuPkKQmzXNuzfq0rUtecuQxE/wSczzuy60v8QOASQGoZI
	MdKOnhpGXKutbXy01RG8cx8j24mxI9wOusBhNMrtqrdb/pODsWkQwpAkzk0x/jFc/mUyRBPUIBg
	nS6tcO8DiU4i3YgT+UWtCM7KqVy4PT7ONs+tUbxpafJ00ZJ/WXOqNNlWGJZs97+dWcQ==
X-Gm-Gg: AR+sD13kDYFii9r0P2/9YyI5Ov8i5pxM7cRNmeFg7fnT98I+pkr2m4t1tMwEAlYwwW/
	Ie2Yqsb0t1DyU/KsBuOmj/Wvem0RPX9oGklTeImy98zYmmCOpgX/Yk7MoW5Ojou2xxMWKEYlE8k
	EpvFPg/21bOGaNSXBMGSnoYgDrTIH61FFMRbFJpbJIO5H34I5PtyrSrxgN0uuCPJ1rRLiOF1BiW
	/LGRRtTqKn0+X8WM80B4HGn5EwmOf56wGx+U5AWROtrJV3ZF4/nNOebGu/vhLLydr/HKgolw2Re
	Y9x0pvZOS0JvkOosausudfQI6Sgc6U1plU1m+jN5LD/+hE2v1P7+twBsu3pE6xVS6XQeIAmDEc7
	tbCy0RTznxzLYLVq40bIHcB6mYw3soQydMQ==
X-Received: by 2002:a05:6a21:6112:b0:3b4:e4f6:4f15 with SMTP id adf61e73a8af0-3cb85e9922cmr14991453637.5.1785993679932;
        Wed, 05 Aug 2026 22:21:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:6112:b0:3b4:e4f6:4f15 with SMTP id adf61e73a8af0-3cb85e9922cmr14991394637.5.1785993679511;
        Wed, 05 Aug 2026 22:21:19 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.140.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b76cfsm22135770eec.4.2026.08.05.22.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 22:21:18 -0700 (PDT)
Message-ID: <d0983bf7-a708-46ff-9f86-f94fb6a92ba7@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 10:51:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <futJwsC0VjGSkjrB5PP9T0jBOVgWADaDAYyRRp-OZifaKPNtjcnnA59QJaQTdqYTeayZk9jY6e1jOfun71Yp5Q==@protonmail.internalid>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <689580d1-8169-41cf-a954-927e10135700@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <689580d1-8169-41cf-a954-927e10135700@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAzOCBTYWx0ZWRfXx0qJnL2YLfUz
 dV1DqFDUAM84BCgOtqqzoS46XN9qHgbnNa9Gq6u1qwYL93R6HcANRrXMe+SgbVDPm5XmnooR0Sp
 cWf/WC+1n33sGrSXofsLuUWukCWV3D13i1NunKJZJvozUUleTv+xWi9LdBgi2pFZiZAoj9h1rBB
 9oRI2seNbqDzuleTzLJ7Ae3sgLCyZQi5i8slHjeDXvyQT+LMBnfgds34vd7bIfj5PiULU6YrlNA
 6gvBAcjgU5azjAZxnavPO7frgYA7wis3NSKg54apbTXQsmKDvMs+3fzAxobfjeuZW7LfP4Titui
 s6bolP2uSh2aGt2mbscjQ/6wGlTg37saMnAk60KEnnfL1Rb33hvA35uOfvdISf51GJU8cK7EfiX
 1mhUpA3WQqS/hQUxuhibp6w28Fr5XUVNngTgAthWWF0dVNYu3EvQ8EMNlqbWuOprfudOFIllcO+
 WmY0SEHmQfvVaYR2qHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAzOCBTYWx0ZWRfX7UA1q+f1zAT6
 WhSG2oLTnoRzcyFQ2YaR9oAwaJuzhVVAPpy2v0C+Sa/EKoDRfevEbXmvbhLFpRipRVzKvI4qKiN
 09ydVHLdikxO09N51Ns1yPbuFgXtUuE=
X-Proofpoint-GUID: _7TAgeVKMs0czud4ZlUiuMjulabyaBbj
X-Proofpoint-ORIG-GUID: _7TAgeVKMs0czud4ZlUiuMjulabyaBbj
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a7419d0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=kGzeRs6aa4G/VYrSuZk26Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=g2j97YndKkMRmPxWxGQA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060038


On 8/1/2026 3:36 PM, Bryan O'Donoghue wrote:
> On 31/07/2026 19:22, Vikash Garodia wrote:
>> Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
>> Cc:stable@vger.kernel.org
>> Tested-by: Daniel J Blueman<daniel@quora.org>
>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> 
> What about venus ?

Plan is to get the reviews for IRIS3 family SOCs, once we have a go 
ahead from binding/DT maintainers, i can either bring in few series for 
remaining venus and iris SOC family OR do all of them in one single 
series. My preference would be to add in multiple series.

Regards,
Vikash

> 
> ---
> bod

