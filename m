Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898F63E49DA
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553173; cv=none; b=BflOUMTY5rDFdJsW884HYq2X7H7cTkadm3to+AlsOuTMgxPVPU061aCruCETB+nBwHogIfi0wljuayrQP5cMVrR2N1pla7nPco8bp4TDz/nCN9WD/hxfvtuN3nQo8Y8TR3CU0ViqcwXO3jHAcxHJMFdNp1a6166AhQAPUDgpZio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553173; c=relaxed/simple;
	bh=syWg8sLJMiMY3ZnaxoaIqM1ZIb7QIUvi5ZvMkQfPIrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnCvlRPGfSvk1Tkp0rewoAqTUNE6batcbk6bsNlQzvRPFDm/ZZ2d5cNKWMSks/oanIcGXtWFu6tUA7B/bl0au4nshDVszu3OEF6sNtSCg5oJuUqaA4Tu8UWxk0MpZ75E95rZNoJGMC315YEN2u/r1uTgm8rU1ckdpuf5fsPZZow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQkGXMis; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7z+lFfd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQkGXMis";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7z+lFfd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R57Q2058055
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 06:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zsWuTk19AfEdQatolBnlwSa9JrBBEN3NWLkZB28HQ34=; b=cQkGXMisLAMbwHrA
	Pr/3HK3FygWdY7riRf/M1xY9oDlCJmpiZtCmr7JvyTiJbPJJqotlW/wq3C2XaIxx
	996HTlan3FvrWU3oJtCaq8p/KmwvhqfrXGcHK8qm5Gv/fLxhnOBaEyD07y6LqMAc
	pu+JI4zG/b2ZgtCAEquz1Kk1qCCATdHqBXeowcNqb7oOX89jYzlyScYF+E5cPqs/
	dx6wK4Fp5piDCAAlnI9PO1jksfGQeLkVry52bZSWtMVOYJyHPQVlaytiR19E5pYr
	McGtI42e220nul5taZs5eCb7JTmdlAFpkl5FZBRpk6+wPmgeT+/WmT4yu9ZR1FnG
	ojyK4A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr0w2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 06:32:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52845bd815bso6090541cf.0
        for <linux-media@vger.kernel.org>; Sun, 23 Aug 2026 23:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553171; x=1788157971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zsWuTk19AfEdQatolBnlwSa9JrBBEN3NWLkZB28HQ34=;
        b=E7z+lFfdU6P64mvjwXMVg5bs8+57tIEnitqEI5pqrCXSMbCutHiT+dFrgqaV9SqKfX
         9VsH6XFwXtjUtjVVocdf4UUA9IVN3bQP5SkkzWewXpgdcQlLv8QMFnH7ZRGDBpFIWMV0
         Se+LIXqXqOu0zf3pDZBGHTje+hr5wUVNbotQCuppc2TXv2dk8nNOOHUnfadiMbnuV3tF
         8zcq/Ib8MP9eh4V3a144B2ZSuepfxKmMALVufuZ5bKfL4rPBnpMfu9qRaEwtJa4rEsXd
         mP8ukyMW4JKgpzRLnobmsLAdSaVjHRBuwFvg9Bu/2YcO41hEkiM4G8SxfxRu0BC384fn
         bFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553171; x=1788157971;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zsWuTk19AfEdQatolBnlwSa9JrBBEN3NWLkZB28HQ34=;
        b=GBvtkEQezC7eGTxMfJbe3SjzSZtK4FnByXQUZlAjso4iTf4Y7CsuQAzcMZX+tEIU5C
         eN//MyBFH5FNBTSsC59T/5+FORrmUowP/cZdjlrI+jJVBkBVfCdvDyjTfP91O8Vk6MGW
         SzR3QBcQMQsWK4/rY/XGkI/P0z83T6OkbBnvo00AdFnk48nyoFC6eoeeefN8BRdkK2Dk
         KKXS2iJlz73TlStlV7EFKGY1TFMPFgd/RxOvDH46Ck+wKTWHFO4SgS/jARup9APb0wn8
         aWQIl8v9q1K2vU3R+DDVJ7kpF643xBLOWY8lN9vO0LEpKZrs2hOJjNoyPZQJRHEy7+z9
         b8VA==
X-Forwarded-Encrypted: i=1; AHgh+RphDFUfbRFWdYzN+fmtlAmSdQpDrGabwqMBZbLDYGIlRMtakv7uj1ra0/cb1rZ0n5NC45pyZbuXJOKFKQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kn/vk5RD6xKFPS84eMSumRfHxwjc3BUpVzJbSAjDh+Zv+MOrym
	G9IsRkMPL6etEamKvDj+Fozl2fIyOdzA/Tlk15YD6DS1KQgHn6SRoGoeVr4BIR8LGz+4Zp18ZnF
	f9QSFPOV+CjM8T7SxqL/KOpoZyd8n2gyIhYGBvbrITspox3njtM35gR3tA4D4Thaohg==
X-Gm-Gg: AR+sD13JdfVktK+Vpor3GeAIbNE1+Oy2Wnymx6Kuv3Pv8bWgKxh8YSeimdpURcYkHEn
	07GEjJW7A2euErcawjZzEun98Vs4Qx+efHcz0WL057ZusUj3jzFunlpAFYGLV6GSQYHPPMb6gp7
	sKQaTmHRG+eDVS8M/LkANqFH2DLqIUUOkw8sQ0WQWepwY1cI2D3jFnv1/FLOhU7SNip38auMS6s
	IpgfbG5c7jBL7meL5+Rhq06V5g4lSsFtP+aYiCpbrCZJISq5N3u8LxbILp0Ibedi1zGMQOINFZo
	MugvYRKQUjIspKqdUbkWQhYiBJAn6uunimUOCgQ/KjCK+YqJdh5WDCvQ1DC9D2Gbiaj6QQDuhzD
	RpQnjpGIksEjWh3dfbfd1qqC0
X-Received: by 2002:a05:622a:1ba3:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52df567630bmr175223991cf.1.1787553171069;
        Sun, 23 Aug 2026 23:32:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba3:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52df567630bmr175223721cf.1.1787553170623;
        Sun, 23 Aug 2026 23:32:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a2183sm1060232966b.58.2026.08.23.23.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:32:49 -0700 (PDT)
Message-ID: <95de411b-0b6a-44e2-b343-fa557a917e9c@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:32:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for second rear camera
To: david@ixit.cz, Alexander Martinz <amartinz@shiftphones.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260822-dw9714v-v5-0-502bc7f43b8f@ixit.cz>
 <20260822-dw9714v-v5-3-502bc7f43b8f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260822-dw9714v-v5-3-502bc7f43b8f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NiBTYWx0ZWRfX0vHx1ItXj6XF
 a394g6bi5xd9IHh/fHhRuRwWzzYmMFDd4hyZRrGsYj+SbOsjXNS6/qhYvRHGpk3J20DwJBwt1bL
 fjiiOCufhTUzl03MhwWJuJ/PVtgpexmzsO9ADlKqWVJ5ewgKIxD5c3EQG0eD6TNTQEt0UniWppj
 74lfL1s2CtEctdW7LGmve8QVHWn9lm5y6+IvE+vBKpVB/tOlSQ5+g7204vCDQGGCgqgETziIfOm
 a38teDrGANqLZIE+Tl4NdRMNcbW9Mo5jrNB4VNqAM0RIu50rZ0lBcrgSB8Nm+4F9rLChdr9VMGj
 Vh1TL9tzFBW8U0bLPFHejBLnFIgN/W3ZyorQdRbeWYkbU2NriH059D5Z0UGk+pqS/ajKnt7DO9Y
 8JHv9IW7qFXs1gawL4nZRC4/oFhV0U4C5X4GFLzx3dNFzIiySjp9tPYqpNCJ3EDxgj0eulU/uHy
 YMwJWW61e4lNgAJV6Hg==
X-Proofpoint-GUID: CWJnCmHOhQVND3oHPLcCaQhg_RyrzRTj
X-Proofpoint-ORIG-GUID: CWJnCmHOhQVND3oHPLcCaQhg_RyrzRTj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NiBTYWx0ZWRfX/IyQBPze1VlS
 CT4Etfx693+mHqmXAojO4l1/m6OFA79QYpkzzrjrMfSqRVVx/06JCr+dZpgV9byK6P84UFmPcKE
 ItTZ5wDSfHjgRfD34dNkVEMyT3LQNT0=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8be593 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SGxFASbRf4WqgnW55AYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240056

On 8/22/26 7:15 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The SHIFT 6MQ has a second rear (auxiliary) camera. Its autofocus
> actuator is a Dongwoon DW9714V.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
