Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099469;
	b=OscI7K+8App/+RmSkaiEA22taosMDzBoIymkwtL/a7uq+D+ZmBTgIFOxakZmedAdLtLN
	 dpfYkrUpNdMQhhBE8D31mhOT5Y2FRZJixdIFtVKjo9g+dd6cEbSdbMlCdl0F2/5QMjFK3
	 mUFJVaPm8XLNLKGo/sJk+OSkcIB7jPEfhiIRTncU2k/7QHslg27k405rCvQBJ5Xn+18B/
	 TBdvmnDDwkAqqfW7ZSu020OOpMLXsdpTxpQcnWulaoi7jckklSUiQCdD1GZEnqxNB7hQ0
	 JVo4H/0bnhELTXxWukj/K0GVoGuYIMjqBUGJNLihzXt/D7UpWMX5x4pLzA6sirhwVUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UAHroLX2yjQ1id1FQtf/by5pAgKIpOkaQ4VOiN0W9B4=;
	b=fznQxvyZwV8K0AnElc7plIQ7OmC2Yiq8ZaHyKsQpRTMyQ23Jt1AhVYMQsRPKb53TP6Ri
	 FG/T+DloOqor5SxTsJMrglXizAGtP1fHJdiwnR1mLTuwMpYrDIHiV9ODfqcDYIYZSsaRV
	 BMCD4lUkiV4B1BcyQl499OqptuPNff/ZHNADe9EwFNGz0yKx7HkyvA/riuJiIZGJEGTGo
	 EWJflfq+n5uJ7x8xrpPkFqT3m7r2pbnP/IqGbbjNECdAnBPD1xVLrh/aT843lZbPh6Xj6
	 SlIa+nXg2YPMiaBG9SohIwk8z1+bYJxYbgvXArqNPN+MLDeWQ9Y1xtwR8CJF3cqyx4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNYmRbsw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgBFq7j6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E550606A31B
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E550606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNYmRbsw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgBFq7j6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeJ4G1427318
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UAHroLX2yjQ1id1FQtf/by5p
	AgKIpOkaQ4VOiN0W9B4=; b=oNYmRbswuQ/oPnTmO/h0wYB0cK8Lyh0MfwqC0R5Y
	i76tzGsZDHYhJAmY1IyzHl/a0pPY601ciDq6v79CdKT7aaT4LAG2p3BU+yn1mTQK
	NkLA3DPx7b3FL+fmG2dVlyost7/s3pjAVGkfTUJpTB96tzDEsmKikqx5dlSV3nBV
	ZAAZTbYMe87IktsYqzZzwPLISji8HExde6UnHgVg5nAEycSDXqiR0Hw+U71s5J1g
	t7r1yf1t9xIhspG5CBm7019WQb4vkdf2UXDza7uxFxvtfyqd/EWqTuQW67LnDQ0X
	cpkIUUfrnqK/FG7u/MdNe/0GvMH4pFXVX6gatG5p8Ywg/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmb96x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:11:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f13c143c8so739712485a.3
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099468; x=1793704268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UAHroLX2yjQ1id1FQtf/by5pAgKIpOkaQ4VOiN0W9B4=;
        b=NgBFq7j6N3nH06rt+qL1JvYFLIbAuh6l6PpP5/HLw8qRTNkXRBTkHf04KW7K1cidjE
         vRnsYXCLgenSk1VM/5ibAW5d4f/D1fwc7BEDPy/yBmPwP9V1xKfojp3VFRVGYLkr7IJH
         lCJiEhwGGNLAjGa4fbDTBpT6w0d+Kbn23veNPBda8JbYyEpVVJUolVSfv8FRdcHMwwg4
         sQDrlabH4P1aGgVHOz10R4eZziHTQmdT0L0Fz+VS5L5ZDi+MBtbgz9a/lvzZ7JzcSHQx
         CTyGI98hbcKjPfZrPi/i1W8RggY9gmDrWX//lRfRF+EM9bfo19NELSe5ffWQRWfpgy/7
         PxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099468; x=1793704268;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UAHroLX2yjQ1id1FQtf/by5pAgKIpOkaQ4VOiN0W9B4=;
        b=b4D8Jv0TUWv8XU4eVZfJMnWufW34Jl0AKuJIpKDz/guoky6iFfAtuRuTY2fUBNcnrq
         ByXRlKORnD0tM66NWnFopJcszAw3TMNk1oovp4fN57p1WNFlmvJwA6ZSt0ieOUCMg0G/
         HEB3kGJkeYfZiG4Lm5WnyZPpT8mlEq5WwUQAyfstMc5xxlk7d6/aAMThpyT/BUWU9HLY
         lcdBI5CujxtEdIeGXaMq6bBblZzIIoQQBODQl7BBo61SGHvmjY/1gzKB5Tr1vu8iDrpK
         qw9mJWjmHDlNJwBbJN7QlOfXpq/NdkCUeoeVklnavxFgtfxtD9E+s/5bF8JC8xPbieCp
         QE9w==
X-Forwarded-Encrypted: i=1; AKwUvBySwuddbrFBo5Duw0+iIP8BuvHpwwcqbFhOGTWsbDdWoaTjzF+zm6NOdOfdB551k0Ke1CYcYfqZ/B+aHA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL8UIxRPfqME/3/B9vpm5Wi/8C+rcuyjcop9OH38vmfjAWlhHL8
	IxAhiiD7O2jPfWvbHY5wWhXKqcvPE0eaFmelQyUobGxmywyUo3U3iOkWf02JJXz03vZK+tFh8BG
	5B7pCCjvTZuf+RTiZPpRMRr7O386gzTtQngF75rrb7kqjPLmWsM1mNS859S6EPOhpmg==
X-Gm-Gg: AYBFou2dJRT/jzH8AzapycxhdMpt7OuxVd4VMPuvw/dic45FRPsVgYdvw5mH4jkuS7P
	+5JSrejcE9qZRT54GKeekgRsj4cBqlAnyf6XcFTiNjFwxyeiJB07AZdDJ+46P2We6b0iulwNAeV
	NvlZnciIxzMc3A6wZp6veJo3PcUHPb2O3W4kEwqrVKKZ0egIxa1lgfBV0YQrs9yDJYrsXuzRVto
	PTsAPZino1HeWGMjUrxyKnctu3rhgSInw8CFuFDAvCS6jqqhEXTFnvusX0JMulirAd9hYodBPy1
	ZSW69JRIhNQTGN73yq5H7PTa1cv2osgeQd6UyB3ko+1fYIvGPF60Pm6VhuyIIPlIJDqYnVNMiir
	sV3PJMzOe1pQegqn/NmnFE75jnzF+1Zhb2VYpJrrCdYir/4BuKlXmbdZ7hgEVRDdaRw==
X-Received: by 2002:a05:620a:4542:b0:93b:d7a3:45cc with SMTP id af79cd13be357-940ef96b7eemr1294808785a.53.1793099467362;
        Tue, 27 Oct 2026 04:11:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93b:d7a3:45cc with SMTP id af79cd13be357-940ef96b7eemr1294802485a.53.1793099466727;
        Tue, 27 Oct 2026 04:11:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb851sm19109379f8f.26.2026.10.27.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:11:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:11:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sm8450: Add CSI2 PHY device
 tree nodes
Message-ID: <mwaqzdht3xlouezqwgr4wqmknxn53vjqt52tozdbrxbdjhasbu@yegyvn3f4nyk>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-6-vz@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026224957.1115370-6-vz@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX8O22RXfAV4F8
 71Xn03RURrhHZVmUENnU0rLAcnS2vozbh9tT9PWuzw5F+qKmug0eX/n9hNR3atHpME944ZNyB4I
 IbeT28a5frOvKQW4LJbPIWzEZjO2H0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX7yKt9/+X6mBg
 zm5NyKW9136koth6MCkwj7bxHUCXHxVjA1E4XF8oLL7zq8oQCa/8AzWexbSqaJHMZrUzQKRYdqQ
 DMRBO1oth05fONYpZ94OODKcBj+v0mq/b/NYS17axeQ/O0IZlXCYt801fC8BVtJridmX3VdzYVW
 Hk63UOFUjeyEgXOYygq6oZMl9bwlX9zkoNaQrLcksIq1iAnSUzZxr2cnDqR5D0JzNPmsveyg2ai
 AIHnzvAhaHZF9cwSnzhWgAuhzHY7q8jgMbGrIRyYvsmIX855rFtWTuXsxsKL1hHVDWNwSW+NHjQ
 dMHoIlYFFN4ozM/7zi3wBD9558J0YDv0ne+Qy6K6pgb/5lTWRV1m5SEWz6+6u/RgfZRKdNv2qtd
 rEjJngpuzx5OgmiD0KZyLFfecodi4FXPNIjahqOS11153rXq4BJOD7+EoG1HdToc3i+iBZVAuwn
 +AfDDWJbU8EWX4wDHXw==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae086cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UwdZcGpLVFY4tAqoLasA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dxgelS6DT6JYkQtLrdtUKVlwiVYF-kBF
X-Proofpoint-GUID: dxgelS6DT6JYkQtLrdtUKVlwiVYF-kBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270044

On 26-10-27 00:49:55, Vladimir Zapolskiy wrote:
> Add device tree nodes of six CAMSS CSIPHYs found on Qualcomm SM8450 SoC,
> and a shared CSIPHY OPP table for them.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
