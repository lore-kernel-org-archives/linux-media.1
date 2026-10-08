Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA4E3B9930
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 05:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439022; cv=none; b=Ax0CmhpuJaQQe3kxtLcOxW0gLq8yTzAUqj1yiG2I6HfloxhK9Px+IuZ2IzHvNeju91AwxdNQ8ezxVVXiwiP0yw+IqHkKCWv2IwkHVq1xhMIC7gty3oC5qKVKKr3I5R6TTxlpa9lj6htZlUyqHXR0TpSygHmJyj9LtyY/hagytLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439022; c=relaxed/simple;
	bh=ceY6AYpjHs1ElPPIAmrcrxWtf7KZKURR1QziCbelGPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4lg+SGDP/GK8b7cnn6QPZ8JCz16vARwnrM6CmOJKSKvGGbVxBlt6bk0wLwLuBhFqaVs43llhbs9rXt44VNVJi8KrZhiNrKt3gTbRrsjOM8dlShrmum5J0Wl1nEV5d4HjqIJs7YXcW0Fm8s+C+1arp8PjMLDDsBYA8EGKpwVFnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NOlsk5b+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDO7n1GM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NOlsk5b+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDO7n1GM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BQes2774927
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 05:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/Zgs0WMSKVyRyw7zUHqtPNt5IdRRFTMiQLOMjFu9cU=; b=NOlsk5b+qYWY9dte
	P5ZSXTdbOe975t+hPrnB4MthxaYR/6bW68yRNJLo0rfF9P5h0lqR512AigeOwJI/
	xOY5klJRK+CSyNB6s5sloWEXuYxCUQeuSZrDF756xdobjZrqDkCwe3WbL/YXmHBZ
	z+9/H2en8LP3Vs3iBP0nQ4bpqz57ttCLOanXMvobtCHvg9TTpN3aboaD6xy58d4p
	HY+D5NNibiHkZ9mLgoQRq25xirfrngjo90l8zox+AVx8nCXYPt3nS1N3kEWAO/4t
	Nf1/Trv9wt9ZdlkiRI/fVzDe/dudiNfPozCuMsOey7zw/AQKYeQlcKF89CkAGkWE
	4t+eGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe69brn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 05:57:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338c215ed2so76840471cf.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 22:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439019; x=1792043819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/Zgs0WMSKVyRyw7zUHqtPNt5IdRRFTMiQLOMjFu9cU=;
        b=XDO7n1GMISgsVB7rAEPRJoCAJWzFobaBEqtN75mb2MUVB38CUmrfRuQRcmL0HfvDMH
         kizjWRtfpPIQ2mziUdq3/Cevuf/UOLDUF1iYMjnlBrGVE+n+NbJZYJ4wYVfhHjK/XGzu
         t+wVWrVjcu5xbyGIMI+hCH8pxsx9e3FiyrAwjjy4q9k7jnH8MELXjPI6uvDLUPa+LVWu
         jISfKeS5C3VX6V88DN56d/BkIn1ybgJeSdCs8msUUaS0CPoAbuM9SUI8xNd+wGLV/usa
         A+odPfGKccxqXSrW0eBUrhOGdim9qXsTSV22I6lJmAxdKNyp2b2JYRur9kXTVjPW7Syv
         n8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439019; x=1792043819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/Zgs0WMSKVyRyw7zUHqtPNt5IdRRFTMiQLOMjFu9cU=;
        b=XkE3qvsLEgeCkhV6nmVfVvRO2nnK6G7fcnjKzTIlj74By3SFVBuB2cj/tppYeM093P
         K2+cfJ93Hh5zA9UWa9OuzhltFy3lhIbmpTYvzGj9ywXuaICeTam9Q9TwkjTEuX2SZdWM
         7bq62mXyj2IKfmrvZjy55qp/XxV7kRybMHyRTFqRq1dpxBbn+qpWKw7swIurFCOczr/h
         V8Zz9RX197Xvz9GMtLdQu5pvEVN5/Sd3/omafCTVQixShrGgpk3ndiAmtZLiPy1SYtVt
         PyfWzLrVt/GFeL/DSgnBmF/yyXLfdAIfyx6lQcdpGSheai25pi/DQLAj1k8pVmjUV4cg
         5mbw==
X-Gm-Message-State: AFuF++lbIC51x8Szige3qXTAognhh5Adph8nZQQHo0DXSOX96ZAgVqNC
	hqlM5ObhDklucfRfaiXhyl4WTh5U7abNTVIQtgpZ53gLH0uIvr8rWaECinsgxRExvKmixy5t5A+
	w877dSR021P5jqr0ZtzaknpQDZFH88+U/XCri8wWb4I2nrPGvrJHS9WZVsoIJNqh4IA==
X-Gm-Gg: AYBFou3ouOF4qimlSIP0O4QxcxC0alaPcENO9TEn+1MSm8feSvHxBv1FDjBnHTsMnZh
	DVRaEulHzWNHn2BmxmqQ3yYvwy2Q0DDRkMHOuT8Q9266VFEQYIe1lgKqUE/L56pJ4B41coeAHLN
	FVfQ7rNda/CzT7uR3f7q8ht+o5XQa3FiRKk8Up75ff0DsnuiKjGzkTitynHoAPNs5uV7N8X6im8
	Fo0gJ0mGo29Z3SIY+zrqxxP4M5jSfxvwGQbuzzp/9+xA1ybD6oRAZf7mN42kha+IvzisfDq15VB
	dXjyu/abtj0BI3BCxC/E0FdQa7l/PmsihHDaTVrU5mDiAmAQqXzNEPyQ12BuM6Anfmp0BnbGAM6
	HeuBVuwmXQpJ4uW2fW9Es7v9KNJtw2/fjMrycYWA=
X-Received: by 2002:a05:620a:4411:b0:93e:9809:8383 with SMTP id af79cd13be357-93e9b8781eamr916572985a.67.1791439019201;
        Wed, 07 Oct 2026 22:56:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4411:b0:93e:9809:8383 with SMTP id af79cd13be357-93e9b8781eamr916569985a.67.1791439018764;
        Wed, 07 Oct 2026 22:56:58 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71bd7983sm9461851f8f.6.2026.10.07.22.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 22:56:58 -0700 (PDT)
Message-ID: <6a2df7c7-274f-4620-8a56-31551536c49a@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:56:55 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/74] media: qcom: camss: vfe: Add planes identifier to
 struct wm
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-28-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-28-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sYCyKFVMgSUgTSdBru4cKT4sWP_miNEn
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac730ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=X4GJfOngNdAlU1NO0XIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: sYCyKFVMgSUgTSdBru4cKT4sWP_miNEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX/87hDxdwX86i
 K6NAYpFP1Ph6dkq902ZqGA/wsshEQGzz0tSk/LD5tdZ9ZMz1pqFvaWej8gh6VXYNubG+/AQXIso
 IgGsYUCkwX6RwVKA17hWG35f6R5IwK3y96JQj3NBvK9tdNdJ0UxUeoFkrEM5ikKSc9bLj1NogD8
 MwOcWtzwZ84DB7qgW+E47UAl9LzukCp702/QglVFnapRQtdTAXst6yScBlk4t9V/PscMTgIC6OO
 4y2CsaiN5ist89F3lUqu4dP5C+oHLMkUvV8DpRxJxHCwNuXgEZyrjE89XSzWpoD4lWyUtdsKDcW
 3t2piagt6gByJtvvAQavZj09NqHvSmha8FlMsTAErU4nifK8qCcwq5wKn95PL0panceaLwpouZs
 cPC0dUoPhUEw88PHNZUygZNVNUdnweZ4ObvoKCLicS4yZmTUN5T+F/AEg1a5SbOplmshWpsJ3eU
 EuJzjQCPEslSyzE/dCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX7rOJ5vUdDtmP
 GdWPipQJwPZ+kJWMh3tSbhXqarR99OFHq1J+KNGHOMxeNY/O0FH6xLkugmBCOJBztJMdr9WAU1R
 cfbPkR2Ci3bSZ7Yi7g9T0Lj9WQ/BHMk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080023

Hi Bryan,

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> Define the number of planes a given IFE write master will write as a
> data-field in the WM structure.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index bf8dccf4c901e..8bc07fe7798e1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -101,6 +101,7 @@ enum vfe_v3_comp_group {
>  
>  struct vfe_wm {
>  	u8 bus_client;
> +	u8 plane;

Can we change this to num_planes, plane is somehow not well descriptive for number of planes.

~Gjorgji
