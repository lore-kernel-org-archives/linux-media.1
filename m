Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493371;
	b=a7cCrqOfGEtWT1lP9RbPFTGQyyW7kDvmor5UT11Qv5rl+RJ2RHhXawBs3+ekpy+s+eir
	 vUVr2oNbr5lqAEkdhZv1ZMDIweYHB5PktPtpDw+st5ST6lJW6zMuXB6bq8QDjQY8S6W2B
	 ESM5YBA10J1oiMlmt6iKyhL6/vyV19XzlIyRCQRd1qlI8pft02QId2/B4EcqeavddBycf
	 9n0uHkvImq96VNdI20t44RPzOUU8Fm28DDHsD2LGOic6xncRPMV3FFdlIBCml1hl7yooL
	 PoRLHLpKwmDyWOKYLbmJDv8k6a5Yo6LnggNMOrAg1xum3GcYQGwPnisei6L2BgVFuUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+eMaexRE5YK9LKV2U20lRzNlg/Uqk666DN6/XsuIY9E=;
	b=Q2f8dT4Iod3pGjhANIP9QOqsvjsIJErGrahcqV2LcEoh/uKVAv0CRGJNG2IdYaEImDRv
	 0SpJydln4Le28iBOr7BK+TI3n9HkZUKaetosfAhGulTQSHa4yiWbnL3EI4kCrrAJcEVhc
	 TKq5WG18LcgbtwH4rsHa9lnldLM8WiV31TIdhNpLZGfv6mkLJF0JbfZ6ntXkny+J/m9/k
	 lyD4KgEyyg+0wcN2fHCve9EDmeFfK4ZdI0HAmNDFBTvko0ce7yFdY3UTVzzkm6tYuSaZi
	 +SV1gCVOyrGCBpLXUAAL/1omceb0QK5IEVi9ijf5QtMM2g53Lv+e2TmZmUO0xTCNt8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QRn4WhY8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ii4ssk/m";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350C9606A321
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 14:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350C9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QRn4WhY8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ii4ssk/m
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9M3L54092373
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 14:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+eMaexRE5YK9LKV2U20lRzNlg/Uqk666DN6/XsuIY9E=; b=QRn4WhY8RG9Z8KVP
	f3dKHXO4obz0OeZ36CntkiZecVhpROOHa15oszqHYOWx2HSCmTzeCeo1DryB7tHh
	U5RS4LsF8L4jrx7PPUsqmJiAcIqN1py+35b47WlIhjdNCN6U/5W4P6BDls4qnFnP
	QbUranhaa59lowsrk7XGcwU1wAvzAetzUhYzXnpJERt0HvFh1MVUaC7MidceQFXA
	DSbVmCkaEE1bbFDiqtn/UeG3rHWE4CPruCNQe053ryQ+egPrPlnnIvpZ3jimM9zw
	G1AuX3s/11GkkbBzAroRpouZbauyvCTsZla07Dr6aAdLO6EYafbS5Lir9GhSvxrl
	GBkO1Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8k6w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 14:22:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a065e2933fso5639902b3a.3
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 06:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794493370; x=1795098170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+eMaexRE5YK9LKV2U20lRzNlg/Uqk666DN6/XsuIY9E=;
        b=Ii4ssk/mhdJWrdV93RTlZvIBWCPjwUnnu1DxEIAL4jSQUiZN0RguCShe1UxWY6eF8r
         j9h70CZcR31jH/JH3PYeREIf1qPeqPepQsuhT6A3O9wP0IIiTb1DsL/oa65aLA8PzbNi
         MK+O+qIw8MTMwXrh0Ye2OciaV71iBrdPQFrtM0EcNP4XlxO5tXg/Kl+cDprv2skm4RZJ
         RA9TsEejSxdWmZqdRWr0nw4OZ9WhFKyPp0Nxp06TaFpInPl2xWIbLTM5w9DluaEUBF6c
         gWjFi/sPcgNUK4jF91+cxn/Z7ohOxyn4MqKdP5Ux39anXNfRLbQwND2BvGYFZ4uomdoW
         /Myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493370; x=1795098170;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+eMaexRE5YK9LKV2U20lRzNlg/Uqk666DN6/XsuIY9E=;
        b=RVqvW21b7/8RneqOIMpoQqIyRKrEd+RTcH2IyI7XB8pIXcBEJxlZWcimHKfWpp7BNw
         6QLG8W8p6+R32NWuYGqRTTZA6vyYU5Ma8GHXwVuB8laLZ0GdtVXGX2n6LuVv0kxPgO6c
         zxAcHGTD8LicZTLk41fGZdA4HZUrNqnPavtzSrNvcu/NpspNJlataGE0jkiwseGIS2GP
         ZqDaaL2thrmICrhw9HdGcyDfPTnYwdvTMYlr5BPMoK+qbvJpP2zulrm7ULQNi/xr7wH/
         HSNgtQbr2G6z9X12P6tIlN6GCjeYWXeilyhaDvN/JE84RrvqZ4W6ElGbrsPwyA3XRdYL
         DONQ==
X-Forwarded-Encrypted: i=1; AL+hErGt9czhBw1qznJEDTpRUF2XGAW5oy3lHzA/ZljZc99q3HwguQNSo0/bERX/2FBplA2VIeB9LhQAvpvXxA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pc8QSA5W58O64Y9TPPvVhTeVu+xe8Yt9k3XQEYKUYPUt59toH
	d+aQeb1DZtXVBvq5wmnIAFRx3oNZW6h1o5qoexruZza5i/yEXK0WsUbBJOPlgq69S7Wyb0oFNOL
	t7UCwqpU7xrrMyuUUKt8Q+/sHSrUCCvqyJ7c69KoCCQ7hb4Z4Ns49T9pX/w9GT3OgoA==
X-Gm-Gg: AYBFou3TlkOxNcox6HvABufREvhBM0QgOvZjENPBjLCMTGzwBANl6Nn3iKX5SHW33G7
	frQyGclVEKdRsiHMS/UwI0droGCSooGbFHQfbUcWt7z+b0zXF03WGnx6wWAOtf/wc4p6caJoAzR
	XG/lhSrEE/I/FzsFUtNn3zMw/r2M8OHzh6RAwfL3wOA+OSP0qojoXrhrQ0QxdJSCm9/Dgd1KZ9u
	QcZaF4G82na1C4jY6ouwO0cT9QKkCjrVG3C888RufgAGiTy+R27VHhZsGRwK8E/TNjut2fznPwC
	BZuyVJ4EM5gREZl3hCa7tkIkjuZwBOqfqTcyYghro43y8t++FmndHSQWdarna2tAru0+w4Dhp1t
	bfTRoP7NHLZZmHb3teiD/M7jS/VvX1gmriI+uB7Byg/LCAAcAvkjLbK0f1u1q0Jq9V7g6Hm8FOu
	2w
X-Received: by 2002:a05:6a00:400a:b0:89e:6bef:70f9 with SMTP id d2e1a72fcca58-8bc1cd630b4mr6052237b3a.27.1794493369693;
        Thu, 12 Nov 2026 06:22:49 -0800 (PST)
X-Received: by 2002:a05:6a00:400a:b0:89e:6bef:70f9 with SMTP id d2e1a72fcca58-8bc1cd630b4mr6052205b3a.27.1794493369238;
        Thu, 12 Nov 2026 06:22:49 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7bf82b1sm3659638b3a.8.2026.11.12.06.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:22:48 -0800 (PST)
Message-ID: <3cb96b5b-d061-4f0d-919b-09c6f336e453@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:52:42 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
 <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
 <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
 <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
 <qKk3s6LA2dFNbAVvrsOlf17dn6zizSiyVMf1rJNQOvkvLGxswT_81cDlITq0atMX71Sw0VZu6u9WHK0fS1bzIQ==@protonmail.internalid>
 <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
 <3df59469-e665-4901-b4b4-512604194ddd@kernel.org>
 <CAFEp6-0keBgVWbBPCghkxMQAQeLeOHW8By7sQrqhjSGtJaZmEw@mail.gmail.com>
 <5e0f4424-7194-413a-af7c-f6e74d07392b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5e0f4424-7194-413a-af7c-f6e74d07392b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NyBTYWx0ZWRfXz26DJcIGO7YT
 2BPXhQtOXchTdLWjMoHb7tWoHiUMyDAQnaNkPVml8mZTFr0iWUaXT4UxdF1lC8JOSpkHluGTizZ
 uHjeTZk1BP8c3VgTWWQ3k88bHXV7frQ=
X-Proofpoint-GUID: 7Og7B1wG06aO2upbeYN1djWPlC8bafdQ
X-Proofpoint-ORIG-GUID: 7Og7B1wG06aO2upbeYN1djWPlC8bafdQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NyBTYWx0ZWRfXw94pD8le4yzl
 q6ojN7jbT8hmJpZxojW9pjW8Y63k81a9CUZS27oIigyndwk0KpV3o6kTbkRnj1fjuNUjgEwZWLt
 +OY0S5XVC6bu03/eOTPMgbsn0xr4lXx0MDZ+V4Yynvxo9T3AukXfrHLpAkQ+jkRBgtRaUeLkPxo
 v1/6TQAivbJG4H+BBSaYD6V3haeJjxjmSUWfsED5YTfi4M72gXHf/qndszCl9Y0QdXBOvkCNdtT
 eKL0cCVckp0YPEVtXpmBWtvbTmeM1jfbDiWayfGoyqOrDDptA27hvPHfYb1invdYH2lSiVs21m/
 yCcYG1r/WQu5H49jokGFyk1ao5Q6KGmvF9bTUfjkUz0z505u1wnVQQehbKt+UR1RwGPsPTMfa/G
 wlnKKKG8k6K4RowFqfQ2JeDqjWapfVpW75V5slkGxA/MRlJGXyOqTTuAFh+NPnOuOmsQtLfLPRu
 9O40xWhMtC+7wTLa7lg==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5cbba cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=k8_bfzPL0-wbRAlyoaUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120057



On 09-11-2026 11:35, Nihal Kumar Gupta wrote:
>> So yes, we could argue that the port ID itself has no inherent
>> meaning, but it acquires meaning through the convention we define,
>> since we still need a way to map DT ports to CAMSS input IDs. What is
>> really changing here is the convention used to describe that mapping.
>> So, for Hamoa, ports { 0, 1, 2, 3 } would map to CAMSS PHY inputs { 0,
>> 1, 2, 4 }, while for Glymur, ports { 0, 1, 2 } would map to CAMSS PHY
>> inputs { 0, 1, 4 }.
>>
> Thanks Loic, Bryan, Krzysztof and Vladimir for the discussion.
> 
> Krzysztof, understood on the DT binding concern. I should have got clear DT
> maintainer agreement before proposing a binding semantic change, and I will
> keep that in mind for future changes.
> 
> Based on the discussion, I agree that for standalone PHY CAMSS DT input ports
> should be logical and linear. For Glymur, that means using ports@0-2 { 0, 1, 2 },
> and keep the mapping to hardware PHY indices { 0, 1, 4 } inside the driver.
> 
> Krzysztof, does this direction sound aligned to you? If yes, I will respin
> accordingly and make sure the commit message documents the logical-port to
> hardware-PHY mapping clearly.
> 

Krzysztof, the Glymur CAMSS binding is already merged, but no upstream
DTS consumes it yet. The current example uses port@3 for CSIPHY4.

For the binding, would you prefer keeping the existing "^port@[0-3]$"
range, or tightening it to "^port@[0-2]$" and using logical ports
port@0, port@1 and port@2 in the example?

The driver would then handle the mapping from logical port 2 to hardware
CSIPHY4.

>> If you look at the mdss_mdp ports in glymur.dtsi, you'll notice that
>> the ports are associated with their corresponding INTF numbers, and
>> interfaces that are not present are simply omitted. As a result, the
>> port numbering contains holes, for example {0, 4, 5, 6}.
>>
>>> Honestly I don’t see much value in continuing to treat port numbers as
>>> hardware mappings in DT now that standalone PHYs have landed.
>> As long as it is clearly documented in the binding, that should be
>> fine. We will need to introduce a mapping table for platforms that do
>> not expose the legacy PHY numbering, or otherwise derive the
>> corresponding information from 'somewhere'.

-- 
Regards,
Nihal Kumar Gupta

