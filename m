Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792554100;
	b=Rs9Ugynv9psVQlf6JnTb497fLRVb6N3n8ZHXjKMmtRbDBdLKKUNO5hUxAXNbKkCCP+Da
	 PxLKXWaxVTD3+i2S+/11AhkNDLOLmAcgeSkzN+rp791QPkTWv4YpLem07Xpz9SBlNv0D0
	 I9KgabkUMe4T6hlnQuKfhAGhE4lP0h9bxqz8WZMhikPti8ECG8HSmo0nNgqSgBoxs7Ru5
	 rfHuZRYzLuqyn7D7EpYBdwwKYK4sPA0ReSFzRe09G5RRSPgOoIi7Xzp7YqMd4vyyqDxFs
	 vv3KNlYlsit0TWLuKnEkZUObIx5q+y97Npc7P8sYJl/CIGtW2HUJcfV8/EpL4fED+zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792554100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=;
	b=soKZVfKkvYGy9EAgcETrBFaILneBIx4tcghGsfro0TorzT5nOzS/z8S0jc1tlpTCCzVU
	 CB4Fbi1WvStz9Ye9dcm7goEcxM1dg9JYCffTm/sK2uV8HVc9zOQGXFutTvmtKnTrR9ud6
	 xQZB/OU8uNcoGpvCT1KAbfILEW4txLYoWfw+4Gjzm7MIhfRP/uyvKAZ0YPOXSeLYsnO1S
	 dDnVyGqnXzHBs6vXKnxre5Ah2UiOBR/zrifzs5OWX6LmmrTAmhPECRCO+2gy4xfpj0tHJ
	 xDxniJExDOMRi0Vnrogf5O3oWlEtIOYt1nyRYChSoGwnDgs77fKhmDc1iIXcIDTMjow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vssd5sII;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcJeIcHc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475E606A319
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 03:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3475E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vssd5sII;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcJeIcHc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2F3Fe3256711
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 03:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=; b=Vssd5sIIrq4j8ts2
	ijkmHc7MV0i+ppTspuxGSeXl/ZH9hsFZ3HwCKL8402xJXkPgW6jllrGqbPa+afbk
	/1usO2KZxw7ZWF+UhVts1cQ26Ewagw09xYtYXjCzXlqmrGho52GS/vTIbsNzRAiV
	ozBsNyW2T2N9qOI+UYJTUI8FToxlgY/go1Kt9EENR2IGrhWyBfpOOxwzD+IDxq4x
	Lbo86PHKV6K8irh+5hYZkARRqsJZCZq3q7Jfhg9XWEB3M5AEdkcXwvPk/GlnFxLO
	Bm8tqNtDX26AcZBX71YpEXDMWpoiYC5/HJ4k2VaifOuloot+pspHckXLJzMN7sfp
	qIaVgA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v1udv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 03:41:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so486396eec.1
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 20:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792554098; x=1793158898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=;
        b=CcJeIcHcG7oDszfV09U574nRRY69IX5wtr1qG2u+A+7FlbMujc4wDKqWUoarzUO5D6
         FgIaA9TbK32E10WfJH0F78ozHHTDZC9J1fKS3bQiy73JaLCPrOqvS4TOXoj+aUxw7lwu
         iiFTrJRdvD491zUlPKBlNTPDPI6cI+7P++l/uDLhCZHx+NcCPmP/CVFg/9G6KSJS+Ba7
         DS5mSgVohhQdWUhoPJpqyXwgPoBpWN3vRnz8Cq1kCfyF7r87EzoMlw7S5jW1vwuEYfl0
         u++FlsP4Y2V2tDPUEukjwmuii8ah38So+lB8veCXiDVMUibG+r1xEqllGX3opWM/V6dD
         s/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792554098; x=1793158898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=;
        b=qU6jI+P3QkR/w6ORaoDotFLUjjRzjHEs6n+x0PCQ1JLY21BfIEomEWitCIl6vDub4N
         ILGkeNF0uDYTelSB8Va96uWLMdFUgDrvHh9nwsPcO/E+Jikv9vIBVRHdRcCCGRw8TWyf
         37Ppc+OPGo8CYzBjazH3PhEWQR1r+6eeJyFsMkozSS8oaK1G41eT0JgwnDGEjAqy6VHk
         45kUCS+ICx3Y9H357wC15HZYmu+y26yiYGfYKO6ze4RU/eBqPIWJD4yyCF1UZSqmlDhv
         uzTcLEULYJjZr8yFWOWQhg153faEfKSAXuip8KZZfCPmknnwoCHccCEyg2iIwp2IEWyy
         kF1w==
X-Forwarded-Encrypted: i=1; AKwUvByNblE6wcjsCWVAdWkxcxXRjq1fRMJV0ydnEuPz152IZWqIfXG9YKcgV9y6rAuu/NCIX3nGVkpdamGgtg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKwfYbwj72SH1UnB6b1L7lhYj9UwVc1o5sNKE5KEiBAscAEoLBl
	jmkr5lULtG5tczBYdZzf9hOzaqtrHJabF7WiOye3djmk2aIvwIw3rLyU0DFAW1md4o31M/RQD0l
	RzU7zLSrDGjYkQV3Lrhg7z+P9W7+zFEcfbhq+yXctKsxaHJo9ZQ0noVG6tQZvxpe5iw==
X-Gm-Gg: AYBFou1pzT4Sxx155L2nTqwOJToeHdSXBDurCwnHDOeEYiOxwBvwJehlONTwwNZNrI+
	Z09yRYIZcLz6Ivow1fBo/lGONa0CJ5aUpZkog6t35VkqOMRREZtmQu2k8eIdxnLUJnlrkpVOs/t
	JbIa9PQFMwE8Q+e/nRvooDSXdjKfrps/cnkx6TFgrNpj2qYYImkJCpKp6VgvM41auUZzaAPud2b
	amW/9jXBMxyIW1qoehZw2WI7Oo/gTzDNZfv+oXse5NgtF0G2+Gw8eFe5V3wyLgj1nm77S9Ww+LG
	FlGgOP0N+vYVhL3c6LWH4RLIE29fqEDzTK/WhprJhcnr+vwU4PTNC1d2yRIXFOqyq8KXk/CnTqO
	/DFbWsQ7ePJ+R2WOValtMk+hYBl/eqg==
X-Received: by 2002:a05:701a:ca01:b0:151:8280:2c1a with SMTP id a92af1059eb24-190a6dbd524mr1236463c88.42.1792554097924;
        Tue, 20 Oct 2026 20:41:37 -0700 (PDT)
X-Received: by 2002:a05:701a:ca01:b0:151:8280:2c1a with SMTP id a92af1059eb24-190a6dbd524mr1236425c88.42.1792554097382;
        Tue, 20 Oct 2026 20:41:37 -0700 (PDT)
Received: from [192.168.1.10] ([103.211.19.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm3336442eec.11.2026.10.20.20.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 20:41:36 -0700 (PDT)
Message-ID: <92c02649-454e-4b68-a9a8-2371f8a6e5da@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:11:28 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, bod@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
 <851434b3-4cf1-4371-9b4a-57dba8022e13@oss.qualcomm.com>
 <20261019-funky-real-skunk-eda6dc@quoll>
 <7766382e-5187-465b-aa89-ff1bf9a16588@oss.qualcomm.com>
 <708b9edc-3ee9-49f4-ba62-9fc2806168dd@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <708b9edc-3ee9-49f4-ba62-9fc2806168dd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMyBTYWx0ZWRfXxnPwtLQWX4+k
 dR7CxO8Cs47UdRivhkhzPQ/NBn/M+A30MX/2sY/Yb69AgSXyOy+ygaTf028z1LbcnYDTEdiEIXp
 +pOCYhTzBl8rMm82hY74drhQXGInpVM=
X-Proofpoint-ORIG-GUID: 2AdBdfQgZDCL3VZhFlyvlzZJKwSjCsQh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMyBTYWx0ZWRfX6LwzfYGdmqNZ
 q+YGDvpoVy7XLd60gfQFE4VeZu9R8JmfhUDCamsz2GylX9QsdlYMY6Y/erFj4cOKxya0x0Q5fHi
 VnuO5amS+Pn0vhGBVM2xs6PruN/Hy9N8L1kOHPd8M201kxU4KdHITXMwtMxL/B18ectgBGbwYX+
 K5lvtmqEBxbY8wEhC3z7obiNcSZypKhTgZg9hbU5bFyOWoeqfw3A7s6WD+EMrYaW0N4QopHYuZI
 AJp2zsraF2rlgtDoShTi6zNqzZOco/PbpMPNSVXAVox/7COWl9bnaKoD5ir7is03ygRXiPKvQSJ
 2si7g31ghgWu3JTiOaS3Ve+yCuotG7dOu2aVUcUsJGGCKax6mKwB2Vz/uwtCXnQ8yGagOAxKQXg
 n8V3OCWPFFpcl2UDNfNdoNcfo0E1SQk+2fnSGSVLd8DkDalY4uC2VepCgxSTVxZyE9IfBmwppip
 YwvnBBcD1GeVpaY5TeQ==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad83473 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ocEEpg4cTnoGtXECQz/e5g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=TgBa4wLDfMOKYiLJ7W0A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 2AdBdfQgZDCL3VZhFlyvlzZJKwSjCsQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210013



On 20-10-2026 11:24, Krzysztof Kozlowski wrote:
>> Krzysztof, should the binding example mirror the SoC bus address/size cell
> Why are you suggesting in review something which maintainers never
> suggested? Or actually opposite to what some maintainers were suggesting
> before. Code has correct example.
Understood. Thanks for the clarification.

-- 
Regards,
Nihal Kumar Gupta

