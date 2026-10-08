Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B534138F932
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 05:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438912; cv=none; b=tOGFEkWKLEzwLMfDwaeIG5nRo0Gpf7i7wFO/iSE8ADOirOlzjkkCIyJo2XiDhCpYzxytbsQg+ASd38iI61AJO8XQgxjZ5Xavfdq6dVMebuKY9+wOnkx0Wktjb/BAwflqGeLa/+qdxJ6mC8O+q+TDRHqX76iDYt/McahDllCdf2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438912; c=relaxed/simple;
	bh=H5lV4HDJd+sQ6AiSG57mDPJMpP86KcSTO/G4ReIBut4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0Py4kIxINCPrqbDQ6mUXKN2366y5BlSY+2AXF1AzTmQGYS2A8boUVFPu7mQZmi6vYc+rbYisC0Sr+qfVVFngIwadBn8wlHG7QKN872o2oSjmTEDfIUt8+jyPZ6HkTBI3gplKENFzX5SDzCHJE4V23Rekcem+vEJnIi32RzUlqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bljmhRl1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jF2830lv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bljmhRl1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jF2830lv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BRYG2895383
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 05:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xmO//HTj23XpH2lQAudxjM/nmaHIKl9LfxnLHiLhqjA=; b=bljmhRl1ULofBkM/
	8N7UGicI/RhUEncLBzwA0zt95gKeTi2PovelNZ4EhR1nlbQBagqUUGQN6ovYoL0h
	1euud9ZoFLvpK4xq0bV8wE9jN9nrTv9ZqSfOI/HRHTQg1a8PufRaeqvv6un5Ywbp
	xCqnaFPtc6q6RxIX6UZjRqGf+OFX606MdNm2XCySXrIrlT8uUmPrkmosUx6EaacG
	MbecRosEnDpZn5/k05QqaDoE40EmzRgzO8SkxKmEHyY5p/1bPyZ90Dbaq5uQeOo8
	y1LOIPrBqQHGs2OzVN3fbSTt0xJ10CvnCh3K5opEnXU7yhMwx9DOwMVBPbHjxPV/
	d9bAqA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg8wp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 05:55:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso941179185a.2
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 22:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791438910; x=1792043710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xmO//HTj23XpH2lQAudxjM/nmaHIKl9LfxnLHiLhqjA=;
        b=jF2830lvDdnE78zcGmDMIAZlARcAaKKndjRhR0KpsQPpO+UK0FlV06fHypQ60W/op1
         RoIT/JH2W82OurIuswHiEeaVee40ZPVaeZ/b4jZIkWFxKpx7i6M2Z8OKJIpDgR8p7du2
         /c1j0McLd+J1AarEbW7ctlEUpn5SVJl9pKHmK5xk/XijfF4vuroX5RKp9YHBKUsTnGvm
         vAtSqvkGxPntgt6opd3zo+SNssOTpKd8YqDnYJr+pJ7ImXf+Y2Jgl7YNJKGIGqlhHCqv
         gijYkGFeT/M7I5CM7cB6yyz12otVlgnqZz6yarbbPV3JgtzSbUQYlvRq9WYKPP6NXKlV
         /rpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791438910; x=1792043710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xmO//HTj23XpH2lQAudxjM/nmaHIKl9LfxnLHiLhqjA=;
        b=OJVrMiFrZGziq7HSs0WjJhQNYogUnjeK9c/SpZSChOrJ6iGn2RJCvTZW+/GT1qTgUa
         P+VOHfeM21f0UBvxgROViEY6XL5GxxF5C8Yhxb3b+uOcdvlXgMl4pY/6uD8bR3vcP8Ws
         Eo9n/40WE8eJ2iFWTwsYcfbfDwmqylj/y8DalP4mmPU/YJV2zJrXO3chUS42TCgv1z56
         7e7HKlMtv4Hj8IxInKG8G4yacz1Z5zbbMyt7/E8e27PgYZEIbNtwsgMT9oiVukOUDg4H
         9AvzPRqQQXYfQ3Vv7JnVt7+BI7zLCqPUT9QcikeForSBI1MCbaUjx3K3qxkbpf46ip0s
         VndQ==
X-Gm-Message-State: AFuF++nrlQdoy5ARqDMg4J+0q/hSesLOMzw22iwa9v63vHPQ14mL/Nkx
	FY/BLIYq/MGPNYMRfjuwosYq3nNv5xrEXSkpeUT1kLShefexiKfi9cApZhJ5EvbwwiB7VVey9zC
	9U09Mk9bjfUj3QiWk2FUmMiEtRKwDHaPGblc1vrkZ7z2JBcXdpIFwgIC2WNADiuuWSg==
X-Gm-Gg: AYBFou0XyBGBwheEE2E5JF18xFJpNoCYsPMP78Mp+snH1MvjOvun70mBk1JZDbNrBwD
	r321a+L6otPzFoxUIxgNj/fDpQdje025byQwbwjbefmWMGKGzP9oBdLdBLX0H9/lCRl+QnwhZxZ
	SK6yIn6d/yZvp7kwjhEyXfgBTqCBIEfOMc1f0S0ZzN9M4a4U7gwv3FU0LNwH4fR4PyBXshXH+Hr
	f9bfnDqcd272hzwci76i6O5A1ine8Xq4opAAF598lyt7i2HuQhCvIWkaMNYgz/B8qBlrlPJ8TAr
	r8uKtEswAjjblpCwveMmyvYR3HvWvwkBmGABoJ9b0aXRbFMda96KkJ44FKGFO5eci9v6/wP6Lkp
	mvD7gAnkD3oyVxGppuoB6de7e0rGS1nt+UkS8Jw0=
X-Received: by 2002:a05:620a:4411:b0:93e:9809:8383 with SMTP id af79cd13be357-93e9b8781eamr916083585a.67.1791438909935;
        Wed, 07 Oct 2026 22:55:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4411:b0:93e:9809:8383 with SMTP id af79cd13be357-93e9b8781eamr916080185a.67.1791438909483;
        Wed, 07 Oct 2026 22:55:09 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2e2dcsm10299868f8f.42.2026.10.07.22.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 22:55:08 -0700 (PDT)
Message-ID: <307f12f9-8805-4b3c-92d7-422d994fdeff@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:55:06 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/74] media: qcom: camss: vfe: Define output based VFE
 controls
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
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-25-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-25-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zxuPI4u-sNinSc-VNOb8QtqO98KQ4Nnw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX0W/r3hhaMaTt
 OFJ/IQSNuBeABmyvVvpA/6SLr9oAxPelJIwhMOkOuU2YM9qtmWpFzoBR0EzhytsNzODy7p7oq84
 TmPhP1nC8CnurOL6VJ9e8rd9DPCqxOI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfXxstZyzkidFkY
 67egiM7HJxnQw57xeLO+KdtaR/OOnqoKsrdWDQBtfNkcHpa3USDKIQAmYWjWiIXyisKtdtXx/YC
 yyZH3itpJsLWg8RLiLHaBcVNZoqZn78WVSOMOfxSrHiztqsteKAldEjBigooKakgOtiOk3ZpLC0
 8lR53PptTMzqxU+Uo6wVyMmgfm3Y0JoumKliBA30yPG53taeu34gFUODSYJRbR7uflaQ6b7cDKa
 RKVog5Eo/fKPRTPQvqjE5jNgJR6b7v+iM1xk0vx99z51bi7zuhAZo8YLAkP1f+1rA7Byohev/kN
 VvppEeOp0cNF+OEuvmK8xtltqcYRniooxQtYcCsOfBmW2pJ5h/tM0oZdf3MS/9fPMDBK7fjDxmy
 N2rqvg4x9vwkmU5O7L820kWDu518oXowTffSlozx+nnXG93JT2w0kkj6zM9WHRvfKLdz57DBfyZ
 mLnSWoPHOSEvxJ6wyyg==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac7303e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=zfKG3oH7uKmXRWqL_JoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: zxuPI4u-sNinSc-VNOb8QtqO98KQ4Nnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080023

Hi Bryan,

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 6ba0d0c7d6be2..bf8dccf4c901e 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -168,12 +168,22 @@ struct vfe_hw_ops {
>  	int (*vfe_enable)(struct vfe_line *line);
>  	int (*vfe_halt)(struct vfe_device *vfe);
>  	void (*violation_read)(struct vfe_device *vfe);
> +
> +	/* RDI based API - deprecated */
>  	void (*vfe_wm_start)(struct vfe_device *vfe, u8 wm,
>  			     struct vfe_line *line);
>  	void (*vfe_wm_stop)(struct vfe_device *vfe, u8 wm);
>  	void (*vfe_buf_done)(struct vfe_device *vfe, int port_id);
>  	void (*vfe_wm_update)(struct vfe_device *vfe, u8 wm, u32 addr,
>  			      struct vfe_line *line);
> +
> +	/* Output based API - new and shiny */
> +	void (*vfe_output_start)(struct vfe_device *vfe, struct vfe_output *output);
> +	void (*vfe_output_stop)(struct vfe_device *vfe, struct vfe_output *output);
> +	void (*vfe_output_buf_done)(struct vfe_device *vfe, struct vfe_output *output);
> +	void (*vfe_output_update)(struct vfe_device *vfe, struct vfe_output *output,
> +				  struct camss_buffer *buf);
> +

This also deserves good commit message, this is exact copy of the other RDI API with other arguments :-) Shall we migrate
all existing drivers to this api in respect to use other deprecated API but having both of them leave in vfe file which 
creates even more confusion and readability of the code?

~Gjorgji
