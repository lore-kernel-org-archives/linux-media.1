Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58132E6CC0
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192874; cv=none; b=TeRlYzBpGMDddq/vbb8is6i6OxhiOmuT7pcfZpUB3h5rgw+pmW5PFwKyaqs/02/zn5CciIAwInqmgCBKI3OLL5wGTBUQ756jUdySB/Yhf/rp100vTJy4M7n6vcTdWst63/MmMKF+jmmiKrugNqkR1+MCupPFKi9ejYYDWU/z+/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192874; c=relaxed/simple;
	bh=gZisI131OsW1JOfB9ZtrAqnDtGusGcVOsUKQdK+pbOE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=O4TKmYIpn1HlqA+ZPaTuBVsvVP69ofwO+UF8NS9tky+nrz6Sk1/wqfNgG4uSFIZ53LSaTVd0lJ77j0+B65644MvQkg3Grb4FS1+m/DDFAGIR9JsaKdtj1fuux28sySK2eeeBwIdKTvc9GXIGE4S7vf9vLn73tNxx1VWVNTlR52I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmxgVxmu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hr6zErbS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmxgVxmu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hr6zErbS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DWW21994854
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 09:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cuy1oYaAtubcYKQKuKf5EG+7bdtALDSZBRiiK8hfI7Q=; b=mmxgVxmu26fymKxx
	k4DN8/I5q78sOqklkyn5lf75wVLpPMVXBozHESeDlHPRdWQoOrcjZNBXaZj7JzLy
	VN8t34mAlZiWq2de64gnDLC3fxMw+otiQBLqmAT8jrDpUxXnN6dMDr+xUM82KskS
	tyWENLgSAb40JfkU+Val4zx+s6IuXni7PomvTZ9gvNmJXSslACYwTB1U7ZBRGj0r
	Y5GqrL7fskZXZhp2IZKl1IIlLIhOqsdANtrbSXq3JASzOhNHZeYAt4zoLzfDCTbs
	uDlY47bXinMN9MJed/khXP7jyUB4V09XOiQxNsPviDEmfFzTRJ8xN2OmKXUA/p18
	sQWtIg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqjx86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 09:07:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so9060922a91.2
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192871; x=1784797671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cuy1oYaAtubcYKQKuKf5EG+7bdtALDSZBRiiK8hfI7Q=;
        b=Hr6zErbSCfC+dIAsCmMAHuLef+DbE6jX0u+aPKnWofASJxkzu/GnSjsXrXkSw8ra3a
         9FCPojIkm6Lj1X/B9/5e/slo9aAfsHsA57T4WTpHN1C2PkKAWOklrHSvmKOxF/fE1fru
         f8XKhyeTJkhJ5HM+a+MeG6NaGgHAfTA7iIKJjHsVJP7W+XG8wo/XBMnKkw9nw8S1vrsF
         VE7uKCMpsT/eJII/HyhYdrzufTHGL5/hm6xzztangr0WJuMUuGY7q/ddJfR2ierH5xNq
         0dWpGYYAui1kLtadFrlsL7JjrwK+vi9jwUbf4ZGHRBbAQKx91hBuALqjaxLGpJMBnot4
         gNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192871; x=1784797671;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cuy1oYaAtubcYKQKuKf5EG+7bdtALDSZBRiiK8hfI7Q=;
        b=ol5EXDz5e8l2ViTY2bV7aJ6bNE9Q6D2WwytI76WD+PA+sOvffgZvNNLacmNWeJP2q1
         j4fjIf+tovzxg1i6LQkfukzY3qccE+C/BMbscaEygszUqbKkF448A3Bsqw7XIW23ijjX
         wVlshAK00SZp6wLjniv6ok5Td5/4LjKbF+8I1KdcbdalfSEGCmgpAmZLBvvtfsq7P+r2
         1hhBhJp/EeTgaMzKEZzsP25vZ2mBmeIcdlID3lWbbPSK3ZDkhhBxCYwmz+LGJnK8VIN4
         LgUPe3oXeUv064GWf6xOEHTWPKBfabyjNm8sid6sVVntD9+DkNO/kqAP46VjLpq6rLIu
         oVjg==
X-Forwarded-Encrypted: i=1; AHgh+RoDJwgaj7z36eNFNIfazW+PHvxPI/D5u7/kXad98JOVBh784a8lpXax5Y4kLcLe5psFRT2x4GiT/JNtLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiNsNHukwhHWQ1O+cFeWrwZX+XNrvUkw1Yo7oGIePD6JkFHsG7
	lO59K+9Y46k38MtD+yWC9jGbxdHW8WEuNzRpXQELV7/hlGweAFCntQfl1Fs4HRntWdu1acyYDUD
	fRJyErsfz9khv/sCnOcBOgQM8VFzNq2Zk4dXw+H+6UhIPJIUG5aaw1iQMc0PI7UYgeQ==
X-Gm-Gg: AfdE7cmpgO8KiRhRtNG0jbQHrejJKkqzpcX5h4Rk17wFU84tgbt+uo9oQou8Tfo9XK1
	7ho3uOl2sFC1H4c8pPQyVVyaaPtblC8f//csVLPE/iSdMJCox7Vf5Iae178t/IRk3O6XcpezSje
	Y3nooaU539eq3DjcJ/BztFl+4vo7pOyRbaMu25Ts/Y+nYh7NkvSL07I4BYBy7pFMYqJDtQPS6NL
	95NFdkHYQaMn0Ks4H/a229Y1ulJ6CHt7YShdr971ZkPSj4/Dc9gHM9oww5GfvnEnKC+EdNINe+N
	REab4ZdYJ9oS/fLK25+6Z9ukciciZStabf90qPOEjtoruoo/GJUSwoSH0OYyrGBljXZnQz4PFNH
	QVqtDgxx110JPsrnO5CNdjll16Ycc1+uw
X-Received: by 2002:a17:90b:5825:b0:381:dc88:7c09 with SMTP id 98e67ed59e1d1-38e1afe7912mr9768144a91.33.1784192870620;
        Thu, 16 Jul 2026 02:07:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5825:b0:381:dc88:7c09 with SMTP id 98e67ed59e1d1-38e1afe7912mr9768095a91.33.1784192870090;
        Thu, 16 Jul 2026 02:07:50 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e4fcd31sm10601985eec.4.2026.07.16.02.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 02:07:49 -0700 (PDT)
Message-ID: <3128bff0-98a6-44d7-a390-27537e74e9fc@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:37:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <63t_fLehIKEom4-JPN9kAGFEjUG4_yFoHMhB2aEAppwPHb2oPbK666eGkGgXxEAHRJnfTRRUwuf2EqNRYe_gjA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <5c8af0d5-2477-48ca-bd7c-0f2475a9dd62@kernel.org>
 <xrfd2dbhmpiy7ftpztcswba6iyzt3dsajqtr4fpq2iyn6tbeny@4wijspe7n2ig>
 <00df448b-b492-4c85-bba9-84753825c265@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <00df448b-b492-4c85-bba9-84753825c265@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a589f67 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=Rdlk7PUvzP16AkN5vSYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX0xdFmbLaYCxc
 rY7b8lHZScBwOMzBnGoBeOFCmSmN4P4AzHFs5Syj2WKxmZCaZDLHYXAcPVCJ/N8e75hiRPLJ/kz
 fk2h1/YHTpeXUcofEUMfpCaDI5hQono=
X-Proofpoint-ORIG-GUID: OE-fN8lqcRoJTSIh5JS-9NLCzcexXjet
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX3xrwJp47BVGM
 fbLul60MUwhlj0v7CQ8c43SuPEUI6f/0e1T3E/OF8CqxLeoM5HBXaMV1mmman3OE9evoJcNzB02
 Upruoi/T+kPZ4t3XGbvTxu2f1RPYQGtHEmMX6uyfz9jJE4KfBqjhi7BjCsbZipAuYXsSQzOx0TW
 R/K0dEfyWu/VQPF0ufY5jsUB6/+SmAPZKTBE8WNPG7FJHTDb4xKb9KiDJVTzVuX/tteq2cJINDT
 8jE+pC7jqFrMH2rSubZWTw8V+c/OVZzWW/nx8hf4vVPqBrzxFXc5o+NkFr+LFkIA7k/MgzQjqZo
 HUN2P38NEMtiWdRxBaF1b+O3Dxxt0mpHHgYs1E58Aq7wTto9ZC193HbevhGxLhJdFjvoeQz7Pdu
 rNzaRqqfSHi2LQyKflLkT1+XyHUCaHrvcdhLAFTMLgXC7/MZbAY7SqCPN1ll4mPzBwsbseVny8T
 tsHSqkgmqyQAUgzY4wQ==
X-Proofpoint-GUID: OE-fN8lqcRoJTSIh5JS-9NLCzcexXjet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091

Hi Krzysztof,

On 7/13/2026 11:32 AM, Vikash Garodia wrote:
> 
> On 7/12/2026 5:49 PM, Dmitry Baryshkov wrote:
>> On Fri, Jul 10, 2026 at 11:46:58PM +0100, Bryan O'Donoghue wrote:
>>> On 09/07/2026 13:35, Vikash Garodia wrote:
>>>> The Iris VPU has separate streams with different IOVA constraints. The
>>>> non-pixel stream must be limited to the 0-600 MB IOVA range, while the
>>>> pixel stream can use the full IOVA space.
>>>
>>>
>>>> Using a single set of IOMMU entries for the Iris node does not describe
>>>> these per-stream limits and can allow accesses outside the supported
>>>> range, which may lead to device crashes. One such issue was reported 
>>>> at:
>>>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>>>
>>>> Add non-pixel and pixel child nodes, move each stream ID to its
>>>> corresponding child node, and add a reserved IOVA range for the
>>>> non-pixel stream.
>>>>
>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> The thing of it is, this _is_ a bugfix - perhaps its not one that can be
>>> backported, actually scratch that, this isn't possible to land in - 
>>> stable
>>> realistically.
>>>
>>> So what is needed here is a strategy for fixing -stable.
>>
>> I think, we need to start with defining, which platforms are affected.
>> sm8150+? SM8250+? SDM845+? MSM8996+?
> 
> All platforms, including venus.
> 
>>
>>>
>>> That could be apply Daniel's patch and backport it with Fixes: - with
>>> mainline then say applying this change and reverting Daniel's patch
>>>
>>> or
>>>
>>> That could mean some other solution for -stable - up for debate - 
>>> what's not
>>> up for debate is this series needs to _address_ what happens to 
>>> stable for
>>> all of the target platforms - and then transition mainline to the new 
>>> and
>>> shiny way.
>>>
>>> That could mean
>>>
>>> - Applying Daniel's fix with Fixes: and cc-stable
>>> - That patch needs to be extended to _each_ Iris platform containing
>>>    this bug... all of them I think.
>>> - Updating bindings
>>> - Updating DT with new method simultaneously reverting Daniel's fix
>>>
> 
> Ack. The proposal seems a good way to me addressing stable, i can work 
> towards this.
> 
> Will wait for couple of days if there are any alternate suggestion on this.
> 

I would like to seek you suggestion on handling for the -stable branch.
The approach proposed here is;

1. Pick the workaround from Daniel, and mark it as Fixes: and cc-stable. 
I have the series ready to post considering for all _iris_ platforms.

2. Update the bindings with subnode, and at the same time, *reverting* 
Daniel's fix on mainline.

This is due to the fact that #2 might not be easy to apply to all stable 
branches, #1 would serve as workaround to fix the bug in --stable trees.

Please suggest if this is fine with you or any other way you would like 
me to pursue.

Regards,
Vikash

>>> And I do mean doing that in one progressive series - a fixup for 
>>> mainline
>>> alone isn't enough.
>>
> 
> Regards,
> Vikash

