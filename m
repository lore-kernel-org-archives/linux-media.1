Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9936634A79D
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 02:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773916; cv=none; b=XN67e1Wr0yIcdWlCMoTBsGpeK+gyL/tNvb4njV5agocsHymWXzt3vJh0b8cF57plcN1+ob+GRQfADQ1JPJQfUh/u5anYNP7iTV7edLgumvYebp7rZX7Xfobkap6ovnzsdMiK6uVDQ1gzp15eUVnoUUGl7R1KkRvaFuVWdsRx6bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773916; c=relaxed/simple;
	bh=TZu5cnhS+C9bzH15pyjmJ4fuAkhd61i8gzo+xVaYGvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJzT1Z/n8O5HsQ9gXnpotSn9IACqfbnmoHqgCcARURrUlgVmYdJvnF/IY9RYSXDw7N51mBXiq7RjS+5ab4mY7Su14O7GbuQMh0IObi2jTFHqI4U+y23BcrXv1KyxQvf73pzj3JZun6ZXoJXwhQCU1Lff22hgcW9tHi2I9Sjl2yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8MZJyIh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wdg6Glap; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8MZJyIh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wdg6Glap"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WhKq3534814
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 02:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KrH5l0GX2HhPownoyMjGvAZeDI3QTDXXz7Ro6yCrE5U=; b=d8MZJyIhfJvHjff1
	7pNtNs8rkxfT7RXJwccHFdIrjjEhdhIR8h7vgP4XIodhoRWGxQw0ptQqF3qbkfu2
	qaANRi/HsEgeH7lVzZJAFDlInvaPAsbADv0uya9mUK1sGOm/h4QrkuCMQcoASRXr
	zUYuDXeI1b9SxNphzraWDITFaxwkpjgmHLUdgOn6VIeqKNLX+gzT5qy1GvUNCgr8
	ErsdfNEUkoceDYhGq4eYMNZ9Yr1whGcrgOou7TX500Nf+/W3cCXZwqI2VROitDpR
	PBKQErqi/DoR6muLTJdif8eJs/OGEMruYsNLo2iRl5NwjCpLXG3XC3wsQZpnaUdp
	m2CxuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xssak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 02:31:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so34311085a.2
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 19:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784773910; x=1785378710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KrH5l0GX2HhPownoyMjGvAZeDI3QTDXXz7Ro6yCrE5U=;
        b=Wdg6GlapXZy+4V1Ct1AnwFn89ZF5XwQVN2IXzTkLWSpHfgCCSIvVqTx3vMsrHTs9Bo
         sshYwHs/O4G+tWsSo2yUafq3d0Hun7aN6lJLXE+T7+WL11VqVUTq27K0oxhD+Dw3PFfa
         0kQsDEJ0o8JWTUtGlau56SA01ro/aVeW6ghmynvKCDfQL5wgc/hxRN5k2wV1bkVlXEFE
         ciFOYYI3D1GGQfDZnhMo1+vP2PeuqD2ikuYz8/pWWPeRhtJjMXgz5cKO6wNygIl4+pOH
         vaWqWx20d+A+NJ26wi7fLbgAgPL/RlxYLcIyPMNR2IPNULfUpVUz6jRMydZQhIA97fXZ
         65dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784773910; x=1785378710;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KrH5l0GX2HhPownoyMjGvAZeDI3QTDXXz7Ro6yCrE5U=;
        b=akdhRc2OhEcYf262wu+0mJ2l11mxNnULdBZ/c5XshAsDLgKRyz1Lv/0tMH1hCGfsms
         Y8YD2btdEDr1sykKq8YyxOXqdcgGhazt8A0UVYcD3Kz5fWaihnSzAmu4MTjd9/4Fewz7
         GInle6bkJcv3bmL8QMUg/9NUFqevbMx3+WgffCML7B3YJdIk3+BcI4zZKJqL6fiKbDnJ
         L7Tm4y+4ho53mzeGTABt3uUTCG53rAvoB15z3+rG4/XeglA5SsC8K8rOKP6qbTlu9/uc
         849ql7NWaX/u1+ZdjJlt/cngCBCPAS1TNpiSM0ukepE9QOstiVOHOwguOLfaf/piEEgT
         p9Vg==
X-Gm-Message-State: AOJu0YzeqZ0PU8EbqodzJQ+o5zHbLryx+E7ZhNvpVeP10ATqBefj2z/H
	ZdvHWXvFkoFT6FGuGZERxxTSkq/T7arU58tB7WqdSmKR9r818H08VvbOnVR2X2speyAZ5SQWiTH
	787RwYaEq+L4an6NxuG1in5xX4tfO6DhE8tmO88lr6+wyGJUrBQT109yJR/EEczuShQ==
X-Gm-Gg: AR+sD11zrdR8l6KFiAt22Nw33US6vWBXIuUTtMLXt76iynsSH9sqRU0o+glcoGpLQq5
	jr70pdF8aY5mcx4lnV6omD9qOEIWQqiken6YcQF3U3zIvUPKadTOcgDtsUCGRFrM+kyD34FWUEb
	KGcn1wEnNVKJnYvH4sTqEXnMmFM5L3YwoIE9+8qxWMzF7FsSCyMIX0hOQNlMyFuWX7hQLXe2Hhz
	GRoPmLxV7APptRnILUK5nEScVEz+xD0qrWvlYciAX4gN7UpRkgH3P4ywwG9MAfLMGm0/bzsM7uD
	KmEtJBJ46w9iSjk5YEmqs6NkrtZAUR+OhDPuVspXwlJkXNDM4VmypE/ZZlXfJnmhB9pfuTB3mJq
	B8yVr+iYFhOFZcX7wGKOW5imNCpNgz23hSwxUenpS70YYid5RoRyr50OFxc6GiEcF
X-Received: by 2002:a05:620a:2305:10b0:92e:fe10:3f04 with SMTP id af79cd13be357-9310370ce45mr105394285a.53.1784773909988;
        Wed, 22 Jul 2026 19:31:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2305:10b0:92e:fe10:3f04 with SMTP id af79cd13be357-9310370ce45mr105393385a.53.1784773909468;
        Wed, 22 Jul 2026 19:31:49 -0700 (PDT)
Received: from [10.111.167.143] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a8af5esm307755185a.41.2026.07.22.19.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 19:31:48 -0700 (PDT)
Message-ID: <3f1492e5-2c79-4084-bc5d-adfca230506f@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:31:41 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: Add "gcc_axi_hf" to 8775p VFE
 lite clock lists
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uMzU1nO13yhWsRTsvey6xxu5FK-aXWbY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfX3GBscFlLD8Du
 ocY6GWJ9tsit2XseFvx0I16Qd7Y24SwdoiW7o8zjThSve+63kEie4IoSkhryzhS2FuSprHWTkap
 TBUVv4+zCdbw4Q9p0VEMg7LLRUJc3L8=
X-Proofpoint-GUID: uMzU1nO13yhWsRTsvey6xxu5FK-aXWbY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfX+rvNGUMP4oM9
 kxExc3jM+2me+6bQX6sprVk6b42i1GbUYSuItlXniFcbopK3z4H0tf8kPOAixOhyp6U4F728gaf
 4HbniySUCsPwupA1+DGi264I7D8LU/pXUjna6/xK4jJfsAt1GmuDpo6KXve7iNy90FBhLbIWRLA
 encg5RG+j5BTWP61X+9Mdj9VmMbjz3fip9DcIo3+T+xIWDv2aXa/k1BhtZMM7mRIYW8lAvemVDE
 3vSDFA5Lcy/3juFdav0Ylxcm0a8gP0f3PkgcZBri4b3HKPpk973ghIRcZzlFlH7N7YobdjcsUv9
 DE3Al/PKvy5+xj/YK1aHEv+Elq07nJ9Aibz/jAPwWpsFa1ds9JMG7uup1tKF+xgnxXELzMGso8W
 LJqWodNetFEX/am5CKMdEbSC3zWMP2Zliffm1UkPS19WyWtdklX9VgCqOW4qsAbaHXTLDnAbtIG
 bWDat94LrKtu1nyzl5A==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a617d17 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dxeiA1o6bZYjeYBo2nQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230022


Hi Hans,

On 7/23/2026 12:36 AM, Hans de Goede wrote:
> The "gcc_axi_hf" clock is correctly listed in the clock list of the
> 8775p 2 main VFE-s, but it is missing from all the VFE-lite clock lists,
> causing these to not work on platforms where the firmware allows turning
> off "gcc_axi_hf".
> 
> Add the missing "gcc_axi_hf" to fix the VFE-lite blocks not working on
> these platforms.
> 
> Suggested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d..3efbf2fb4472 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4037,8 +4037,8 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	/* VFE2 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
> -			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
> +			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
>   			   "vfe_lite", "camnoc_axi"},
>   		.clock_rate = {
>   			{ 0 },

Please also update clock_rate accordingly. Inserting gcc_axi_hf
in the middle of the clock list without a matching clock_rate entry
will shift all subsequent clock-to-rate mappings.

Thanks,
Wenmeng
