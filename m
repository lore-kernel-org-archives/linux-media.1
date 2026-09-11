Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9B635675C
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137461; cv=none; b=C8d1qgSeI+MyHYrkGzEjLLPFnZGT2miw8ITOhZycneFTWZn/ZXkwmEDaS2T7W0yIu7+DR5fUGBgPeuzNtWNHiIs6SWr92CmVN9C92E5RsFLKC2/+4vxZcLEfHA+OpR4TQt5B3u32j2osry4FvpK/8ulPhaOxgjNzRuielhfWSiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137461; c=relaxed/simple;
	bh=b+gTCGiDwO7AAZUz2RC12nJzP656GpH4eTQ5xuQxetA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oS3+i6jroSdMiRxhgQOsq9xFQAoKqqNw1Zq1WpjANTyyyv7sM7hEEd0NGkYlsJ1kVT8wnlsBSOfDAS32sCmDnZgP7JnieL11ixyc1jmU6yktjHLHGurC0Z3L1YKKZy/PNP5kOJvO+ECNFT28XX6RlwgrUpxK+OH7rWAzpve7tl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dn7lFFFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NiVQevSA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dn7lFFFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NiVQevSA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEaZ5M243358
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 14:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cG+4bsboaubOONr0y0VfhGyfp3ufATAAnPdJy2AgpRw=; b=dn7lFFFU05o5si4G
	l0kJkSN4KE6AkK3oJthtsiODxxLnASEx0ZuBLimYaN4aajDJRB63x1F9qnr5nKJT
	VN3vGPEioBbP7GsdUOgBU3LiMLIy4bs2h7mrHw+bVWHLGpoI8nvge7mQS6AMfHL5
	Ts7I0GoShFDQZSUraMpvazJC9KC0KxVFEhIUtSuxZunQe7PXs8796qk2skY3lK6P
	3xgXp7NV+4L9G2TJ67aPjDxDgcZ9wTmJO8H459asfxD7KOXpEmpF7VVMtj86w/HO
	imU6rJkZz5DaMU8SHFf/tASgQof8PcyneBxsHQLlAvQFWhzht7OxpLXb+7Psn1Iq
	LQiLUQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd526rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 14:37:38 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c851df59edso209587e0c.3
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789137457; x=1789742257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cG+4bsboaubOONr0y0VfhGyfp3ufATAAnPdJy2AgpRw=;
        b=NiVQevSAw30lIkcedEz683F7xYvg6WdQpPqWzemawooPjchtGFcEkQ3JWf244adZBR
         sr0Vi6u7S5vhsxcH5MiEZOn8Rqm+PFMwqSkQF8+KgaV5tA4Og5T8fI8dK/ornU3BmGAd
         zd29ehQnKS1Vn84EHx4o24eixts2hYBC1gYx5LcsH5k7Fep0TDkz5fIu75oW7bFGkL9h
         wYKY7VhxmxpuKIRD08b5xcCxL/yussVwI8jS7XWUp2GVVDAh9aR7zD1Ot2Zzef5vsGhy
         JaRpNbW/Kms5FIP3+u1twnTKMqFDMP9eMxpXaoX/hQRL9ow8R3sJ2cE1LZLT+QjxSJRQ
         7VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137457; x=1789742257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cG+4bsboaubOONr0y0VfhGyfp3ufATAAnPdJy2AgpRw=;
        b=CozinpB+IPfKclZRpr/UpmI3wGKmgS/YT3If0c8xa3Jlr2eCAbSvpNZBPbsiIBo20Q
         dIQHgrkxv5qamSX0dkl/WYKcchoDr2VW0EZjDczvOoV+WNFsxSN7I0papw6qT4V+0W4h
         Q0tZNYSqVYh69RvWil9kAbxASY8xkQO3t9b6AS71NofhoQxbQiEF5G4LkMkyTnD+mTia
         1itHzmmJwDHdDq8kmnWA8O+keUK/KQUCdbTlkF9yXKLUrg/IKyxysQL1l+EA07Fqj9yE
         4oadMMbKG59eJWOqcYdOE1+gzkGpxBeIP6paz5uJEqiSFtEV3XrhP3vfUJV6XP54fuaA
         s2dg==
X-Forwarded-Encrypted: i=1; AKwUvBxlzuyU4N3AfgV5XNTqkDXzLXOpXwzUy2KHevIQabUxZMZLeLBRdGI6iH24EDiKeqlTLX1r0IjfNwN+SA==@vger.kernel.org
X-Gm-Message-State: AFuF++nPYw5ktxBWPGYlDfG+w4xSCwErow6AQv/X7WtGVPbNbYVXkxgG
	Ue5QMWjNdB2ncVYDLQ8qI7prflN6QpWaaDGeq5+X9mOW0DJIuLoaF1/3lQkMkOlVoYbdBcuoZq0
	TnBM+kq4K9fDfRmd227LnxXj7dLtZ5WlYbjQTiB5ZyRmB6+6u8FdkGXDl6nQXU0DU0w==
X-Gm-Gg: AYBFou19dBT8KdK1nQ7eX0iY4tfrTu7Mm8O8YRa3u71Oo+jNSidYRy+4K1L/TudvseA
	95xrXJbGI5UqT/vF82eyGNOSQFEpD7oUHQkyYGllpGFq0vYMZV+oEVyeDyrXSWNabO4o+O2z+um
	dWvIO3uinFmxAHriN7jImbeqsEdDyiy8bk4AcK37WG85zzuQtd51jGpLiGDcEk8Ceq9b+83MQem
	JSAycq9skrhpT46UDeiJYzxCtVmivr1tSLoe0fTLOQspPGAv+g2aVQjaZYPsmuLJmZD/TDnyBpu
	vA0N8wi9WiCJuak4Y6+NuHChifsUe2J0ETz5aajfGHiXwUE3pJ/VDzLrNFAPsx3zFODmu4Yp8f/
	bDRhsVkXQeexGIPPf1RodrnQCVsc6fBtKRFHMtLKC
X-Received: by 2002:a05:6122:794:b0:5bd:af82:fd9e with SMTP id 71dfb90a1353d-5c84632bb1dmr5919258e0c.8.1789137457288;
        Fri, 11 Sep 2026 07:37:37 -0700 (PDT)
X-Received: by 2002:a05:6122:794:b0:5bd:af82:fd9e with SMTP id 71dfb90a1353d-5c84632bb1dmr5919166e0c.8.1789137456827;
        Fri, 11 Sep 2026 07:37:36 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f0403125sm4105340f8f.8.2026.09.11.07.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:37:36 -0700 (PDT)
Message-ID: <cdb1109d-2d51-4b6b-baaf-30eac4b9f008@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:37:33 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] media: qcom: camss: Fix CSID-to-VFE all-to-all link
 crossbar on sm8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-6-gjorgji.rosikopulos@oss.qualcomm.com>
 <9b7cb871-1bdc-4a9e-9917-e16a53dd3fb8@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <9b7cb871-1bdc-4a9e-9917-e16a53dd3fb8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MqH7aDiA2Gvc7Pvlpxtk4uXWMw2kmKxc
X-Proofpoint-ORIG-GUID: MqH7aDiA2Gvc7Pvlpxtk4uXWMw2kmKxc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwNCBTYWx0ZWRfXwTjDs8y90l8w
 VUNJi5cDxBTQ4yvnyBXkfHZ09nsq9tw3t0l0PoPKwLa+a4GD1ffQjTf18y9/5HD9czw6H8RtCVF
 As0OMxiuHcKK7SrhCo18BrYX/ikvZn4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwNCBTYWx0ZWRfX6IRJx684m5l5
 ccD+6/Z/h9MFAc+n13oEqZL/YoEJdYQZF0nrlhdkWFjdbV29EsZ/xjFDoBgigd78y0Nay0dV7gu
 Kb3koH58zA4z6deeUdzMc8PppsY+IxcpD3Cdsd0EH4a+/255kxoVUgVDkhboS6+W5K/z0dfC9JW
 kenAdJgsnb58sCoQZLoaazLeAsSCchqQPuBQBwUaNbZt2uSyLSybulx8NUln/ywq4+6ML/GlabP
 a98nOHwwjWDOuMtOSkD/LpEfZsEYSZ2m2Tn0GpAJ4HtUmc8fMaSumtL2oGIDqS115IXKRC+6NAM
 uUiUJ1Llsuw0oxWhBUx5kvNzbxVGH/DcoOvIpIyMaUkX10/jq1+yvkkpaxEOTg5R8yi4kzdx1k5
 TUtFut43i3x/upIKMMf9RwrdtkEJmyXXLC+bKgRHKpOeVqWBo2MpNcwlVKFDZz1A3SdLcXlOu9r
 L7lTjdWNyPyiZ+XCbqQ==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa41232 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=31iUUCM0u9l7UKhvf3AA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110204

Hi Bryan,

Thanks for the review,

On 9/11/2026 2:37 PM, Bryan O'Donoghue wrote:
> On 11/09/2026 07:22, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>
>> camss_link_entities() unconditionally links every CSID to every VFE,
>> creating an all-to-all crossbar. On SM8250 the hardware wiring is
>> fixed: each CSID is hardwired to exactly one VFE (csid[i] <-> vfe[i]),
>> with no crossbar between instances. Enabling a mismatched link (e.g.
>> csid0 -> vfe1) creates a media link that does not correspond to any
>> real hardware datapath.
>>
>> Add a csid_vfe_fixed_pairing flag to struct camss_resources and set it
>> for sm8250_resources. When set, camss_link_entities() skips creating
>> links between CSID and VFE instances whose indices do not match.
>> Other platforms keep the historical all-to-all link creation.
>>
>> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 7 ++++++-
>>   drivers/media/platform/qcom/camss/camss.h | 7 +++++++
>>   2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 2123f6388e3d..1bb22cd23c5e 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -5000,7 +5000,10 @@ static int camss_link_entities(struct camss *camss)
>>   				}
>>   	} else {
>>   		for (i = 0; i < camss->res->csid_num; i++)
>> -			for (k = 0; k < camss->res->vfe_num; k++)
>> +			for (k = 0; k < camss->res->vfe_num; k++) {
>> +				if (camss->res->csid_vfe_fixed_pairing && i != k)
>> +					continue;
>> +
> 
> A) This should be a Fixes
> B) This should not be limited to sm8250

I agree. I think either we can have this based on platform, or based on ispif availability.
The csid routing to all ife's is possible only in the platforms with ispif available.
Please tell me what is your preference i am fine with both.

> 
>>   				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
>>   					struct v4l2_subdev *csid = &camss->csid[i].subdev;
>>   					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
>> @@ -5017,6 +5020,7 @@ static int camss_link_entities(struct camss *camss)
>>   						return ret;
>>   					}
>>   				}
>> +			}
>>   	}
>>   
>>   	return 0;
>> @@ -5666,6 +5670,7 @@ static const struct camss_resources sm8250_resources = {
>>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
>>   	.csid_num = ARRAY_SIZE(csid_res_8250),
>>   	.vfe_num = ARRAY_SIZE(vfe_res_8250),
>> +	.csid_vfe_fixed_pairing = true,
>>   };
>>   
>>   static const struct camss_resources sc8280xp_resources = {
>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
>> index 93d691c8ac63..ad0b42719788 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -119,6 +119,13 @@ struct camss_resources {
>>   	const unsigned int tpg_num;
>>   	const unsigned int csid_num;
>>   	const unsigned int vfe_num;
>> +	/*
>> +	 * True on platforms where each CSID is wired to exactly one VFE at
>> +	 * the same index (csid[i] <-> vfe[i]). When set, camss_link_entities()
>> +	 * only creates CSID->VFE links for matching indices instead of an
>> +	 * all-to-all crossbar.
>> +	 */
>> +	const bool csid_vfe_fixed_pairing;
> 
> I think the number of platforms where all-to-all is possible is quite 
> low - if possible on any.

Yes that is correct.

~Gjorgji

