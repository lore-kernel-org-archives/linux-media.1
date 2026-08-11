Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A0B43DA53
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 11:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786446462; cv=none; b=cnLU6CRWAIufJfOPJDX4aZJMrQaMDjXT0rGelwRVjEZJomz3iao5U5J3D8kNn45RfYagHFnpcNreZAz5tsPxAaUEnBZvvLD9iHsCikIcY6F9UgDBVqeYTAy+rHolueorADzGJFJ6ej5TkM6cjRaJDxnV17f7EAQhs/45sXJ/0pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786446462; c=relaxed/simple;
	bh=11/yfdODjty39Gp8g1JkZ4DOZ7JXHJNQDijNJ5Hqd5c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=g87gekw84XaPZRPe7hzuBEjQIsNgiahGXeaQNy/tMIFlAWxpmtb47N5ZQcyfIB75mSVlIKIVUcREb5rTdK1QRT7p7yTkkCD3y3fuAqxy/LM1fCSZbsF7c/42HpiVoJwv6AElHdb0xkVYadMtbllF4gh6K4H6BPvAdg9nS0LlvWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEbD1ZXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXDfsRMG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEbD1ZXk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXDfsRMG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BAM5BZ267637
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 11:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lc5v6sOXDPxZphbxmXaW4eyFpl22/QQl1jnzjr3fy4U=; b=dEbD1ZXk+PkK6FAf
	hdI+/Fnlt63d9WOKE6WxhgYYGUg830+tSMkfFoB4Zcsrlj4mT9IHOC9B8D8x9sqz
	SBsRMzR1c85J98TjcOBu4XXChkssvh0NpjVbvlh1MMMCW6KxI3UPXTs7eXza7F0N
	xuDmyaDCRZsAEOR08SlKXp1GKGN4WFbjHkZRtkPCVGE2pwIKyarM5UjEXDXGwbE0
	JFW3pEWMWdJlH4DcJRQOIWznUU5cSPnh/T9y4MhUkQzgxvwYBHRoFztnAes3SBMv
	ASj7sEg4E27hJ49hGyweYc322lL7MxZ643BWtufmFQy7x31Ctm7Cob/nN4bbIshu
	Li/hzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjv3qw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 11:07:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so38171081cf.0
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 04:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786446458; x=1787051258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lc5v6sOXDPxZphbxmXaW4eyFpl22/QQl1jnzjr3fy4U=;
        b=bXDfsRMGw0gESNNT/EcqlpbGpJW8oBGJaiNpgyJR1ecb8JbWCclrO7hIcCQpQJ9T8s
         C24fo/BTTDO7yHuVgcB4/v2r352ghaB4JV/7Ey4ADyQLCouNbELS8yQ02cVj1nsaoG4G
         NHXbvXPzF0s5DiW5W39E5nCzuqj5Brn4NKPs7Lq8nwxuIziJcmtVtcNaY/MhGhpfTfTb
         p0P1VwhcWhaR1/JojTvwxFDNj5uP4HTLL++fJC1/0OcsXJd7SePHPxqHjvqMb+1W0AKt
         T4FHBRC0NSLyZ1ICr+NFpz8Jmx1Ha8jdlo3sKhx76ha3hsz2Bqb6oPQUR71TcMyXGT/C
         4Oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786446458; x=1787051258;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lc5v6sOXDPxZphbxmXaW4eyFpl22/QQl1jnzjr3fy4U=;
        b=g463L9MehZKBzXQaeDgyB4/UF+k1sy+Mxfxtu71ZC5KLmVr0p4TxlapEVntRT8zp7F
         111fzibv1Egn+G/QLPfOkzzsX+vkTwyaP2zK9UfKcKDovFo6L+cXG/k+UfgivP5z5zAk
         kAiv4pOrSJjAGptG7AWjLEn8xstyYDmgFKNZQnr4Lt6qIsI19HVDd5sCJIWonV3tncvz
         agcvwbiWcX3Nn8WXvIE67f5DmskaSiPMtyWEWpkk83X0adG4EQOuDI2qunH8KES2CnXr
         dMoVgScbdhPckTOZbNoYtqEWkGgyuue7/aXpNZI9QCV8gRVIiVc11gWj9BUtxEMHIFGs
         Co8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrcxBOSX3zD/5kyYY1V2HyRQ/7mvFlx/GQBIlH/NylqQNrH8rBrGTR8A8Z9ZltsTcXWqoXk1E2qRB6r9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFMsmS9Du+4Z8E4fuXd4lGWEOkGA/6YszdxS69KJl3mmHvw+H3
	WFylD4WpzRLFKHgmi9uiqoPowoG1a2n3+Pzny+LLk52zUB+jBGeGWuHfKTrf3rp6HGT5/zFl2Ts
	GZ6i6thIQDqU1rwB7oUBMvxVnNSzaX1S9oQlO4IVkXCwcDjDTDStBO9NJ7QCT2iQAzw==
X-Gm-Gg: AR+sD12woIYhbNzZIKuRDTStaPYdkfc5+kaXbS37yxG+lREdBCE3AXPhZNW1Ito+p5/
	Q0ViHL5shragWJ7DTAOCU2+cW//faeexLleEXzh2nKb14FxuoANiZCf0GBheczD1P1YSHleQX2t
	pMPNNj2Q2bAEaDS3vXu6H/FIzZC89vjJfzasgK/wKAfcZK2PAO8dIcXFOZpr2zwAMATAWsl6cVm
	S8lsoG+0pdGJyZkt+rAfcBWXn7oYPrqgIuubFqyrGUIfA0HejXjIM5Ss4WU16MI08Dogl+aE4HY
	51NLaYNhOfsbEpB1hXRiJpdAjwNZ2Y6djqYHhYeRsU6A9vjVl587RL0J5fcxxDJc/e4Xs/ejgnu
	eo3zGcKndPUYfrZJCZInRZVzdcSo3yikap43e0joIQKh3MMkVIgxT0ND8QrevyPTg+VcpHEFJHl
	yZv9m5r8otRm7LwNMcnsggQYHkdyEwBT3Xbtk6wZ7MHjvRh5jMuz8bBidK4igPs/6zPzQ=
X-Received: by 2002:a05:622a:2612:b0:51c:1117:c6a with SMTP id d75a77b69052e-52d584d4f87mr18348701cf.4.1786446457712;
        Tue, 11 Aug 2026 04:07:37 -0700 (PDT)
X-Received: by 2002:a05:622a:2612:b0:51c:1117:c6a with SMTP id d75a77b69052e-52d584d4f87mr18348281cf.4.1786446457237;
        Tue, 11 Aug 2026 04:07:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a362e16994sm516274a12.5.2026.08.11.04.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 04:07:35 -0700 (PDT)
Message-ID: <0ea07f70-e4a8-41de-98ff-dc201507bf77@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 13:07:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v4] media: ov5640: select the MIPI lane mode from the
 endpoint lane count
To: jason98166@gmail.com, Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260811-ov5640-1lane-v1-v4-1-c4a05d4c1b32@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260811-ov5640-1lane-v1-v4-1-c4a05d4c1b32@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA5MiBTYWx0ZWRfX45vBQWBKIcA3
 IYIuQcvVAKdc9zvIU2779KI7h4+jqQh9Y9O0KRSuOaMEe6s1OpyK620JHQka0q7l+FKwvwuQzyt
 K7vHfCpcqUMIc6jfIJ9N6+JYrNyLlUlDG72BFLp4kiY55QjU6FVmv6ZINxz2QilZJNJsdUGdIg7
 DfhsV+ba9Z8reCwd7WssRx6rJee5zjaXewX+GgoSSWSOv5iErsiDLfTIBWiChmD2JgSHigG0nZE
 G4f+GrLQOjuL0ndeoFcXgRfW/9ZywmlhFd7uCh+7/EtTGScPnpLlc2xBgskdw5uT/Subti04FEE
 Pm7wId53pPM3iLKwpwqIYv30cvEtiOqA6XgBT/5QBQPpERh+kO5dpw/zI3c+9rxYdbgzwPqYwA6
 nIJaWL3K1LN5FQdoGdwnCE9ED8J8gUn53F3JqIDsLKXdWrGfkOW4qOuuMHzLrw3TRAR2+CGWBvk
 LjGztdhDWzA7D5mjL+A==
X-Proofpoint-ORIG-GUID: gc-XD9NBKvkMJMKfthPhnyqcFu0tAkiA
X-Authority-Analysis: v=2.4 cv=KLtqylFo c=1 sm=1 tr=0 ts=6a7b027a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=0TnFsdFECxFYUmcDFoEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: gc-XD9NBKvkMJMKfthPhnyqcFu0tAkiA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA5MiBTYWx0ZWRfXy8s4j6JeLLQv
 QqJKHaelhFM4cv5avUJumdJaJkgkRCeRA4RDo+4w/LE6LM7uh5aRIupsi/1nqzFx96FGMDOaxhJ
 7CiFgbo51Krn00QzEVj69UBqj8lyJgk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110092

Hi,

On 11-Aug-26 11:17, Jason Yang via B4 Relay wrote:
> From: Jason Yang <jason98166@gmail.com>
> 
> ov5640_set_stream_mipi() always programs IO_MIPI_CTRL00 with 0x45,
> which selects the two data lane mode: the number of data lanes
> described in the devicetree endpoint only feeds the sensor's clock
> tree computations, so a module wired with one data lane starts
> streaming in two lane mode and the receiver never assembles a
> frame.
> 
> Take the lane mode from the endpoint instead. The field encodes
> the lane count directly - 001 for one lane, 010 for two - per the
> current sensor manual (version 2.33). The 2.03 manual documented
> 000/001 for one/two lanes; OmniVision corrected the table in
> version 2.1, which is why the long-standing comment here found 001
> unusable for two lanes and validated 010 instead.
> 
> The power-up path also programs a two data lane mode, but that
> value is overwritten when streaming starts, so it is left alone.
> 
> Tested with a single data lane module on an i.MX8MP board
> (imx-mipi-csis receiver), where the unpatched value produces no
> frames at all, and on an RK3588 board.
> 
> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> Assisted-by: Claude:claude-opus-5
> ---
> Changes in v4:
> - Keep the lane count programmed also while the interface is
>   disabled, toggling only the enable bits (Hans Verkuil); with one
>   data lane the disable value becomes 0x20 instead of 0x40.

Erm, I know having 2 Hans' in linux-media is confusing but I'm
not Hans Verkuil, I'm the other Hans :)

No problem and no need for a v5 since the changelog will get
cut anyways.

Regards,

Hans



> - Link to v3: https://lore.kernel.org/r/20260811-ov5640-1lane-v1-v3-1-ae476eaf5024@gmail.com
> 
> Changes in v3:
> - Inline the lane count in the write instead of going through a
>   local variable (Sakari Ailus).
> - Link to v2: https://lore.kernel.org/r/20260811-ov5640-1lane-v1-v2-1-65205ae86feb@gmail.com
> 
> Changes in v2:
> - Compute the register value from the lane count in the single
>   write instead of branching on it (Sakari Ailus), with the count
>   in a local variable to stay within 80 columns; the programmed
>   values are unchanged, 0x25 for one lane and 0x45 for two.
> - Request a normal stable backport rather than opting out of
>   AUTOSEL (Sakari Ailus).
> - Drop the quotes around the function name in the reference from
>   ov5640_set_power_mipi() (Sakari Ailus).
> - Link to v1: https://lore.kernel.org/r/20260811-ov5640-1lane-v1-v1-1-79699457ce13@gmail.com
> ---
>  drivers/media/i2c/ov5640.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 8deb5f5501fa..a99e4edb6a75 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1831,22 +1831,16 @@ static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
>  	/*
>  	 * Enable/disable the MIPI interface
>  	 *
> -	 * 0x300e = on ? 0x45 : 0x40
> -	 *
> -	 * FIXME: the sensor manual (version 2.03) reports
> -	 * [7:5] = 000  : 1 data lane mode
> -	 * [7:5] = 001  : 2 data lanes mode
> -	 * But this settings do not work, while the following ones
> -	 * have been validated for 2 data lanes mode.
> -	 *
> -	 * [7:5] = 010	: 2 data lanes mode
> +	 * [7:5]	: data lane count, 001 for one lane and 010 for two,
> +	 *		  per version 2.33 of the sensor manual
>  	 * [4] = 0	: Power up MIPI HS Tx
>  	 * [3] = 0	: Power up MIPI LS Rx
>  	 * [2] = 1/0	: MIPI interface enable/disable
>  	 * [1:0] = 01/00: FIXME: 'debug'
>  	 */
>  	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
> -			       on ? 0x45 : 0x40);
> +			       sensor->ep.bus.mipi_csi2.num_data_lanes << 5 |
> +			       (on ? 0x05 : 0x0));
>  	if (ret)
>  		return ret;
>  
> @@ -2535,8 +2529,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  	 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
>  	 *
>  	 * 0x300e = 0x40
> -	 * [7:5] = 010	: 2 data lanes mode (see FIXME note in
> -	 *		  "ov5640_set_stream_mipi()")
> +	 * [7:5] = 010	: 2 data lanes mode (see the note in
> +	 *		  ov5640_set_stream_mipi())
>  	 * [4] = 0	: Power up MIPI HS Tx
>  	 * [3] = 0	: Power up MIPI LS Rx
>  	 * [2] = 1	: MIPI interface enabled
> 
> ---
> base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
> change-id: 20260811-ov5640-1lane-v1-b0fe37eab4d8
> 
> Best regards,

