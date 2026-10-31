Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461334;
	b=eZSbJLTHMAG2th33s5osESBf9Ft+2bZ4NRBflfOuIjdorIBkPDUDzurySgd0LwAEqRvK
	 7JDC5u41ygsvrbrJX/oak5OYtCx/1maop3/4XAExfLbJUnhFi8Ih5ByzVuegvh2TYysoI
	 GpAn99VRERqrRUtBx/Z0rFd3/IeX40nvZw+0fA2mNcbng4XeVkywO8SdUUpe5MwnyBqPP
	 45Bdi3wtMkW222AcV56MAqK/gkvZhpdE3rFcO9TqQ/UT8xBLcSnTov/QgAhq98r5Aqx9K
	 KDjCB+F01VJPIL/Fa+v8DIrizs0qiWYXuzzMuBVHf84yqaJbbf/4tQYnnxYImC0Bz1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aFV3TPaYtQ5flXiMSYRlyBEMDBAUTU6tbyACU0qLOVk=;
	b=YWxXYyIuSppda6YyiKwRx/1tXEO85raHazKvvSSTBnUwqFaeNE8qahOahm3BfOp6vt/k
	 eLNjVlNc91Tu+PmP2kUvYGEmI3We+cXu/XltieUhCn5Os5IUQIHT8eNNQBggLSXkr3TxU
	 +y/DaMojgCXvFqjW6KTvRtRc/U/Lx2vFy1MeAH18x4zT+Hoit/liHGSW5nlBbSvXj4HvV
	 6Le1CLg6Cb72EQiDtvpiVVQoYC4kKDkdFlK7wtI53pgpDDN7pg1FgcRkeA3KFiANEKzgs
	 jyNln7TO88wg3m+tw/E24lQHb6TWZQ0wHKyTKlpie+Wo3sowPp+A5VLQf19ctHDrnfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jZmKGfkc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IVCHG3jo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5641E606A31D
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 15:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5641E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jZmKGfkc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IVCHG3jo
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VCxqQa2161133
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 15:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFV3TPaYtQ5flXiMSYRlyBEMDBAUTU6tbyACU0qLOVk=; b=jZmKGfkcQHp/K7Co
	1SBTyA2or4VZDoYvwyxP/e1gwPL/aAD+pva6G3TGl59sCV4ALs0QuaZ3zQ4U7yt1
	0TWtfTWVRDKV9oe9WsiJqWKIpTiutiELbnAsnzx0pickcQs42ZU1718wrQnS5NoY
	ubPRVou3pQU+0AOcGQpnTb7HPfQur/dcnXpzLwkoAO9VnoY0Nf7J1xm+EinKNAMa
	mG0NUXgIN8MaiHAJgCBK+HKPgGcn2UjEr1GX+yzSgLGyxWdtpZ770AVgqcusx5f4
	eInPboOgp2Jan5w41YcYmPfcJZdE42HsklZ78lLJaMUtWd/dZX11msvDweBeS6+2
	m5g7hQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2set2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 15:42:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so2651135eec.1
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 08:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793461333; x=1794066133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFV3TPaYtQ5flXiMSYRlyBEMDBAUTU6tbyACU0qLOVk=;
        b=IVCHG3jopRQppD5o2GU0P34uDiwhFj/mBJ+dihCW5J43JRhHThLFhZfWUlI+6xQTTG
         4YXtLtctz5g2s7eRwGxWnEIzAc1TT/k9mIc1LexuISgPbd64AT13DvvLxN9kBq+yIhs2
         bG0gcKv8OYc9Q23JDzaGyBymNqJpUBKop00vbhN97FpJz6XPc9C1cPcBm8uHkPvQ/xIF
         pOtrVG8hxqy9Oe6aSiKoXBd0B2CCaEChQImrpUuJ91Kc6CFntk9w+qp8/xsjOzL9SdmN
         /1Q3FywA2bwtAAHKul/SzOSXAOBzf7oakQQ0x85Fv5bIKIc+wiUtJAzEquRkz+w31MoL
         xVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793461333; x=1794066133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFV3TPaYtQ5flXiMSYRlyBEMDBAUTU6tbyACU0qLOVk=;
        b=bTPlh/r5DECGVB9QYXfxgRW5xG0P5QhqtKPLTNXTUzX/wxY8ug1G2hYVp8hte4ZKMi
         q3PH2nrPuWZMFw7dfFUMB2JZUvPEi12eroQgDUbrDhCLGGUpN6qun7A+DA9uFV50rsnh
         OW5HtM/QzWpEdkdYVQCUEIqX6KyrVHA0o/SZQez74NmINKspy6ptbZC8zT3pI9QX3zIA
         KUq96vlYSPUjyoUeh8v5tpmtrAYTrbfRpxLlwC/ZLX1D5uagesgHxrjIysxUdOROfaVZ
         FJ01wmK+XB9JKL0U9mgmweAZGjUBk7ue6Kg5ntTmmHocaiAaXiIxROgCkeHtEFQ0iABu
         WK1A==
X-Forwarded-Encrypted: i=1; AKwUvBxFMfyfM9QV8e9m3rg1CNeux0CqOdVYpO0esoqRtyo9ljwuJJQ07tbmcOz8Qq4OwExeZhuPEcI+pKFDQg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK6m5BhcJA35kpflrfy5g9rALHs9jIWK+FCYERx5KAMMV5CiNIK
	Zjg+BF8aEtXjVvm1n2ZSLa+wTXOsgx/ag4LlLWJ+as6p5n620/rQDEmoMkOoru65tyX9lHLvwBy
	pMGhaA2Pw5J/hEOLJROzENf71V9l6inhen+JIHAU9ALWFHzF9LxCFdCPjqCMRDQS6Dg==
X-Gm-Gg: AYBFou2Qqp2mo9OhQH2GE4z6+fGUGwUxuFHTEda3Dy2ZqUA4NJn51ipMp9eDwfN0E1+
	NLQlNxDS6NhAy7Ub1XCwwUHls6WfYdZN1/vw8klNMMqrqjHnWD+cvV3HMLOhxXjFj/fbpm4fxyR
	eWBnBqM27QjN1BHf05xtrk4zW8CRetoEfN7SBno1GMgWLE/JYEdPGa/lkfTQfk3gL5HwNOFh/pA
	Im8XLsnsizZBWH7pAXFqhLznIe6/MWoBCBAWAX1BGlJpg0FzNp6zR2RAFuHWkke11ZdeogCJpZx
	8tpB/DZo7iQhIukU/SrqPaMl2oCBqzYSiAznVLpLisDsgHrsAC2FbmTPaoqruqzIz4zkzno52VJ
	L78i1n0bTTqqTJJmZ+0pxKj3XDyxCW4Bfj7NMRTfCu0/W2uIvdDnaItDR3TWaSam+BqrpOuyS6R
	Y=
X-Received: by 2002:a05:7301:1a01:b0:369:f85c:787c with SMTP id 5a478bee46e88-36a4236a1d9mr8367554eec.10.1793461332265;
        Sat, 31 Oct 2026 08:42:12 -0700 (PDT)
X-Received: by 2002:a05:7301:1a01:b0:369:f85c:787c with SMTP id 5a478bee46e88-36a4236a1d9mr8367488eec.10.1793461331549;
        Sat, 31 Oct 2026 08:42:11 -0700 (PDT)
Received: from [192.168.1.6] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm18944606eec.9.2026.10.31.08.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 08:42:11 -0700 (PDT)
Message-ID: <f033b603-d397-4397-a2de-a3014c997278@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 21:12:02 +0530
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
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without
 CSIPHY resources
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vz@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-4-vz@kernel.org>
 <CAFEp6-16WAoyS+aY2BzPknsMtHa1cSfVYNmYvTKHm_MWqqW_ag@mail.gmail.com>
 <271ccc9b-ccf1-4254-9664-2f00b504a5a9@kernel.org>
 <d35b7934-54e7-425b-a223-570512be0374@oss.qualcomm.com>
 <CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Km8HdWt4Fr5OhNpv1l0bNP0O3tZPmYAU
X-Proofpoint-ORIG-GUID: Km8HdWt4Fr5OhNpv1l0bNP0O3tZPmYAU
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae60c55 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=fhbCC2ozS9dPJYT3FEkA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MiBTYWx0ZWRfX2LpuuOgQIGV7
 3ZA8nVddNv+sTFekLB331yeMmJycEo0ATDvW+RYhZ9UX679mC2K8fQJWk0lsY1wUk69lwlDUiBT
 QV0P5vdNZYhq5lpItV1YgA9rWBro8U0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MiBTYWx0ZWRfX/Bf9X8WXCZot
 KpQQ3eBMgathtrSIlQiP7h+EF5Hs4mERSs8looabBmLC0gTW1PjhybToCDOj+BpzTPgwB5cHioe
 xaUHOG5zjDHBrQMEnHKIu0cZQ0opImxWMxZCAfYa+4RcVsqZ7ph+BXQWcjv6cuHkAnZxf92GWKk
 DHIIXQgXvEFWEZJICDUjVh0zdRvVTDIcXN1xF4BA/kwsIoqCB0zE4w+xNp1a+QG3KQK69O2ASaQ
 DwCbwKzf/rOialT2yYjojv14uSoAXr0/X4+I0E/2NR6kgI5VqI+pEgiuF/LIx4tYHE8cOaQCnSK
 QQFKRDcaOkHVYhxbYMKkk8V97wr8exIwPJRjh8ckBVVPvaUy3aB78pBnApjISgWUzBDW4AEyNTe
 NtpUYA6RpQbzCy76mYExHlBRs1VJ2dqVOVGi32jKFB5Zbh2IFkkOGKqyk2tW8JmwGyTNI6cTQXZ
 ZHD0LX7nV9tmbGyzA6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310062



On 31-10-2026 20:44, Loic Poulain wrote:
>> Bryan, Loic, do you think we need that change now, or should Glymur keep
>> the current approach for this DTS series?
> I see in the following in your Glymur series:
> port@3 {
>    reg = <3>;
>    camss_csiphy4_inep: endpoint {
>    remote-endpoint = <&csiphy4_out_ep>;
> };
> 
> Which CAMSS pipeline interface index/instance is CSIPHY4 connected to?
> If it is connected to interface 4 on CAMSS side, then we should use
> port@4.

CSIPHY4 is connected to CAMSS interface/index 4, so the DT should describe
it as port@4 for a direct one-to-one hardware mapping. 

I will raise a patch to update that.
-- 
Regards,
Nihal Kumar Gupta

