Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6911D41F379
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804485; cv=none; b=OmZ96lsbuUBazG2ee6daBO912K1bG1UleXzAf1mTePZQBwBA3ZU0OpYEjcT7t8Xbr2DjKbsOMfF4KBRAf8bRDSTCz2ieKOMrAdPXjqjO2s3K1g3a58qrohraD1pcbVx7Nt0XO3PPIKN2P/P1Nc93I7R3ecArKJfXcm7/RLCafXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804485; c=relaxed/simple;
	bh=qjLm2iBplbOItMK/nBGuK56LU3E2ytdvfFyzPtdXtAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RpBb6psDmV1PSBzLRcsuw4cCHzot4l99ETNQHdxUWsnMmLcw4ILrVPkGkccfjaIb/9yP6ObhRpgaznEG7OrmskJffFjTUi3/Bb1z7DLZ9TttAQly9+0dHVnFs/zgOQ14CUToQb013IXyRLhGHRa9dUslsfcLQxvZ6Cfm9dsjVWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gImQNbwd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CcnweEGU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gImQNbwd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcnweEGU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KCD02796181
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2vh5XXOQ95SCxIAFLYDt8jIXow1InAg31g5yBuaCXc=; b=gImQNbwdgJWauHAY
	mD8xFrawwRgpJu+i5pfErJVfx1bc1+jj9MyTZQz31bEl7BScch7eGz+5NXkmeC0w
	K0Nzn1tXgvaVBKEF1L678T3vvNr1hT4/Wsx4apRrwWwam5euUV2lEaHGHqqY+wF6
	iyzNely90CuD/iVOaErHNoKc7+ibJZHxLi2FfnyrjqL8ylFzmZkkPDomzeZStmjd
	m6hLmXBgxmxklByXqNCQJkUGDrB+O4+k29Am8ycEHZfJw1wlZcXqLf3r8HOCMgY0
	wMU6orZA36xouMkZNPBXW1PnUPROFSl5hQWq6hdlJqg7J+U9tpPbenrev+FHVsYc
	TKB9GA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3h2em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:28:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so5072102eec.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 04:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791804483; x=1792409283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2vh5XXOQ95SCxIAFLYDt8jIXow1InAg31g5yBuaCXc=;
        b=CcnweEGUllA05PVuW0ZZTcGpMNwrHYT7oxFPEBR8NnNN1M192vJfaxak7TNX0qQ85X
         efBlBvcR7Cib3NEoxCn0eld5jMPOF70Y8UMiwXeYg9t9b1KhgYaVDDlrBWpeutlAIIL8
         HJQ8kBpCfG3fEnVxrVCCTGnWAmI6nM2SWabvz3PaYyQZN12BYZX9UoGfZC58zwUADbDg
         JfBbX42exvU3ddE/lJ9+iY5JKyT9Mga7VnQVGGBnvEwH/Ac2wtGqeN4diLqZE+ypS7l0
         y79BXOkDXEJ7ec2/WcUpF/ImZYF0R9IL2oPOXR+cld5qu2yVvKjj7l2sX4GakR7YvxQB
         /E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804483; x=1792409283;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2vh5XXOQ95SCxIAFLYDt8jIXow1InAg31g5yBuaCXc=;
        b=ooep33SyD0fTfTSMMTh7pbR/lxx94JiAC6yE7AJK5PSKl2uObtY78bh9bnrx80FLid
         wDNdy1008a/llHZCznDhxBJ8mfL6Lvk8BpdKR2uHzad0UkFs8AUsYGnLTFwyrf0nr1ZJ
         b5H5JDxX+vjVYFMImjfRedkxHLOzLu6u+zzJJ7kniXzvr+amMMfhsUkvFcnN5Dre/jNY
         cU/2I3flly1xL4l9wywnqGMxP4xVM6iZfCFTps0stCZDJfy+4G0PmqnQHfIn9LOg2QpF
         rF8Rxrz5q9mJy2dLMZVlIHy7qgix4FJH3IdPDSSnfNdIHF0B8tGVYolOGNRoQJJh+6rA
         uV5A==
X-Gm-Message-State: AFq9FYIBQYtwE3iwPVBd0bcQ9XfWpgei8Gmd6TYUExvr4fdrVIvq9Z83
	PSjFnsfNkTLARIcBJH7iMYi2rrWapHkDLp4RiBai86Aof9SZ32DeQV/ZGWIgS+43S5lJhLdzGYP
	NrTe8qLh8dOrNz5DG6vOYh4RrvzL1ebi8t19K/Tyf0jLOx1Q9XKE9QKmMAdi3lCe0tQ==
X-Gm-Gg: AYBFou0nUCasVuAZgtG+4CZv/DNh7th3UIb7rAXaRUYMNiYGIfs65OdXWG1rqmHmSKY
	ZNWTg07Sk7fC7ik9tTmn0qCMvkg+eUUbPk89751n+vCzai1lkTQ1vUhsBr4yVd989G8NizpjfuE
	ET4a0Q2w2VTrVOp+p/oC1XOe/vEwr9lF4A1Xmyf+CoBlrbpIhvGGdjF5hWZr8gknTYmAgvLaeNG
	Jx1n3acojkjBjToN4Marpl60dBL6pEwwrkL7Z7tVj1M0B5Jai9RG9b1bFg2ycrF/Mhltsc44T4v
	HATf6llHA30OJbaIea5320w4wHrQrIKsjr6aL0q3Qu1t8PzwRw8RoWVDCh2IrKz3LMT9dCqyU49
	QDaBYokm9nqt3R69llSy9gqA0kxqLWokrbQ==
X-Received: by 2002:a05:7300:4349:b0:351:62fe:62 with SMTP id 5a478bee46e88-3537e0b81famr20147817eec.19.1791804482405;
        Mon, 12 Oct 2026 04:28:02 -0700 (PDT)
X-Received: by 2002:a05:7300:4349:b0:351:62fe:62 with SMTP id 5a478bee46e88-3537e0b81famr20147743eec.19.1791804481793;
        Mon, 12 Oct 2026 04:28:01 -0700 (PDT)
Received: from [10.204.101.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3593b8b2ec7sm18128821eec.4.2026.10.12.04.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:28:00 -0700 (PDT)
Message-ID: <82993933-090a-4306-9d3c-40ef7dfdf367@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:57:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
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
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfX4O8mklLGe8kl
 UMAAJKfd48SBGdSEU5DTgEd4Qy6UUA4jvAC6IXAecElJvs+j/sZJd0+8/A8L6ySB/4tjFTO1DfC
 SpdUle0E5ujqzcF4XwnlKQW7j8H+ysLMvX8fR5t3yibm7i+VsD1Fo9B6K9ArGqjVpeLoXnAg8qk
 4xtbuFVcessI4O2ROXLFBz1L/yjpgicjwCipb/1JMXA0uchW3qw8xNQqmXrmWohL9usRjg1EILQ
 rV3dI7GRDKq9O3pyJ1DlUuTzPTW5ULFaazjb9n9Lfp+Po+WiPIy/j6d6qTQ4K5Dt8fZ1eIESYlW
 ohkMNHX0y9I6NoHNfYH4MkhlaAfmeyk9x13TCiyxGvEC/qvQqleglP2N9b12HQ3bpH2nfsnj+yz
 SHtsYqA1M6qCqR08sFzNG5JHcaRLRXULrPIHjzZKL9Zgf/tpmUe2XJ915+d6STc+Zn3PMXUf2yS
 67C9nlNoXY0OpEuQ6SQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfX/ef67YdnSiI1
 QvcIBIuRTPtuCZKxhs9ZynPpq5wFh90VVrwCTQJ66ueFCuX6YVJyj+8iwjA4VIilow/y5ddSV6T
 eBjEPU5LXPDdjNVskw6MgUq8QkqmGPM=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accc443 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MjlnR1W742UOhp88nnQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: jNQw2YhHFanXOrphCDEwvCsIK9bx9ENd
X-Proofpoint-GUID: jNQw2YhHFanXOrphCDEwvCsIK9bx9ENd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120045

Hello Joerg , Will, Murphy,

On 9/26/2026 12:04 PM, Vikash Garodia wrote:
> Reserving an IOVA address using "iommu-addresses" requires it to be
> placed in the reserved-memory node. But when "iommu-addresses" is the
> only property being described and there is no backing "reg" (i.e. no
> actual reserved system memory), it does not really belong under
> /reserved-memory. A device IOVA range is specific to its own address
> space, and does not describe the system physical memory to make it
> qualify under reserved-memory. Given this, place "iommu-addresses"
> inside reserved-memory only when it is paired with a "reg", otherwise,
> define it within the device own node. It was discussed here:
> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> 
> Existing "iommu-addresses" property expects a phandle, which does
> not make sense when the property is defined within the device node.
> Introduce a new property, "iommu-ranges", to specify the device
> specific IOVA ranges when there is no backing "reg".
> 
> Suggested-by: Rob Herring<robh@kernel.org>
> Co-developed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/iommu/of_iommu.c | 128 ++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 121 insertions(+), 7 deletions(-)

Do you see this patch getting into 7.4 ? Or, you have any other comments 
on this patch ?

If you are ok with this patch, maybe it would be a good idea to have the 
series applied by media maintainer.

Regards,
Vikash

