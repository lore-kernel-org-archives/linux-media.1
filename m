Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797647;
	b=nIO86dbf6f3cTyAEiQgsX4eQ50ZhgKjrcycTzYvL82YlPCDNsKx775pWk1fEhIsjfVKR
	 Xbli0/uAQ3Hw69TlCWTvy5Uw0aIvFzzXgH1EmSHw+H7Hq+S0Nd0NX5O3K/qEBmnISOyTT
	 3AKc3iVhAMzC3/37yrtjtjEq0pfSqfMCNtb9IMvFjA/1AMOUNRBOpyBunnRStG62akzsh
	 uu/OdT/rM4GBuWlT1+9kb1E4B4OGbEraFbcpIMQLCiDWFDvqG84b17d2ev26rCPXnsUfg
	 CVmqfz+feLCbiXCrIzi112eR0owZ/iNz1X1pyi0U6oBh1uwT5+d7gQyvEpyEEwiFZDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/t5gIXet1KU0fg2tYdJYIX+eipw2gKyXU/2amvyVhs8=;
	b=FYVgs5OyOzPjnjiAetkdofYduBxcPZr8GWyADIIxm0kOF0AkrBpI5aklEUDg4WtHX4kF
	 0++glC9CrTTDUYK/8rt+AWAUHJEUXiXbOc24loa3ghlGdlr6JoHZJh4V5NVKkMQWfnpVW
	 buve7AFDqDmxRsTdLLTdyGovbtyzH1Ekz7zodC46iZByNa8yrokWp2l3CFFa5X6seCFhc
	 SNDSJDtLzl+dNHyyCVfkkQgo72Jjdd8R84XujdK7yfYXtQcQtAyThQ12Qf0qYfF22Qsgi
	 TMJP4jCgf9xUMkJooXE005TR7zy2bnGXdScWf3cTD8IjVRbg+ZHZSpBHvt4W6J5IizA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cb+bGGQV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j4oIqoSM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8687560A2616
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 23:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8687560A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cb+bGGQV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j4oIqoSM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvZYP3471095
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 23:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/t5gIXet1KU0fg2tYdJYIX+eipw2gKyXU/2amvyVhs8=; b=cb+bGGQVjydzF9Lx
	J56AKDjoIYpS22BocoL9bhKBFDX36DHAxkwH5YB6vPzYFzSOIb8F0NU5kdciBr/f
	0SBywl+ZZUczmwWqNyqNxc30oixN1PtxbXUH+8i4Vqm2muZQVi7wJ/6j+kwIb1DQ
	mLTUvH7qxCiaqwza5PevPSPsvwtvQhyPhiwq/cxpNa4Yv/l6esLVF/oJRCUKpT2E
	ckNBVhsLqqp+2i5i6LcZtlUr9/sdC2ZV874U8JIkb8BAhOEhkb+a3AsLwjEBwB0j
	tmQg1ooMKyc/cUoBQ/f6BDEABgbWxpWo8+GvAvaHYNKATK8Hho8DI0jMAQImhBN2
	nHPevg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrugupf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 23:20:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so2077524eec.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 16:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797646; x=1793402446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/t5gIXet1KU0fg2tYdJYIX+eipw2gKyXU/2amvyVhs8=;
        b=j4oIqoSMPXVP5YMbr9ydcBNENwx3ioJbVZmxmyCK6/dVnlo1N8mCpVQb3+P/H9Ku1i
         n386I1edb+55MMWX3Pez3DUaua8PmRTmx3YCULOBYf9PD3oTQYIZJDsbgsK5myl8fpdg
         IiJ/OlpcruzntYCVpsTMjI0vEaI2+gaBkv1rNKwJvIa5mQ0d2iD7uDXrRXiLVjx8Ja04
         6nZvwhHe0JdPlJ7oW5yy7tHwXTlog4hfQvIQKjEfvGTMSNt6L/bx6GM4InzY+g4J6t9k
         FMzuJQPkWZujjt4WSAqK9ejGn3EtyYdrYiwNpzoZOldBGCuHel7MfS1k/9zXqzysuZ9D
         hYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797646; x=1793402446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/t5gIXet1KU0fg2tYdJYIX+eipw2gKyXU/2amvyVhs8=;
        b=dVMbSaWcZc6rHle7++juNVbkx0z6E+evJ01pK33q2A8wi2WTLnQ+ASbHlMLl4tlg+k
         +UG4k36gilHC4Pb6+h1tSLhLlHcbPOVcCpH3uNwwPeFoU77UbM52i1Zaogo6V1j9OtCh
         Gq2B4FuzcIx8vXRtPaFmRpJL471phEADp9UXdS7iRdbt0+5Y/PisUltEx+FIpcZ2Vl3Z
         j19rUrToh2lxlrgfR+ngBScGNGZGP7DDJzknBQ7BDZGrwUVK1Gj3rpXqsTBHw5j4mlqv
         wJZtx72pvP0Q4oNhx0lZRNVdsvTUNadeC3slhA1gUHCKEcXkD87mfksuyZNORDcnjAfe
         z8bw==
X-Forwarded-Encrypted: i=1; AKwUvByawEgVahB3Sif8rgxBP8Y2umJV23tyqx2yVOdRn+g87uFqDxxSpZEP9j1vE9IhYh20FI3RFOLo14tcaQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKlZ32Galq6fTQXZe6RvAa4rolAEzUGZ790UFS/GHZeYEFh8PtA
	r/pHw6gmiuIlJPWmgVh1JYLYshXrLEuhlPl2oruXMBAIG2ykSKM54nO4d9ryYh0EwfgRsyPdp9g
	Qx6EUk2ec7sNz/PgavB8BMJfldyYNxR7wP6T9YxpHYw+VhZ4yN2IKIkgzb1ojy+qSOIvL0C3Jgg
	==
X-Gm-Gg: AYBFou3WoTboYbGmNMldvERy+CGExW+0iUdVAiOiHOHc93xp3dzmCXoc2byUAPmIfSG
	OM50YFBpx9M2Q6TlTv3jNftauGz2F7m+YAOuqYHERYbmzQRbLlGhyMe9n9egvGNBbyukEsESMjt
	VdWPtCY+us6ftH2dU8vmjEE+9C/z+NINgCoze+hCcN7zWszDjL8bQS+qBfYJ81XrBgh0nOpV0On
	8G2p/srCRT+OEbeyDaiDwh0TMwWRB6H5YYLJzunxSvwJIQ8bD/ur9OUzOtaZSsq+fvRqNzhfnp4
	dZGamfw9mv52EbCm+lIr49RoFQFKC+rPYg/8F73yc2zVZ9uPP2UuGKtIogtmHq2BJLR1iaJ1BRN
	JVAmfOwtB/vdPDNOo3XmVlAZ5SQpKJxHkflYlD4bk8bYvM2gFwTkddqem
X-Received: by 2002:a05:7301:1530:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-369e84e94a7mr941199eec.25.1792797646033;
        Fri, 23 Oct 2026 16:20:46 -0700 (PDT)
X-Received: by 2002:a05:7301:1530:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-369e84e94a7mr941160eec.25.1792797645424;
        Fri, 23 Oct 2026 16:20:45 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8dbaa42sm1633083eec.21.2026.10.23.16.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 16:20:44 -0700 (PDT)
Message-ID: <8741d667-efdd-4e3f-a1b2-2f04255d7c7d@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:20:42 -0700
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
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
 <e3d322a0-43d5-4369-bd09-128152f4b233@linaro.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <e3d322a0-43d5-4369-bd09-128152f4b233@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX5ZFUvcaDPTs6
 7IvPGOqsHW6m/sGmXrn+jS+9m5e56iLfa4pKtiNVFMZ4EoPK+2/u6zfGFPgzKzZnZ70jLPETv3q
 1fgKXAWbWLii+oPdTFHPHPJI4VAMN7U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX8CWFuEZr6zBz
 5xIntV/HJw0OCQR4G7k9KNjilwmDGTVlYQRMQjhZHeAhsyTe4AqZceX+RPqEC9iWXKv8y5foH87
 RfX2cogdJuaqf5r5OdJBJUHSMtcC0S4HdpjW9ZgrarXD1VI3AkIZAEBd4TAo2NNBtqycWMSbfNW
 AnNIVpofKS7ZcG/M0mxUc9clL0C1joZzEjdWN9E2mnQKfYxBZkrgYN0A6xQWoAc6fYzsvDlPqT7
 sU66baBjfy/t3A2peJgc3ojTdqvCwsOhcEi9WVyjvDLhG7qMlfdPskLr50W2cSBiahPd6AY484g
 nde3/owWbe1SD/cDbWtZhzagnvV/eSNM9GTRwqecyifwD6rEckmuDX3/AGmguigu5FjFCRKCwZM
 Ab0XSsgZuv1GD1yNs3wYfWGvvF+MFeanI0ohT3vaGody9nv3VIz4T55phu9iD8eZrBShUTT+ThP
 17Eac3u8h1JjD76dNpA==
X-Authority-Analysis: v=2.4 cv=Ju5kP84C c=1 sm=1 tr=0 ts=6adbebce cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=0dgAZyHGDfjHxxwXnN0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: qZyhKhnbBB6EdSUonH86Tu4JLRizmQi9
X-Proofpoint-ORIG-GUID: qZyhKhnbBB6EdSUonH86Tu4JLRizmQi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

On 10/22/2026 7:15 PM, Bryan O'Donoghue wrote:
> On 23/10/2026 01:33, Anusha Arun Nandi wrote:
>>>> +    if (!cfg || !lanes)
>>>> +        return -EINVAL;
>>> Lanes must be a multiple of three to be valid, at least for your three
>>> submissions to be logically consistent, this statement must be so.
>>>
>> I will update the name of lanes to data_lanes in
>> phy_configure_opts_mipi_cphy struct.
>> I will add more sanity checks for data_lanes > 3, as C-PHY supports 3
>> data lanes only.
> 
> Sorry the only thing weirder than arguing with other people on the
> internet is arguing with yourself.
> 
> I argued myself down from this.
> 
> =>
> 
> One CPHY lane is 3 three wires. So data-lanes = <1> means three wire
> that only the PHY driver understands.
> 
> We communicate in lanes not in pads. There is no meaningful way to
> specify pads in DT - only lanes.
> 
> Which means lanes - I think we should follow what struct phy_mipi_dphy
> already models for us:
> 
> /**
>  * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
>  *
>  * This structure is used to represent the configuration state of a
>  * MIPI D-PHY phy.
>  */
> struct phy_configure_opts_mipi_dphy {
> 
>         /**
>          * @lanes:
>          *
>          * Number of active, consecutive, data lanes, starting from
>          * lane 0, used for the transmissions.
>          */
>         unsigned char           lanes;
> };
> 
> For example in DPHY lane == "two pads on the SoC" so for us in CPHY mode
> lane == "three pads on the SoC", there's no need to deviate from that.
> 
Ack. We will keep it as lanes.
> The CSID needs to know the symbol rate - so that it can vote on the
> appropriate NOC/CamNOC clocks/rails but... does the PHY driver itself
> need to know that ? It does not, symbol_rate is not required in this
> struct no more than it is in DPHY.
> 
Yes agree. I was thinking the same. We would not need the symbol_rate in
the struct.

> Sample principle.
> 
> So _really_ thinking about this I suggest
> 
> - Following the DPHY example
> - Including all of the CPHY specific timings
>   The ones you posted, plus the few I found missing
>   Any other relevant CPHY timings we may have missed
> - Include the helper functions in drivers/phy/phy-core-mipi-cphy.c
>   IMO we should use defines not hard-coded constants for the
>   specification of the timings here, unlike the DPHY code
> 
These comments will be addressed in the next version.

> ---
> bod

