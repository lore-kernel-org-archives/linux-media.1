Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374153;
	b=BCKjiEidVZtnS+QdPse4rxwc2EzH2WBOP2anCP0TGzC2fiMc+VhOZqCQ+4ekrqLWeqms
	 ulU9Fl2NdMIf562gltdZ98AO6Wdtp2MYkr+gZg4mX5L4V3KflQM5K8uEnGrBAEHdEucoR
	 lP/YUA/ZE9OjTgIA23L7+zI4juirlLMljTV/w2GXwwb0Iy3PoWl63mcg45cH++lrBsUzy
	 CSG1A8p1BeFOZuPh6pAOALOzyqwk6TMDRJehOfVElmoDcNktjbiiquIqOI3ImkzCqWB+R
	 mOCSXPqqPvd+qkUxp7gSFS6ppocrGtyqEHp4xFCJcHvzWIzDTvkc+XuuMs0lGX9Rx9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374153;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=;
	b=usJtFxDszErlFoZ7i+BTezdHtQUXBgUHUSeYOvJxzby6F8lYZKYELZNYmrZ3x0DXSu3h
	 uT83S4apAVzLl4BMq/HdSZknbPVo8fOniNLN2r86Ya8N9fPDhozkD1qxgINeE+EMuEFsM
	 lirHbduURV1gewALssmjazLlopsfIQilaowFVzFQaPBY9dRZncSSfNapiQWdwWdzA3dr2
	 zFYcWu5ir2W7r8n4JtS9aiLfiu/RjP7wmGTg3P83r5x+peLrb1GrwAiwAnFGTUhmFRm5i
	 q6h583c66g1g1Eq91xoFDyLYt/GI2hiL1Wg6C0k0PV3EvtV89fBYi4vKOL7DRwXJ9QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF2zeuvs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjGU0fPd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2374A606A31D
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 15:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2374A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF2zeuvs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjGU0fPd
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERliY1953664
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 15:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=; b=bF2zeuvsw8xTU40d
	HT3A/yDe4WC9oljx4DKP+7HSiqoE9+lGkf+ymTN21QJD480GTyQ1CJtgBZB3qrHU
	ImLYsqEaLETN8Bf3czzoU4YN2cyGFE1+OuswgKdL3Wb17SXpYgb7UYpW14Lz/qxe
	yJK+863j/y17yMbvgKRvcWSZX/dvSVqxQpCk1aoFQGpm8WJqnFL13Xbj19Y4SZFF
	mK5KdJyby1L3t8TcdmxyONIf3mU+G0I984B4n4ksG+ySVoLL05k1v3iTvqXL56fe
	RflZcfEETNCUegj4fE3ge8WiWNvwtmiiKtTOX/I057m+pb0IojphXTVCyAxB3sOL
	USiJPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pkrxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 15:29:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e942b1cc86so9792995ad.1
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 08:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793374152; x=1793978952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=;
        b=XjGU0fPd/FoAjh95t5/VvQCDs+5TxtUzwmlg+vVR6Dpxf6XDog4JHmvr9vH4te1zW3
         6NJ1VUuC+jf8CbusDtfj0zFwmd/1PmAd/+qlSa7cpbmsDKR/Lw9XRyrka1TJ/tyRdWCx
         ZATq2yi2YyuSI2QUlFO4yINsS3HTRsnMTiM2qw4/XgitCmivYMn5LnoDdg7+J2vHWb6y
         kT+mYdgXV66stbpPUJ/hQzAHj2Mp3LA2aryyrKV1L8o37faDdaVDtOMsZ1YvboFy9Tym
         Cfg4LB8c4Z10Et12cQVkP3tIze7K/ab3efvtjqS6k+XcctVmPY/5TOt5wchMG074JAc9
         BGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374152; x=1793978952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=;
        b=TSlAoVlptzhORg25SLnn0kwXQz/2q6fBk2gdp98NrZnCmxGXpJIcMjpyDhSXdpbUkp
         JRuK9KOwmU6Cee9IG4d2re7uepL+qul7r0H8WEVhdgl9/9XQSnz9bNdj7O0TM7Ob1Ff3
         lLW7hQqqHxV0u8vVxh/CwlMesT9CoJDFwizNBtCa/1eNPNAAViE/BTgM+S8OYTunBQLD
         hL2ij4NQ8VitQGal4TcLtrTeJa1mVIAjH4Z2PcxkiiUsZ/qYCg3KVyX2OZF/lP6VmVOF
         RWUxOYy6vCF8nArh+tC30KKF+jwaodzhdyoYB/67El2rw1rJlrIZx/8LQsgrLSewWgH3
         obnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYGXkBHBOTBO3jdaJmq7ro1gYQq/kQNWgj8k7XJjED28KB2GMeXIIuimv3rufSPmDko654fGKtMaRANA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLX9SYB+NavROYitOA7unwhAV/x9M7dATGHYPtWuOLI7m7RgNKK
	T9sl15pml6PsLV83NJ74uaArgIEgkInpAudQbU3jcyyKKn32TnuvgIIvr5p7X4ZnIp/4svQKtCG
	10w7jKjJ0/PhY4aj4IVXKVWIVFSCKVQuG8I5zS+NxQXN0fdNSIcOC6b16B33zfNmRTg==
X-Gm-Gg: AYBFou1wZ6L2cixrPgBTcDFPiB6KIS0mxCPVrHqj2U5KQV0mxChUX0hrdeRwRR+/C4V
	TsnDwbohbKipiXVZR1f+4bv60cYqd4wqfrXyZ8C+DztrgPBDHxMmB7vx/Hj7owCUjx3d7ixlA0A
	rE+FnpdpkHHhYHv8YVPxZXwFZS5XK+7IDGdkvFO6J9aBx4pShN8OOTOYXID1x/7Ao89kQ+wYIl+
	R4ZY3479EKyJ+EivEGfURwx+7GfCUYPVEhe9zSv/2Fw7kQ+dncjczYwlsCIZTxAbFm+2beFCMQo
	hojvQ3SG5hlT57FQ2f+bycKYkKaIQt6rUusXYwPd8fRYN2XfApSKv9akd9YNC1BtJt+97aaPG8m
	8FshrDs322pfLgIj17mcH9r1Y5c9uaS59MqSgE7i4h/Lxu2nlahCD7e4/C+cC25kph7kRAOlkN6
	dep/1mS3FzQGJl0+zRoJrnXJ0xN5mTTk8TcOUf
X-Received: by 2002:a17:903:3804:b0:2ea:fb8b:258d with SMTP id d9443c01a7336-2eb36401e95mr30024425ad.6.1793374151739;
        Fri, 30 Oct 2026 08:29:11 -0700 (PDT)
X-Received: by 2002:a17:903:3804:b0:2ea:fb8b:258d with SMTP id d9443c01a7336-2eb36401e95mr30024015ad.6.1793374151265;
        Fri, 30 Oct 2026 08:29:11 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.160.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392add5dsm9202195ad.68.2026.10.30.08.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:29:10 -0700 (PDT)
Message-ID: <7d443972-d4fe-4bb0-b758-49608bd27446@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 23:29:01 +0800
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Bryan O'Donoghue <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <23845ad3-dedd-4e24-803b-5abf3b030c4a@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <23845ad3-dedd-4e24-803b-5abf3b030c4a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfXx7i0vADVi+ty
 IfR5NCRonB6JDJgFK7Q4PFBUcYElJmF2kBBQFlhh2Nk3yV8eL1IDbfQsIJoaHOt3DNSvTjF0aiK
 huHaNqcCFxdiLM1VgDTAeq9A30uX69hnq6LqsjQZre8VdeZn+xYeJg3cfjgmLFKa4EqDKJMF3Pv
 48EdXtM4I9qEzEAXkFq6gxXo2G2WRgaN/5yPj4itBs20G4pvih6xIklCz2ojdp+V1rQiRzOBwXs
 qXeeNTBhsvtBdGGSww8FUivroFlG4K53ra2RcHa8u0m9NEYJqrUxih9ZkQwr4WpSeCmoDorr36L
 FsP0+uAlKjlhj0f1p0U4PFMREau+RcyNNWal28/Y7Z/PX5CoDb8Use/PQh7bQZTdsBmvbEMCnvT
 TShBTXsYkVjc7UlNqpyk96DdFezPcYjDsr+6J1vTv+ItLIYgfHL6ebcOdcJ6uCm4HVpgRoLDCk7
 smUV/UK7jadKkhUlQ4A==
X-Proofpoint-ORIG-GUID: pH0Yzt--iYgmXU4NbXOqXbCLW0nnIi_S
X-Proofpoint-GUID: pH0Yzt--iYgmXU4NbXOqXbCLW0nnIi_S
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4b7c8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6d0oVIyUxUng7TJeo7N4IA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=l-QsVsxeav8zdcdG2uYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX53a716qPsaVa
 ldJb6DKvLupKbt9ORlzP94p5CcpHw1ly5fTa8DwBLDsydQ35HvyjcAnERXx8YmFZ3Anij86+qxf
 M5oz/7RMavE/lW/KAYWEdK+5Gsmgwlg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300061

On 10/30/2026 11:05 PM, Bryan O'Donoghue wrote:
> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>> @@ -6113,6 +6341,7 @@ static const struct of_device_id 
>> camss_dt_match[] = {
>>       { .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>>       { .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>>       { .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>> +    { .compatible = "qcom,hawi-camss", .data = &hawi_resources },
>>       { .compatible = "qcom,x1e80100-camss", .data = 
>> &x1e80100_resources },
>>       { .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
> 
> this insertion makes no sense.
> 
> In fact glymur should have gone up the top with hawi underneath it.
> 
> Could you please remediate ?
> 
> ---
> bod

ACK. Thanks for pointing this out.

The compatible order should be checked carefully going forward. We will 
correct the order and make sure Glymur is placed above Hawi.

---
Best Regards,
Hangxiang
