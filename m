Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519D137189B
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571080; cv=none; b=iFP9FFuZBsM/Q4hY3FAkJ2Qt7UEJ1E2JdlbbT2S2Iz8hDvdb/WFtGS+QSJDBMqaL803uDkAYpazvCN9daWwjI36A0OL5Htlj5OnC68OjJmvTdlxu8dnOe3Vib4Hz4QUm02TnZRBIyG5kbkJiIq4sYRUv8GwytZ7+wn/joomctPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571080; c=relaxed/simple;
	bh=ML8IQx6cSEJ7UmK5TI1ede2WcTMV4WWb3D3JvR8a5UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNKxNKHOeKjyg7abz7DqY+SUvbKRL3Ij4+7hF69Qp8nLyTvPrCCKwYY45eGV4zgsH19DOQFwjjaXpE0+vprucdgZk+U5G6XmmuURjWeetEDXrfweMVdSZJM8xVYDnqnbudVOCqkVPoS8SSj5t1RNTMOeIiFC1glO6IovPwSGZ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSREmy6Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEoyiMO9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSREmy6Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WEoyiMO9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYa5h3902406
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 15:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7LjCBqGQZV8zO9lEeRosIFBYfLlI/jhcd5yXML9I4w=; b=gSREmy6QqGpa8K7X
	UoHtXEl4UlTysmQ6XSkMpmktbB5VACXhXK6Jxt3+m9XEjOMbRzfqi/Q+MZxuGfuQ
	WDfs/DXmRS/U2QNfrkrKwTIBXsxKxDwAtEapz15N6i2+jxl3H5jkwu8y4X4wuugg
	nA7gi+d3KkPACOOaFAblt/J/tRYn1iB9yJcNVmpfZAvQV77lk++6bIPP0vyl3eRK
	a/s3RxaacqxmgVA+0HvoNWU43di4OHoZK69lGhFIxdwPW0Sg39j2y4f4py189hd3
	KeDYAtFrOm91idxKU/t8Cr4a4Mo0RvcqgXF1Qj9yUOYO/aSZXvIGH/SwbafsRkSd
	TNtwxg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2sude-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 15:04:38 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45f00527132so3542191fac.0
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 08:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789571077; x=1790175877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7LjCBqGQZV8zO9lEeRosIFBYfLlI/jhcd5yXML9I4w=;
        b=WEoyiMO9VYQsARtL97m9LuQFC1ySnNdHbo82TXuRWyT+299adBCJztPBW92TsHci/+
         r4QDCgu3/WIGclkju3uEYqqNaafNInd7HLXUJxZOjJwE3zQgJdpR7tHFKKBOmD3+m0T3
         YuH0uOWLEp/0pN/kXGvLGl2QUmjHSQMuCcAYWlYReGYWfJBr/xq7GksgqMS5NyTkwuz2
         EbhGqC5d0OqkufOG4urkZd3Lk9zJCi6xMq9ddnPDsuFNghB4UVRnWSJfksDtpfH54wTk
         Kflz2wRK3E8hrm0aQC6N7TC/5cujFkrDurTp5G/0TDqwqPLl0TCiEPYvY3sNUVMZuTZo
         zpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571077; x=1790175877;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w7LjCBqGQZV8zO9lEeRosIFBYfLlI/jhcd5yXML9I4w=;
        b=GZCs+mgXdrUO2Ch8n6NP5i3EONXFnLJStlCle0hcK8h5P+ssc1wV4ZW4Bh2cghNiWJ
         1YRN3MihS4nN8RLtPSXEMGPC5lPl8yaDNIXkYfGb00rae4n1j9dCpT+tqLgLJ8wYqsCv
         uVMlU+sJFBOsEkvK1ZthOH+43RCl7f47kezvQ+qndWclARirRTP9toXrlxDH//0AxRuF
         /cGYliLz1owet8RelaVHlYXcYbGPHb25fp+GUamRTy3ll+TyPS/WLB0PFrkT8P7bVQtT
         L5LIo2d/K2b194WkZg/QCuYYg/xx5SxEzYH3Ho8z+8g814iYMhC2ZAb7AP4FmxJKT6DJ
         l6+w==
X-Forwarded-Encrypted: i=1; AKwUvBxuk7q4/NGemY6ExfIWTib82P9c7Nr9racbF44QJDViAsGEx9oT3hNmqEC6JRLnfTFP1vjA6hGvY7k9dw==@vger.kernel.org
X-Gm-Message-State: AFuF++lL74Kuj9Xme+vpmEvxRbshErwaFoEZ2mNPqdC9aIhx4RGsSYyg
	tXkhqkZk8GNpkadvALAeKSvYzTn1OfPbOkQUG4a3YGFHO0YFzubZibwY9SYeSnD1cWVEvIdfqfb
	uHG+ySr2K5V3xUOUHRRZ9qfYkISkBdvOlbMok/REi9+k3ZuCndhx22X+XrRxnODZDAg==
X-Gm-Gg: AYBFou2pxlPt6XGGnmBjvoG2GXWMfzgoEsz4K8HRXqM6w+IxCIV9soL37mP9Eh3XJJY
	oLgGm6qyhCeUszJTym+5+C5QnMCfjR2E6Ghi0Y+PUnOQLb3pRt9NzjIItf57KJI5VxRIGU27k2/
	KBxcNeGISUPKrBQSGVjnq7E0JmfVctLhNNLXbETDbmCe6RIcVtvDS2Muv3QAD6J40qtT/7248FU
	UQgozp0/uwKV+us2Bq0DGeziidG/ZJSpXfLA8SamK+hHyP3ebXMF6YtTXmjHEJYro4sNobQVi1N
	iTgvJyziUW0tjgo5M3aBYascYMzZznHoE552tF5yY54VXy0LWt/JKp4QejvcBmYmMsVTT/EplKZ
	LQir+fTmije8xaLsizG804g==
X-Received: by 2002:a05:6808:1906:b0:4c3:bc5a:e0d with SMTP id 5614622812f47-4ca4df328a4mr3029991b6e.4.1789571077261;
        Wed, 16 Sep 2026 08:04:37 -0700 (PDT)
X-Received: by 2002:a05:6808:1906:b0:4c3:bc5a:e0d with SMTP id 5614622812f47-4ca4df328a4mr3029913b6e.4.1789571076552;
        Wed, 16 Sep 2026 08:04:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29e801cdfesm111025266b.58.2026.09.16.08.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:04:35 -0700 (PDT)
Message-ID: <6dcb0b11-3490-4254-b86c-a1afbcd3b863@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:04:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
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
 <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
 <EcOn_d45L85SEZXEL9tJYp8j2B3-IIn5Ao1OiDaZsoJZOhfDjo04cEbn_YvY3I0eidZYm2PvZNw0K2e9D62CGQ==@protonmail.internalid>
 <2f950735-91ef-4e43-a5e3-1375585dc43d@oss.qualcomm.com>
 <8c82ffbe-748a-49f2-aa52-eb7a56165c03@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8c82ffbe-748a-49f2-aa52-eb7a56165c03@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oGIimfCp0m0l61M15Tydg1UGN1L1J6Ov
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaab006 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=UOiVvvBnbk-lCBhJZBQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oGIimfCp0m0l61M15Tydg1UGN1L1J6Ov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfX06gWpTpUJErJ
 Zq0TpmQdXYVqLGhBBPX29WGDTcwBrgNTEbFo48CMRT+bRo7SLbuX2wfELEe4XbGMWTO7jcTKiej
 lLv8sdFSQ6ydObuUW7hHqQPB/xj+wqjuhpgHf07ZWvnesLof9H6Hlc9p2/+MnfuQxiXxnB75slj
 dFcOytRVSIc1TMrbQWsE4RHKYC8TCQIgmBIgdir6Rb+0KQyALWtKRaPwh9vFPYbbkoaoYKa+8YI
 JxfVzSehgKJ6AvcDIHikizMnHgU91iz+e5T3TnxqxJ+HQBzH5sSzbjX7GmwnPIj2J+SiGBFjqCT
 FG6n8858TttmND1F6mXwWgwZhPdx8/UHC4qW3FxlGv6Lx4LHXLYRcuIdZcWqoV5ctxfwIQ6fBTv
 e1T6Tt07r/3FGEB8aEu6GjX9oO0Ob884+Nir93iq4FESh7UVkawwXgMWSZoVHBvFXd7vuZTt7YD
 bkW1CjtWmyRYwmIeRog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfX7LvvBhNLIVOy
 H0XlUHwRXq/oojdVVIih91dXSpzcc6yj6j706YPhyuWHUXSRqzOISAnGwFmsTyYo/O3SNLBRoyX
 9N9jxjGYt2IQ+3CYf0N+rT5b/HynklU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160204

On 9/16/26 4:58 PM, Bryan O'Donoghue wrote:
> On 09/09/2026 13:43, Konrad Dybcio wrote:
>>> +        port@3 {
>>> +            camss_csiphy4_inep: endpoint {
>>> +                data-lanes = <1 2 3 4>;
>>> +                remote-endpoint = <&csiphy4_out_ep>;
>>> +            };
>>> +        };
>> This port should be defined in the SoC DTSI
> 
> 20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org
> 
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                };
> +
> +                port@3 {
> +                    reg = <3>;
> +                };
> +            };
> 
> I don't understand your ask.

I didn't notice it was. Even more so then, add a label to that
port and override the node's contents through a reference like
so:

&camss_csiphy4_port3 {
	....
};

Perhaps moving the endpoint label and definition there too would
make sense, i.e.

-- hamoa.dtsi
ports {
	#address-cells = <1>;
	#size-cells = <0>;

	port@0 {
		reg = <0>;

		camss_csiphy4_inep: endpoint {
		};
	};

	...
};


-- x1-crd.dtsi
&camss_csiphy4_inep {
	...
};

The current approach is super fragile and relies on the developer
never making any typos. DTC will enforce the existence of the
label at compile-time if you follow the approach I suggested.

Konrad
