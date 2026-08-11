Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A191420476
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 08:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786438690; cv=none; b=cpH/Ex38/E8GxUTnrOuBBFBLp/lOqUe/kSuoXdK2Z5IYBD5yhTDcMSYjgLZzut4UGjm80wyPUK6FV9+STLNKc8LrvhlDNoPNNwiZjHWXGO5Jlwx+IH4APne65bhrvKYg+ECteCovQCp6lTa+af8BpFdRNBlaeqJQt2wKWAFnoBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786438690; c=relaxed/simple;
	bh=iDRbwdsfovx3xb+RUtNUQjIB4cAV7bkHsVi34En+MxI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rAWadxpRT/Ol5dr4dzfisXhUrXqSiL4rOwXc2mQ/3E+4DUBDxLHQT1oImlIt8CLyAt0rnRjcuEzUaOxzJlyxcbPmr6amT4MZoyKLVxcqpdJYRvl/vt2E1A4QArMdwgf/aR+bYOFmRL307aa+9ARLSPOvpedOF6JqpP88aX4+x5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=az0cLA59; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HU7Rsgqg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="az0cLA59";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HU7Rsgqg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B70ImB3048467
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 08:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqgYOHAGZ5JHEhPZIqaXtDk4dQ4rwadktM0ky4dxGXI=; b=az0cLA59d6UXRr19
	3lfgDiQh+hNrQD70gkCo88/+4tFfjYvNOXKC2PHVC8Puz+g33zhQHCVvIGb+tLz1
	O7sUtlv2fD626HFFplqkCYyIgk2NnZzv3quW+b9Kw2sFjJPFl69tK8A4ZEcLcFCE
	O/LRRNpRJG+txO1pThyJhS0mtI7/pPUKIvSxQQQhQEGwegTkmn9+hslJq48vTYXp
	Ot+xEtTraNW3DSBJsPJpIJkOXXzMeGP/J94WVlQeWACHUGs7hpw0uN6yV5eLfunx
	tt7R1h6ykVhDUAoJbv83W0GbbkrfGYUvaG7NESb8jb7HOBygOQBM8mGFckciIWW7
	m4yLCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk23bye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 08:58:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936a796a23aso24741885a.2
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 01:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786438678; x=1787043478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqgYOHAGZ5JHEhPZIqaXtDk4dQ4rwadktM0ky4dxGXI=;
        b=HU7RsgqgOTRnd58ZdfH9j6Xrqf39VsJlPyUp0S3x+DxLVRdvbuRQFpHzRrVA1GePI4
         N5pg8Q+x2sWBka7nKcNlNWrx8jQQR4MJOObENbMmnL/TYH3Bi7Ua/z35cogY7aNOau4N
         NQN3tuB1CHPDXSCgF8vprVWo1Of1U0tWeMnyms6YbOIXoqk7qIPMlKJx3P9oYUaG6KDC
         XvKbnbn2fW0vp5Hw+LpaqxepdbC1CD+NkXFl4UCwNjpU4K8Ck0+HzXTgc/tufp3fmhQ0
         4AXU411ZVEVJbw7OHu6cEberWgdDR2Gp+fmXXPvTfsufnjckCz0r9YUqh21oDiQW7ws5
         7Qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438678; x=1787043478;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqgYOHAGZ5JHEhPZIqaXtDk4dQ4rwadktM0ky4dxGXI=;
        b=mfFNj3cGhbnWx0LYKs5eGaSZDS+4utXjHxtJtgpVE4AWWfM6qEjW1FM9PRPH+kxmj8
         Y0J7fCm0hzLhZuweHph8SzYHGPWK8p25TJaDQ1A0hUyva9u9D06WvQ3fxbakSMp7TEB3
         iDvBlTbGY5+nxqaj2T9b6t2c1Bi9FXGnuOytuibhMTThPMv2CoQ98pw7ouVGpzNY9p6j
         agE+Eu0rmGNZFf3KItqU9jjH5liGwNwnVm4H9vIYSbkJ4zzPMXgW0JQX+/5ijzPWdzQx
         u6Ko+L9Lma7wuz/VZPnyQyIEdnClvMUuOU2IMIJbs1zf2UJqxSdTtbRsGn+ZvppGGD3r
         MtXg==
X-Forwarded-Encrypted: i=1; AHgh+RreHik/PjnVYxxmJwEgY1Bcq8lRw7pC+lg+cgjeCN4kv7fjGENOAdcc+jdccbAtjQP2Ww3757QETgEsZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6jZFOFt9TIHD6+Ya0pFJWYlkzJ9H9SSzf4gGYgSXs/FDsHa9g
	3aIk7OjF3wnswEPqOOTH3U3RArxOgXSbAUyuH/B/07Hr9u17yfNo8m/DxTTaxTzbNYv9yZ7pe6A
	wguh9n6Lo5YEmXIUd3D9EmdgYujTJAO/N67OOTuQnLWQf5YaKN/P/OSCehksNrsa4mw==
X-Gm-Gg: AR+sD12biYd179L9YWOtxRCO+YwQn/ZLFUE5iNPig/WpQ3YDk6hA1zuEKfjEl+HjurS
	pnReaK1MGVwgsPd/2g7QOuk/+KHQhzde9uvs5vyTAysrX68amg4kRW9/HpVWl08dRl1qitzrPfB
	DqIY4IwPkwXw0lv7DzX3i6/DZO+kJa1Arvuxh9p58vD3Dp92tT2OQceQOhYgS9bWdwrU3o9mMBW
	W4dNjQAii1Gs1YHj26xZb4GKsFqZoi437Q9G8OrkIdPAhxUZzAdppl32r5OHXJz1YkgtrSg98b7
	VdhSz86nKUVcSjlvxrU0fIwMf8FFfmrpD73FDmTvVG2/hoR4aAFmZrq1RoGVYzLGpUMRCz2MrrI
	+K/Sb6uqy0P82A8ghY5dWXGOHrOJ7ufVHCWQFLsS9C5/OJw6GZD9zkHcvpNVl1Pd1/aKY+k9tZF
	JwD0mi6n4IkJK9LzstGo48Ukis2n1T8qqXIw16iBJn1dqbfsfNLoXLliIUJgL1oGyCq+s=
X-Received: by 2002:a05:620a:4e8b:b0:92f:199:b035 with SMTP id af79cd13be357-936a8e96cc0mr94236685a.3.1786438677816;
        Tue, 11 Aug 2026 01:57:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4e8b:b0:92f:199:b035 with SMTP id af79cd13be357-936a8e96cc0mr94235685a.3.1786438677335;
        Tue, 11 Aug 2026 01:57:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a362ec87a5sm389585a12.16.2026.08.11.01.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 01:57:56 -0700 (PDT)
Message-ID: <e60deaa2-33f5-4c87-8d69-c37b0ec70f23@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 10:57:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH 1/1] media: ipu-bridge: Print SSDB information on debug
 level
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: antti.laakso@linux.intel.com
References: <20260811061612.325451-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260811061612.325451-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3MyBTYWx0ZWRfX2EdKKupGPWVJ
 GSikucvwLELmg3A6jaWSk2wb6N2kIWzdFI2VIBtR0DLYeX6ZcBqG9HDcVUTZAF0F9zXyV4gbDot
 EBB5Rx1dY4kcg0Io3ovR85OpLHkdPAk=
X-Proofpoint-GUID: 8ePJz1QuDxnijap9kJdlnHplTgXEuCWG
X-Proofpoint-ORIG-GUID: 8ePJz1QuDxnijap9kJdlnHplTgXEuCWG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3MyBTYWx0ZWRfXyf0gogBzfChW
 2EtaABuqcEb2181ieWuJEwWs8q4ypVpFN7ZJr+vs6U+LW6fsmwNm459fsbIUTDlO1mrCFQh9BrW
 jj09JcFdo8WbYg6jbC8/2n3sxiCWS/rL4JYb9b2DGXAGL+9cmaOSfUy+TtBltFwn2q1oFXFCQR1
 qLZG0DXDTgWPtyLe6Go9o7aV0g6Vh6uOn3fQt/8dSxpGDv7pB5bRzVYYF0pSRKCqc6+xrCBQAv/
 SC2DWAsoec5DR28HtqYjS8Faap2wTQumRbq21srdXpMqxI2R/M7qpST6FgbDAuJRtvqqqcPD8YY
 t48H0lYVX3PiG5gl6utftRFHFrs5l0wIvdbRgUAj8MEnb9+ZoKOFIvvFjXZTVG7VUXII8pVIa9H
 MY2W3B5/FKTy1J3GpzPsQZ1i9uSgq2P8mq2kqAp/mmJYwZKXZBZrtYV0iPeKqk+G8MPEtvizJj1
 lNG3cizpcT2CZi1TxRQ==
X-Authority-Analysis: v=2.4 cv=eJ4jSnp1 c=1 sm=1 tr=0 ts=6a7ae420 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=UDpfuZXWZKkqJqgzBFEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110073

Hi,

On 11-Aug-26 08:16, Sakari Ailus wrote:
> Print information mainly from SSDB: port number, number of lanes, rotation
> and orientation as well as VCM model on debug level.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/media/pci/intel/ipu-bridge.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 1bb3a3e98d6b..ff3bb80d374e 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -412,6 +412,7 @@ static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_dev
>  
>  int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
>  {
> +	acpi_handle handle = acpi_device_handle(ACPI_PTR(adev));
>  	struct ipu_sensor_ssdb ssdb = {};
>  	int ret;
>  
> @@ -435,8 +436,15 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
>  	sensor->rotation = ipu_bridge_parse_rotation(adev, &ssdb);
>  	sensor->orientation = ipu_bridge_parse_orientation(adev);
>  
> -	if (ssdb.vcmtype)
> +	acpi_handle_debug(handle,
> +			  "CSI-2 port %u, lanes %u, mclkspeed %u, rotation %u (SSDB %u), orientation %u\n",
> +			  sensor->link, sensor->lanes, sensor->mclkspeed,
> +			  sensor->rotation, ssdb.degree, sensor->orientation);
> +
> +	if (ssdb.vcmtype) {
>  		sensor->vcm_type = ipu_vcm_types[ssdb.vcmtype - 1];
> +		acpi_handle_debug(handle, "VCM %s\n", sensor->vcm_type);
> +	}
>  
>  	return 0;
>  }

