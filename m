Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00C481ACD
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 04:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321744; cv=none; b=iNBhHNK1+0IMbRUC/W9o2ribRZHUs/16DscWDTSYauneKuL15P1P3U62Fhji+WiMu+r18izgW5hWob2yk7aF41lQP5p6ZXe+ONOn4zT96sW0fTCAyN5L1epG1JzYveDeW2Q5kMPjXNdHRO048NzLC0+0Cl5KvXAADHsaWLBDQ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321744; c=relaxed/simple;
	bh=Hw1pCWbKjons5MyktJhlnowCAcV8eFfeJO77b1R7qgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7CXYFg4B21whWPc1VszeDJKNE8UZTCrRYpjmFtXBQbNgouYPvQcb+3KlkSkUzsF4uoezbGBwFy5wVns42iWXTBxxTWfUb6+1PYP0bx9k9BK0xogijS/6r/SEj0K3+b1cqJ5UM4GZe3DzOoMtwTt9gM4te2DzXhn/TYJBz0WLtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brKuIfk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+EXNpg4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brKuIfk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+EXNpg4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTHsf2982852
	for <linux-media@vger.kernel.org>; Wed, 2 Sep 2026 04:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5fDoURdpflwz2Lot3I0jQz7fHiBVI+TpV8NMQd4Aio=; b=brKuIfk2shRiR1vU
	1HoUrB30jg8r6qidhiP/raZCoOnApbVO6JIoNayQNtcNRihs158l+vNd4Y9wPPM7
	iyvtnB0gAJcxPqYA6T9b2WypdV2pWceF7yp+iwwflw5PUzYYJHd5CqWbk65g8VnR
	lR293hjd0EnHJ6ctb5y0GWpJFwilF6ngLkPflIO/XiTg3IEPjVBwBSrxtBTmu4kU
	r6uZUn/8ZGDItwY4Fw0Q5l7OvBgnxJ1RUWLRoxR3yTTp3sVR/1OXIg5P0Drnx8Cs
	wZWSkHXrjMEQoRMiU9X+i52cn4bemuC19oZ7VUNiwUXDEHVjuWBgN2HFTDn2JoTY
	f6etUg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge35k21na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 04:02:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso508310a12.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 21:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788321742; x=1788926542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5fDoURdpflwz2Lot3I0jQz7fHiBVI+TpV8NMQd4Aio=;
        b=M+EXNpg4jyjZ01V0KyvMhqi0jrCI/NYSoqlEKLHUQAWXWOJTQoQIKnZWb/+aSOqmOP
         G+tp70XkB/Uan2DneOvcymYYWUKu3gukrXZaN1TiHUhZjsGrWtf5KHDytbUhckOuoU15
         VbKFshKB5XqUpK4oJwDeAuDfR5EJzJFxGBHVOS2kHRuZrv2z90jqlwGd/qvy++37rHGp
         sM+wp85iTLGUEVeZcvQCCRP9WYDbGQMnZPnW0JLBXIoPpgu3cM3ZAXQkVR5Hp2BVAwyt
         D6gYK+3RiXCQaZ8iKrq0LHKVm6wm4RKKyMawsK7lnne/beosb14qdgwbcAYO7NKXxbpy
         u4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321742; x=1788926542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5fDoURdpflwz2Lot3I0jQz7fHiBVI+TpV8NMQd4Aio=;
        b=gyDrQAVuCd015kWN7eAvaX0w5viJFPXr5HtaP0pA3GBK3mp2QEZEmD3czYDr+umfKL
         S+KVaTxIV+nt7Ct4J1aEn8VPZ3jUidZcCpa1NbtWW+Tq3GGlQG/8I9y679/etF/W4yEp
         LTx/7zAcIYWw0RZPJCj60ZUa+f1MID4XE5rTDsDrAniQbNS5qRzI8pA4d3dFl2l/ayDp
         ASjejI5cn0EZk4munIBlLaGGhaDhkJjIjnxa/lMhiWFDntfTj/lUt5oPAmceRjBgRosO
         lC+8uN+DRnILX+vH/EkSpstUflaygSilCZ+o5Ejc8fAA2Hgk9ns89PG2liqbCvhue8kV
         Qvuw==
X-Forwarded-Encrypted: i=1; AHgh+Rqb9/SC40sWcbIEDJUiYwbW1h2eRmcm9Rh4yvuDu7pUh9BS/q3R2ZoFkFtMWJj+I9nEqJzNotcPv2PCoA==@vger.kernel.org
X-Gm-Message-State: AFuF++kqAWEn5yfBEo2PObLJ38Q5sEatKRCLuLDs4H5onWVYPO3T+rIg
	ts1VVTF8xiK1zKLSVTKKQyO1c9iC31Sd/mU7PuPPxp7gnIxu+/N/0FJYMppUv2QUjooVEWaywiV
	f9eSckxktFrRUaU1WZHpTnvESHz9trM/fKRGqZEygbA8PH2ohxeiM3YbBYBpwOU3/xA==
X-Gm-Gg: AR+sD10nt+M44CSFY/3BaIE4x8RwxwICuRocakxdY/IKXeCLKQUToYVqEKZeHi80oqj
	aNNZvkeEcErIeX86PcsV8pzfRqwM5ePFR5chYIb3No2rUiyHsj5fvjA/+fmmKZS+tmmQGNoeWcU
	UaotnpVSp0DPtkVQVJupuWFX19fMuBAoreGak1y0oJJ3H6QX27lNcKMXRpTXortAwEc4TjuGXUP
	TyODHGxMv+dLhvVgaheR0U7Sx3toi4gzEm0RoR+B64pDMXsGiumm8edbbYAmgZR2beeNp2/FXD0
	f90sm8hxMUTrNHl8AQcGBcrz3bYxqAQ/g4z4rEs1U/RwNNJRhP4CYI7vJXeAFeBrA56X2kN8OLS
	b2Dpt4Evw87He8GH4wtBSHPU2x+Pd0lKPdjTwtS1oXgvQQot6y0C6XyQ9hYgd5a6xSSj8kWA=
X-Received: by 2002:a05:6a21:4613:b0:3d3:af44:ee12 with SMTP id adf61e73a8af0-3d9b0922531mr3227987637.27.1788321741915;
        Tue, 01 Sep 2026 21:02:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:4613:b0:3d3:af44:ee12 with SMTP id adf61e73a8af0-3d9b0922531mr3227931637.27.1788321741477;
        Tue, 01 Sep 2026 21:02:21 -0700 (PDT)
Received: from [10.133.33.209] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc34d03b5a8sm377772a12.26.2026.09.01.21.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 21:02:20 -0700 (PDT)
Message-ID: <c169738e-33b0-4e06-8c9f-587f5c1afc46@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:02:16 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: iris: add firmware debug logging support
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260815-media-qcom-iris-fw-log-v1-1-c8a70eb08849@oss.qualcomm.com>
 <80a8ce4c-cebe-154e-71f3-d12fa88c9de6@oss.qualcomm.com>
Content-Language: en-US
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
In-Reply-To: <80a8ce4c-cebe-154e-71f3-d12fa88c9de6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAzMyBTYWx0ZWRfX/CsapGqbXLKY
 TplfMI6D/L1sZNjcAN/VwwLOAm7GevpIb1W1U/+mLuSC8dKOOy6QiLYZk31VFDl4qe1feWUU9FR
 kvvT/Xv3Oahujp4cFT54wTjRxk3QJPwT90JOaOTIRWt42/Vkwn0PUiR5+cSeM6b/qsuupdBj1cp
 GRNsxGI3KkhlReO/GaTULnwJycB9dKWVCzBNPghqEi2tGOzaYfvYHw71XQwWUf0hbDLYUXflLka
 U+iNNsCTeK0oaYZhPq2pB2qexX9aAnD49Rg7TpP9xWgA2cHVCBEAe9pHh7xOJbt8i4p/IdtTJAa
 F4mYD8WQgYVMzIHHF6VZvCWSE9gBdrvx1ml1zGDDguuQhXEbjOc2bzTwZIXYdnZbE05/7vg2pJa
 3DdvwQSm1g+IPNFxKRAdR/BbgCkvR1cv3JbNVC4n5cpwML55TMAGNTHEG5OK3Zxa4V/uxrjfcxy
 7LeGF2oCPI+4qFFGFRw==
X-Proofpoint-GUID: Nj-UaiybUcq3k9Fvp34jnTE73IjGRY_C
X-Proofpoint-ORIG-GUID: Nj-UaiybUcq3k9Fvp34jnTE73IjGRY_C
X-Authority-Analysis: v=2.4 cv=VLrtWdPX c=1 sm=1 tr=0 ts=6a979fce cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=SqRly4UM2iiU9c_N8OcA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAzMyBTYWx0ZWRfX0dGfeqgAvg2H
 oJQAm1SkA9FXdy0epKzKMCb/IcfB2bn8a0elZ0G71UsYsas6PaFYQhPOD8yA+J0tdIJzXYEQRf0
 ZP6vos1Pn7mU1pKyqaswawxfqn5+9bk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020033


On 9/1/2026 12:13 PM, Vishnu Reddy wrote:
> Setting the firmware log level to 0x0000003f may cause hardware response
> timeouts due to excessive serial logging. HW_RESPONSE_TIMEOUT_VALUE should
> be increased accordingly.
Yes, but this patch is for fw log feature, response timeout value is 
performance issue.
I think we'd better use another patch to fix it. What do you think of it?

-- 
Best regards,
Renjiang Han

