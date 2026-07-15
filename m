Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD56E1A682F
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784088403; cv=none; b=J0kRnuPjhYgYYv1xprpy2KX5EetScRurRUZ7nb1m6EGTjqv7gqCnEf2aL0m9UqmOyxmXciXDNqKz0tzb96AL8ba1XtdAZoqn+3N3F+jZkPX6DSfvO6Q2TTiJw7YgyexLHcsRt7FW0bTx5p3N+GbJr3//KLcIxGw/NKXRIzzTImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784088403; c=relaxed/simple;
	bh=0EFshVqSrc8f7OStgTf8hZCJkjVP5CzhGdQcqZKvRV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUJbK/NoZoYMUv7sUUIGcvOsi1IVyVzOWWp8g9WABRNBu8CUWAV853oBgQGkt4US6HVHtlFUqyZIsN1qB09XeLfG3oP5yL2DMJgTpA0SHRkDCVLbPhTma5DAfdiZx8I+f5Q8tIEdzg7Ju9wvoRHahJHHAA+DZDluqmnZpBDmVQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBX2aI/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UjROiSJA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBX2aI/E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UjROiSJA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lCKe2624006
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aq8pKEu+zdq3GBZfc94BkwVIZ1D/MyJMoeF2wETynLU=; b=MBX2aI/E267mc+Ri
	Ae2koslafqgvNgkufljnooxJZ/mYOzcNmTBJ1O/GCjLaXODOL5WMxsAmoeNgAgIE
	T7+FdX/FegTXjic/uied/NqaF7LWQDNJfU6Z6YMNMCltGUy1bNIjc9L6kPkMFrFZ
	0PTkWf1iKlUWhR/crNap7gH52HnFbIWZGWp+fcWYv42fyODmgAh32aswrBpNIXkz
	K2UbaBp2xUTQxdDOqPMJCL225uzX9oFNVb+WcMj/cf21/x0P58UnoF+IjHZrgMk/
	iF3LCwyM27PRzeKEwuDkKgt46NW5UhMR4Thwe607JpSy0awSC/QxOrSjpiQOmvsp
	AcvVnw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqtwxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:06:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so7552995a12.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 21:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784088399; x=1784693199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aq8pKEu+zdq3GBZfc94BkwVIZ1D/MyJMoeF2wETynLU=;
        b=UjROiSJAdTRU1jHdyKEKlBHAUM/aRPkVkhsT6lIrHFtYObK0ujpxOyzGsYm+t6Lqy0
         qcMOL5yGUaMfPfVMA4VZlJ8zXJHDGT6/9NaN7V0R0hk/+HYj97UtGwARK6mBywpgsJHQ
         CL8/vKcHD+vP7lOFJDGGXtrTeCk4t4l+K63v61PPDWIFFXflQqbkQe32BSvsIsmgLQpg
         7Oi8oPQpADPtV4fUDOTqa2mCtUBp5L4fAzcGIWzpgvqslljtqqis4cNtQkvT6i+2TNUH
         0kpJwavRD+h+jn7643po7F4z9y8AJLOu+Q78sVUcXOMBsdLq1sihuMKHdMCTEhy8N6B5
         AFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784088399; x=1784693199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aq8pKEu+zdq3GBZfc94BkwVIZ1D/MyJMoeF2wETynLU=;
        b=K8545wLPawsqnaKfHru2XmdZIxAeF2TJ3WRzi9o+542tgL62jB2c1lMMEF7jQSME9R
         dof/nV6xDpqxKLZC4WEZapyCrf1eCvdhm7btK2XxmUiPIBNhdeX/QknectiYlKEp+GaK
         oZW8nrqVNn3KiJZkivtjiyd1If5G6exd1kphLKSsBzRIisue1iApZfh72TofcWPGBw8o
         EDvR219JnH/PtXTwFlMFJileDzPCOHQ9L3CAtiSYBXYLA6N1eleDmqWDhDevQFkEWtx+
         bxIfl0CyVJr0Mt4+qNJRQybM+Vo1/frz6t8303u9Xmo2T8L8D2SdsOmsooLdwxcVwJlP
         vu2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpqgz/p97zg5oQv+QIffIvtLVK/JjKlhyW0NaBpQMdXZyThZ9r8CGHpuWqUr1bS9DbTB70OkoML46k+CA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy1798JlGu0dxIDHus8luyfZ6UwhFC4Zcv+kyAKpElqE58t9Th
	sovCJDkiKhHwn8t0vNmowKvlN24swUz6jlfKWoyaNKu8q2LMjITk83fa0f9hVqJKgquPzakKbzb
	4TkrtJQ8+2W/9L5Q5mljNQukF1pXS4JiIvETwrPsvBNFebORIUI393WrwRlSmRbJb2Q==
X-Gm-Gg: AfdE7cnDzSdsTww39Q1h+jR1BtJ2qylIcqernphuvZ0ReoUYcWigFE4cP7M+jKeNeN0
	D1J3PWdCMY1mUS7NW6g8Lq5WXAGOK4N1MlcTIy1XI5DP3hCyWut30dLjNH1Q50SNcxPuBy4bjNu
	E1ufllmNsgKdLnl76Q+8TpanRf8TCJUibmBD16kQRxuCmOuW9vRsmIfSEss2ZrOC4YjJLPH3oNY
	+9i9nGDVfU+omuf+EWk8r2nfl4BiFZcuP2ayGoVwP0pnmGYv9PNa/2MrVQObcgq/tC2NvRBRri/
	w+d3JuGEKqCdmlMwZw5F9PAULlZLeNEPUcJPYlWx0GbBrXQVy2BmxOF17L06HY/cYqceRFx/fmM
	QvSyK9Br5T9TwPnszJrOgAgoEdEbVicJD4P/4QJalfwaOhw==
X-Received: by 2002:a05:6a21:8cc9:b0:3c0:9c18:d5a6 with SMTP id adf61e73a8af0-3c35729077fmr6943831637.67.1784088399580;
        Tue, 14 Jul 2026 21:06:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:8cc9:b0:3c0:9c18:d5a6 with SMTP id adf61e73a8af0-3c35729077fmr6943801637.67.1784088399121;
        Tue, 14 Jul 2026 21:06:39 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9a67c217sm27006165c88.8.2026.07.14.21.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 21:06:38 -0700 (PDT)
Message-ID: <e53ea721-bcd1-4d8f-9b7a-ea6ec3003f71@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:36:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260710161056.1799019-1-aniket.randive@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260710161056.1799019-1-aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAzNCBTYWx0ZWRfX6K8r2fqajMC/
 plq6gymEGhRVrLsjlvNTaLwy3EqU7YFRfDj7kcnMgltVNNP7gPLusTj6NQeGSqMKl+NZpNBIuoF
 9xIp9oE3h4SKdehiQPAxhjVNVUpObzCWMSz9AJEydBHSkiQucsqQvGSGQ6MsY0ylOAeS8BAoPon
 U3o5qahZn6ny+pKB36BtAcXxCdM1pxe0kOj8nuPT0kd/wguIBxOkF0Gx+3oXBjjiQUtM6C11iv2
 RD+2xfiTJhVGzadIq+VVm4TlHO9BLt49WmYyaJVgZX0XZMw/AuvGkg0zVeff9in92lIMauUzcYH
 YF8bPw9jeYFrJNKpZGOHFaFVUk5pV4ALBHQSz7aB05YxYAUuwW1417lfbuchVfKRz0ro9u8WUnw
 I9R5Adgm2FMSC609lvRTMMYzPMP0EBLPZ6JrZd6S3yX21ynTyfljWqBh3aLvszPlkhpSdSq4+7F
 8SLX98Rb/0xGWk4e1Tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAzNCBTYWx0ZWRfX4IxW8JYypmnE
 RcP4YZ+CRXS9sDZqpANeO4ap8MuBt4/TEq1T4UsLLQDcB15A48XfnWEp7eTCq72DX4R2zu7aQEk
 CTjNGAIxjRmUN1h9z92PmZqC9p+1aF8=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a570750 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ENRykshp9vPgoFS4LJQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: HGKdDyX_WmZVABkR7Z1Eugc4P6CkYeWc
X-Proofpoint-ORIG-GUID: HGKdDyX_WmZVABkR7Z1Eugc4P6CkYeWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150034

Hi Aniket, Thanks for addressing previous comments.

On 7/10/2026 9:40 PM, Aniket Randive wrote:
> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
> regardless of message length or bus frequency, causing unnecessary
> delays on error paths.
> 
> Compute the timeout dynamically from message length and bus frequency
> with a 10x safety margin over the theoretical wire time. Add a 300ms
> floor to budget for I2C clock stretching, where a slave may hold SCL
> low indefinitely during internal processing. This detects real hangs
not only internal processing but it may go bad holding SCL low indefinitely.
> 3x faster than the old 1s static timeout.
Meaning, in such case/scenario, don't need to wait till fixes timeout.
I guess, 3x faster is relative to the 1 sec, but for larger data and 
slower frequency it may not be 3x. Hence, correct it accordingly.
> 
> For GPI multi-descriptor transfers, use the maximum message length across
> all queued messages as the per-completion timeout.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
> 
> Changes in v4:
>   - As per konrad suggestion used mult_frac() for bit_usec to avoid intermediate
Do not keep space before starting, directly start with "- As per....."
>    overflow on 32-bit targets.
>   - Updated the commit message and added a driver comment explaining the
>     rationale for the 0.3-second minimum timeout floor value.
> 
>   drivers/i2c/busses/i2c-qcom-geni.c | 46 +++++++++++++++++++++++-------
>   1 file changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 96dbf04138be..c5c3adc8ec77 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -74,9 +74,13 @@ enum geni_i2c_err_code {
>   #define PACKING_BYTES_PW	4
>   
>   #define ABORT_TIMEOUT		HZ
> -#define XFER_TIMEOUT		HZ
>   #define RST_TIMEOUT		HZ
>   
> +/* 9 bits per byte (8 data + 1 ACK), 10x safety margin */
> +#define I2C_TIMEOUT_SAFETY_COEFFICIENT	10
Add a line space to make it look clean
> +/* 300ms floor: budget for clock stretching; slave may hold SCL low indefinitely */
Already explained in commit log, can remove second part.

> +#define I2C_TIMEOUT_MIN_USEC		300000
> +
[...]
