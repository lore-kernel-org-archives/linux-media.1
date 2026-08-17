Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E156741CB25
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 12:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786971330; cv=none; b=JLH+rxQqMgl9wtFWyQN4afem4DBdp7Nw7Iujh2+OV1iWKf8xf/ib3Km9xp/XxBlAfqy60fyRHMw30QZUmGDbdd4uK8G8DL7w2lfewHaAQpIwBwSXSblEl4h0GlgwBLWngbiBe3Ew/5QEffzJtk7sMM0eO7BtPD/UUrFmANt2Szo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786971330; c=relaxed/simple;
	bh=oy92kPm1bf+2L9GrelBJ1keC5ZYDOGF3ZgUoTsQSnvQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OJt7NwUYmhOH8F4LahH46h28qcANmLgSMPAAgStdxStpnJ6zeMl3UjvJSAer25m2bvsB1ybx+5fCXlYHLH0n1ajrwt1kTfOtlEbBHY2Fve4TsEtGeXoN6MHRY0T91nqHD2bNAhfdmuSM+98GJgirLVeXdHwLfe44LbCkSQjnWSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3fHSjxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwkaHzCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3fHSjxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwkaHzCU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HC9xb02112871
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 12:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ttqr/4uWZZjn4Rysccs3ujm0NAIFAKOVVGjoNKQlPeY=; b=D3fHSjxbAJ9v2cXq
	kbKVmlrBULSbs3JyejE1Bzd80BrcniUQgJWg+et+VIVkbse6No5fmpJl/ttgPdaS
	WPIvp7h8sCFHB+/fQ2T2onc4iBc8d2lxRJy6hOBCZIdJ+BSxvd5GvylnuOL4f+1g
	3DQd1EhxQpWbH7HjiAxPIY4wO/xFkCfAxt4+NB1vDevHig883H/KhM4zrTAHA9J7
	BNqcvWwlMycNaNfgCZ0VxRMOikxVU+6J8Nb+BtQXMdSFLBC5o9SsXnwAMfnQ2Xqt
	1auyLzXTJ6JQ+K+ldmDMlKU7qAV/sdocjO5ousXHc+dtM/5M459Cj02+4mqSxPSB
	WQuKWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xyk8y77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 12:55:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92efd2ca21aso584104885a.0
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786971327; x=1787576127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttqr/4uWZZjn4Rysccs3ujm0NAIFAKOVVGjoNKQlPeY=;
        b=NwkaHzCU7iH+Flj0p0qNvVpqWJQbRBSK9bBjjwJqeYTk6aaunlUNm+rN/kRScLfAWd
         DlngMCtITfnAKzys6fprDpFl4oUFwLSSUawmd2k6r97Phyrezo4vuaKvAff/q0uXs97b
         MMKhAQ8NpmWBjozFwXjSJhiqv5kSSeIWVkUjq7kg+LfDXlAu2C8W3k2Ysvw3URCQbWyL
         MZJSIIu7jDZ3vymmqHvVq14V/opOIBYn6U5BWwympHOIAyIis+wNCU9UFs4VeCQlEIii
         7MskVa8kxvdtvdtGrSIxbrMwBOBGQOUy/cd6qyzMOmbbN02rIxrZOX1LWUGRnPQQjQj3
         yGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786971327; x=1787576127;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttqr/4uWZZjn4Rysccs3ujm0NAIFAKOVVGjoNKQlPeY=;
        b=szJSAPEfKYt2p4RvxRqrK3Dapjv72IB+mkKIfTNX4YsUaAAKTqSWfp1Q8pV9DRCpgu
         xY2d+b2INFq90Wu5td8fkOdC7URRuQg0XO+XvWb8HOw4aQbaPKKqV4ATgMWQAfmt8j2j
         kxbbor1lWNU8YvMn0B1klOcOzeXe9U0Vv6hAsiEs4wt21I/H9xi7Q0ttUAmQOxS52wq0
         Po45NgKVP8S35ayHWV5wD+c9w0nOP6xj+svWErcTmmQ8R+3cjVdL6/AWJLjwaIRkBiqw
         0yJJZ5qEpr44PwVtURqiEGWL3nUmsOiLGVBRcl72HnGnZ4hDyfv3UjjZuLXKYq1xHZQN
         gZ/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqYy8sDE9AUvFBLM1WHfhY0igBy9G+73Ghva7NeMDuMzZotuth7y9t/RZcVLbyBBn52q7xwiAvvqhMoHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY+UOrEsz3SmTGeglsA+8H4fZ70aF/FjXRR++EY+pzqjq0vN8I
	8CUp08tcVWXOdzXdSR+hqAn6xPDOPsx6EmccRfdjfr8HHobp1EEqsBQnm2h/SrwwsD6Mn6gIkOr
	HONGdqaupbsUxg3EQk+MIoKYg0yMdgJ+wrE1lNk/2R9uVffCdfe9376z+L6RTE7uE8lxpN+2Ttg
	==
X-Gm-Gg: AR+sD1326lWvFPVeaXUV17vsUphNRvgi2uU1Lek93TvMU+eHF5MYAuGpfMnzSw9Br+K
	5swWF9QUpqtdugOd/azPxTBs/f+LrnXN37LduOoimuEAGJNBPf6rGzO6r85/XsYdBcWex3TiiJd
	pHyNZnLhLkygJGCY+w6nXySbCGVXajcdCRfikRE3ZZRBFg/yLgm0VsZE3c0oAVyGPWKKLnDWsTT
	tizWK/f20oRmSxVipWtXjOR/gKLlXhMRgst1IsdfOxzmR4eoc2iOF4PdYOTBSMzDUlykX42KyBA
	MW438t3mI+g6fUD+3nMdqZMAsaH6kaoury6MMuBQb5W+B3gm+dEiC1UyQO/lBvbiWUCkKcZtIH5
	ZsabzWSg9tUgatB5njSc=
X-Received: by 2002:a05:620a:3d11:b0:92e:bd39:9993 with SMTP id af79cd13be357-936d22c5bbdmr1626568785a.31.1786971326985;
        Mon, 17 Aug 2026 05:55:26 -0700 (PDT)
X-Received: by 2002:a05:620a:3d11:b0:92e:bd39:9993 with SMTP id af79cd13be357-936d22c5bbdmr1626564685a.31.1786971326443;
        Mon, 17 Aug 2026 05:55:26 -0700 (PDT)
Received: from [10.40.99.41] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b9863asm24295966b.49.2026.08.17.05.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:55:25 -0700 (PDT)
Message-ID: <6d0b08b4-c786-46be-bf03-ed957d52bc72@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:55:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v2] media: ipu-bridge: Add OV01A1B sensor config
To: Steve Kaznak <skaznak@protonmail.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil+cisco@kernel.org, mehdi.djait@linux.intel.com,
        linux-kernel@vger.kernel.org
References: <20260815022320.728925-1-skaznak@protonmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260815022320.728925-1-skaznak@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jGVmltY-Nm_WIsEgciHGNZ4Veakmc2Wv
X-Proofpoint-ORIG-GUID: jGVmltY-Nm_WIsEgciHGNZ4Veakmc2Wv
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a8304bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=oqTt8M_68hfEJnlhVy4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5OCBTYWx0ZWRfX6w5qrcVd0zvK
 trCWqNO3vUO7e5C6ljXP6SOzgTGiPuCthqM8XQTic+HLhQZxCgUXc0G/4QAbr9i3peGRUJunRa5
 Ofsr2ROuwhZu35DJNnVJYQj2m0tkOU5GYjH/AOUvDsU6toXcJRYgcnQmqsEaSABwSFGR9GS6vbn
 bIb62Wmg8/BeByrS2PhLUssPBHy/+Yh0RgOX4YAx565w7e9Um14f1WoTa0NWdIR1iyFoDHqUniC
 cxucwbK3vOSHZ8EPPvmuseC0bqd9FRJ1Woa/dBrOEd6e5VGK9uoXKbMSYUquRreqqBrTxiyLPeA
 YIEXawZZ4bpYsp9FmLnJ3ORM+HzSiPBy+aXAyAbiFSn0Fb8mbuq4n9s4QSQsT4/6Fh/Pv87+8Bz
 5mxiubLLlkj/3LmlKLgjWIQYxQkuPssUQ5yHf72UWjjJLyhg0HVVbgiFagIXa9Dmfrlz+bli3Bc
 upfJcU9tqsxY/nQj4uQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5OCBTYWx0ZWRfX9hPWauUrhLyB
 zGfjCTM8iPnTf3gIg4kbY8z3nzuwhimrMHr3JTC/2PowyKsRf3Yee3XJVTzYhsclv3M/ffZpov1
 Fs3v2atit5vAjjGFT50ivLpzy4UxGP8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170098

Hi,

On 15-Aug-26 4:23 AM, Steve Kaznak wrote:
> Add the Omnivision OV01A1B (ACPI HID OVTI01AB) to the
> ipu_supported_sensors[] table, with the same single 400 MHz link
> frequency as the OV01A10 and OV01A1S entries it shares a comment with.
> 
> The sensor is the IR camera in the Dell XPS 13 Plus 9320, behind an
> Intel Vision Sensing Controller (IVSC). Commit 36eab90d3f4f ("media:
> i2c: ov01a10: Add ov01a1b support") added driver support for it, but
> without a bridge entry no fwnode graph endpoint is created, so the
> driver never binds and the camera is not enumerated.
> 
> Tested on an XPS 13 Plus 9320: the sensor binds and streams 1296x816
> Y10 at 30 fps.
> 
> Signed-off-by: Steve Kaznak <skaznak@protonmail.com>
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans

> ---
> Changes in v2:
> - Move OVTI01AB before OVTI01AS so the table stays sorted by ACPI HID,
>   and reorder the shared comment to match (Mehdi Djait)
> - Add Reviewed-by from v1
> 
> v1: https://lore.kernel.org/linux-media/20260805021154.51404-1-skaznak@protonmail.com/
> 
>  drivers/media/pci/intel/ipu-bridge.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 88581a4c081d..3dde07443002 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -73,8 +73,9 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>  	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
>  	/* Lontium lt6911uxe */
>  	IPU_SENSOR_CONFIG("INTC10C5", 0),
> -	/* Omnivision OV01A10 / OV01A1S */
> +	/* Omnivision OV01A10 / OV01A1B / OV01A1S */
>  	IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
> +	IPU_SENSOR_CONFIG("OVTI01AB", 1, 400000000),
>  	IPU_SENSOR_CONFIG("OVTI01AS", 1, 400000000),
>  	/* Omnivision OV02C10 */
>  	IPU_SENSOR_CONFIG("OVTI02C1", 1, 400000000),


