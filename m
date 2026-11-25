Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595009;
	b=5dWOftRZqhS7BhbuN/5Upw/0VV0cnuCHfCB49XDiPJ3G3WF2/f+Icq1YdPKAh3X06MsW
	 gpsx0lLMP1s05bXB2j5o+l6YdCvxHCrhjvtNMnPIWn9Wk9sZIdvYB02faqCIvEQdz9A/3
	 iuwrrIvwscrbCuEufgb5zObHs//SYXwZ1ouFjKrLUPuTLNR09JSHbmehk4MWtFUWYuaA4
	 CoQVGRgwyNu3YR0fZ2IB2dry1bqQGOCJZm13N5e9h8stgDPf1czH8bK7h3P5XrzZMvE3W
	 FUTezdYPEk2gfOkGgIQ9Npr94dpwItHlnKJE/Nnff1XKzb/u+Zsh2hljnpsZT9JpxPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595009;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P7qZuBBxFMJzvGgQTCt3p1+7Q/oOBSu1DLkp5hs7Q2o=;
	b=WpHx5A8wiQ1CLdenjOp2vGzYMByJMPVqyHLdCUflXm+5yWXwJtpHBjGOSMo5Ns1PmgfP
	 txwC1806bf/MgneXzZpqS1SeAzM/mepcy05nHEN3VJby3IEpflGhhMA2a4tmFc5FpVZtW
	 sN4vORxDwHIFCFYOfS4U+T6Gv4WvS9M+WICh8I2jUNFyEpjgrHNU7PAQmZSIBIrVgFk5b
	 xgwB6eD9PjwMUllPk6DSwA2vBOhMLb4gHr32H7dPvfhSZX4wfVb4ixAr7bDsCqp8Eg8uU
	 IMn5fONXjvmbapl/Ov6rLCvADlaclhij6cDfKJrue19u6lgYK5CZmgneQW9E7aHPZVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VsP5wUqJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OcA7OZgj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D36606A335
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D36606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VsP5wUqJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OcA7OZgj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68chK3113706
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7qZuBBxFMJzvGgQTCt3p1+7Q/oOBSu1DLkp5hs7Q2o=; b=VsP5wUqJpJ2ylKDL
	EXoU4c06v6dT/C4nZzchcdkJGptgYaIJWjKXhvPA3OK1H2NQAdJUlgUtc4dbsV87
	ffAlsKoN4S00IvoayHU7Sp3ee/pCV3gKuQ8uxDszh0ZwkcdpaGfpbgZjZHATL9ak
	bQq+x/6afJb2eLyP7mjWzXbOFb7bocGxYWeo1KryQe3rmpsQnYEWbhAiqP+Ib8CY
	AaaevXAJKDX24w3eZfXpLYqVdcBZ3rcFJ9Mfjz2/a7R14ln7U7vZaL+0tjr+1rI5
	4wBZo0vmy60pyEBvI2cfwUp1gShKqwxRhWEFr8MUiKBnuCAdbDKAv/c8R0i1XNsy
	+/an2g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsah70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:23:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3fa6c8d4bso5900555a91.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595007; x=1796199807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7qZuBBxFMJzvGgQTCt3p1+7Q/oOBSu1DLkp5hs7Q2o=;
        b=OcA7OZgjLngCELgH8b4hXtd/9GR1G5oj8ZxH03ZoLpZ5x/3QPmFkDCos8vhTAA0EqP
         21+JjXLIi3KxvyZ1VpvcmyEu3O9ZGw6LZQmg//hG1SOEbavxdvwDbhXlMddfDAKSLcNy
         PqjEskOv1mMuEm19sH5i7TddxRcMaLUq0SL8ZSka8eQLzX+sauMRooXSI8Gl7z22Ind9
         uFLq4X19CH6aTvnmLYiTjDaeRoFis1C0DN9bzgLfvHW+nZRSO0oAyx33JGyn3weZzV5H
         KpfoIUQQI2ussoFDabtiMGGAqPdN879+zqGMLv1DPPEQ6zEUQcbiBRRFffU1tubVR2QN
         F1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595007; x=1796199807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7qZuBBxFMJzvGgQTCt3p1+7Q/oOBSu1DLkp5hs7Q2o=;
        b=sx4+/m80RVks1XzF1Imkl+VSS5bxcrYpzhuggHhSyMTyBon9q6uWM1augNx2t1BJWu
         QsGJuTOuhRUbzuEHqmNdK7c69GBDA7Z4iaRFVnUuF8VYpAjHsju8uJnlHu+tKb/4etxE
         uQzHT+x+/OmZtKPtGdOekyCG7qw25340GwxrzY0tvvaYYC8HE/+i4sfDMzI7qie9wo2V
         nQlxfWLDvVNBJ0p+bpuwHZJndVYm30+8BM8augLPLwhwaaBpyT2aMGlJWtuw5WAfdaQd
         3AR3xAmhaH0VgCCaz2WLiI6weL06oepX/K1Q5iF7RRm76kDc43AMpkb3oVK+4L9vYth2
         k5rw==
X-Gm-Message-State: APuU4Z9UpxGgGs7Pz4LSRWXUKJaiqfhItMArFSaBBvTT7wz/RMGjEHE7
	OdbZ1wr06AuAnBTH/WnvPLeT/gA7kT6j2FY8GFd8akY6/+oWNs0s07ivSpfOrusHVL/0MaV68Q5
	7b1yhMWybGx3OthtDlOD7U3C99afIBLMdthlVuiNWqmGDIkI63X9FqxKx8f9zZrmk4Q==
X-Gm-Gg: AZFdTZfWviGV2YbuQSo52oX4EiTButGCtzStXV4MJAYvUjZ/WlmeoyG1iRro0gZhZRN
	DTFUwgHI2/e7M8IaTiH4Nipo0uWEPWhXUPws1TQpuEZdVEOO8vc2vJNlgqKFMZFHEtBoWMmHuhQ
	bmw8PpRKh9TNvQV1rgvfdTPEaOmSdyKjj4OtZ/5kCRJHgJnQ1J3qEnSr9jdiLfGjuXnqT96K579
	PjXFxvIrCFLaMeC7ZybCs6rxzOB9qW/lxJqO30YbUlGZeMnAjnQ8GcAmc26gjbFHvE5MvxwGZRL
	UpySJsr6m45q4pqvnPkmBhPeo03QsEoewU5upfKK+sisUI4p8BSsad55gptlH2DKnQOMA1RwIV1
	rrMVLa6f2116j45xOd2sZiBUqhlLKyuZ9MLr3gyo3GCnYESfup6WwVfd6V7cQJUJQDrMypytG1t
	iZS7vBBToYG1mRGEVMvlFnUNu4x+aNXvdl6w==
X-Received: by 2002:a17:90a:e7c2:b0:3b4:f983:e52b with SMTP id 98e67ed59e1d1-3b4f983e5f7mr829366a91.5.1795595007418;
        Wed, 25 Nov 2026 00:23:27 -0800 (PST)
X-Received: by 2002:a17:90a:e7c2:b0:3b4:f983:e52b with SMTP id 98e67ed59e1d1-3b4f983e5f7mr829358a91.5.1795595006858;
        Wed, 25 Nov 2026 00:23:26 -0800 (PST)
Received: from [10.239.96.119] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm11420458a91.1.2026.11.25.00.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:23:26 -0800 (PST)
Message-ID: <26d4f9ca-ec16-400f-8f0c-cd5a374aadfa@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:23:22 +0800
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
Subject: Re: [PATCH 1/2] media: qcom: camss: Latch buffer addresses through a
 single helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
 <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VhDhxqNxuO6l72YYINiaHaoFRJ7b-E05
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b069b00 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0y8wJTrDH0ucKQC6Y7wA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX6oMLIxS5oha8
 44iNQ3Fg78OXifT3A8q6+sZoafFT0N4eEiuVLnWRABNBBhqkm3/23DYe2j56TBntyMx9LANWPep
 lV19JVUlKASZ52ql0MlHZJFyG96+yMY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX8x84UNo5tEfW
 /qmTE1NHIf8YwLTl+9xPAIRPLvFd+v6Xr82myc9MJlGD53gDTENvY0anXB1/QV+w/aAqWI3vtbf
 4cSfDgNL9qfJt0d9wxeu07va7ZjN30eOlTLKaWo9ZiOenqv4WGjU8vJtT1AhkPvProl57NQ5GH6
 SMwBVMYclAXRmCOCl9sixuxmL3NbnAZQnP8AZtkV6xmvvMgk7kubphaaA6RzA4Y2hlljpQN3dV5
 OZrcu9zjk/bOJcI/6SC3/a6SrPvo07Av9h2WojpyntVdfLLFpZqVYDXrwPPfMDyxIDUnZeO4ghx
 0f+LhllUlKwzaroH0tKE9Aw4v9/WL5/SjbEb3KIT+UqkMsaWd6oAfJ6dlfZfXSUyB9/iZH0vEph
 897nqJabwf4bT/fQZU1FKytwkLN+GY+MU/u6RzjVxqoUVF9RbEuOqsZResHcDYBFygLpHswqn42
 4CLor816oEHi1OCZzuA==
X-Proofpoint-ORIG-GUID: VhDhxqNxuO6l72YYINiaHaoFRJ7b-E05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250033

On 11/25/2026 12:47 AM, Loic Poulain wrote:
> The buffer address written by vfe_wm_update() has to be made visible to
> the hardware, and the way to do that depends on the generation, the older
> ones only expose a register update, some relies on a FIFO, while the newer
> ones expose a dedicated address update that triggers the latch on its own.
> 
> Both sequences are open-coded at every call site today, with the address
> update being additive and always followed by a register update. This
> leaves no way for a generation to tell that an address update alone is
> enough, or that no latching is needed at all.
> 
> Add vfe_buf_addr_latch(), which calls the generation's addr_update() when
> it provides one and falls back to reg_update() otherwise.
> 
> The write master configuration programmed by vfe_wm_start() still needs
> committing, so vfe_enable_output_v2() now latches each initial buffer
> address inside the loop and issues a single register update afterwards.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 33 ++++++++++++++++++++-------
>   1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index f9bd2367671f6e50c6948a6405f78b8c2b03e5f7..f39e1f303c9bb64a41c59d0d413608b5cb54a8ed 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -443,6 +443,25 @@ u32 vfe_hw_version(struct vfe_device *vfe)
>   	return hw_version;
>   }
>   
> +/*
> + * vfe_buf_addr_latch - Latch a newly programmed buffer address
> + * @vfe: VFE Device
> + * @line: VFE line
> + *
> + * Make the address just written by vfe_wm_update() visible to the hardware,
> + * through a dedicated address update when the generation provides one, or
> + * through a register update otherwise.
> + */
> +static void vfe_buf_addr_latch(struct vfe_device *vfe, struct vfe_line *line)
> +{
> +	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
> +
> +	if (ops->addr_update)
> +		ops->addr_update(vfe, line->id);
> +	else
> +		ops->reg_update(vfe, line->id);
> +}
> +
>   /*
>    * vfe_buf_done - Process write master done interrupt
>    * @vfe: VFE Device
> @@ -491,9 +510,7 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>   				   output->buf[index]->addr[0],
>   				   line);
> -		if (ops->addr_update)
> -			ops->addr_update(vfe, line->id);
> -		ops->reg_update(vfe, line->id);
> +		vfe_buf_addr_latch(vfe, line);
>   	} else {
>   		output->gen2.active_num--;
>   	}
> @@ -564,10 +581,12 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   		output->gen2.active_num++;
>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>   				   output->buf[i]->addr[0], line);
> -		if (!ops->addr_update)
> -			ops->reg_update(vfe, line->id);
> +		vfe_buf_addr_latch(vfe, line);
>   	}
>   
> +	/* Commit the write master configuration programmed above */
> +	ops->reg_update(vfe, line->id);
> +
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
>   
>   	return 0;
> @@ -601,9 +620,7 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
>   		output->buf[output->gen2.active_num++] = buf;
>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>   				   buf->addr[0], line);
> -		if (ops->addr_update)
> -			ops->addr_update(vfe, line->id);
> -		ops->reg_update(vfe, line->id);
> +		vfe_buf_addr_latch(vfe, line);
>   	} else {
>   		vfe_buf_add_pending(output, buf);
>   	}
> 
Tested-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com> # SM8750

---
Best Regards
Hangxiang
