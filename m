Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7190F349CE8
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573027; cv=none; b=dLXVolrPfX8FGb2fJmnHmD3cf1f/bnF8k1LhXqoA+3iGoJUwQ71BimHWrYY4MsjjAQzunyi0wJJKqRnwJv/H7TefHVFWhkp+5VvLT/W7qJwLY1synFQqfGqhRb+Kwa2zPr/ZNsGjOja4XMsY4bWIcETZ/wgSouy2IQywO6due2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573027; c=relaxed/simple;
	bh=ZwkseMV6FbbwphPv0uGrX/aYoUPUYRh5WltUTfvDOZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljvNnKdzOperRfwrsrLVq8S12bfxHswo53ctYSiZcgH0nSQf3W/0EsxkiRnn6qPzlMiOvexiXBlasDuXh9sVroCc4b3Rw9jcTHmNyViZ+Ql/lMowcE0xMSH/yjG0uXsH3TczhMF56sI9X0bAfFgxF/0RnqriLBPecJTKjM2rj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iksRDBTL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRxBcsI3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iksRDBTL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRxBcsI3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GF9h2S2935058
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 15:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JdsTIVTs0KYsy94zRrHjZ3fCdvLEW0KfasUbrZWJ/vc=; b=iksRDBTLWdel5adO
	38M/fUJ5mmG+ZK7EZVBvbaCloehNAPJWOFG3HJI8ZlAtCnB123XaRMGvvBePspvq
	bJypI2FIjqSRtkNxFUGK2yyLgy8bDTgkmQlE7V6ic9P3GCBE0R4QllPFRVECsxVN
	CX7D7fP7XRjZQWhwAZ5yxIsp24q3uiE+Ed7/V33aezLDbAfWkt1DBfvVsDEcsGoU
	Oc2IJMDOMtGxkfvHpXoW3BkVwqMsSVttgQqeuGPB/rt9PHU7FvX5wyWGMW1a7ygo
	uOyGNFsBXtjK8DgFSQ8pAfycg9pUnU+ji5GN8xjUQOZF4d7PyGKSb6wp4C+DZIhr
	iMYcLw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7jsn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 15:36:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8323b8464so6873962e0c.3
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789573018; x=1790177818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JdsTIVTs0KYsy94zRrHjZ3fCdvLEW0KfasUbrZWJ/vc=;
        b=LRxBcsI38asErWduQHfACnACVkZksER123Z4cVPw+ha65dm6X7AWqEWN35mgtxTe6F
         IyW0PraqiOyZs2mX9/dgUXzb2qFy6WSGzRD2K3p5PmHtNIMKX55nH7ef0Wv1c+vwDLK6
         4OH/eelPZtuZJPOjlryj5WV3hQIu1SAdGHVL2yYx32B6I7aj9jlsXfIdJUoAtLjddqzP
         TEAeZW3KHqLtooINqbWS7zDfad0OD8zluJshEg5jN4yEd1td+g21MszjTL7Xr4pNIT8i
         h0yftgKKnY2m5rO/t7mBnPmrZHQ5U9D+7ilcBenQ2IHOipE5t7TPlv/KQIUOi2tlgofv
         U4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573018; x=1790177818;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JdsTIVTs0KYsy94zRrHjZ3fCdvLEW0KfasUbrZWJ/vc=;
        b=2Qvtp5EELegT7qLnO3629jrK1EC60MdApQ2YD3A5r0KbnbvHwpFLPMU3wMYQhVr45V
         zbJl/yD5u/WA41d4533zkGmoPG87/ng/R6bslu1Ngi3loyIFF0wszzcc/qGsxK0LxxhL
         KUNDYcnO2SIkoBVt1OB04U0jdktHyXADPxxm4zovyJPKGrj59XHJydQ13SZ/lq8LmYN2
         uflNBIEEgtKPYUFRGvoJh8Bcm67n+z0pjXkkduKMME1bhXb1hOYpWcktCYUU2TQ2nUBA
         cUnHphdP2FGomSE+LNRds1g/97lZvWat56/8mTOImGegyzackxBBPNzcvSM6XeQjrpRO
         tPZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhsNzCnXrR1ji8Ae7ZhDS1BVcoApoMj6PnmgP8mt82jJzQGDHoH6g5MOsS6MYPcHg4EuVRSZfucGLhAw==@vger.kernel.org
X-Gm-Message-State: AFuF++kBL0MQyylbPdMU22PGiqrfpcxHqdzqEjOEElKCpBbEdgsitlJo
	52B81mGEbLyVAuAy89G3vpidCU/a4Qq/yDjG8Pd0/SJHosrv/w9Jf5p3iSvyWbvmiQ+TzR4FsZr
	mPH1D9Nif2SCPYrZwxd9eocSkRzNkICRQh/DboLRKzAgy4rbo39HOvQ6UoQGTN2SGdg==
X-Gm-Gg: AYBFou0xnLfnQDVoAEMIOlzEn3WZd89t6QBfVMSfZxb86tMK/pu/prlnX964yC0JCcH
	jgFP9d4lB5Z1J027nDpQDVgIZ+1IDHYwnUk64yl3baBw7lSN335jTG6Trx3t69GyjaNMQbBVm+l
	VZwhtRcpEjmHlWUpOEP7UEs4u/rGYc67oLgAkZeoqw2FbWUn/dGggSvOWSxJi1n/vCU8d1nLdHs
	gbeqbG9qnAf16ygwSt91mwGIUeMt5BzFJ1rH3LpA48tN92+dTG4fpPcJD0nWvPqWc6vhBL333s6
	6x3XIHVKSZNJSzHSX1tCHRG1ogl37XtaPiAKr3n9dZZfYuhXfTlF+++fQnQjMOYL4P6is/9/r0S
	Gsf/MGf+s1oFy4GmC+8RXYW9MIJH6fCyEn7weJnmghKfRxfWFwCz5eQEmFSy90iw=
X-Received: by 2002:a05:6122:d24:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5c99ae061c4mr4693032e0c.4.1789573018192;
        Wed, 16 Sep 2026 08:36:58 -0700 (PDT)
X-Received: by 2002:a05:6122:d24:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5c99ae061c4mr4692900e0c.4.1789573017750;
        Wed, 16 Sep 2026 08:36:57 -0700 (PDT)
Received: from [10.38.244.133] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be95d2esm27183766d6.30.2026.09.16.08.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:36:57 -0700 (PDT)
Message-ID: <5f8746bc-392a-42c3-8ca2-07327e5651ea@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 23:36:50 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
 <KE4uG1eVJQ53r3OwBVGp0Yl45AtOqMj-yJJmAq67lq7ze23gLlb-2Ci_I0qYx574oG8woS9A13xt2Iu1TkTMZg==@protonmail.internalid>
 <4c43c80c-d8c3-4738-9a5f-0b3e1c19679d@oss.qualcomm.com>
 <6ca6cacc-3fcc-4d1d-a6cc-cdc1e9a403ca@kernel.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <6ca6cacc-3fcc-4d1d-a6cc-cdc1e9a403ca@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: im__S9Ta1kkn-WjMDS4YCOFggfvyY45C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxMiBTYWx0ZWRfX2VPi/9TiBBof
 e0Iho4kZ0yIMC8sijP9VcRuCcOknvRrzUM5kvcn9K6g2yrGDeLRBdbN7EbDwSizmmFWAiwd+C5/
 BYIvYgqA9jMk+sj2Brf5ntOB6pd4p5/WSlImadbfs/Lc2Il0bPvM+y9M/VO+DxxMAwwngdW5iX1
 gD4O3w6r2J0v3TJidrqHSNnUXR597pf67CkUaCaEof7NzaX9/nKf/iCHkRL+XbNKWCErPjW68hW
 B5IzxYv3sJIDSysvWdNywZu2ywNe64prvT8T4OjDHSz4pnLjLE4VZyE3eS+AsCu05Om27pxL5Kd
 aYPPnepMH/H8vUw5gTJybKH/ZhKZ50GRyKjvHef3u900liU33tp0bXjeH+r0x/zNeBubbP+KOEg
 yabWRtwWts2pCJCDnNa2TA9YsfHMy8otsdBC+RiWkr2ceyaEQ9C2b2sS2tQekgVKE93SsiIDxz9
 cFJ4kWf7aCRP6TcvnRA==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaab79a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8EY4eiAYLadLDWKzreoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxMiBTYWx0ZWRfX9e/BIABKogqD
 fGp1nr9pT1PNGBJKsMFHvTxCLs/ZW6teaP3Vtf7B2wKerdnfQa0H2VX15enfKxry6zVt4pnduX4
 JYWqMvXVedSd4Nc263OkMzWj5zeBKoI=
X-Proofpoint-GUID: im__S9Ta1kkn-WjMDS4YCOFggfvyY45C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160212



On 9/16/2026 10:59 PM, Bryan O'Donoghue wrote:
> On 08/09/2026 09:46, Wenmeng Liu wrote:
>>> +                 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
>> I think we should remove the SRC clock.
>>
>> Thanks,
> 
> There's no clock that is derived from this clock, so if we remove it, 
> what is responsible to switch this on ?


This SRC clock has child clocks such as CSIPHY0/1/2/4. The CAMSS driver 
never enables this SRC clock directly, and enabling the child clocks 
will automatically enable the parent through the common clock framework, 
so the SRC clock can be dropped.

Thanks,
Wenmeng
