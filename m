Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771630;
	b=c3Y5nbUeLHtheD2ATRChMtHDXuUhNQQvDSRT9aGweEk8qiiNKof4mJasKjSRaxu7w4EX
	 tQjr8enb5me28H3NT3ZdmYqUOPVbzOh4TzfdLBxleoB6ryDuNiTuoIfrZ1pVekrlY6QbU
	 2nHc8cZeCIoeDUIMdLmsMllDkx4V8Fyh+S10Bm/fkz6FnXyiAQzz8TtUl3XQGwn+5+5Aq
	 coJYZABzRwonQRdGyxE4wk9/p6eoKLTZAUv20fDPK9dC2Z4pjCyePANLuOhIVeKfuTw6W
	 wqguMomsRbJtj/0nNO9KeRY/+10qr3lRTtSEr2XLHNDivowl/+7WMaLXdVqsVVZvIrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/RT/WyKzm7LLtK3pAL7i1tiNS4yPoqapGsrijvnzVW0=;
	b=J3xVoPBGCF+ypDyjaxDZXW6U9HRO1iAEruAPnzHN/drXhW9WsEP3+1xvj8W7s4uPKlRm
	 r6hkCInaeg23rg/VrH2mJOlLuy10TFA2cLBTLHK2O6zEDxg0w4hJnJirwJKkHpjqzB7KQ
	 vi50iliOEBXQPflLFZdyKzibmP8BcxRpj5aOkr2bm3PRB1naIEfPZYF7mwEPrmfBNU3DP
	 29VIMAugcIGCySXHxLfLxEYvjyy7VMbUZoI37xZwriYohDEKMxiTJmTUub6eTIi1n0BBZ
	 P3Hgbj1K74mddr4Bzny7g8X5TRElBq95ZRoxW7e0QqMU93Vw5FqNuBuBXqfpdb1MyWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Nr/AzaKX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUlNjkby;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B897606A31D
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 16:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B897606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nr/AzaKX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUlNjkby
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3lbc2931048
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 16:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/RT/WyKzm7LLtK3pAL7i1tiNS4yPoqapGsrijvnzVW0=; b=Nr/AzaKXr2gRCpNP
	y4OEAqJZwrNZusw6nLM0bIbep4EkQkkIk+rrbsT1Hw1MhzdSuzvHil7yNFYxX3Zz
	MW2+X7wk5qjWuDAnYi7wVWdWGYv1nl4/9HTB6v7SXSc4xi/3aKf4dqDk8Q8NeHyR
	Tx3PjrtlmWMUH247iupiaBv9yIN+nXpNRElgqGVdJ/NkGmELKd9LT92hEAZiSfSG
	zD/SvSfjEzfsO6b7S6W0LLyR8653nciVm8Hh4qekiTCE+vLVpIX/dmOim5GADiof
	R620xpKerCgz9SL8/7eeAAeheo6OugsMtFrib0cg1fo7jhLy558CfBMZ1BDmgfNN
	sCFyNA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6r0d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 16:07:08 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988c7363ee1so968753241.1
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792771627; x=1793376427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RT/WyKzm7LLtK3pAL7i1tiNS4yPoqapGsrijvnzVW0=;
        b=ZUlNjkbyGzi7jNjOs3MD7uxc7BbmgcJKJp5izuRY9obFcmYF3NlakLDxAph1rCfmUO
         ghqKVcgQFB+aP8VLlv/gWXIZCVrIxyGLLGHzsxtJ/C4PjWPS+vQNmydfRogbRLZDlICn
         E2+8tcGiCLQZNs4bNwHY10BnlJrMrd1Taj5wMWIH78QaiiBfpmTB6QTF1lReRgrlOvAf
         +7/FWhuxdCDsJwMbbRNzCPi5QfolXlwcSF8O+lXr9uP1smQE+KZBS/NOVL647CS4nZ49
         6uDyCZK33NOHJ7W/7ORSMxu0WKjdVoOmLGZZN46wHUfObjaooWxyiwCdzqxhfYMkI8R/
         lMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792771627; x=1793376427;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RT/WyKzm7LLtK3pAL7i1tiNS4yPoqapGsrijvnzVW0=;
        b=DmLpNJ98M1XmgzlG6r7ztGwz/TfL0T7gQJ9D8dbsb33MoVyPYW60l6Hq/GMH/vJJ9D
         UG03a0GVBtC8oYy6dvjVjVc47UwdWhGgy79s67DoxEYgOyEcGhIpCz4XxJwUHYD3CT6a
         2cewW8QQm20CTYuymh1Yq9HUgcJoCuajIJXgYB4tOgv0sBHL6iYNS2i1gNcja6qluVD8
         448UIpaxOxhyUuMPrTZ7cQpcIgP3hCiAMGHSyn337Sr6duzf3PGoNJSpaLBW5sYqppKc
         +4F+ljsX0pnlFkLCSzDD2oQ0ZjxAbhkJwM43c49LxAImpzzRuSr+55ZRvta72wMh/kF1
         8UHw==
X-Forwarded-Encrypted: i=1; AKwUvBxWzjoL0HS926rrWL6g6xhVNpjQL2W3WKpL1i0l5jm6pqfYvEpx1UlIaOJBg3ateBX555aVuiVhZ+tmMw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjUCa2OZRZuy6cso6aeIZBqWpKOiTj8tiyueEG+UFHdW500V+Q
	ZSKoTSiSRqpzXzAec3IQMgYt8ysz9JxisSWp9YVGN+jgjc27fYIudfMpO6PSVLMyoYZAoh92yfk
	rk6LrxpyrgFr3MTB/HSnyF8++8TJw/NavuaymMX9rnb+k9dAggXH82ejS/RiF/D9I2A==
X-Gm-Gg: AYBFou2nNEfbPy3zuyFWcRudNNyEZMa1cXhzzu+ki7q1jvJ5bYMT2NtJa/qnWR1VgIa
	n8keeMhBzFW8Ob06fJO2uiUhp+pS5qR5+z8l2fwXlJVEy6pWgYziuaszTm8S9Z1uXJSm7lmPTYR
	rJTDIYufcMQskTfsZpzJqCisDe9rf12fOzjGU+QrioinaQhvLQHyB6+Hrn7GeM0oPckl3RsQb+s
	JNhuLILHziaCr+FVM3g3a1/M2waNSDgnDtXeiTBUtx+NT6fGambjQOxoZIMgHQEg40zcJpymMRx
	hAsGAN3opwWEHCE5l3J+b/Xqiq4FrXiOD1zuMih0O6obD0BhFrqGQKu9e1XcJRm6QVKJcRKjLuj
	iYeQEo1z9c2rVQCX5dFmt8cVQYY7lnm8=
X-Received: by 2002:a05:6102:4448:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7ccc2f58653mr1013121137.2.1792771627395;
        Fri, 23 Oct 2026 09:07:07 -0700 (PDT)
X-Received: by 2002:a05:6102:4448:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7ccc2f58653mr1013111137.2.1792771626983;
        Fri, 23 Oct 2026 09:07:06 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2a9062d50sm15404525e9.2.2026.10.23.09.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 09:07:05 -0700 (PDT)
Message-ID: <559fdf87-368d-4e31-b754-897353898d7a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 19:07:04 +0300
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
Subject: Re: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
 <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MiBTYWx0ZWRfXw1TnNQXhGQs4
 jQ6ZrrU80sEHn0ShWqx8J8yoNZyfptbbbegOYm/VuYqr3SYr299Ik3S8dDOKJhqvZL4c2o2LLBg
 TUJHV8rii5ZW4NRGX/p/xjlyom0xJPKeGCJTS3ehWooJ6Tl8XPUEqoGSMkIlhPirW+DW4Aj//9m
 Xx24iMF+r7t7iym6LC3QUyk7SVqQEuW5XZ6cuiiERzd8RyHXAUqzHpP5xWRiB+sHK7RsIWNnF0x
 rH4xEJmsGSBZhi1y2xP1QLpSQVVj5Ki53Dx++eLjaozobWFfVl86vg01f5opZbVLZqukvug9CX7
 ycsWZ8t3FLNF1NRj5Wk/aXztQEtPLjhKXgMEAxgRmAJztgkomsFkyhQMg0IloaH17TL4Z9Mw3jV
 db3sfAuF6WciD8ljccbDjb+f8L1E7oaELQsvgk43PbJtaTlsr+iBlfkFUbVlzGB4IB2jR+uYwS0
 FlmGXaynoDSE6Li7pqg==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adb862c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OtwWDPiBtiHqWltJD10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: xJ_nGqpK_FLsF14NS8oZlnPdFOrV1lO7
X-Proofpoint-ORIG-GUID: xJ_nGqpK_FLsF14NS8oZlnPdFOrV1lO7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MiBTYWx0ZWRfXyEiRH3RFOd1y
 U/CplvO5dklQgVCJ6BUQZztYaZrR0CnwXXjn/uCRQJyVTNPj+LNlWosSrm4wOhT0e3ABWSMxoxx
 70iC7fBILlmdPKkDoEOWCLgfT5rlMZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230062

On 10/23/2026 6:45 PM, Loic Poulain wrote:
> On Fri, Oct 23, 2026 at 5:29 PM Atanas Filipov
> <atanas.filipov@oss.qualcomm.com> wrote:
>>
>> The VFE fails to power on when the pixel rate exceeds the highest rate
>> listed for any of its clocks. The rate tables of the VFE clocks are
>> independent and need not have the same number of levels, so a clock
>> with a lower top rate than the VFE core clock, such as the SC7280
>> camnoc_axi clock, makes the VFE reject pixel rates the core clock
>> still supports.
>>
>> Clamp each clock to its highest listed rate instead, and warn that the
>> pixel rate exceeds it when the clock lists more than one rate. Take the
>> clamp into account when another line powers on an already running VFE,
>> so that a clock running at its highest rate does not reject the
>> request.
> 
> IMO, this function has become a bit messy. We should split the core
> clock selection into a dedicated helper, as it is directly tied to the
> pixel rate. The AXI clock scaling/selection should be handled
> separately, potentially through the interconnect (ICC) framework (when
> available).
> 
> Regards,
> Loic
> 

In any case, I'll split it into at least two parts in the next version.

Regards,
Atanas

>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss-vfe.c | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 2680a9914765..87096095b1eb 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -982,15 +982,13 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
>>
>>                          camss_add_clock_margin(&min_rate);
>>
>> -                       for (j = 0; j < clock->nfreqs; j++)
>> +                       for (j = 0; j < clock->nfreqs - 1; j++)
>>                                  if (min_rate < clock->freq[j])
>>                                          break;
>>
>> -                       if (j == clock->nfreqs) {
>> -                               dev_err(dev,
>> -                                       "Pixel clock is too high for VFE");
>> -                               return -EINVAL;
>> -                       }
>> +                       if (clock->nfreqs > 1 && min_rate >= clock->freq[j])
>> +                               dev_warn(dev, "Pixel clock is too high for VFE clock %s\n",
>> +                                        clock->name);
>>
>>                          /* if sensor pixel clock is not available */
>>                          /* set highest possible VFE clock rate */
>> @@ -1041,6 +1039,7 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
>>                  if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
>>                          u64 min_rate = 0;
>>                          unsigned long rate;
>> +                       long max_rate;
>>
>>                          for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
>>                                  u32 tmp;
>> @@ -1063,6 +1062,13 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
>>
>>                          camss_add_clock_margin(&min_rate);
>>
>> +                       /* A clock already at its highest rate cannot go higher */
>> +                       max_rate = clk_round_rate(clock->clk, clock->freq[clock->nfreqs - 1]);
>> +                       if (max_rate < 0)
>> +                               return max_rate;
>> +
>> +                       min_rate = min_t(u64, min_rate, max_rate);
>> +
>>                          rate = clk_get_rate(clock->clk);
>>                          if (rate < min_rate)
>>                                  return -EBUSY;
>> --
>> 2.34.1
>>

