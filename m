Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461931;
	b=Qw4OW4ZWR/Cd73CpCoxfHpP9f08yl9CrqCMxcCNmNMexOXwqWJITBabG993/sush/6Uf
	 Z8j4AwSDTm7Z5tI4kp/R4qgnpBxKd/iUlwR/lSWkc5RLbbgJirUHnSzNVEiwJXB8G14lb
	 lDM58dvaT1tRgHXJV2+df5hvmsv7tbxyPvfqA1WRvQYp87S8xoyd6r/jm6AKiAd6m5Iqp
	 XM42uA3ZsEjQbLh+bW9q5hHrnUwr5yMA2XTYqCEHIDiWObWoqt8QvesbfBrrSv9IyL3Dn
	 KrQ9TdqEmwHGZa7YkU8VHy5YEBCmA60uKmAl5jmoztuf1kZVKSL9cnLdwneblIE0hhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=;
	b=sYqof6QPXGlSiNBu83+mnCcfAbVvgCus0VrLAQcUR9fg0jKQVun0tXEExT7YzPEZmMNh
	 5dDSsMVs9nTHwrZlNH75VgilYjHg4k0NckON6NEooI5tMg2tdyt5vQEV9jzH9VpbDmAZk
	 WT09D5EYfyNseIPhlZnRZsCkiI4nGE0W+wKD9I/jAHmk58GpWNVyrrfshrohaRTE1H7iv
	 rGoihBK9BK7bXr+nDGRO2rcAUfuWIuOKRQ2uRvAYuSbWfYFRurJ68vTCJOv2fbX40AjaE
	 JVFlLSrjN/j3lwlBrY3PPUTE4Q6+zn3DkZpnp7prMvhZ7AyISBZbTMHBJKkPB+PT35g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZq5hCtH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g5+fGACB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBC5606A31C
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 02:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DBC5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZq5hCtH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g5+fGACB
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tPSn1211286
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 02:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=; b=aZq5hCtHuETxGA1d
	ZgBXVhAeq9Yo6J6HkuY5wNC/RzzrWWWntLhjFbb3RvhB7BVaQOjaxailEjrVz6Jh
	j5D9TwTFCSrG50hNd/Yr1IabXFaJXsdnaBWme5gVYQZr4mXtD//Lh5YdOOe3gZtW
	OVkFusIxmL4UYUmRR6HUt7gkFRb9dzo+uyn0RyiRVHxQ4gXAdQxQTKxq49PXP+YF
	FkkEX4E6zb/2euEk8c7ABOg1nSAPB+HKexzfroUiIpQj4ptVIJNx0vK6LrVvsO+A
	vDzP45Fb3dQ3ZwjTL0UOd9n8fG/dDUSB0xpsDOhk6Mm5OHrs3pUXgxU5mk95sqUH
	4k0SLw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p0cxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 02:05:30 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-15c16792146so407504c88.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 19:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792461929; x=1793066729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=;
        b=g5+fGACBsDwHKA2wsysbxgV23NaHCPHB7Pb/GRy+Z60Uoor0VF6VPEGLVg8eTs19H5
         ExIlsznIw3FdQIk6Ciq16kXeuNR5Y3g2mw7AgwEyDzyA0wmtjInbGnVLLmOXOkA7bAa2
         qJ+gjeA+oKFcjFvKqfwS/Asv8ZtfsiSEPmTs6DNfdYXVdBQ2yDcBIVwysrLuRSTHJhHp
         qlowxh6CmQOQ5pQiVP2oPTw0n8bPwB9fIjSDd6irWLnCkKLdNYks3Zgdzdc48I3ewj2x
         cotzzRbSm/BPERFA/afSBTJcplb/oNn6arN1zSG+zYVKybU2YaVzL8KsTYjobL61UOT4
         I5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461929; x=1793066729;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=;
        b=SwDRKsMn/3JqSaYBrBR0yw6wQE9Y2rYCLEtGIGvtv1jMzYugOoLiOgY17PMTuiDtVg
         uKrsq6AO44VsDQEC5ksJpPKL+CbYmorZd5Pukkkip41DheqFeMHtDsnkeTqtPQYFssRE
         aBDUCe0L3h5Dj9glDK82qCUcubyxialyqU2pwf8LW3jsprxe41B+aK+Tl+9i8K8ZMjnW
         H+qJV/eTnmDKTVGJWvE2QCAcWcN3yVGpDjIhVrsparpFCt5KU36ZIAMxNFfQa0YYan2t
         KnRvYfxBPSMm4RQmNeAR4yNQw1XV1Q6kuozlEhshWRtsuReWHjx11mTV8/QYlpbQ773q
         xvJg==
X-Forwarded-Encrypted: i=1; AKwUvBxTRoartftLVSkiXnmoL98BqW7PZ1pQuitW6216N3xODArikuGWGXVTiPwpoqcm1Al63HZ3TNuifQMKwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7MsGZgFw9iHmJUtLu5CfNWYoOILq+OWNmV7l1HsX4gELvbfj3
	Zv4wDRd5Arxp1AtGlx28C+igcs8KfRcyYKEl3hSzcQfDmnNxh12Cur/cdD6rGzUQQbRM+1QsTYL
	ucxxAsAg0CfOSlr64cl2sqAVziQK3/efRI5Gb6G3fn7qKIJgAVX3TKsFVPnYTZrNxlw==
X-Gm-Gg: AYBFou0v2Wfte1izxokEC+0Jl5poBcdTT0VSTZ8XALU6WQF9ls3ehFeZKt/yJJkN3BH
	KoNah0exNRZR33ePN9vj8m2By0nCwplYICVF9WkBKe4big2ytyQc9ufeQbQYGXmEVkamVD0OM8I
	f/SP7rBQWynPpLettUbctOFsiVtqhGAhrCgvXYS2bXGPcQQt+NCqfhYDZ6cFzqyhstmt4Uj8kJv
	KZZOe7CwbbcAZiWTcPiqrtYY/C66kl1G0bDdwqQ6RXUUGhECPCBFA4LoVMSrkakjqDDshWC1/RA
	Rc0wCaBD27PWypy74kjKOHFs7DMCHpc+wX4Ju3+E7yHdAZ+1ASFEChWgEcBzzBqdEN/Gymj1lZf
	/PyOEjDRY6SVQHFynUuUn68Uy5KZ9m6rqKQU=
X-Received: by 2002:a05:701b:2918:b0:18d:5988:8d3 with SMTP id a92af1059eb24-18d59880c2cmr1634920c88.3.1792461929326;
        Mon, 19 Oct 2026 19:05:29 -0700 (PDT)
X-Received: by 2002:a05:701b:2918:b0:18d:5988:8d3 with SMTP id a92af1059eb24-18d59880c2cmr1634870c88.3.1792461928590;
        Mon, 19 Oct 2026 19:05:28 -0700 (PDT)
Received: from [192.168.1.235] ([47.231.130.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm36101206eec.13.2026.10.19.19.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 19:05:28 -0700 (PDT)
Message-ID: <81aa3d0f-cce1-4f78-9610-67815507bba4@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:05:25 -0700
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
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new
 csiphy_stream_on()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
 <a561ff9d-eb2d-4097-ae66-c1857f33e42f@oss.qualcomm.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <a561ff9d-eb2d-4097-ae66-c1857f33e42f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pwCR7O0ByKGD8piGV7BZ-yO3jEsTcT5f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAwOCBTYWx0ZWRfXzMv3/di5/exr
 5zcinz7MYd6wFmd4baTdk3ETCtKBg3TLDw83cWNVZLnaBHShJ6Jt12Aroenm/9CPZFm4c771bH7
 RYhJ8Z5NGP9kPdz44V/5HGUQ8Ya7VBA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAwOCBTYWx0ZWRfX7wa6vEj40wnN
 7ZeoXQtzQ2Zjc0Nhi2mNC7uLf6BEK3jt1iE0O/Ym4lKl7wDgAY1RbSw2Lninth39l/JSXR/HroQ
 v0etw3JnCQgjo2vw37eShQP24Br1JDrFERNf+d0YRZitI4UUS/NUwWhQdNu9+dbsXhDlCMuek9h
 ztJ2uvIQuBX0xFi7vN8Fb6PX5PUgRdurFadRO3CU8EjwYX2Ax1enHAix3HIm7xyohe0I/SSQvoT
 IC+bBM+oFUe5fSiQXWYicvMH4cQx0DcETBkbBWowMSioN+B2TEkg8trWIOT/3W2VUgXJ3PV3I+o
 4cyPACPPi9txwtDMttxXOoXUu40usVjrIvVUSpAL2vNLAqn6yZGLbivwNf4QwJBhlTLpb0S3uvg
 dVGQ+zMX1BXgM4+bCvdqPgOJtqwdQriI0qMzAGDMabG1xU94MriI9o+2MNVoCSZKrV8pV6DEPpL
 OBUD0JKdYZv0ZETrXVw==
X-Proofpoint-GUID: pwCR7O0ByKGD8piGV7BZ-yO3jEsTcT5f
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad6cc6a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=TcmD64HtHlR11PSYA/r07w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ra3kV2IsKW0ovCRCs9YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200008

Hi Krzysztof,

Thank you for the heads-up. Apologies for the noisy CC list — some
internal addresses slipped through from a prior workflow. I'll fix this
going forward.

I'll re-run scripts/get_maintainers.pl --no-git-fallback on a current
mainline tree and switch to using b4 prep --auto-to-cc to manage the CC
list properly before sending the next revision.

Thanks again for the guidance.

Best regards,
Anusha

On 10/17/2026 1:07 AM, Krzysztof Kozlowski wrote:
> On 17/10/2026 06:05, Anusha Arun Nandi wrote:
>> The new (non-legacy) csiphy_stream_on() introduced by the PHY API
>> devices support only built a MIPI D-PHY configuration and
>> unconditionally called phy_set_mode(PHY_MODE_MIPI_DPHY). For a C-PHY
>> sensor this makes phy_configure() dispatch to the C-PHY handler with a
>> D-PHY opts union, which fails validation.
>>
>> Branch on the recorded PHY type: for C-PHY build the opts via
>> phy_mipi_cphy_get_default_config_for_hsclk(), populate the per-trio
>> lane positions and polarities and select PHY_MODE_MIPI_CPHY; 
>> keep the existing D-PHY path otherwise. The shared
>> phy_configure()/phy_power_on() tail handles both.
> 
> I received multiple patchsets from you. CC list looks really random,
> half of the addresses are some internal ones?
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> Best regards,
> Krzysztof

