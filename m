Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572793;
	b=i6pnXLNDD5twSzQvn7ShytukCWFA+tHEOHOYZTIj3Zx4CptVPR48/h2Csoy8UkzO3Wpt
	 TChijB9CBR0JqKw76w6B5Q86o0fNYiR8DRfP7DDkAYnWFfGWe6yQEDy+oNyV9+V0akknK
	 A2kNes1iXBX4iODaXBmlR7p2P69r9dHxHp5eXE0+l5+LRVhQfYDSmB1Z3UmTcY0e4p/XW
	 0iEJspmUWP+pdV9+NsGnlWN/nBUcUFUn7yBlYWapXD1lUhfOFW3C1ufsYj7vRd9eWDtPI
	 z61uMUH3y54smZspXQEePRqo2f5KQtQ8ptRzyRTn9kQATj/EqRx7L0JX3v5oQdTXvKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iPMD+7nAdoDF4dLXoWfSbpzZ6Oz4vyFuN1XIGNi1WO0=;
	b=bYMgCQlhhuTLlM1SNhSQOg0DyC7L2FtEFRcTTIcfPmj6SyXL6kMO+VZzaO6lf3xN4BD+
	 nuyEkksF/j55zprJetdyHDEnyLr5R2nyouAzxJ1k9+Knb26EkLEy/lSDpCuWOB/V3AG8B
	 gOMfq2eTLwLI347YVHQ9XKMFiw4rO2rR/QY8UNhTDTxyuywwwN4OszzNBExjOme2P4B74
	 kn7/gS+9/isfjtcEJGeHZxKLhnLkkdlfzcpEimKq7WxrCJn8n3C4feLD/bSA3aVU/CeTR
	 edbdkidsVY5WRNkp6MDEsv6qv6IVINFCT/LZsdTw9+yoy0QdjsiRprLcnvtROVEbSqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hDi1fTr9;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2225606A31C
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 08:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2225606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hDi1fTr9
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso2177345e9.1
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 01:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792572791; x=1793177591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPMD+7nAdoDF4dLXoWfSbpzZ6Oz4vyFuN1XIGNi1WO0=;
        b=hDi1fTr9i+zE0FEJtCLU4Tve8JY8Q4EM5sjz/3gmc0wUthILHp0sp6WCAPNT5wsnY0
         fkBaSADTLdFFSW+7GisT1JSX7sdNuTdc3sd0Uc2HpgL56OMmgYaEiJzkiDP6EaSrED7X
         S3/UlS9MOg71A4PkvOkkalBn5ivg2gBBZp088nEBQb0Se/kJjYkep2MH9KYtTZjzeDHu
         OgyYfBuRqtlMIu79eb6UZnlUGCzcLY2a9wE5tbB32PTSrmWvW6ncd5Kpa7p0I4JAM4FN
         DyWOWCKoBWeTcClYDNRrBmqNLYOVZbHoXVO7pLkZKzKLAiZuebtTorrdWB/ThGTrys2m
         Q0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572791; x=1793177591;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPMD+7nAdoDF4dLXoWfSbpzZ6Oz4vyFuN1XIGNi1WO0=;
        b=N0BWQnSjBwIHx97GIe69GM9dRYMfIUSwk0uFCZdOhll5Wdrh7JgXN4sKuDVU9le+JO
         5D+tRq7G686UcPs0KktybvXwpXClsPTVTcQ8PT9nERqqyhf2+uILrthrfHpfKLrn/wbU
         ENgJIqcNx9lhUvtYviBf23pk0RYgDk8Me50dY/d/btFCmCtrDS8lXTURqxmroLnZ0SIs
         4a+jjVSa6ZOI+n8f5GtxdzgaxuaUNYsooEDS963GD9GfGucIMZwSGMFLceHZgdd22YHU
         COrwpvwpHNruH8EgTG6VsFFrPM49YgyacqhWFDnDyvHWdlZzRFLwkP+GCeYdG+jw7ljF
         AnNw==
X-Forwarded-Encrypted: i=1; AKwUvByYqQSFr6zWCmJVHUzpp4SaWQIRD0yGFcAG82PJxxSkVZPwA/egQUYZX8OtBoaTPfc+cBZvfnQ19r1Zcw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPABDwadh9RYddo00+s2gOjdCZtPrLSDUZ4hNAPsCQonSQqw5L
	+BC1iMJbGbYT6ltrfbwEYZka+kmxx25Rr/byy/sSZhn+I8TnKLJ+kHiNQqNPz6HZx4g=
X-Gm-Gg: AYBFou3L7S0JeLcV98liSCjxbGqdrBhGwZ+ENrH9uZ/lwJSBsTNCXHG3tQeVrSWjmgn
	Wl87hen9yr9yI4j/J2R7Y6imc3mr4/297zK5FSZYsA0/f4BChB5CfrWRnXy/rgKBOrpICrtX0rn
	1D+dhwfW7auzZuNh46Jpa/CdLIQAnVJAIK7Rm4DCwWObrDCuKPpCpmr94ENXgBPPez1JVdWDsHJ
	QvjZ9pAXn8Imbs87GCHWJS1rZ5if/UYqImxoaWKqNA/awyGaNkP6c2LQ9CII/DbjXdjZHwmt4sE
	gPQlR38HN/BBicO0XnoaDb/RCiHyKPinX7cd4j88sf4DDJFREdpbh+I6ppmfeCOTWdF7s4K7VAR
	acRrxJL9qxy33ZKHcbhLbi9WXvTRRfNgFohI1ewNWSCEu1e4flP9l86aR319Oux0tlTQuXbtEU9
	NzUqMSgC7kymMNtDQDJZ2sA3AugTfHV7dsCMGAGthfBPamJ4u3no08SFkOKOhF0Pr0obKCgX/x+
	CZvR5CkqwN/rbp+l1bwmh5coeorlALsS9YfPmGrX+0izZqwxFguGOfZzdXSbHuLuX5/4Q==
X-Received: by 2002:a05:600c:800e:b0:4a1:cedc:ab51 with SMTP id 5b1f17b1804b1-4a1fdd3a79fmr31334015e9.35.1792572790953;
        Wed, 21 Oct 2026 01:53:10 -0700 (PDT)
Received: from [192.168.0.167] ([78.152.223.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm14290625e9.11.2026.10.21.01.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:53:10 -0700 (PDT)
Message-ID: <dbde0e35-8246-4f69-b3be-cd617a1767d9@linaro.org>
Date: Wed, 21 Oct 2026 09:53:08 +0100
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
Subject: Re: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
 <3843110c-4766-4352-ab2a-6d3017336534@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <3843110c-4766-4352-ab2a-6d3017336534@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/10/2026 08:37, Wenmeng Liu wrote:
> 
> Hi Bryan, Hangxiang,
> 
> On 10/12/2026 2:45 PM, Hangxiang Ma wrote:
>> On stream-on, CAMSS starts the subdevices upstream from the video node
>> through their sink pads, so the VFE is started before the CSID.
>>
>> Starting with CSID 680, the REG_UPDATE is issued through the CSID
>> rather than the VFE. However, vfe_enable_output_v2() still issues a
>> REG_UPDATE after queueing each initial buffer, before the CSID has
>> configured the stream. The VFE then never signals BUF_DONE. Therefore,
>> the CAMSS now issues the REG_UPDATE from configure_stream() on CSID 680
>> and CSID Gen3 instead. The operation happens after the RX configuration
>> and before the RDI path is enabled.
>>
>> Skip the VFE-side stream-on REG_UPDATE only when the CSID connected to
>> the VFE sink pad implements the reg_update callback. Platforms whose
>> CSID does not provide this callback, as well as lines fed by ISPIF,
>> keep the existing VFE-side REG_UPDATE.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss-csid-680.c |  3 ++
>>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  3 ++
>>   drivers/media/platform/qcom/camss/camss-vfe.c      | 37 ++++++++++++ 
>> +++++++++-
>>   3 files changed, 42 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/ 
>> drivers/media/platform/qcom/camss/camss-csid-680.c
>> index 345a67c8fb94..556cdfef6207 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
>> @@ -296,6 +296,8 @@ static void __csid_configure_rdi_stream(struct 
>> csid_device *csid, u8 enable, u8
>>       writel(val, csid->base + CSID_RDI_CFG0(port));
>>   }
>> +static void csid_subdev_reg_update(struct csid_device *csid, int 
>> port_id, bool is_clear);
>> +
>>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>   {
>>       int i;
>> @@ -307,6 +309,7 @@ static void csid_configure_stream(struct 
>> csid_device *csid, u8 enable)
>>           if (csid->phy.en_vc & BIT(i)) {
>>               __csid_configure_rdi_stream(csid, enable, i, 0);
>>               __csid_configure_rx(csid, &csid->phy, 0);
>> +            csid_subdev_reg_update(csid, i, false);
>>               __csid_ctrl_rdi(csid, enable, i);
>>           }
>>       }
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/ 
>> drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> index 0fdbf75fb27d..830c9c818d3d 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> @@ -219,6 +219,8 @@ static void __csid_configure_rdi_stream(struct 
>> csid_device *csid, u8 enable, u8
>>       writel(val, csid->base + CSID_RDI_CFG0(port));
>>   }
>> +static void csid_subdev_reg_update(struct csid_device *csid, int 
>> port_id, bool is_clear);
>> +
>>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>   {
>>       u8 i;
>> @@ -230,6 +232,7 @@ static void csid_configure_stream(struct 
>> csid_device *csid, u8 enable)
>>           if (csid->phy.en_vc & BIT(i)) {
>>               __csid_configure_rdi_stream(csid, enable, i, 0);
>>               __csid_configure_rx(csid, &csid->phy, 0);
>> +            csid_subdev_reg_update(csid, i, false);
>>               __csid_ctrl_rdi(csid, enable, i);
>>           }
>>   }
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/ 
>> media/platform/qcom/camss/camss-vfe.c
>> index 2680a9914765..16a0b5663fe2 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -502,6 +502,37 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>>       spin_unlock_irqrestore(&vfe->output_lock, flags);
>>   }
>> +/*
>> + * vfe_upstream_csid_has_reg_update - Check whether the CSID feeding 
>> this line
>> + * issues its own streamon RUP (i.e. its configure_stream does the RUP).
>> + *
>> + * The CSID->VFE link is created in camss.c for all CSIDs and VFEs, 
>> so the
>> + * upstream entity of the sink pad is either a CSID (possibly with 
>> RUP) or an
>> + * ISPIF (no RUP). Only enabled links are considered.
>> + */
>> +static bool vfe_upstream_csid_has_reg_update(struct vfe_line *line)
>> +{
>> +    struct vfe_device *vfe = to_vfe(line);
>> +    struct camss *camss = vfe->camss;
>> +    struct media_pad *remote;
>> +    unsigned int i;
>> +
>> +    remote = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
>> +    if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
>> +        return false;
>> +
>> +    for (i = 0; i < camss->res->csid_num; i++) {
>> +        struct csid_device *csid = &camss->csid[i];
>> +
>> +        if (&csid->subdev.entity != remote->entity)
>> +            continue;
>> +
>> +        return !!csid->res->hw_ops->reg_update;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>>   int vfe_enable_output_v2(struct vfe_line *line)
>>   {
>>       struct vfe_device *vfe = to_vfe(line);
>> @@ -511,6 +542,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>       unsigned long flags;
>>       unsigned int frame_skip = 0;
>>       unsigned int i;
>> +    bool rup_in_csid;
>>       sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
>>       if (sensor_pad) {
>> @@ -523,6 +555,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>               frame_skip = VFE_FRAME_DROP_VAL - 1;
>>       }
>> +    rup_in_csid = vfe_upstream_csid_has_reg_update(line);
>> +
>>       spin_lock_irqsave(&vfe->output_lock, flags);
>>       ops->reg_update_clear(vfe, line->id);
>> @@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>           output->gen2.active_num++;
>>           ops->vfe_wm_update(vfe, output->wm_idx[0],
>>                      output->buf[i]->addr[0], line);
>> -        ops->reg_update(vfe, line->id);
>> +        if (!rup_in_csid)
>> +            ops->reg_update(vfe, line->id);
>>       }
>>       spin_unlock_irqrestore(&vfe->output_lock, flags);
>>
> 
> According to the hardware documentation:
> Starting with CSID 680, CAMIF has moved into the CSID. As a result, RUP 
> is now issued by the CSID and propagated to the IFE.
> 
> Starting with CSID 980, software must also set the SET bit in 
> RUP_AUP_CMD after issuing the RUP/AUP command. Otherwise, the hardware 
> ignores the command and the corresponding register update does not take 
> effect.
> 
> 
> Bryan, according to the HW documentation, the change itself is 
> consistent with the required programming sequence. The main question is 
> whether this is the right implementation from the driver perspective, or 
> if there is a cleaner way to handle it.
> 
> I have tested the change on the Hamoa EVK board.
> Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> # Hamoa EVK
> 
> 
> Thanks,
> Wenmeng

OK thank you for the explanation.

OTOH I agree with Loic's statement - it is cleaner to subtract the 
callback and disjunct on its presence than to add a flag to the same 
effect in reverse.

---
bod
