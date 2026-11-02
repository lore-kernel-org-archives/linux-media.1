Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610696;
	b=VC61m0cPyhp8F6xCtJBZ0IC8Gn9qeoNu82iTBYPE0jcs6U9rF8yDUrpQ24RTbpvcKagr
	 7PSIt9WU42z4s7yiPL18zyR1U4YJP7pTgH8lEE06afDxyBW2+/Baj29X6rMjqfEJsFhq1
	 JmySrRkK5xNBbaIbWA2tr5GT5rI8LG1NDLLQ8OwTADWjlv7mE+AL/jjcQU6eeuuY8My/v
	 69oSk101mSZgjfTCxA9OLimR0D+pLhBgMwN3jxPDGOMacLZR55Dvlxq5mNQtIGC0Au9Et
	 7pb0Bqppk99OFtseau8RSW7r9UMn1gNvY635bJFYevM3nyS8iAG1Qb8TNLSP9LK5fnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=;
	b=UbzW/IWrCwaXlEgz8Ip6jbaPYXejBhTWTOAdyJu3t8dNrmri2pFYzHpU2edFXpfqthd4
	 +Y7TanafraRoHJP+YAdqQmgYR53LpxNKjy02lsWRbFX2ZSx7ZGI3tyPWFn+tyiRUiT1Z+
	 DDQB/UDvJ9BEBMQFZWiiUa6YugefYTU8NWSlxjdPu//vyPXp/DBOfBcNiiILXyt4PdeIE
	 rvHmCyJvSD/TPmd76shRVjiFnFZ8vdfHGOZbgQPymkbkIOsY26ydPPZaYxaFsNbtcn2io
	 vGCErMLax9Q7cUrKmJ1YsCjatJgyneyWinC7crfnKrAhXUa+o7Z/XWbrOV3m5x6c7ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QUWnkuiC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7UBzL2x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E374606A327
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 09:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E374606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QUWnkuiC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7UBzL2x
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AHCp2880728
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 09:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=; b=QUWnkuiC9xEXxw81
	CXmHwdRTUEXk21Gqf98cesdGE6yjk4JrLYRuxMyFjTc5gk31J8r3SlDW2sBz/AFj
	D76XGf2mYKajqd+mGUNqClPL+dtiJUjbxAdmmjfPCXA9KynPCiAKnec34fkEUE+e
	d/oVF5KK0EmBTkvjjVM9IpMH30UGG0f5WnEUm0G2frqNR0KNonYJ57HJG+zgCBRM
	mkTONZwP3yQlpJd9MAwABHLQKiytzPAHOppuhgQ3c6mt09HBj7SfKMXz+2x6OWsY
	+68ms6CnFWMULK2uWfcSDglIZE8DDxwGMiDYFzNhUpTJORhPDvi/F5cOGsv+YA78
	EDDaMg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrg20u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:11:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea785a4decso34014365ad.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610695; x=1794215495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=;
        b=c7UBzL2xTWZ+Gks77LrZxV6ufkxco71Ebg1q7EhcC9qDgdh4UWYblZMMzDOHUACyms
         xI91GRvWwnrD+2L2EsMnbN7atwKtSQnf9T0j+PAd+S9ORwFM7E27BcJ73ahtutbUaxIB
         0/qGEMB876F0OHfCH/HXija+kywki4SvPo54txiEqBynWMX0aNiQGCTDJ3QFqIWzsEqg
         VxYrcrl9UY21rRyT7A28j+1pF3wiaEowK5xR+0WXmEgvzeqm4tuLwct+E9e2xrBuuHFq
         dW6SiAgcEpGQj0GHlDAJysGOBm8wUVBJU/Ii/E2Ca4cDEBgQ9fqzZcgJTP5Dg2p370CV
         Cd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610695; x=1794215495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=;
        b=SucOW3diugH/ZH6DinjdXWceRNmfErnrbUmW6I/BtK+iIXDe2CCSrFy6M7KX5MWp4q
         B0jk/ulzLU0sBRvwRpryzibMO76kyGHLglfCD8Z7cFJIqatSQQ611FoDF53tDIMx/6pp
         RT7Qvzc56M3QceCL3vnoKYK7Ge+U0jOWJ7wCd0bgyL5U5a21oDQL5IHJsDbTjaLeKQ1E
         ZEr1MQ0J8pTojcHRfmJ3sCXWgzuEXVGqKvWH/vF1MnTFvNsH+CK+BMiqcNAEz9rqKeb4
         vdYSNq1X1KLjF9yzzhzEgqJun9dWnBHC8tL8QxvDgheUlRdMF29kOXIPAjhOqRXHCowp
         LxzA==
X-Forwarded-Encrypted: i=1; AKwUvByp+WKE5BBFA08s8RHrvPYwPiRPAWJ8eR8IoarifGVE1r3sbDqLW0w7Ty+pdNp+ZMOjxG+8j0vJ4npMRA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+n6/o6atSHOVnqIQ8oD9qo6zM53EoAtFb7iI65gOv/n+mu2KCO
	i+tlSfA3F0O9K7m8Ak/s60bZIbnoWmykLjht+Ix5uQFaCK0WNlhMEzsyrjK/brQ7c44MA8b3CZl
	bBr5JZNgk4xkSwQyWlwkkfR6jsVtN2EIUCVuaS9frUphxcTix/q1YP5JocLSTcuXeVV3lK9IZbA
	==
X-Gm-Gg: AYBFou0GDbutt6zaCcNFK22NHNYBEKssXXxJWHw8EiHDGpmgXkfJitO1acoaiRlLOhe
	cgXJLE7GJjrqWtHCFD+EJMk9vl/+EFTxMcRGsJfW1qQefcKXChfvyqX4HI80CSUb8MjcUOIwFmT
	wUvbZV6aYPNm/vrJ8rv3aOcDgXQFA064LR7GALKV9XD33fQ0wEBy/AJhsvRJd9D5rds5YW8vQGG
	O/F1borT6CoVYBeisFl75NBqOzs/mgRU/vQ/en5VsZp/PHj243LkybXuCRZ86G/Df/Beqmg+L98
	widdtsXfc4lS/l6rNj7bFh++nmiVH/gebPFtQl79fGVQQzKK9LMT0v6h1KO+qD2MY/XVTma0Wvt
	P5a0HwdaHBp99yi91or2mTcHGh6vI2OZqcedRiZke7cwdO6At5a6lQ+r3O+7PorfZQDRjkG1SzE
	bVk2bOYUvGwnR0YDuy+uqzYhGhkFX3+pgj
X-Received: by 2002:a17:902:f607:b0:2e9:3dd2:a8f6 with SMTP id d9443c01a7336-2eb364941d8mr67629295ad.9.1793610694906;
        Mon, 02 Nov 2026 01:11:34 -0800 (PST)
X-Received: by 2002:a17:902:f607:b0:2e9:3dd2:a8f6 with SMTP id d9443c01a7336-2eb364941d8mr67629165ad.9.1793610694447;
        Mon, 02 Nov 2026 01:11:34 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39248909sm25062335ad.33.2026.11.02.01.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:11:34 -0800 (PST)
Message-ID: <757f0875-8940-496d-a35b-5f482887739a@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:11:27 +0800
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
Subject: Re: [PATCH v23 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
 <c10dbcfd-b9d7-4ac0-be30-6b78594bfdab@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <c10dbcfd-b9d7-4ac0-be30-6b78594bfdab@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae853c7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=dRQ5KtDc-XJZQSWJ7xIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: b961KqADIFxz6_MyiKZ2JO1tx0veqZ7x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXxXC8li1Sr12G
 tLpBggVNahIFkF2YDPEbEps9z2ZZa+zU3qM8QanRdMorITbtdp1GW4BeWKsHt6nBihu5XksDnKl
 qGBLCoXYI9EdcaFFKfQYs/GT2PGHloE=
X-Proofpoint-ORIG-GUID: b961KqADIFxz6_MyiKZ2JO1tx0veqZ7x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXwTk9mjsK8/Ol
 zPRj9Nzd2D0xzUO91YMEpMuwT+jy/xO5jfkSljpUQqB6cmVLFSLJyt1c9QUZxbSCFH3iSnMLqbc
 GaAtAvsfwkDEgObYj3EDPtbEObulOEf4J07ArDAoOvdRMDwOyGUKK0voPMbgaf+tyPGVEpij8om
 TQcBuB3X3F2rQwGGeGzaVAbNu5pCX21HO+GP9YMu3J9bmS3N5rhdIUqNJRcsqfIC4hPP+nxdMg/
 tl4tS+vHflRkB+pFic0FSKXYh+NVqCTOE4IXGwLERqQuCFS/xc40g22wxu6RZxQKMEgaDDpcm3d
 Oxeuyc8KleetH884xN5VqgIq7FqxgoeNhMc3741G5mRNc9iBjcaK7Ch7deYeoqYMRzm0Q0O2+8S
 i4SJOafCnelEPZHc9D4o6igmfD45XRo896xGy1L6md5afhT0WjxzkOlYTKE4zrIqyI46/WtCNQy
 FPkNYNIvw0KlWkkD1FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020036

On 10/31/2026 7:42 PM, Vladimir Zapolskiy wrote:
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
>> C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.
> 
> Wrong, it is NOT compatible.
> 
> Due to the functional difference in the register offset, which is
> described in the patch 0002, it is NOT possible to fallback to
> "qcom,x1e80100-csi2-phy" compatible device driver, and there shall
> be a new stand-alone compatible variable "qcom,kaanapali-csi2-phy".
> 
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 
>> 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2- 
>> phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2- 
>> phy.yaml
>> index 1f1e2a4993b2..6e9eb8e265df 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -17,7 +17,9 @@ description:
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - const: qcom,x1e80100-csi2-phy
>> +      - enum:
>> +          - qcom,kaanapali-csi2-phy
>> +          - qcom,x1e80100-csi2-phy
>>         - items:
>>             - const: qcom,glymur-csi2-phy
>>             - const: qcom,x1e80100-csi2-phy
>>
> 

Agree. Thanks. This line of description is stale. The commit description 
doesn't reflect the content precisely. Actually, KNP uses its own 
configuration. We notice that register offset difference so that the 
adapter macro is introduced to handle that.

<https://lore.kernel.org/all/20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com/>

---
Best Regards,
Hangxiang
