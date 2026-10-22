Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637555;
	b=hLAIw01t0+Qij8DGFFePpvgSte9mjOqwzz22PwVSnN9+p/xClihKR+B/XqT/lsfufDYK
	 0OvWVomB2R5E3N6/Q414jfWoVkS0BSSqztuyulCZuyXqXuhCMCq92Tta1+7a6+juX+0yz
	 xoI89SUFRVRmRUQuMt+txYZi750mIdAqaezKWt3HhcXtClw98TnVNmMi+O79oURHz+66K
	 XLXMhOSaKVu3RpeC8UjhWgZj4FykXc0ZUZW3LBsfrw88PyL4+5Mu6YXyZSlCWi7MKnfsJ
	 h6i25Sv++hSZ5lzPa19t0vO2eDsp9kp+AGbtIPIPsi1YAGClKYfTJw+18qyyJIwTrwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2KsmcwfPU0B4n9fvquhuv3nC0jKgk9A00OaniATuFj4=;
	b=2d8/Ovj77mJSZ4oHqtLCd1FhO5N74OizOccc7LyJBWpUK+j6BHavkADinzpc+T5rgQ6t
	 DO7g6e8AHpMWvR/gDwUFAwNA5lgS/gYEwiwLpjREQlgCSsm3rygVVAV43AMKLofwmXj09
	 Sxul8IyiFHa9x1nbG/Lv6GwZTd0H3F9qEVuQQBe/i06E0gLJvb0L4ja9SUPGW6UoZEiiq
	 /jWVsr086XQJYxcx6zgStIfWA2zVqdM7JN2uO+yvcfe8+d7rcess9V2UD8j/OIwaMVSzL
	 uQaVzCRf0oA8PzWZ5WldwwRNQNPAvIuFpi/+oT9+ZVYAV1bqnHVPooaRLyjdG57rRZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3KslQfo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijlfmOWZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4907606A31B
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 02:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4907606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3KslQfo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijlfmOWZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1wcYY2931902
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 02:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2KsmcwfPU0B4n9fvquhuv3nC0jKgk9A00OaniATuFj4=; b=k3KslQfokLDwp3Uh
	M2ghKmiRaCWGXWwVVbF3171UCszgjCjlTY0vowF5YxiThjqY3g8YrSjOhS2TLUmh
	tkA5l9Jvx665feuuKW7ulrw8XszqJgqCCPex57j6G9/QMBa0bVlignmCB7uj4S/s
	C+q77C8qQ63c81OD0D8ArlNf+D2kzPKB9T+7dVug3tlboz1JRT9LhbR01wI26kVY
	NRACKVC3xICyE1pD0vNi0GAcrQdGnHloQyP39SFTmRUKpTHryNVMWoradEAwhCgW
	qrH7FwIqoZpSRFMxSND4y68oYxNBJJ+ifTjI0tNeHR1rAj+L6PobGmEQd/62m0Ux
	REjCTQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c8ac7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 02:52:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso1424486a91.1
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 19:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792637553; x=1793242353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2KsmcwfPU0B4n9fvquhuv3nC0jKgk9A00OaniATuFj4=;
        b=ijlfmOWZ0rwduIpE9l6SWhqeeRKlWRp+XmkaZyHRCm7e2/SehBAlosjKPvWMAS5n/f
         EdXxlbU2i/zSxRE0zpp48JhzxIdUOt+b6fEC6vnx2tEMhsfvEvLS5Xhy4IFwhp5Uc9HB
         WLq+HCrwUxJy6S7BnMPSCeRSEsbXdaycOnrUAvxKZy/j7ll6csGYFbZyagRjBQcQw9ER
         YVdY9XMhu5CaCRqAAh0QEHdPHe4Jtp/l3Dwp9ZFIM0QRJLssqR1c5Z/WtyIUsmN8yqzV
         T+V1yxG3EHfv2HydshelC8Dr40NhWJgJzkcb31dr5mIsPL0rp1Vt8T7pu3DCn3Xl30+/
         v1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637553; x=1793242353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2KsmcwfPU0B4n9fvquhuv3nC0jKgk9A00OaniATuFj4=;
        b=toNY4qJkBgJf7CrD/qP+itML2cum0diBYs8+DOo5v/pE0oOmtGnkwvj2C7A4W0y+th
         Vo5oEUtXiGJSBlEYDlqGPdPC+j1G6XisGPssXBjtintWy1IgYEQHn6emcAJjzJGtCaXm
         uCK0VZAzbWxUfgpqrj7yG+QoGyMTfJ8WYNCcR3Q+KCTJ/9JOFJwWJYmwVmOhnm3Kjdzq
         pbRCC1NR1Mzm/oOSUvqaDQxh24YJZkPWe5h1vXxkF4g+XLjr2x0HLPh/41QHYrEpF3nG
         +WwqeqIVcpGcLIm+0jdOjTXsRbQlIxu5FHw4Y3LVZTmWfWF3rS1fbKGUvcdyLfh/qJ5S
         FblA==
X-Forwarded-Encrypted: i=1; AKwUvBxxBEfnZPsSscTKGyxb9vTnC2I1+8DFjEkA6SND5eh9SlQfayOcvbE5isIymPSF2fBRDuIBMGHK47Jn9w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLVfM2IFzDUKBudbE9zu8N72ydLWdBzygjTnVClj2Ykf8hu78WF
	4mN8jE1y6YXFKm2Bw7gv24QvRUIhhgVlTpvoR7VSSNQzsxxctodPIPkMx5h+95KYFihXbBVXWPI
	WvDrDgqRCg/CVqJMjMVAUGeqvvh29/crvV2a4mNthhpjMgLOXt44UnsY2O3FUMNm/JQ==
X-Gm-Gg: AYBFou1fZy0HVYSf4Lgm6KAU4ntfdQvHOLBDzqnPzuk43HDalK6ZbKVfDm5v63XrrDk
	haMnR8TWWQUXsDdcMCcmqL/hZXhMSI+EIcQ6Y+ZF1UJGJZ+UMrnzQ6V98Ftgs/ewdlfGSAZpg9z
	hcvSkxN2ddhu0//A2eiDnR+Ye6yTAYdJjKpx+lOqvJAAC2JqZ3DLRGg2YMcPADfV+jCSrJEHpPD
	iwipc/4vXKCNt/OhLgcrP4ClSQNpR5xc4ryaeXaG5ZCaGI/qswKOkEfFqYFwz5aukc11aj2uYpY
	gg9ZmumPD+fYS9HEyO9pPXSQYSW35ChhDF4auL9c0kKxiucQjlSrh9NqtbgBoq+r9IEGX9Xp/tO
	5A4X+2rFTLhaol/NJPtS2YvZQNIAtE8vlis+m8cVcN/i6A7bE6HQJTbV9Pm8v
X-Received: by 2002:a17:90b:2e42:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3ad86afbdeemr2985653a91.2.1792637552635;
        Wed, 21 Oct 2026 19:52:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2e42:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3ad86afbdeemr2985630a91.2.1792637552158;
        Wed, 21 Oct 2026 19:52:32 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890c56sm2048165a91.2.2026.10.21.19.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 19:52:31 -0700 (PDT)
Message-ID: <a661cd2c-debd-4444-ac38-531df07637d1@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:52:25 +0800
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
Subject: Re: [PATCH v21 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
 <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMSBTYWx0ZWRfX6PVRgjjB9JN7
 WAr1wFwBG9I1EYWpchrMbbm2T1DpqUfYECQ9DkRb1VeNtEQqEWH1d8TikRSJIdsp2wTVY23g4Y0
 B/FihjTzdSAUJAiC4PfRxHXp6XOltLQ=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad97a71 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-Nk8vmC4l4_uGId51r4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: p-aS82illLDZMKjVLdZOnbRa8XDoiVrY
X-Proofpoint-ORIG-GUID: p-aS82illLDZMKjVLdZOnbRa8XDoiVrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMSBTYWx0ZWRfX4zaPEWoel+Fk
 FbHGwsfbwAKIHAtLFO01xOrA5xq7Q7dtxt6bi3ywv830KPB53gWd5PGc7XWvC7tdwk/ldK8CBhU
 080E6FUzWioqxFKOCYwYW4isz20lizJgwX6QgvgFoCJtJILh23n4o1X/mVU+QUro3NCK/et5diD
 TUncGGpgiq/XmGFiemqkup5QyVGncimR12QUVFrAFepwnRvM5V5AYNwsIHmICP70VN3lbLaVtaN
 u9ikh4UNP4EFVNWxMIhsNq7kb/lM1Rqse0MbP3FYvrLrD7BRXdT9C/SXbdpJwvvlY+ZRsK6ybyY
 ycMvTOzoV9Iqp47bvq0cT3wjpj7IRoIsBcLzlModZoSVlGLmmCR828lyFFJFl+8q6UkBMXjMj8a
 dadsW6JxQQlqi0cLckMam2TIS917pht3Dh2B8CgosD2gGRXwGevYBrfVFscWah9r0XyLHbgXn/g
 aPtWT4BttMMble8iEyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220011

On 10/21/2026 10:02 PM, Konrad Dybcio wrote:
> On 10/12/26 8:45 AM, Hangxiang Ma wrote:
>> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
>>
>> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
>> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
>> lane mode on a rework camera module.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&camss_csiphy2_in_port {
>> +	camss_csiphy2_inep: endpoint {
>> +		data-lanes = <1 2 3 4>;
>> +		remote-endpoint = <&csiphy2_out_ep>;
>> +	};
>> +};
> 
> Please define the endpoint in the SoC DTSI like the glymur submission:
> 
> https://lore.kernel.org/linux-arm-msm/b5734dac-1285-452b-8107-9164e6a3e5fa@oss.qualcomm.com/T/#m55a2d04f3fe573dbbc86fe89a874514494eca345
> 
> [...]
> 
> 
>> +&csiphy2_in_port {
>> +	csiphy2_in_ep: endpoint {
>> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +		clock-lanes = <0>;
>> +		data-lanes = <1 2 3 4>;
>> +		remote-endpoint = <&s5kjn5_out_ep>;
>> +	};
>> +};
>> +
>> +&csiphy2_out_port {
>> +	csiphy2_out_ep: endpoint {
>> +		remote-endpoint = <&camss_csiphy2_inep>;
>> +	};
>> +};
> 
> likewise for these two
> 
> With that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Ack

---
Best Regards,
Hangxiang
