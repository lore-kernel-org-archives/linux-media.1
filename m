Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C9B4AE8A9
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642146; cv=none; b=MuJn5o3metVRnqXP6qffLt1UVdtZTkWlT1byk4JorCKocp1nocQjNj7Hlbo2g+VOsZthW3KAXVu4AhCviFSRZ5J9qCnegV9oBfgd6Q2rCxG3QTslwwNqRN7CMV65FutCaLdPpSo7br0zq6T2K4Xev2vG4kNAJWqSnquwkII3l8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642146; c=relaxed/simple;
	bh=eZ1R02TktGMoafWc3iB44QwiSvxM9+9cWgD0hJ/GFXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPiWqE4i2XYq4ozJLP/Rt/aBUk2WjteUJRJBGv6HCgohSAoHwy+dMFbYNxY6iCxZnBaG138vxYQBwop6/ly+dE0ZJ12RbhZjRYj6qbGDtZMCKOWFJy5Aur4IdOGULgMxdWD9/Mxz917XTPleb3/djgrsYWWx7foJLV5AAcMn9nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0driMJ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNICaZmg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0driMJ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNICaZmg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zaru746541
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 10:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tnso/dK39CPl4xYVq096jLstw/svSY24BOldvEqgn3s=; b=Y0driMJ1/qlH2QYJ
	6RSWPCsoXtE9kJVKN+DoJ3LKym8hkI36vPzB+1ZDeDFoiBP9rzv8gx+mkScpjvgj
	5ZuimtJ18KZdHIzdtG4ynDvgJqHvl73tUhSoIodZyLGuzOvxBKy+gemTJr2r8dlv
	XclVpA+T0dktZtz7Was6jrdAZHq2S4Y3RTK7aurVxg3R0FWP0U5x2xCsy8VONl3m
	e0mwbdVSXWl/wiN4z2ifvRuVj3GoVRxwAQ8O38XOZCJHNBCss5tIS9MNyTXBvaBA
	X5GWNoEa/7spXd+RRMJQ43PrTsBBzO2hBIH3k3LTdSDc1T0evBmD/zXlxYMelAOB
	Sw2j8w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra8j2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 10:48:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so762767a91.1
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 03:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789642137; x=1790246937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tnso/dK39CPl4xYVq096jLstw/svSY24BOldvEqgn3s=;
        b=WNICaZmg7pqv0sz8n7Us8UVBoqgC9uu9LaHnkQJI7VyVzgVNQgObf8J7hBmWDWo2zZ
         8g1PtkYyyCKJJJqbQPFV9049oxP9SCS29PKxp4QNGn52g26CMfAGcZHH5hj3d0NpdHoS
         NWL//Hu7DhOROpV74Q9n2hQPsRST4JGDyotG//j8BEwO1oPaUSbfz0rVbkdfPpSxsxbW
         Ixc8/7huenKKgLz+70xAZDvAR6LBygf39HZLIAGcJDpMBJr4a4byQUgSA5BOJGHIp8gW
         WXxvGmA0i6dMmSpEWkvSBmH2ZzLltn4evfAfZcG/8WU3Nue9MyLz1pdehE+y3xPQlyQS
         lO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642137; x=1790246937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnso/dK39CPl4xYVq096jLstw/svSY24BOldvEqgn3s=;
        b=tRerCxNmP9HCRlbv28RK8Xo/7pq4np4FNyVUKWRHhF5dlM7RKQ/9MVQ2Vv0iH4b/tb
         BpzN3z/H+51RAItdnM3OqSqshPD/hvHVVoed3l64hj9+GcW3ppJNx5tAzsNuJ2dCcx/q
         d3bcE80hwaalNpqOfz6vS1uycXoiUFNjIcdZfs0AnEAAXxHAaAheD0yEGD4XIDiWNuR1
         HBnfmKw7z5u/LN18cOasD52EWAJcxb0vf8OB8ayKqBkOtjGzrZU3Cu41x33IUgU+GwV5
         559bU/avxe0KL8L85VsZmkT+7fEXvaOnQ0gej2zdfncv0dG0J+ljjCMS5VpzXAUVJE8x
         nfvg==
X-Gm-Message-State: AFuF++kqTQ6vplzGttqOYNZy8wNcm5Q7m6sP2/Wk8b1SeI8TUef4Zysu
	hmXC4/ZGxtRH9AHXszB6QzZbUBR0Cd+DKHxSDTsoxqS9tyxAfBUnRwg05P2OBRoISlW+QQmy698
	JhcPNXWRkl5RqEpXJPnJ6iywdZG6M5ZcK2t+ySBMIZGYSgSEWcJqZJJkcZErEAsNnPQ==
X-Gm-Gg: AYBFou0TgGVqNlsfdbQDnBBwt1e2//ZGZR5ajcSynQqcoTSm+tVcN7izoTO6r1Kbc2O
	QLBtX+omOSIEI1qUbH6mJZvNH9EINFqSKkBNnpFB0yyyyAR4iUEPy7G7Sgkp2FaFWfgKG4j9SfB
	IDxtAOFGNLRL04QfhWngyyM5P5OpVpWjrUzQROT7RhWwTQZvyiWcMyFnNFUtwLfkE2NeMafuWT0
	mcTJqtjK3NGgKAbMAvqzMcfbWPcLCcOPNwCwHUC5Q7ub+46V1FguCN+txItWF13c66XZfFkSMd8
	Rg3a/J6IYAvV/6Wi8ferrYplSL5tTlQpkLzwvif7A9SMH5Zz6Hk3PTkFkCcaYg2yF4glLxwoZXW
	YpqwBBO7YiuycpEqrnrbKP5cGlvpdqi2IS/Y=
X-Received: by 2002:a17:90b:3f0d:b0:39e:2c5c:a689 with SMTP id 98e67ed59e1d1-39e361ab7dbmr4771627a91.30.1789642136557;
        Thu, 17 Sep 2026 03:48:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3f0d:b0:39e:2c5c:a689 with SMTP id 98e67ed59e1d1-39e361ab7dbmr4771594a91.30.1789642136132;
        Thu, 17 Sep 2026 03:48:56 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.137.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4a48fsm12639770c88.10.2026.09.17.03.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:48:55 -0700 (PDT)
Message-ID: <2beedbc2-f47b-4eb1-9191-597c360c70d8@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 16:18:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/19] media: iris: Add AR50LT core support and enable
 Agatti platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE0OSBTYWx0ZWRfXxScHiVXhYUQ/
 tsgIfl4hzI2JOJVHCzvNvDHH1QsuwkJXlIEu5fr/9UEBKn2hd1tu+pd+h8dXhvL28UgMiHkGG6E
 xRlnGb2mKoJ5Gq/Vmg7Vfyu2wWrjaK4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE0OSBTYWx0ZWRfX56VcowCPykfk
 GDjfJq+3X/uWJQ5Y7eAYlBWnp0Axxaq/lpd8oqkfG9qgczV3/ZieM+fsbVccsQqBh4jzKKz0Rk7
 3IVGcTrLTZ3JpAV69F5jE3fMiHPZ/mEtfv+Wbmz62w6EXjwIN4syE8bAbOQV7tx3yEsqAkaKIjf
 gkVVphhQ5XCrYr0h7XC9vYWeHs+Puef8CicZWSHN/8R6ugRzynbJyN7j3vcYXNVcauYrK+/6Mxs
 3wdwbwu6+kLWPGFLqtROgJuDaq6g/CteSUijBbtnSsTZQA3KWFpUfLSHc4bE6g4ROhlEpilK42f
 7hcJb2BPHaJZQJBFdmVFdxoOywAxcCwc4fXpUxUaxW2hURFJbprDePpciec9xVw2gt0bKk2PWEh
 3ZhRAYKxSZ8IKeq+If0SAeQ9k8UfUfqu+FAcyrieOxxMi0sRQXHtwaFB9O9DG3JwXgfvpjr1gWI
 01dQFxP9CtwPqlwoC0A==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabc599 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=/MhRiX8TZM4BB34AAREmLw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VEuCN2dkXrGIZYAknfoA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: OJ11fzql8deD-ZQ9vRUjl734Ltnl5SLV
X-Proofpoint-ORIG-GUID: OJ11fzql8deD-ZQ9vRUjl734Ltnl5SLV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170149


On 7/31/2026 5:18 AM, Dmitry Baryshkov wrote:
> This series adds support for the AR50Lt VPU core to the iris driver and
> enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> AR50Lt introduces a few platform-specific requirements that need to be
> handled in the iris core and VPU abstraction layer. To accommodate
> this, the series adds minimal hooks and updates needed to allow the
> firmware to operate correctly on AR50Lt without impacting existing
> supported platforms.
> 
> Additionally, the series wires up Agatti to use the Gen2 firmware and
> HFI path, aligning it with newer generations of supported Qualcomm
> video hardware.
> 

<snip>

> 
> ---
> Dikshita Agarwal (11):
>        media: iris: Add Gen2 firmware autodetect and fallback
>        media: iris: Skip UBWC configuration when not supported
>        media: iris: Filter UBWC raw formats based on hardware capabilities
>        media: iris: Introduce set_preset_register as a vpu_op
>        media: iris: Introduce interrupt_init as a vpu_op
>        media: iris: add vpu op hook to disable ARP buffer
>        media: iris: Add platform data field for watchdog interrupt mask
>        media: iris: Add platform flag for instantaneous bandwidth voting
>        media: iris: Add framework support for AR50_LITE video core
>        media: iris: Introduce buffer size calculations for AR50LT
>        media: iris: add Gen2 firmware support on the Agatti platform
> 
> Dmitry Baryshkov (8):
>        Revert "media: iris: Add Gen2 firmware autodetect and fallback"
>        media: iris: drop IRIS_FMT_foo enumeration
>        media: iris: skip PIPE if it is not supported by the platform
>        media: iris: add minimal GET_PROPERTY implementation
>        media: iris: update buffer requirements based on received info
>        media: iris: implement support for the Agatti platform
>        media: venus: skip QCM2290 if Iris driver is enabled
>        media: iris: constify inst_fw_cap_sm8250_dec
> 
Hi Bryan,

When do you plan to apply this series ? Is anything pending to apply this ?

Regards,
Vikash
